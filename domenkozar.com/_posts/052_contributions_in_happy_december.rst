---
categories: english, python, pyramid, plone, gentoo
author: Domen Kožar
date: 2013/01/02 23:30:00
title: "Contributions in happy December"
draft: false
---

Another month passed by, another update. I'll try to keep this on monthly basis:


`mr.bob <https://mrbob.readthedocs.org/>`_ does your project skeleton templates. Today I
`released <http://mrbob.readthedocs.org/en/0.1a6/HISTORY.html#a6-2013-01-02>`_ *0.1a6* which introduces
`hooks <http://mrbob.readthedocs.org/en/0.1a6/templateauthor.html#hooks>`_.
It allows you to hook into various places of the rendering flow. Before/after a question is asked and
before/after rendering of directory structure. It's also a cleanup release before last missing piece
is implemented - dependance between templates. I also updated my
`bobtemplates.ielectric <https://github.com/iElectric/bobtemplates.ielectric/>`_ templates to be used
with newest ``mr.bob 0.1a6`` release. There are already few packages using it, for example
`bobtemplates.niteoweb <https://github.com/niteoweb/bobtemplates.niteoweb>`_ and
`bobtemplates.kotti <https://github.com/kotti/bobtemplates.kotti>`_.


`29c3 <http://events.ccc.de/congress/2012/Fahrplan/>`_ - every year at the last week of December,
Hackers organize a conference in Germany. Those are the
people tinkering tools in a way they weren't designed. In most of the cases it results in security holes.
There were way too many interesting things to note here, going from
`brewing probiotic beverages <https://events.ccc.de/congress/2012/wiki/Brewing_probiotic_beverages>`_ to `Hotel card
door hacking <https://events.ccc.de/congress/2012/wiki/Hotel_Door_Unlocking_Kit_Assembly>`_,
mostly aimed to inform general public about issues we have to face when considering security.
This year there was a lot of political movement around privacy and neutral net. There are estimations that
the new data center NSA is building in Utah could crack 1080bit RSA keys in ~year, parallelized for thousands
of keys in a row due to batch algorithms. I very recommend skimming 29c3
`schedule page <http://events.ccc.de/congress/2012/Fahrplan/>`_ and at least watching the
`keynote <http://www.youtube.com/watch?v=QNsePZj_Yks>`_ by
`@ioerror <http://www.youtube.com/watch?v=QNsePZj_Yks>`_.


`Products.TinyMCE <https://github.com/plone/Products.TinyMCE/pull/40>`_ - quite a short patch to add
a feature of "adding an image by external URL".


`django-akismet-comments <https://github.com/iElectric/django-akismet-comments>`_ - got tired of all
crappy Django solutions to provide `Akismet spam protection <http://akismet.com/>`_ to Django
commenting framework.  Still lacks a command to clean current spam comments and a way to flag
comments as spam/ham that will teach Akismet to be a better filter.

**UPDATE**: I forgot about `http://pypi.python.org/pypi/nose-selecttests/0.3`_ release, a package to filter out
what tests to run from testsuit when using nose test runner.



If you have an interesting problem to solve under public license, I'm happy to hear from you at domen@dev.si :-)
