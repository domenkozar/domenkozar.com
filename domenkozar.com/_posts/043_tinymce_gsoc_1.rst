---
categories: english, tinymce, plone, python
author: Domen Kožar
date: 2011/06/05 23:47:53
title: "GSOC week #1: TinyMCE improvements for Plone"
draft: false
---

Another year, another Google Summer of Code, another project! This time I'm working on most needed and used part of CMS — text editor.

Following has been done on Products.TinyMCE:

* `pep8-ified <https://github.com/iElectric/Products.TinyMCE/commit/7a1d93497e815d481fa8f879804fd21e50084e3e>` the product
* `ported <https://github.com/iElectric/Products.TinyMCE/commit/402aca285f6287026f1387acfd757e8aeaf697da>` all doctests to unit/integration tests 
* `added <https://github.com/iElectric/Products.TinyMCE/commit/a2f4bdf0080abd7e7e354fbd032c780f74488ef8>` product to `jenkins <https://jenkins.plone.org/job/Products.TinyMCE/>` with coverage/pep8/lint reports on Plone 4.0/4.1/3.0
* wrote specifications for new UX of image/link browser in TinyMCE and forwarded it to `Peter Čuhalev <http://yukaii.com/>` for mockups

Next week, I will work on current tickets at plone.org tracker. Time to shoot some bugs!

PS1:Changes were commited to svn collective, although I keep them at `github <https://github.com/iElectric/Products.TinyMCE>`.
PS2: The Sweet Vandals were my spiritual company for past week, wonder what funk is coming up for the next one :)
