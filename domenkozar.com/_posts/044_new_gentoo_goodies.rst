---
categories: english, pypy, gentoo
author: Domen Kožar
date: 2011/06/07 18:45:53
title: "New Gentoo Goodies"
draft: false
---

Two very wanted features landed in Gentoo Linux portage tree.

  - `PyPy ebuild <https://bugs.gentoo.org/show_bug.cgi?id=300301>`_ submitted just 2 months ago!
  - `automatic unmask of packages <https://bugs.gentoo.org/show_bug.cgi?id=345775>`_ released in portage 2.1.10! Thanks `Zac Medico <http://blogs.gentoo.org/zmedico/>`_, you rock!

*--autounmask* and *--autounmask-write* are two new parameters for portage that every user was dreaming of. It will even respect --ask flag! Here is what happens:

* `emerge --ask --autounmask-write pypy` will ask you to unmask latest pypy version and to confirm configuration changes
* `emerge --autounmask-write pypy` will just unmask needed packages without asking.

In either case, you have to confirm changes with `dispatch-conf` or similar tools. Happy Gentooing!

PS: I put `EMERGE_DEFAULT_OPTS="--autounmask-write"` into `/etc/make.conf` to make life easier.
