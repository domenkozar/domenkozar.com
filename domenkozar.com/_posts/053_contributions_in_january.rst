---
categories: english, python, pyramid, plone, gentoo
author: Domen Kožar
date: 2013/02/02 23:30:00
title: "Contributions in January"
draft: false
---


Another month passed by, another update.

- `mr.bob <https://mrbob.readthedocs.org/>`_ got another bugfix release
  `0.1a7 <http://mrbob.readthedocs.org/en/0.1a7/HISTORY.html>`_
  which will short be superseded by another release
  with *template dependencies* feature. This is probably going to result into first beta release,
  since I consider commmand-line interface complete feature-wise. Python API will be refactored
  when I eventually start to use it.

- `bobtemplates.ielectric <https://github.com/iElectric/bobtemplates.ielectric>`_ is my personal
  collection of `mr.bob` templates and currently includes
  templates for a modern Python package and a very opinionated `pyramid` skeleton. There were some
  rather small bugfixes made.

- `zc.buildout` is nearing 2.0 release and during
  `Beer And Wine Sprint <http://coactivate.org/projects/wine-and-beer-sprint>`_ in Munich, I tried to
  write `outline for the new documentation <http://i.imgur.com/Vn8yNX3.png>`_.
  It's not finished yet, but I plan to work on that
  sooner or later. I certainly can't blame the lack of
  `Club Mate <http://en.wikipedia.org/wiki/Club-Mate>`_ for not finishing the outline.

- During Beer and Wine Sprint I was with the `Patternslib <http://patternslib.com/>`_
  team, which is doing a great job at
  developing a library that with the help of HTML5 data API loads and configures JavaScript
  plugins that provide certain dynamic behaviour to the webpage, such as dropdown menu. I was
  working on bundling with `grunt <http://gruntjs.com/>`_, but we later decided to ditch it and go with Makefile
  and `jamjs <http://jamjs.org/>`_.

- `pyramid_jinja2 1.6 <http://pypi.python.org/pypi/pyramid_jinja2/1.6>`_ release.
  Adds support for `jinja2.globals`, `jinja2.newstyle` and a more sane default for `jinja2.i18n.domain`.

- Last month I forgot about `nose-selecttests 0.3 <http://pypi.python.org/pypi/nose-selecttests/0.3>`_
  release, a nose plugin to white-list on command line what tests to run from testsuit when using nose test runner.

- During my last year of Telecommunication masters courses at `University of Ljubljana <http://www.fe.uni-lj.si/eng/>`_,
  I worked on a project to evaluate Network Intrusion Detection System `Snort <http://en.wikipedia.org/wiki/Snort_(software)>`_.
  Unfortunately it's in Slovenian, but nevertheless, you can read latex source or pdf
  `here <https://github.com/brodul/snort-kso>`_.

- Got first client that did not pay for my work \\o/ I learned a lot from the occasion,
  so I'm positive about the time spent. After days of thinking and a forward notice
  to the client, I open sourced the code to github
  `collective.nutrition <https://github.com/iElectric/collective.nutrition>`_.

- I'm currently writing this blog post on a plane to `FOSDEM 2013 <https://fosdem.org/>`_,
  can't wait to see again developers from Python community and meet some new people!


If you have an interesting problem to solve under a public license, I'm happy to hear from you at domen@dev.si :-)

Cheers, Domen
