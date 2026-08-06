---
categories: ["english", "ai"]
author: Domen Kožar
date: 2026-08-06 09:00:00
title: "Cookie Law for Robots"
draft: false
slug: cookie-law-for-robots
description: "Cookie law turned consent into a ceremony instead of a choice. AI policy risks repeating the mistake if disclosure becomes its main measure of human agency."
---

## Consent without choice

When a website asks me to accept cookies, I usually click the button before I
have finished reading it.

I suspect most people do. When researchers asked participants to join a
fictitious social network,
[most never opened the terms or the privacy policy](https://doi.org/10.1080/1369118X.2018.1486870),
and those who did spent about a minute on a document that takes half an hour to
read. This is strange, because the legal point of consent is to give us a
[genuine, informed choice](https://www.edpb.europa.eu/sme/be-compliant/process-personal-data-lawfully_en).
Instead the notice has trained us to continue without choosing.

By one measure, cookie law has been a spectacular success. The web is covered
in banners, preference panels, privacy policies, and records showing which
button you pressed. The European Commission even convened a
[Cookie Pledge project](https://commission.europa.eu/live-work-travel-eu/consumer-rights-and-complaints/enforcement-consumer-protection/cookie-pledge_en)
to explore how consumers might make more effective choices about tracking,
though it
[collapsed without ever being signed](https://www.euronews.com/next/2024/04/23/commissions-data-cookie-pledge-crumbles).

By another measure, it has failed. People often
[skip or merely skim privacy policies](https://doi.org/10.1016/j.chb.2015.09.038),
while the design of the banner itself can
[shift consent rates by double digits](https://doi.org/10.1145/3313831.3376321).
The banner records a decision that, psychologically, may never have happened.

Cookie law may even have made the problem worse. It taught us that consent is
an obstacle placed between us and what we want. The fastest way past the
obstacle is to agree.

## Summaries that help us decide

There is already a better response to this problem.

[Terms of Service; Didn't Read](https://tosdr.org/en) takes documents almost no
one reads and turns them into something people can use: a grade and a short
list of the terms that deserve attention. The grade is useful, but the list is
more important. It tells you that a service may
[keep deleted data and use your identity in advertising](https://tosdr.org/en/service/182),
or [change its terms without notice](https://tosdr.org/en/service/190).

This is more than making the document shorter. A shorter document can preserve
all the wrong things. ToS;DR organizes it around consequences. Its contributors
[extract individual points, discuss them, and classify them](https://tosdr.org/en),
while the project publishes its work as open data. The summary does not merely
save time. It helps you decide.

Cookie banners ask millions of people to spend attention they do not have on
the same problem. ToS;DR does the hard reading once and lets everyone reuse the
result. It accepts that attention is scarce and tries to spend it well.

## AI as an assistant

Software has
[tracked how terms change since 2009](https://www.eff.org/press/archives/2009/06/03-0)
and [still does](https://opentermsarchive.org), while researchers have proposed
[plain-English contract summaries](https://aclanthology.org/W19-2201/) and
[party-specific summaries](https://aclanthology.org/2023.emnlp-main.909/). An
assistant could combine these abilities: compare a new contract with the old
one, find the clauses that affect me, and ask about the few decisions that
matter.

The word *summary* undersells this. A generic summary tells everyone the same
five things. An assistant that knows my context can know whether I am the
tenant or the landlord, which compromises I have refused before, and how a new
policy conflicts with the way I work. But context is personal data by another
name. I should be able to inspect, correct, delete, and move what my assistant
remembers. Otherwise it is the company's assistant with access to me.

Generated summaries can be
[plausible but inconsistent with their source](https://aclanthology.org/2021.acl-long.536/),
so every claim should [lead back to a clause](https://aclanthology.org/2023.cl-4.2/).

The useful future is not AI replacing ToS;DR, but extending it: humans decide
which consequences matter and review disputed judgments; assistants handle the
reading and revisions.

## Cookie banners for AI

The [EU AI Act now requires](https://digital-strategy.ec.europa.eu/en/library/guidelines-transparency-obligations-providers-and-deployers-ai-systems)
certain AI systems to tell people when they are interacting with AI, and
certain AI-generated content to be marked. These are sensible rules. But AI
policy could make the same mistake if disclosure becomes its main measure of
human agency.

It is easy to require an AI system to display a warning. Warnings are visible.
They can be photographed, audited, and shown to regulators. It is harder to
determine whether users have meaningful control over the system, because
control is not a sentence on a screen. It depends on who owns the model, who
can inspect it, whether you can leave, and what happens to your data when you
do.

So we may get the AI equivalent of cookie banners. You will be told that you
are talking to a machine. You will click Continue. The institution operating it
will have satisfied the disclosure rule, and nothing important will have
changed.

Open source projects are already
[writing their own disclosure rules](/2026/07/23/llm-disclosure-is-becoming-the-new-cookie-banner/)
for LLM-assisted contributions, and they meet the same difficulty. The label is
easy to require. The judgment behind it is not.

The mistake is to confuse a visible ceremony with a change in power.

## Hierarchy or melding

Animals offer a clue. Species compete most when they
[occupy the same niche](https://www.britannica.com/science/principle-of-competitive-exclusion).
Humans and AI will too. If both do the same work for the same rewards, one will
eventually be put above the other.

Hierarchy is the default answer. Humans command robots; companies command both;
laws command companies. It looks orderly. But the person at the top may
understand the system least, and every new ability becomes a contest over who
replaces whom.

The other path is melding. This does not (yet) have to mean implants or a
collective mind. It means letting humans supply judgment, goals, and the right
to revoke, while assistants do the parts machines do better and carry context
on their users' behalf. Different capabilities become
[complementary](https://www.nature.com/scitable/knowledge/library/resource-partitioning-and-why-it-matters-17362658/),
which gives them less reason to compete.

The usual debate asks whether humans or robots will end up on top. Melding asks
whether there needs to be a top. That is probably the better path for both.

## Control, not ceremony

The lesson of cookie law is not that regulation is useless. It is that
interfaces cannot substitute for power. A button marked "consent" does not give
someone control. A model marked "safe" will not make it safe.

Good AI policy may be almost invisible. It will let people
[take their data with them](https://commission.europa.eu/law/law-topic/data-protection/information-individuals_en),
[see what their agents are doing](https://artificialintelligenceact.eu/article/12/),
choose whom they trust, and leave systems they no longer trust. Instead of
asking people to approve the hierarchy, it will make the hierarchy less
necessary.

That is a less dramatic future than either humans ruling robots or robots
ruling humans.

It is also probably a better one.

<div class="Post-embed Post-embed--centered">
{{< x user="domenkozar" id="2085065735152275472" >}}
</div>
