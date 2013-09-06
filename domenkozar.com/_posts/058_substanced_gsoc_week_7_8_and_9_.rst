---
categories: english, gsoc, substanced, python, plone
author: Domen Kožar
date: 2013/08/18 23:00:00
title: "Substance D — Google Summer of Code 2013 week 7, 8 and 9"
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


Things done in 7. week
----------------------

Finished initial implementation of `substanced_multilingual <https://github.com/iElectric/substanced_multilingual>`_
and played around to see how well it works in practice.

It's possible to define language through pyramid configurator, define folder that will include translated property sheets
for registered multilingual languages. 
`substanced_multilingual <https://github.com/iElectric/substanced_multilingual>`_ will also register traversal routes
for each language as a conveniece to register multilingual views.  Documentation and tests are still missing, I'd first
like to refactor few things to make whole configuration DRY.

There are few issues with current prototype that need to be addressed:

- you have to register one `@view_config` per language for a view - not very DRY 
- you can not use multilingual folder as a real folder to place in more content  
 

8. week
-------

Not much progress was done in 8. week. I was discussing with Paul Everitt, Chris McDonough and Ree Balazs what
would be the scope of merging deform_bootstrap in deform and thus releasing deform2.

9. week
-------

I've started working on `deform_bootstrap <https://github.com/Kotti/deform_bootstrap>`_ merge into `deform <https://github.com/Pylons/deform/>`_
as part of the `Pyramid sprint in Halle <https://github.com/Pylons/pyramid/wiki/Pyramid-Summer-Sprint-in-Halle-(DE)-August-2013>`_.
The result of the sprint are deform2 branches on official `deform2 <https://github.com/Pylons/deform/tree/deform2>`_
and `deformdemo <https://github.com/Pylons/deformdemo/tree/deform2>`_ repositories. Paul helped me with porting deform_bootstrap to Twitter Bootstrap 3
and jQuery 2, which I later merged into the deform2 branch. 

You can read full sprint report `here <https://github.com/Pylons/pyramid/wiki/Pyramid-and-Pylons-Project-Summer-Sprint-2013-Wrap-Up>`_.

Next week
---------

- Continue tasks from `deform2 branch TODO list <https://github.com/Pylons/deform/blob/deform2/deform/TODO>`_
