---
categories: english, python, logging, mock
author: Domen Kožar
date: 2009/03/04 17:07:00
title: "Mocking logging module for unittests"
draft: false
---
Today I was writing tests for upcoming application I'm writing (more information will come later)
and I needed some way to redirect logging to some kind of storage that could be easily asserted to
values in tests. First I tried with monkey patching it, but that wasn't the solution since all
logging setup is done before pylons tests come to play, so somebody in IRC pointed me toward writing
a handler. I thought to do so in the first place, but were too stubborn;)

Here is the handler code:


.. sourcecode:: python

    class ListHandler(logging.Handler):

        debug = []
        warning = []
        info = []
        error = []

        def emit(self, record):
            getattr(self.__class__, record.levelname.lower()).append(record.getMessage())

        @classmethod
        def reset(cls):
            for attr in dir(cls):
                if isinstance(getattr(cls, attr), list):
                    setattr(cls, attr, [])

So basically, all records are stored in handlers class(!), which is restored to zero on every
tearDown() call. Later in the code, I can do stuff like:


.. sourcecode:: python

    def test_foobar(self):
            some_function_that_outputs_logging()
            self.failUnless('Invalid status' in  ListHandler.warning)


