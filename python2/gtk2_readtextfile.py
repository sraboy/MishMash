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
        self.window.set_default_size(200, 250)
        
        self.window.connect("delete_event", self.delete_event)
        self.window.connect("destroy", self.destroy)
        
        self.textview.set_buffer(self.textbuffer)
        
        self.window.set_border_width(10)
        
        #self.button.connect("clicked", self.set_text, None)
        #self.button.connect_object("clicked", self.set_text, self.textbuffer, os.getcwd() + "/gtk2_base.py")
        self.button.connect_object("clicked", \
                                    self.textbuffer.set_text, \
                                    self.read_text_file(os.getcwd() + "/gtk2_base.py"))
        
        
        # packs widgets into window
        box = gtk.VBox(False, 10)
        self.window.add(box)
        box.pack_start(self.textview)
        box.pack_end(self.button)
        self.window.show()
        self.button.show()
        self.textview.show()
        box.show()

    def main(self):
        # All PyGTK applications must have a gtk.main(). Control ends here
        # and waits for an event to occur (like a key press or mouse event).
        gtk.main()

# If the program is run directly or passed as an argument to the python
# interpreter then create a HelloWorld instance and show it
if __name__ == "__main__":
    txtfileview = TextFileView()
    txtfileview.main()
