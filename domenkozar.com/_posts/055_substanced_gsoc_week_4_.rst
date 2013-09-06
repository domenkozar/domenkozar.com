---
categories: english, gsoc, substanced, python, plone
author: Domen Kožar
date: 2013/07/17 01:50:00
title: "Substance D — Google Summer of Code 2013 week 4"
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


Here is the progress done last week (and yesterday):

- Submitted `pull request adding support for evolution package through webui <https://github.com/Pylons/substanced/pull/86>`_

- I've quickly thrown together an actual app with Substance D, adding a few content types, views and templates.
  Mostly to feel more comfortable as an user and to help me with evaluating how to do multilingual support.

- I've given some thought on the matter of multilingual content and decided to write a document of why/how to
  implement multilingual support into Substance D. On EuroPython, we agreed with Ree Balazs that we need at
  least low-level support for that in Substance D since having that outside of core makes it very hard (we
  learned that lesson in Plone the hard way). Ramon Navarro Bosch (author of plone.app.multilingual) has also
  offered help on brainstorming and we had a first discussion last week. 

Next week:

- Experiment with deform/colander/substanced to implement translatable fields, write a document about design goals
  of multilingual support

- https://github.com/Pylons/substanced/issues/84

- https://github.com/Pylons/substanced/issues/67  

- tests for https://github.com/Pylons/substanced/issues/71
