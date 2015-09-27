---
categories: english, plone, gentoo
author: Domen Kožar
date: 2013/10/22 23:30:00
title: "Getting started with NixOS"
draft: true
---

*It's the first Linux distribution that I'm really happy about,*
`read more about my history with Linux <https://www.domenkozar.com/2013/07/20/9-years-of-linux-distributions/>`_.

There are many ways to start with `NixOS <http://nixos.org/nixos/>`_, the first
declarative configuration operating system based on Linux/GNU. Let's go with
the most approachable way and use `NixOps <https://github.com/NixOS/nixops>`_
to deploy NixOS into a virtual machine with your favourite Linux distribution,
OS X or FreeBSD.

What's the most special property of NixOS?
******************************************

Before we dive into the details, I should explain why 
`declarative configuration <http://en.wikipedia.org/wiki/Declarative_programming>`_ 
changes so much about operating systems. Looking at
`Wikipedia article about open source configuration management software
<http://en.wikipedia.org/wiki/Comparison_of_open-source_configuration_management_software#Basic_properties>`_
we can see most of the projects started around year 2000, less than ten years
after Linux was created (Nix project was started in 2003).

What most of those configuration management software offers is automated
**imperative configuration**, *collection of steps that describe
what commands to execute to get operating system in desired state*.

Interesting part of the Wikipedia list are those who try to achieve **declarative configuration**,
*describing in what the state should the operating system be* (A great example of
**declarative programming** is SQL, which makes communication with the database minimal
instead of writing long scripts of logic how to aggregate all the data).

What NixOS changes about operating system configuration that makes it so special is *how*
it achieves *what* is declared in configuration. Contrary to `Puppet <http://en.wikipedia.org/wiki/Puppet_(software)>`_,
which tries to resolve current state of the operating system to guide it into desired state
(extremely hard problem to solve), **NixOS configures operating system stateless** - all
output (packages, configurations) is a reflection of the configuration and has nothing
to do with the current state. NixOS relies on some quite strong ideas to implement stateless
configuration. Interesting features pop up due to the concept of how it works, for example
**system-wide rollbacks**. `Read more about unique features of NixOS <http://nixos.org/nixos/>`_.

Bootstrapping Nix
*****************

To start with NixOS, we need to install NixOps with `Nix <http://nixos.org/nix/>`_, a very
minimal `functional language <http://en.wikipedia.org/wiki/Functional_programming>`_ that
implements a `package management system <http://en.wikipedia.org/wiki/Package_management_system>`_. 

We will be using a small script to automate install, you are encouraged to check the contents if skeptical.
It is not going to touch your system, but only populate ``/nix/`` and ``$HOME/.nix-profile/``.

The only dependencies are **curl**, **bash** (or other shell that supports "source"), **VirtualBox** (4.3 is not supported yet) and **sudo**. Let's go:

.. sourcecode:: console

  $ bash <(curl https://nixos.org/nix/install)

.. warning::

   You should be worried about piping internets to your shell, I advise you to download the script, check contents and then execute it.
   This is just a convenient shortcut that makes some assumptions about security threats.

.. note::

   - under FreeBSD 9.x you might get missing libutils.so.8 error, fix it: `ln -s /lib/libutils.so.9 /lib/libutils.so.8` and `ln -s /lib/libz.so.6 /lib/libz.so.5`
   - under FreeBSD you may need to install few native GNU tools: tar, sed, make
   - under MAC OS X, be sure you use case sensitive filesystem, otherwise you will encounter weird errors  
   - under MAC OS X, be sure you have install xcode and command line utilities: xcode-select --install

Activate Nix:

.. sourcecode:: console

  $ source $HOME/.nix-profile/etc/profile.d/nix.sh

See NixOS in action
*******************

We will be deploying a simple monitoring system called `Munin <munin-monitoring.org>`_
with just a few lines of configuration. With theory behind us and Nix package manager installed,
we can proceed with NixOps, *NixOS-based cloud deployment tool*

.. sourcecode:: console
  
  $ nix-env -i nixops

Create a folder ``lemon-deploy`` and put inside a file ``lemon.nix`` with:

.. sourcecode:: nixos

  {
    network.description = "my simple test of nixos";
  
    lemon = { config, pkgs, ... }:
      { 
        services.munin-node.enable = true;
        # enables cron job which collects data from munin-node on localhost
        services.munin-cron = {
            enable = true;
            hosts = ''
              [${config.networking.hostName}]
              address localhost
            '';
        };
      };
  }

Populate ``lemon-virtualbox.nix`` to describe we will be deploying to VirtualBox:

.. sourcecode:: nixos

  {
    lemon = { config, pkgs, ... }:
      { 
        deployment.targetEnv = "virtualbox";
        deployment.virtualbox.memorySize = 2048; # megabytes
      };
  }


Create `lemon-virtualbox` deployment and deploy it

.. sourcecode:: console

  $ nixops create ./lemon.nix ./lemon-virtualbox.nix -d lemon-virtualbox
  $ nixops deploy -d lemon-virtualbox


Congratulations! You have deployed a NixOS machine to a VirtualBox machine with Munin running.
That was easy, right? Wait until deploy is finished and login into the machine as root. Let's
see if Munin is running

.. sourcecode:: console

  $ ps aux | grep munin

Wait for the cron job (maximum 5 minutes) to complete and you should see generated files
under ``/var/www/munin/``.

If you want to continue:

- `Read more about what NixOps can do and what target environments it supports <http://hydra.nixos.org/job/nixops/master/tarball/latest/download-by-type/doc/manual>`_
- `NixOS reference of supported options <http://nixos.org/nixos/manual/#ch-options>`_  
- `Learn more about Nix usage <http://nixos.org/nix/manual/#chap-package-management>`_  
- `Search for NixOS configurations of random people on github <https://github.com/search?q=nixos-configuration&ref=cmdform>`_
- Join #nixos on Freenode IRC  

*What is your current blocker to try next generationg operating system, except time?*

.. note::

  To uninstall, delete ``lemon-deploy folder``, ``/nix/`` and ``$HOME/.nix-profile``.
