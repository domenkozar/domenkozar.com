---
categories: english, gsoc, substanced, python, plone
author: Domen Kožar
date: 2013/08/01 01:00:00
title: "Substance D — Google Summer of Code 2013 week 5 and 6"
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


Things done in 5. week
----------------------

- Added tests for `initial implementation of evolve webui <https://github.com/Pylons/substanced/pull/86>`_ (merged)

- Submitted `define user.timezone and use that when displaying datetime in templates <https://github.com/Pylons/substanced/issues/92>`_ (merged)

- Submitted `add autoevolve prototype <https://github.com/Pylons/substanced/pull/89>`_ (merged) 

6. week
-------

I attended `Zidanca Sprint <http://www.coactivate.org/projects/zidanca-sprint-2013/project-home>`_.
It was mainly focused on `NixOS <http://nixos.org/>`_ but I discussed about multilingual support with
Daniel Nouri since he was also `re-thinking multilingual for Kotti <http://danielnouri.org/notes/2013/07/31/kotti-zidanca-sprint-report>`_
 
Main discussion was about how content around multilingual should be structured.

There were four ideas floating around:

- implement something similar to `LinguaPlone <http://plone.org/products/linguaplone>`_.
  There is a canonical object (dominating translation) and rest of translations are bound to it.
  The major drawback here is that explaining canonical object to users is very annoying, specially
  if all languages are treated equal (like Spanish and Catalan :-)

- there is no canonical object, all translations are equal to each other and use "shared object" as
  a backend for non-translatable fields in the content

- there is no canonical object, but one shared object proxies all translatable field interaction to
  hidden layer where translations lie (in some language roots)

- there is no canonical object, all objects are equal and non-translatable fields are always synced
  between each other on modifications (current 
  `plone.app.multilingual <https://github.com/plone/plone.app.multilingual>`_ implementation)

Note that content organization has strong implications on other important parts of multilingual: UI, searching and URLs.

After almost going for third option, I explained those wise ideas to my GSOC mentor Chris McDonough. It didn't
take much to convince me that framework-ing multilingual is an old idea that might be in vain. Decided to
make it as an application and re-use what Substance D currently provides.

Started `substanced_multilingual <https://github.com/iElectric/substanced_multilingual>`_ package. Currently
it registers languages and defines folderish content that has translatable content as items.
SPOILER: Lot's of TODOs inside.


Next week
---------

- continue with multilingual support for Substance D
- fix smallish tickets in between
