---
categories: english, tinymce, plone, python
author: Domen Kožar
date: 2011/08/08 00:20:00
title: "GSOC #3: TinyMCE improvements for Plone"
draft: false
---

Wow, a lot has happened since my last blog post. Highlight of the July being the Sauna Sprint 2011!

.. image:: images/046_groupphoto.jpg
    :width: 600px

**Tom Gross** worked on improving TinyMCE integration with JQuery plugin, javascript combiner and compressor. Now plain Plone 4 production site has 1/3 less requests in edit mode.

**Kai Lautaportti** `refactored <https://github.com/collective/tinymce/blob/3.4.3-plone/jscripts/tiny_mce/plugins/ploneimage/js/ploneimage.js>`_ ploneimage.js from stratch with JQuery, no globals, documentation and jslint.

**Roel Bruggink** was really helpful with improving user stories and overall experience.

Also thanks to `Peter Čuhalev <http://yukaii.com/>`_ for work on `amazing redesign <http://yukaii.com/data/plone-tinymce/>`_ of image/link browser dialogs. His work was kindly sponsored by `Hexagon IT <http://www.hexagonit.fi/>`_, you guys rock! If you do like his contribution, it's best to `offer <mailto:peter@yukaii.com>`_ him more proper open source craziness.

Changelog:

* pluggable (ZCA) shortcuts in browser dialog [iElectric]
* livesearch is now actually usable in browser dialog [iElectric]
* provide JQuery in plugins [iElectric]
* various bugfixes from tinymce upgrade [iElectric]
* refactor ploneimage to use JQuery and not fail at all javascript caveats, satisfy jslint, docstrings [dokai]
* properly use plone.app.imaging [iElectric + dokai]
* configurable thumbnails for in browser dialog [iElectric]
* json views return correct content type [iElectric]
* JQuery plugin, compressor and javascript combiner [tomgross]
* UX improvements in browser dialog [iElectric]
* improved upgrade procedure [tomgross + dokai]
* fixed #10803 [iElectric]

.. image:: images/046_dialog.png
    :width: 600px

.. image:: images/046_thumbs.png
    :width: 600px

I plan to provide following (under GSOC section) until the end of GSOC2011 (or a bit later, if time bites me): http://ie.ietherpad.com/61

Other features may be implemented somewhat in the future, don't hesitate to contact me if you have a need to prioritize. As a reminder, changes to be merged in svn trunk are compatible with Plone 4.1+, mainly for depending on plone.app.imaging thumbnail generation.

Release is coming soon, I will be rolling out public beta sometime in next week. Feedback appreciated. 

I'd like to thank again sponsors for my last years Sauna Sprint trip, it was an important stepping stone. This year was twice more amazing, woooohoooo for Sauna Sprint 2013!
