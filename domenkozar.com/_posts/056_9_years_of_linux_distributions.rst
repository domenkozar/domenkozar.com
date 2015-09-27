---
categories: english, plone, gentoo, nixos
author: Domen Kožar
date: 2013/07/20 22:00:00
title: "9 years of Linux distributions"
draft: false
---


Linux world opened to me back in high school. After `4 years of gaming <http://www.conn.si/?page_id=5162>`_ through high school,
it was obvious to me: e-sports are slowly evolving and living in a country as Slovenia it's a dead end. 

After talking with more experienced colleagues, my first distribution was `Gentoo <http://gentoo.org/>`_ - as it promised freedom. A week of reading
Gentoo Handbook and fixing of typical mistakes beginner mistakes, I got a working Gentoo installation. I reinstalled it a
few times in next months because I wanted to improve my environment and also practice day long installation procedure.

I remember the day (about half a year after being introduced to Gentoo) that I deleted my `/var/lib/` directory. As a stubborn
beginner eager to learn something from that, I didn't listen to advices on #gentoo about just reinstalling (that what I would do today).
Days of research lead me to believe, re-bootstrapping my system with stage3 was the only way to go (and practically the same as installation).

I was enjoying Gentoo. Every year the tools got better, the community matured and I even did a `GSOC2010 <https://www.domenkozar.com/category/gpypi2/>`_.
But that was also the time I started freelancing and traveling. I couldn't afford my Linux distribution bailing on me - and it did. 
Installing a package broke the system and rebuilding all python packages and other stuff took a day (more like a night).
That was not acceptable. I'm not saying it was Gentoo's fault or mine - it's not important. I had a broken system while a job to be done was waiting.

It was time to re-think about my usage of the Operating System. The server part was still clear; use Gentoo as it provides a solid ground once it's bootstrapped.
But in 2010 Ubuntu became very close to stable and I gave it a try. For next three years it was my desktop of choice. Even Lenovo X201s hardware worked
out of the box (well it's certified to do so). With some Googling most of problems could be solved within an hour.

While being unhappy with Ubuntu for last year of really
`annoying bugs I couldn't solve <https://bugs.launchpad.net/ubuntu/+source/network-manager-applet/+bug/965895>`_, I was searching for a new exit, since I couldn't do anything
about fixing those bugs except for waiting for them to be fixed. But this year, `Florian Friesdorf <https://github.com/chaoflow>`_ convinced `Rok Garbas <http://garbas.si>`_
to install `declarative configuration <http://en.wikipedia.org/wiki/Declarative_programming>`_ style distribution called `NixOS project <http://nixos.org/>`_  and
soon after `NixOS install fest in Kiberpipa <https://www.kiberpipa.org/sl/event/nixos-install-fest-1796/>`_, I was preparing my next desktop environment in a VirtualBox
that I would later copy configuration to my laptop and NixOS would setup the environment to the same state. The scary part was - the cake wasn't a lie.

While NixOS community is smallish (~90 people hang on #nixos) and not everything is packaged and well tested, the language Nix gives so much power into my
hands that I'm not going back. And what's even better, I can have NixOS installed on server and have the same environment on server as on desktop.

`NixOS <http://nixos.org/nixos/>`_ promises rollbacks (remember those failing upgrades), user profiles (install software as a user in named environments),
install multiple versions of same software, allows upgrading of your system and booting a virtual machine before you actually apply the upgrade, source
and binary distribution, etc. It takes a single configuration file to bootstrap your system. It downloads all needed packages and configures software as instructed.

This is all possible due to design of `Nix the functional language <http://nixos.org/nix/>`_ below NixOS.
It takes `about a day to learn Nix <http://hydra.nixos.org/build/5567000/download/1/manual/#chap-writing-nix-expressions>`_ with more than 15000 packages as an examples
in `nixpkgs <https://github.com/NixOS/nixpkgs>`_. Nix isolates package building process from the filesystem and it's usable as an addition to your package manager - it works
on all Unix-like platforms.

But the key part why NixOS is so attractive is automation. If I 
`commit a new package to nixpkgs repository <https://github.com/NixOS/nixpkgs/commit/8ea138d2121c008cb009fa0f34917ff560af182b>`_ following will happen:

- `Hydra <http://hydra.nixos.org/jobset/nixos/trunk-combined>`_ will pickup the commit from github and based on changes figure out `what packages need to be rebuild <http://hydra.nixos.org/eval/954522>`_ (including dependencies)
- Hydra will build the package on desired platforms and `provide a binary if build succeeded <http://hydra.nixos.org/search?query=speedtest_cli>`_
- Hydra will run any written tests against the package
- Hydra will send me an email (if I'm assigned as maintainer of the package and if the package is broken)  
- If NixOS `tests will pass <http://hydra.nixos.org/view/nixos/tested>`_, Hydra will `build <http://hydra.nixos.org/view/nixos/tested/5566951>`_ NixOS `live cd <http://hydra.nixos.org/build/5566952/download/1/nixos-graphical-13.07pre4871_18de9f6-3c35dae-x86_64-linux.iso>`_, `Virtualbox image <http://hydra.nixos.org/build/5566972/download/1/nixos-13.07pre4871_18de9f6-3c35dae.vdi.xz>`_, `NixOS manual <http://hydra.nixos.org/build/5566225/download/1/nixos/manual.html>`_ and `update binary channel <http://hydra.nixos.org/build/5566951/download/1/nixos-13.07pre4871_18de9f6-3c35dae.tar.xz>`_ (NixOS instructions where to find binary packages)  

I'm currently extremely happy NixOS user and contributor. I don't mind contributing to Linux distributions, in fact we are having `first NixOS sprint in Slovenia in two days <http://www.coactivate.org/projects/zidanca-sprint-2013/project-home>`_.
