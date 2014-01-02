---
categories: english, plone, gentoo, nix
author: Domen Kožar
date: 2014/01/02 12:30:00
title: "Getting started with Nix package manager"
draft: false
---

[Nix](http://nixos.org/nix/) is a package manager implemented as a minimalistic functional
language. 

[Nix package](https://github.com/nixos/nixpkgs), for example
[Nginx](https://github.com/NixOS/nixpkgs/blob/master/pkgs/servers/http/nginx/default.nix#L39)
is a result of a function [mkDerivation](http://nixos.org/nix/manual/#ssec-derivation) and 
Nix tries very hard for result to have two properties:

- No side-effects. Given the same input to the function, you should get the same binary package stored in [Nix Store](http://nixos.org/nix/manual/#idp26825824).
- Package in [Nix Store](http://nixos.org/nix/manual/#idp26825824) is [immutable](http://en.wikipedia.org/wiki/Immutable_object).

Nix supports **Linux**, **OS X** and **FreeBSD** platforms (probably others like Cygwin,
 but not as officially supported).

Although [Nix Manual](http://nixos.org/nix/manual) is quite verbose about how to use Nix,
I'll explain in short how to bootstrap and get started.


# A few reasons why to use Nix instead of system package manager

- Install packages independent of your system environment (try installing Python 2.6, 2.7, 3.2, 3.3 and PyPy on CentOS)
- Reproducible environment: instead of using language dependent package managers to build development
  environment, use language agnostic tool
- Binary and source install
- Give your unix user the power to install packages
- Did I mention it's portabale and built to be reproducible?
- [Other features I'm not going to dive in](http://nixos.org/nix/)


# Installing Nix (in [single user mode](http://nixos.org/nix/manual/#idp24312864)):

You'll need installed `bash`, `sudo` and `curl` commands.

    $ curl -L http://git.io/nix-install.sh | bash

["Don't pipe to your shell"](http://www.reddit.com/r/programming/comments/1pnkxs/dont_pipe_to_your_shell/cd6emwl),
I know. [Let's not talk about the color of the atomic bomb and how the color might be potentially dangerous](http://www.reddit.com/r/programming/comments/1pnkxs/dont_pipe_to_your_shell/cd6emwl)
**Nevertheless, I strongly advise you to take a look at the script before executing it**.
After you are comfortable with it, let's agree that above one-liner is convenient. If you insist, there is
[documentation to type this stuff manually](http://nixos.org/nix/manual/#idp24454512).

If you really read the script carefully, you now know it will only populate two directories
for you: `/nix/` and `~/.nix-profile/`. 

You should see something like this:

    :::console
    ======================================
    Platform detected: linux i686
    Downloading Nix for your platform...
    ======================================
    Installation finished.  To ensure that the necessary environment
    variables are set, please add the line
  
      source /home/ubuntu/.nix-profile/etc/profile.d/nix.sh
  
    to your shell profile (e.g. ~/.profile).
    ==============================
    Adding Nix Packages channel...
    ==============================
    ========================
    Updating Nix Packages...
    ========================
    unpacking channels...
    created 2 symlinks in user environment
    building path(s) `/nix/store/v5c7nqdad5pmggnhmax91yj49fw9jcyd-user-environment'
    created 6 symlinks in user environment
    ========================================================================
  
    Make sure to source Nix user profile to use Nix:
  
      source /home/ubuntu/.nix-profile/etc/profile.d/nix.sh
  
    ========================================================================
                                                          ... happy Nix-ing!


Let's activate your [Nix profile](http://nixos.org/nix/manual/#sec-profiles) and use some
[basic package management](http://nixos.org/nix/manual/#idp24589920) commands.

    $ source ~/.nix-profile/etc/profile.d/nix.sh

# Searching for packages

    $ nix-env -qaP | grep python3-3
    nixpkgs.python32                               python3-3.2.5
    nixpkgs.python33                               python3-3.3.3
    nixpkgs.python3                                python3-3.3.3

To list all installed packages run:

    $ nix-env -q
    nix-1.6.1

# Installing packages

Packages can be referenced by two identifiers, first one is name of the package that might not be unique:

    $ nix-env -i python3-3.3.3
    ... log of downloading binary packages

If there are two packages that share the same name (this might be due to the fact that they provide different scopes of features),
you can reference them with [an attribute set value](http://nixos.org/nix/manual/#ssec-values):

    $ nix-env -iA nixpkgs.python3
    ... log of downloading binary packages

# Updating packages

To update a package and it's dependencies run:

    $ nix-env -uA nixpkgs.python3
    ...

To update all installed packages:
 
    $ nix-env -u
    ...

# Uninstalling packages

    $ nix-env -e python3-3.3.3
    uninstalling `python3-3.3.3`

# Binary Channels

Nix will try to download a binary package first and fallback to compiling from source.

To update binary channel, run:

    $ nix-channel --update
    downloading Nix expressions from ...

# Garbage collection

When a package is uninstalled, it's not removed from [Nix Store](http://nixos.org/nix/manual/#idp26825824),
but symlinks are removed from your profile.

To actually remove uninstalled packages, run:

    $ nix-collect-garbage
    ...

# Reading on

- [Sharing packages between machines](http://nixos.org/nix/manual/#sec-sharing-packages)
- [Multi-user mode](http://nixos.org/nix/manual/#ssec-multi-user)
- [Contributing a package to Nix](http://nixos.org/nixpkgs/manual/)
- Seriously? I want a whole Linux distribution based on this. [You got it](http://nixos.org/nixos/).

Have fun! Report any bugs to [Github](https://github.com/NixOS/nixpkgs/issues) or drop by on  [#nixos IRC channel](http://webchat.freenode.net?channels=%23nixos&uio=d4).

*Disclaimer: I've been using Nix for about a year now and
[back then I had been a long time Gentoo user](https://www.domenkozar.com/2013/07/20/9-years-of-linux-distributions/).
I'm also giving a talk [NixOS: declarative configuration Linux distribution](https://fosdem.org/2014/schedule/event/nixos_declarative_configuration_linux_distribution/) at [FOSDEM 2014](https://fosdem.org/)*.

*Upcoming blog posts will focus on **why** and **how** is [Nix](http://nixos.org/nix) such a game changer in the packaging world.*
