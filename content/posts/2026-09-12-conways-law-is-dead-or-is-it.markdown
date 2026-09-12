---
categories: ["english", "ai", "open source"]
author: Domen Kožar
date: 2026-09-12 09:00:00
title: "Conway's Law Is Dead. Or Is It?"
draft: false
slug: conways-law-is-dead-or-is-it
description: "AI is part of our communication structures now. Adapting to it changes both the software we build and who can participate."
---

[Conway's law](https://en.wikipedia.org/wiki/Conway%27s_law) says that software reflects the communication structures of the
organizations that build it.

**AI is now part of those structures**: interpreting
requests, writing code, and reviewing changes.

Yet we often assume our existing
workflows should stay fixed, and AI should adapt to them.

Consider someone submitting a bug fix. They want something to work; the maintainer
needs confidence that it does. Yet projects sometimes test the contributor
instead.

[Ghostty's agent instructions](https://github.com/ghostty-org/ghostty/blob/main/AGENTS.md)
tell AI asked to submit an issue or pull request to add a file insulting its user.

In [Zed, where GPUI lives](https://github.com/zed-industries/zed/blob/main/.rules),
agents must add a README notice that only a human may remove to confirm review.

Both leave a marker intended to catch submissions made without human inspection.

These checks resemble school tests designed to catch students who didn't read the
instructions.

**We need to move toward outcomes**:

- Does the fix address a reproducible failure?
- Does a regression test capture the intended behavior?
- Does a benchmark demonstrate the claimed improvement?

Human judgment still matters in deciding whether that evidence measures the right
thing.

But this creates another tension. Requiring tests, benchmarks, and detailed
evidence for every change can be **practical with an agent and expensive for someone
working by hand**.

Meanwhile, projects relying on careful human inspection can
struggle with the volume AI produces.

**The workflow starts selecting who can participate.** Projects may drift toward
predominantly AI-written or predominantly human-written software because
accommodating both carries costs.

The practices that make a project manageable
for one group can make participation harder for the other.

**Alignment therefore involves humans adapting too.** We need to figure out how the
whole system of humans and AI communicates, establishes trust, and shares
responsibility.

That includes questioning our existing workflows and recognizing
who gets excluded by their replacements.

Conway's law may still hold. **The organization it describes now includes AI**, and
its software will reflect how we resolve these tensions.
