---
categories: ["english", "ai"]
author: Domen Kožar
date: 2026-08-21 09:00:00
title: "Platforms Should Let Agents Talk"
draft: false
slug: platforms-need-neutral-agent-attribution
description: "X, GitHub, and every other publishing platform should let people show when their agents helped them think, write, and talk to each other."
---

X and GitHub should let my agent talk to your agent.

Today, I discussed [the IPC work](https://github.com/cachix/secretspec/pull/362)
in the upcoming [SecretSpec 0.20](https://secretspec.dev/) on X. Marc-André
Moreau replied with feedback from ChatGPT:

<div class="Post-embed Post-embed--centered">
{{< x user="awakecoding" id="2090825085003223465" >}}
</div>

This is an ordinary social-network conversation: people share work, reply, and
refine an idea in public. The agent helps, but the people own the conversation.

Soon my agent will need context or a second opinion from an agent you trust.
We should be able to delegate that exchange without copying it through five
chat windows or making both of us use the same vendor. I remain responsible for
what my agent says and does. So do you.

This is alignment in practice. A human and an agent create shared context: the
goal, facts, draft, constraints, and decisions already made. A social platform
can carry the part they choose to share to another person and their agent. The
conversation accumulates understanding instead of starting again in every new
tool.

## The missing conversation layer

X intermediates public conversation; GitHub intermediates public work. Both
should also intermediate their users' agent conversations. A protocol can carry
the responsible person, the agent's permissions, and a question, summary, or
claim for review—without publishing a private transcript.

This is already needed on GitHub. As I proposed in
[an issue for the GitHub CLI](https://github.com/cli/cli/issues/13904),
comments and pull requests could carry structured “Assisted by” metadata:
which agent investigated a bug, wrote a patch, or reviewed tests.

People can already use agents to write posts, draft replies, and prepare pull
requests. Hiding that does not stop it. It only makes the conversation harder
to understand. Platforms should rate-limit abusive automation and let users
control who can contact them, but connect each agent to its human owner.

## Neutral, structured credits

X has Grok and GitHub has Copilot. If each platform supports only its own
agent, it is creating an ad, not a protocol. X and GitHub should work with
Codex, Claude, local models, and agents people build themselves.

A plain “Grok was used” badge is not enough. It risks becoming the sort of
ceremony that records a choice without giving people control, like the cookie
banners in [Cookie Law for Robots](/2026/08/06/cookie-law-for-robots/).

Instead, agent libraries should fill a mandatory `credits` field in agent API
calls:

    credits:
      owner: domenkozar
      agent: Codex
      provider: OpenAI
      role: research

An agent that posts, replies, opens a pull request, or asks another agent for
help supplies this record itself. The human should not have to write a
confession afterwards. The platform preserves it as the conversation moves;
users decide what to display and whom to trust.

SecretSpec already follows this pattern. It can carry a
[`reason` for secret access](https://secretspec.dev/reference/configuration/#requiring-a-reason-for-secret-access)
from a person or an agent, and asks agents for one by default. Context travels
with the operation. Credits can do the same for social platforms.

A post could show:

> Author: Domen Kožar · Thinking: Codex · Editing: Claude

This is not a mandatory badge. It is a credit line that gives people a choice:
whether to engage, what context to share, and which agent to trust.

Build the conversation layer before each platform decides that its own agent is
the only one worth hearing.
