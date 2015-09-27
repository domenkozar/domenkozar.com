---
categories: english, python, pyramid, plone, gentoo
author: Domen Kožar
date: 2013/03/07 23:30:00
title: "Contributions in February"
draft: false
---

Following is a monthly update on my contributions to open source and community around it.

- `FOSDEM2013 <https://fosdem.org/2013/>`_ was a very affordable open source conference in Brussels
  that laste for one weekend. I have attended it purely as participant, watching talks and saying hello
  to old friends from Python community. There was so much going on, it's hard to tell. Besides
  `Python track <https://fosdem.org/2013/schedule/track/python/>`_ I really enjoyed
  `Assholes are killing your project <https://fosdem.org/2013/schedule/event/assholes/>`_,
  which was completely **packed**. See videos on http://video.fosdem.org/2013/.

- https://www.kiberpipa.org (our local hackerspace community) has a new website!
  `@taveliki <https://twitter.com/taveliki>`_ decided old website was too old and useless,
  so he started working on the redesign based on twitter.bootstrap. Main goal was to
  simplify the website and be responsive. This project took quite some of my free time and
  I'm really happy it's out there!

- Simple patch for `python-twitter <https://github.com/bear/python-twitter/tree/api_v1.1>`_
  to `fetch user profile images over HTTPS <https://github.com/bear/python-twitter/commit/67cbb8390701c945a48094795474ca485f092049>`_.
  Since twitter is disabling 1.0 API this month, I'm still waiting for
  `1.1 <https://github.com/bear/python-twitter/tree/api_v1.1>`_ branch to be merged.

- `@garbas <https://twitter.com/garbas>`_ finally convinced me try `NixOS Linux distribution <http://nixos.org/>`_.
  NixOS changes Linux packaging completely and obsoletes (sorry) your Linux sysadmin practices. It's very similar to
  `Puppet <https://puppetlabs.com/>`_, only that it renders configuration for your machine except trying
  to control your Linux distribution. Also similar to zc.buildout we use in Python world.
  
  A day after I got introduced to NixOS, I started creating pull requests with new packages
  and new services. I'm preparing
  `NixOS configuration for my HTPC box <https://github.com/iElectric/nixos-configuration/blob/master/ananas/configuration.nix>`_,
  which you will only run and got the same environment every time. I packaged
  `deluge <https://github.com/NixOS/nixpkgs/commit/77f61dd9878f26dd06fc7232d8d93b9858ded3d8>`_,
  `FlexGet <https://github.com/NixOS/nixpkgs/commit/acc5d4040e8e849a83a69f5afcc301c360bbfa46>`_,
  `beets <https://github.com/NixOS/nixpkgs/commit/9d73b9ca5101856a6e34a65033e69f8baf4df950>`_,
  `upgraded bacula <https://github.com/NixOS/nixpkgs/commit/207443b1849e7b1ce65059d2fdad81db04cc75d8>`_,
  `added xbmc as window manager <https://github.com/NixOS/nixos/commit/4a663316257509e82700f5166aa490db46e93ffe>`_,
  `nginx service <https://github.com/NixOS/nixos/commit/854a37aa7e66bf4f3ef4e0e7ad3947a62b80c5e5>`_
  and now I'm working on bacula service. You can track the progress on https://trello.com/board/htpc/511fd953b0854eab610028a5.

- I haven't found any time to work on `mr.bob <https://github.com/iElectric/mr.bob>`_,
  but community of users is getting bigger! See https://github.com/teixas/bobtemplates.fanstatic,
  https://github.com/gforcada/bobtemplates.plone, https://github.com/svx/bobtemplates.leftxs,
  https://github.com/glenfant/bobtemplates.gillux.

- Released `pyramid_tinymce_spellchecker 0.1 <https://github.com/iElectric/pyramid_tinymce_spellchecker>`_.
  Just a simple Ajax pyramid view that TinyMCE spellchecker calls. Currently only supports Enchant backend.

- 3 day `WebTest sprint in Paris <http://pythonsprints.com/2013/02/26/webtest-paris-sprint-report/>`_
  ended up with 100% test coverage, some bug fixes and `2.0 <https://webtest.readthedocs.org/en/latest/changelog.html#id2>`_
  release. New pull requests (including tests) are coming in on daily basis, which I would claim as
  a victory. `2.0.1 <https://webtest.readthedocs.org/en/latest/changelog.html#id1>`_
  was already released to include some of them.

If you have an interesting problem to solve under a public license, I'm happy to hear from you at domen@dev.si :-)

Cheers, Domen
