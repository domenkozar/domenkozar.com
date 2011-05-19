---
categories: english, 
author: Domen Kožar
date: 2010/02/13 05:07:00
title: "Yet another Vim autocompletion for Python: pysmell"
draft: true
---
I have tried about a dozen autocompletions for Python/Vim, including Vim bundled omni completion.
Most of them did not suit my use case, because I usually work with third-party libraries in virtual
environment. Up until now I was using basic keyword completion, which covered `DRY
<http://en.wikipedia.org/wiki/Don't_repeat_yourself>`_ principle on long variable names. But this
changed today. I have installed `pysmell <http://github.com/orestis/pysmell>`_. Although it has some
bugs, first impression is good. 

First install *pysmell* library providing ide helpers

.. sourcecode:: bash

    $ easy_install pysmell

We also need to configure omnifunc

.. sourcecode:: bash

    $ echo "autocmd FileType python set omnifunc=pysmell#Complete" >> ~/.vimrc

And because <Ctrl-X><Ctrl-C> shortcut for autocompletion is not really finger friendly, we use
`supertab <http://www.vim.org/scripts/script.php?script_id=1643>`_ plugin to map it (surprisingly)
on TAB.


.. sourcecode:: bash

    $ echo 'let g:SuperTabDefaultCompletionType = ""' >> ~/.vimrc
    $ echo 'let g:SuperTabLongestHighlight = 1' >> ~/.vimrc


    # TODO: write nerdtree menu plugin to generate pysmelltags


