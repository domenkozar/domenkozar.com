---
categories: english, gsoc, substanced, python, plone
author: Domen Kožar
date: 2013/09/23 02:30:00
title: "Substance D — Google Summer of Code 2013 week #12, #13 and #14"
draft: false
---


Greetings, following is the update for `Substance D <http://substanced.readthedocs.org/en/latest/>`_ project.
Substance D is an application server built using the Pyramid web framework. It can be used as a base to build
a general-purpose web application like a blog, a shopping cart application, a scheduling application, or any
other web app that requires both an administration and a retail interface. Substance D owes much of its spirit
to the Zope application server. Quick links to project info: 


* `Repository, issue tracker <http://github.com/Pylons/substanced>`_
* `Demo <http://substanced.repoze.org/>`_
* `Documentation <http://substanced.readthedocs.org/en/latest/>`_


Week #12, #13 and #14
---------------------

Updates on `deform2 <https://github.com/Pylons/deform/tree/deform2>`_:

- Fixed tests

- Various fixes of broken widgets (see commit logs for details)

Updates on `deform2demo <https://github.com/Pylons/deformdemo/commits/deform2>`_:

- Week #14 was mostly about porting all Selenium tests to
  `WebDriver <http://selenium-python.readthedocs.org/en/latest/getting-started.html>`_.
  There were too many limitations with Selenium RC. Newer versions of Firefox and
  Chromium don't even work with Selenium RC anymore. The good news is, tests are ported

- Fixed tests that were broken with Bootstrap 3 markup


Next (what's missing)
---------------------

Before deform2 alpha release, there are a few things to be done:

- we decided to split Date/Time widgets into Pickadate and HTML5 widgets
- css glitches with orderable sequence  
- readonly templates markup  
- few failing selenium tests
- select2 widgets are not tested with selenium


It has been a long summer. While I'll continue the work on Pylons related technologies, the end of
Google Summer of Code 2013 is around the corner. It was my 4th GSOC and the last one. I'd like to thank
all of my three mentors (you guys are awesome, thank you!):

- Chris McDonough (2012, 2013)
- Rob Gietema (2011)
- Jesus Rivero (2010)
