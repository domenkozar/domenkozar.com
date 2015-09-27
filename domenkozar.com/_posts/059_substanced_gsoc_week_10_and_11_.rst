---
categories: english, gsoc, substanced, python, plone
author: Domen Kožar
date: 2013/09/06 23:00:00
title: "Substance D — Google Summer of Code 2013 week 10 and 11"
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


Week #10 and #11
----------------

Quite a lot was going on `deform2 <https://github.com/Pylons/deform/tree/deform2>`_
development, mostly on week #10:

- redesigned deformdemo
- resources on deformdemo are now loaded by deform resources machiners
- upgrade to Bootstrap 3.0 (from 3.0RC)
- upgrade TinyMCE 3 to TinyMCE 4 and fix styling  
- various widget fixes (mostly connected with styling)
- Chris McDonough started porting Substance D admin UI to deform2 and `it already looks nice <http://i.imgur.com/C6D1FEL.png>`_

I've set up a `deform2demo <http://deform2demo.domenkozar.com/>`_ for those curious to see
deform2 in action (following `NixOS declarative configuration file <https://gist.github.com/anonymous/6344275>`_ was used for deployment).

Next two weeks
--------------

There's not much items left on `deform2 TODO list <https://github.com/Pylons/deform/blob/deform2/deform/TODO>`_.
Nevertheless, there are still three major TODOs:

- fix examples listed under "BROKEN STUFF" section
- fix/rewrite tests on deform2 and deformdemo repositories
- improve pickadate widget and support different variations input fields

Have a nice weekend and feel free to report any bugs from the demo that are missing in TODO :-)
