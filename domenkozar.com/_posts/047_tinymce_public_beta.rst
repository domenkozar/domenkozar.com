---
categories: english, tinymce, plone, python, release
author: Domen Kožar
date: 2011/10/24 09:10:00
title: "Products.TinyMCE 1.3 beta 1 release"
draft: false
---


Installation
============

- add `<http://static.domenkozar.com>`_ to your find-links
- pin version to **Products.TinyMCE-1.3-beta1**
- run upgrade step in *portal_setup*
- report issues ;-)

Changelog
=========

Detailed changelog is long, (if you are interested) read `following <http://ie.ietherpad.com/61>`_.

Deliverables
============

- tinymce version upgrade 3.2.7 (2009) to 3.4.3 (2011)
- IE9 support (implicitly fixed by previous line)
- Dexterity support
- Plone 3 and 4 compatible
- rewritten Image and Link plugins (now named as plonebrowser) with jQuery
- configurable shortcuts in browser plugin
- GS migration
- JavaScript compressor 
- KSS is gone
- tested on opera/chrome/firefox/IE7/IE8/IE9
- split tinymce project to a fork of github.com/tinymce/tinymce/

Known issues
============

- editing existing link on image does not recognize current link
- few IE7 design glitches

`If this work is helpful to you, please contribute to my trip to PloneConf2011 <http://ielectric.chipin.com/planet-ticket-to-plone-conference-2011>`_
