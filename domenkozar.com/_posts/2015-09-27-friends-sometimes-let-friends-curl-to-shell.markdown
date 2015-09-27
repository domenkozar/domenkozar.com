---
categories: english, plone, gentoo, nix, nixos
author: Domen Kožar
date: 2015/09/27 20:00:00
title: "Friends sometimes let friends curl to shell"
draft: false
---

Every now and then (actually quite often), people complain on twitter they're
afraid of our simple bash installer for [Nix package manager](https://nixos.org/nix/):

    $ bash <(curl https://nixos.org/nix/install)

Example (from today):

![](/images/nixos-tweet.png)

There are [popular blog posts discouraging](https://www.seancassidy.me/dont-pipe-to-your-shell.html) use of it.

Ask yourself a question, how would package manager install itself? *Via
another package manager?*

If we assume *nixos.org* is not compromised (which is really hard to detect),
**using TLS** to secure connection and with our **simple trick to prevent partial
download** execution (you haven't read the script yet, right?), **what can really go wrong**?

It's the most transparent way to see how the package manager can be bootstrapped:
**read the source, Luke**.

*If you still have a reason why piping to shell is a bad idea, let me know.*
