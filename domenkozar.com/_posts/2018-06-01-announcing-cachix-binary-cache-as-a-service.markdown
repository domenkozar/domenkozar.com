---
categories: english, nix, nixos, elm, haskell, gentoo
author: Domen Kožar
date: 2018/06/01 10:00:00
title: "Announcing Cachix - Binary Cache as a Service"
draft: false
---


In the last 6 years working with [Nix](https://nixos.org/nix/) and mostly in [last two years full-time](https://www.enlambda.com/),
I've noticed a few patterns.

These are mostly direct or indirect result of not having a "good enough" infrastructure
to support how much Nix has grown (1600+ contributors, 1500 pull requests per month).

Without further ado, I am announcing [https://cachix.org](https://cachix.org) - Binary Cache as a Service that
is ready to be used after two months of work.

## What problem(s) does cachix solve?

The main motivation is to save you time and compute resources waiting for your packages to build. By using
a shared cache of already built packages, you'll only have to build your project once.

This should also speed up CI builds, as Nix can take use of granular caching of each package,
rather than caching the whole build.

Another one (which I personally consider even more important) is decentralization
of work produced by Nix developers. Up until today, most devs pushed their software updates
into the nixpkgs repository, which has the global binary cache at https://cache.nixos.org.

But as the community grew, fitting different ideologies into one global namespace became impossible.
I consider nixpkgs community to be mature but sometimes clash of ideologies with rational backing occurs.
Some want packages to be featureful by default, some prefer them to be minimalist. Some
might prefer lots of configuration knobs available (for example cross-compilation support or musl/glib swapping),
some might prefer the build system to do just one thing, as it's easier to maintain.

These are not right or wrong opinions, but rather a specific view of use cases
that software might or might not cover.

There are also many projects that don't fit into nixpkgs because their releases are too frequent,
they are not available under permissive license, are simpler to manage over complete control
or maintainers simply disagree with requirements that nixpkgs developers impose on contributors.

And that's fine. What we've learned in the past is not to fight these ideas, but allow them to
co-exist in different domains.

If you're interested:

- [roadmap](https://cachix.org/#roadmap)
- [faq](https://cachix.org/#faq)
- [GitHub repo for the client](https://github.com/cachix/cachix)
- [HN](https://news.ycombinator.com/item?id=17203785)

Domen (domen@enlambda.com)
