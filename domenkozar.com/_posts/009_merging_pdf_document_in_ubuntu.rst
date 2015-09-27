---
categories: english, pdf ubuntu
author: Domen Kožar
date: 2009/09/06 23:42:00
title: "Merging PDF documents in Ubuntu"
draft: false
slug: merging-pdf-documents-in-ubuntu
---
Just a note to myself, easiest way to merge .pdf files:



.. sourcecode:: bash

    $ sudo aptitude install pdftk
    $ pdftk 1.pdf 2.pdf output 12.pdf


