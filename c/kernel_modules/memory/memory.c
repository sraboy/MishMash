// Following http://www.freesoftwaremagazine.com/articles/drivers_linux

// mknod /dev/memory c 60 0
// chmod 666 /dev/memory
// echo -n asdfasdf >/dev/memory
// cat /dev/memory
// rm /dev/memory

#include <linux/kernel.h> // printk()
#include <linux/slab.h>   // kmalloc()
#include <linux/errno.h>  // error codes
#include <linux/types.h>  // size_t
#include <linux/fcntl.h>  // O_ACCMODE
#include <asm/uaccess.h>  // copy_from/to_user

#include <linux/fs.h>
#include <linux/init.h>
#include <linux/proc_fs.h>
#include <linux/module.h>

MODULE_LICENSE("Dual BSD/GPL");

int memory_open(struct inode *inode, struct file *filp);
int memory_release(struct inode *inode, struct file *filp);
ssize_t memory_read(struct file *filp, char *buf, size_t count, loff_t *f_pos);
ssize_t memory_write(struct file *filp, void *buf, size_t count, loff_t *f_pos);
static void __init memory_exit(void);
static int __init memory_init(void);

//usual file access functions
struct file_operations memory_fops = {
    .read    = memory_read,
    .write   = memory_write,
    .open    = memory_open,
    .release = memory_release
};

//globals:
int memory_major = 60;
char *memory_buffer;

ssize_t memory_read(struct file *filp, char *buf, size_t count, loff_t *f_pos) {

    //transfer data to user space
    if(!copy_to_user(buf, memory_buffer, 1))
    {
        //change reading position as needed
        if (*f_pos == 0) {
            *f_pos += 1;
            return 1;
        } else {
            return 0;
        }
    }

    return -1;
}

ssize_t memory_write(struct file *filp, void *buf, size_t count, loff_t *f_pos) {
    char *tmp;

    tmp = buf + count - 1;
    if(!copy_from_user(memory_buffer, tmp, 1))
        return 1;

    return -1;
}

int memory_open(struct inode *inode, struct file *filp) {
    //success
    return 0;
}

int memory_release(struct inode *inode, struct file *filp) {
    //success
    return 0;
}

static int __init memory_init(void) {

    int result;

    //register device
    result = register_chrdev(memory_major, "memory", &memory_fops);
    if(result < 0)
    {
        printk(KERN_ALERT "memory: cannot obtain major number %d\n", memory_major);
        return result;
    }

    //allocate memory for the bugger
    memory_buffer = kmalloc(1, GFP_KERNEL);
    if (!memory_buffer) {
        result = -ENOMEM;
        goto fail;
    }

    memset(memory_buffer, 0, 1);
    printk(KERN_ALERT "Inserting memory module");
    return 0;

    fail:
        memory_exit();
        return result;
}
static void __init memory_exit(void) {
    //free the major number
    unregister_chrdev(memory_major, "memory");

    //free buffer mem
    if (memory_buffer) {
        kfree(memory_buffer);
    }

    printk(KERN_ALERT "Removing memory module\n");
}

module_init(memory_init);
module_exit(memory_exit);
