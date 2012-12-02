---
categories: english, python, pyramid, plone, gentoo
author: Domen Kožar
date: 2012/12/01 13:30:00
title: "Movember contributions"
draft: false
---

November has been a busy month. Some things I have been involved with (mostly during weekends and evenings):


- released `mr.bob <http://mrbob.readthedocs.org/en/latest/>`_ (project skeleton renderer replacing `Paste <http://pythonpaste.org/script/>`_ and `templer <http://templer-manual.readthedocs.org/en/latest/>`_) `0.1a2 <http://pypi.python.org/pypi/mr.bob/0.1a2>`_ and `0.1a3 <http://pypi.python.org/pypi/mr.bob/0.1a3>`_. I'd love more people to try it out. No Python knowledge is needed to write a template. Example: `<https://github.com/disko/bobtemplates.kotti>`_
- minor `eestec.portal <https://github.com/eestec/eestec.portal>`_ improvements for next generation Plone portal for `<http://eestec.net>`_
- wrote `kiberpipa.bookshelf <https://github.com/kiberpipa/kiberpipa.bookshelf>`_ (pyramid web application displaying ebook metadata from solr backend)
- lot's of thinking and talking how to crowdfund our local `hackerspace Kiberpipa <https://www.kiberpipa.org/en/>`_, since it's lack of money is stopping some really promising projects
- `wrote <https://github.com/iElectric/augeas_bacula/blob/master/bacula.aug>`_ augeas (config parser translating it to a tree that allows modifications and saving the file in correct format) for bacula (open source backup tool) as part of `Almir <http://almir.readthedocs.org/en/latest/>`_ improvements (web administration for bacula written in pyramid)
- released webtest `1.4.1 <https://webtest.readthedocs.org/en/latest/#id10>`_, `1.4.2 <https://webtest.readthedocs.org/en/latest/#id11>`_, `1.4.3 <https://webtest.readthedocs.org/en/latest/#id12>`_ (basically just made a release that now supports deform functional testing, and migrated repository from Bitbucket to `GitHub <https://github.com/Pylons/webtest>`_)
- python3 support for buildout recipe `hexagonit.recipe.download <https://github.com/hexagonit/hexagonit.recipe.download>`_ (needed to properly use zc.buildout on python3 for webtest)
- `released pyramid_jinja2 1.5 <http://pypi.python.org/pypi/pyramid_jinja2/1.5>`_
- backport/deprecate `deform.Set <http://deform.readthedocs.org/en/latest/changes.html#next-release>`_ in favor of new `colander.Set <https://github.com/Pylons/colander/pull/71>`_
- planning second `Ljubljana Python User Group <http://www.meetup.com/Ljubljana-Python-Group/>`_ meetup


Two more blogs posts are planned on topic of **mr.bob** and **zc.buildout**. Stay tuned :-)
