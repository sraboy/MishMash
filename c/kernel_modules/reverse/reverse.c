//Modified from: https://www.linuxvoice.com/be-a-kernel-hacker/
//Also see full source: https://github.com/vsinitsyn/reverse

#include <linux/init.h>
#include <linux/kernel.h>
#include <linux/module.h>
#include <linux/miscdevice.h>   //for miscdevice, etc
#include <linux/fs.h>           //for file_operations
#include <linux/slab.h>         //for kzalloc()
#include <linux/sched.h>        //for wait_queue_head_t, etc
#include <asm/uaccess.h>        //for copy_to_user()

MODULE_LICENSE("GPL");
MODULE_AUTHOR("Valentine Sinitsyn <valentine.sinitsyn@gmail.com>, Steven Lavoie <steven.lavoiejr@gmail.com>");
MODULE_DESCRIPTION("In-kernel phrase reverser");

// functions
static int reverse_open(struct inode *inode, struct file *filp);
static int reverse_read(struct file *filp, char __user *out, size_t size, loff_t *off);
static int reverse_write(struct file *filp, const char *data, size_t size, loff_t *off);
loff_t noop_llseek(struct file *filp, loff_t var, int intvar);
static char *reverse_phrase(char *start, char *end);
static inline char *reverse_word(char *start, char *end);

// variables
static unsigned long buffer_size = 8192;
module_param(buffer_size, ulong, (S_IRUSR | S_IRGRP | S_IROTH));
MODULE_PARM_DESC(buffer_size, "Internal buffer size");

// Contains our string to be reversed
struct buffer {
    char *data, *end, *read_ptr;
    unsigned long size;
    wait_queue_head_t read_queue;
    struct mutex lock;
};

loff_t noop_llseek(struct file *filp, loff_t var, int intvar) {
    
}

static struct buffer *buffer_alloc(unsigned long size) {
    struct buffer *buf = NULL;
    buf = kzalloc(sizeof(*buf), GFP_KERNEL);

    if(unlikely(!buf))
        goto out;

    buf->data = kzalloc(size, GFP_KERNEL);
    if(unlikely(!buf->data))
        goto out_free;

    init_waitqueue_head(&buf->read_queue);
    mutex_init(&buf->lock);
    buf->size = size;

out:
    return buf;
out_free:
    kfree(buf);
    return NULL;
}

void buffer_free(struct buffer *buf) {
    kfree(buf->data);
    kfree(buf);
}

static int reverse_open(struct inode *inode, struct file *filp){
    struct buffer *buf;
    int err = 0;
    buf = buffer_alloc(buffer_size);

    if(unlikely(!buf)) {
        err = -ENOMEM;
        goto out;
    }
    
    filp->private_data = buffer_alloc(buffer_size);

out:
    return err;
}

static int reverse_read(struct file *filp, char __user *out, size_t size, loff_t *off) {
    pr_devel("Entered reverse_read()\n");
    
    struct buffer *buf = filp->private_data;
    ssize_t retval;

    if(mutex_lock_interruptible(&buf->lock)) {
        retval = -ERESTARTSYS;
        goto out;
    }
    
    while(buf->read_ptr == buf->end) {
        mutex_unlock(&buf->lock);
        if(filp->f_flags & O_NONBLOCK) {
            retval = -EAGAIN;
            goto out;
        }
        if(wait_event_interruptible(buf->read_queue, buf->read_ptr != buf->end)) {
            retval = -ERESTARTSYS;
            goto out;
        }
        if(mutex_lock_interruptible(&buf->lock)) {
            retval = -ERESTARTSYS;
            goto out;
        }
    }

    size = min(size, (size_t)(buf->end - buf->read_ptr));

    if(copy_to_user(out, buf->read_ptr, size)) {
        retval = -EFAULT;
        goto out_unlock;
    }

    buf->read_ptr += size;
    retval = size;

out_unlock:
    mutex_unlock(&buf->lock);
out:
    return retval;
}

static int reverse_write(struct file *filp, const char *in, size_t size, loff_t *off) {
    pr_devel("Entered reverse_write()\n");
    struct buffer *buf = filp->private_data;
    ssize_t retval;

    if(size > buffer_size) {
        retval = -EFBIG;
        goto out;
    }

    if(mutex_lock_interruptible(&buf->lock)) {
        retval = -ERESTARTSYS;
        goto out;
    }

    if(copy_from_user(buf->data, in, size)) {
        retval = -EFAULT;
        goto out_unlock;
    }
    
    buf->end = buf->data + size;
    buf->read_ptr = buf->data;

    if(buf->end > buf->data)
        reverse_phrase(buf->data, buf->end - 1);
    
    wake_up_interruptible(&buf->read_queue);
    retval = size;
    
out_unlock:
    mutex_unlock(&buf->lock);
out:
    return retval;
}

static inline char *reverse_word(char *start, char *end) {
    pr_devel("Entered reverse_word()\n");
    char *orig_start = start, tmp;

    for(; start < end; start++, end--) {
        tmp = *start;
        *start = *end;
        *end = tmp;
    }

    return orig_start;
}

static char *reverse_phrase(char *start, char *end) {
    pr_devel("Entered reverse_phrase()\n");
    char *word_start = start, *word_end = NULL;

    while((word_end = memchr(word_start, ' ', end - word_start)) != NULL) {
        reverse_word(word_start, word_end - 1);
        word_start = word_end + 1;
    }

    reverse_word(word_start, end);

    return reverse_word(start, end);
}

/* Contains a set of callbacks executed when userspace uses the device
 * See: http://www.tldp.org/LDP/lkmpg/2.4/html/c577.htm
 */
static struct file_operations reverse_fops = {
    .owner  = THIS_MODULE,
    .open   = reverse_open,
    .write  = reverse_write,
    .read   = reverse_read,
    .llseek = noop_llseek
};

/* Used to register simple "miscellaneous" drivers that
 * need only a single entry point. All share MAJOR=10.
 * See: http://www.linuxjournal.com/article/2920
 */
static struct miscdevice reverse_misc_device = {
    .minor = MISC_DYNAMIC_MINOR,
    .name = "reverse",
    .fops = &reverse_fops
};




static int __init reverse_init(void) {
    int retval = 0;
    
    if(!buffer_size) {
        printk(KERN_INFO "reverse device failed to register: buffer_size must be >0\n");
        retval = -1;
        goto out;
    }

    retval = misc_register(&reverse_misc_device);
    printk(KERN_INFO "reverse device registered\n");

out:
    return retval;
}

static void __exit reverse_exit(void) {
    misc_deregister(&reverse_misc_device);
    printk(KERN_INFO "reverse device unregistered\n");
}

module_init(reverse_init);
module_exit(reverse_exit);
