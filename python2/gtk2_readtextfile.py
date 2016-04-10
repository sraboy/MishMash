#!/usr/bin/env python

# Started with http://www.pygtk.org/pygtk2tutorial/ch-GettingStarted.html
# Also see:
#   http://www.pygtk.org/pygtk2reference/class-gtktextview.html
#   http://pythonprogramminglanguage.com/read-file/


import pygtk
pygtk.require('2.0')
import gtk
import os

class TextFileView:
    # setup vars
    window = gtk.Window(gtk.WINDOW_TOPLEVEL)
    button = gtk.Button("Load File")
    textview = gtk.TextView()
    textbuffer = textview.get_buffer()

    open_file_dlg = gtk.FileChooserDialog(title=None,action=gtk.FILE_CHOOSER_ACTION_OPEN, \
                                          buttons=(gtk.STOCK_CANCEL, \
                                                   gtk.RESPONSE_CANCEL, \
                                                   gtk.STOCK_OPEN, \
                                                   gtk.RESPONSE_OK))
    def open_read_file(self, data=None):
        result = self.open_file_dlg.run()
        if result == gtk.RESPONSE_OK:
            self.textbuffer.set_text(self.read_text_file(self.open_file_dlg.get_filename()))

        self.open_file_dlg.destroy()
    
    def read_text_file(self, filename):
        with open(filename) as fn:
            text = fn.read()
        return text
        
    def delete_event(self, widget, event, data=None):
        print "delete event occurred"
        return False # False = destroy the window when event fires

    def destroy(self, widget, data=None):
        print "destroy signal occurred"
        gtk.main_quit()

    def __init__(self):
        self.window.connect("delete_event", self.delete_event)
        self.window.connect("destroy", self.destroy)        
        self.window.set_default_size(200, 250)
        self.window.set_border_width(10)

        self.open_file_dlg.set_current_folder(os.getcwd())

        self.button.connect_object("clicked", self.open_read_file, None)
        
        # create vertical layout box
        box = gtk.VBox(False, 10)
        self.window.add(box)
        box.pack_start(self.textview)
        box.pack_end(self.button)
        box.show()
        
        # use a table for layout
        #table = gtk.Table(rows = 2, columns = 1, homogeneous = False)
        #table.attach(self.textview, 0, 1, 0, 1)
        #table.attach(self.button, 0, 1, 1, 2)
        #self.window.add(table)
        #table.show()
        
        # show it off
        self.window.show()
        self.button.show()
        self.textview.show()

    def main(self):
        # All PyGTK applications must have a gtk.main(). Control ends here
        # and waits for an event to occur (like a key press or mouse event).
        gtk.main()

# If the program is run directly or passed as an argument to the 
# python interpreter then create a class instance and show it
if __name__ == "__main__":
    txtfileview = TextFileView()
    txtfileview.main()
