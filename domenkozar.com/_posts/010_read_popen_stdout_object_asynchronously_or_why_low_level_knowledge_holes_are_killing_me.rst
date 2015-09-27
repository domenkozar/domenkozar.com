---
categories: english, python, async
author: Domen Kožar
date: 2009/09/13 10:07:00
title: "Read popen.stdout object asynchronously (or why low level knowledge holes are killing me)"
draft: false
---
I've been programming for about two years, all this time only in Python. I'll say that those 500
lines I wrote in Flash AS2 before going to Python does not count. I'm fluent with standard library
that Python provides, but I've noticed quite a few times now; I'm getting stuck on issues that
correlate to low level knowledge. I'm thinking it may trigger someday motivation to learn C. 

Going on topic, everyone that has used `Popen
<http://docs.python.org/library/subprocess.html?highlight=popen#subprocess.Popen>`_ at least once
knows that file-alike objects (stdout, stderr, etc.) are blocking. Let me give you an example:


.. sourcecode:: python

    from subprocess import Popen, PIPE

    p = Popen(['command doing lots of I/O and takes long to complete'],
        shell=True, stdout=PIPE)

    while p.poll() == None:
        print p.stdout.read()

This snippet will block on "p.stdout.read()" line until spawned process will finish. This behaviour
happens because Python I/O implemenation reads everything up until EOF (at least I thought so). 

Now, let's add few lines of code:

.. sourcecode:: python

    import os
    import fcntl
    import gobject
    from subprocess import Popen, PIPE

    p = Popen(['command doing lots of I/O and takes long to complete'],
        shell=True, stdout=PIPE)
    fd = p.stdout.fileno()

    #file_flags = fcntl.fcntl(fd, fcntl.F_GETFL)
    #fcntl.fcntl(fd, fcntl.F_SETFL, file_flags | os.O_NDELAY)

    def test_io_watch(f, cond):
        out = f.read()
        if out == '':
            return False
        print out
        return True

    gobject.io_add_watch(p.stdout,
                         gobject.IO_IN | gobject.IO_HUP,
                         test_io_watch)
    gobject.MainLoop().run()

I'll comment what happens here (leaving the two lines commented). Popen object is created and
subprocess spawned. Later we tell gobject to watch p.stdout for data and if there is some, call
test_io_watch. test_io_watch function will read file and print it to stdout. This will happen async,
leaving mainloop runing. This will also block output and desired effect is the same as in first
snippet. 

Now, **let's uncomment those two lines** and explain why it gives us expected results. **fcntl**
will aquire file-descriptor flags and set additional located in **os.O_NDELAY**. If we Google for
O_NDELAY first hit returns: 

    The O_NDELAY flag causes read() or write() to return zero instead of blocking.

This changes my guessing of how I/O blocking is handled in Python; it behaves by C implementation
based on flags used by filedescriptors. Thus, Python does not (literally) wait for EOF (as it is
stated in documentation) but it is just behavior of flags passed when opening a file. 

This blog post triggers questions in me: 

*How deep may one's knowledge be to write code of seemingly simple tasks?*

*How much time would one spend to find that exact flag without Google?*

*Do I even know... ?* 

`[#]Reference: http://www.mail-archive.com/pygtk@daa.com.au/msg18159.html
<http://www.mail-archive.com/pygtk@daa.com.au/msg18159.html>`_


