---
categories: ["english", "nix", "nixos", "open source", "ai"]
author: Domen Kožar
date: 2026-08-04 09:00:00
title: "nixpkgs has a due-process problem"
draft: false
slug: nixpkgs-has-a-due-process-problem
---

Nixpkgs has a due-process problem.

A project has a due-process problem when people have real power but the rules
around it are vague. Nixpkgs committers can merge and close pull requests.
Reviewers can block them. Teams can remove commit access and decide policy. Yet
the project does not always say what standard applies, who decides, or how a
mistake can be corrected.

This is not an argument against strict review. Security, licensing,
attribution, maintainer time, and contributor conduct all matter. The glibc
work I recently submitted changes the dynamic loader and rebuilds the world. It
should be reviewed unusually carefully. I have also made bad merges.

**The test of governance is not whether it gives me what I want. It is whether
I would accept the same rules if the people and positions were reversed.**

# Losing the commit bit

I contributed to Nix and NixOS for more than a decade, served as a release
manager, and helped give Nixpkgs commit access to hundreds of contributors. On
June 8, 2025, the commit-bit delegation
[removed my access](https://github.com/NixOS/nixpkgs-committers/issues/50#issuecomment-3491311002)
for a "consistent pattern of bad judgement." It gave two reasons: I had merged
some of my own pull requests soon after opening them, and I had merged an
`rbtools` update that failed to build on every platform.

Both concerns were real. The package was already broken at runtime and I was
trying to revive an old leaf package, but I should have checked that the update
built. Other contributors later
[fixed its missing dependencies](https://github.com/NixOS/nixpkgs/pull/414886).

I also should not have merged my pull requests so quickly. A warning thread
identified
[three earlier rapid self-merges](https://github.com/NixOS/nixpkgs/pull/402812#issuecomment-2845870158)
and
[a 37-second self-merged revert](https://github.com/NixOS/nixpkgs/pull/402812#issuecomment-2845882086).
I explained the urgency of the change that prompted the warning, then followed
the requested workflow. Another contributor noted that this had been my first
formal warning and that
[I had not self-merged again](https://github.com/NixOS/nixpkgs-committers/issues/50#issuecomment-3491313448).

The question is not whether I made mistakes. It is how those mistakes led to an
indefinite loss of access, with no defined review or restoration process.

A month earlier, the organization had changed the process. On May 11 it added
to the delegation
[the person who had challenged my merging practice](https://github.com/NixOS/org/commit/eee99c983a7ceaf10f97385bb7825c7d6aead721).
On May 14 it replaced unanimous agreement on committer-list changes with a rule
allowing
[one delegator to remove a committer](https://github.com/NixOS/org/commit/102d071a1c05dad6a5e3002901854ff48db85c52).
Less than a month later, the new delegator announced my removal.

This sequence does not prove that the rule targeted me or that one person made
the decision. The announcement says the team discussed it. What the public
record does show is that one-person removal was formally possible, there was no
published warning threshold, and
[the delegation did not contact me first](https://github.com/NixOS/nixpkgs-committers/issues/50#issuecomment-3491313256).
There was no documented appeal.

The process has since improved. In December 2025, the Nixpkgs core team
[took over the delegation](https://github.com/NixOS/org/pull/216) and published
[guidelines](https://github.com/NixOS/nixpkgs-committers/issues/82) saying it
would try to discuss concerns, give a warning, reach consensus, and identify the
participants in a non-unanimous removal.

But these are guidelines the team *aspires* to follow. The formal rule still
says that
[one member may remove a committer](https://github.com/NixOS/org/blob/main/doc/nixpkgs-committers.md#process).
There is no binding threshold beyond one member, no recusal rule, no response
period, and no appeal.

I repeatedly asked the NixOS Steering Committee to review my removal and
received no reply. On September 10, 2025, in an email titled "your commit bit,"
the person who announced it apologized and said they believed it had been a
mistake and that my access should be restored. Readers cannot independently
verify this private exchange. I include it because it exposed the practical
gap: even when a member of the delegation later considered the removal
mistaken, there was no defined review or restoration process. **As of this
writing, I still do not have Nixpkgs commit access.**

A security-sensitive project must be able to suspend access quickly. But an
emergency suspension and an indefinite removal are different operations. The
second should require a written allegation, notice, a chance to respond,
recusal for conflicts, agreement by several disinterested people, reasons, and
an appeal.

# Who decided?

Nix is not a direct democracy. It has an elected
[Steering Committee](https://nixos.org/community/teams/steering-committee/)
responsible for technical and community leadership and for ensuring that clear
decision and escalation processes exist. The committee has delegated Nixpkgs
governance to the
[Nixpkgs core team](https://nixos.org/community/teams/nixpkgs-core/), whose
mandate includes building bottom-up consensus and resolving disagreements.
The Steering Committee's mandate says that delegation does not end its
responsibility when a delegated team fails to reach a decision.

The relevant policy had already gone through that structure. After discussion
within the core team and with the community team, the core team
[proposed an automation and AI policy](https://github.com/NixOS/nixpkgs/pull/514587),
kept it open for public feedback, and merged it in May 2026. The policy does
not ban LLM assistance. It requires a responsible human to review the work and
disclose non-trivial automation.

[Nixpkgs PR #534657](https://github.com/NixOS/nixpkgs/pull/534657) added one
line telling coding agents to follow that policy, plus a `CLAUDE.md` symlink.
It did not propose changing the policy itself. Without that pointer, people
using coding agents can submit changes without the tools ever seeing
`CONTRIBUTING.md`, producing avoidable violations of the disclosure and human
review rules. Reviewers then inherit the cleanup that a two-line repository
change could have prevented.

The pull request disclosed its assistance, and several contributors approved
it. Then a reviewer used GitHub's blocking
["request changes" mechanism](https://github.com/NixOS/nixpkgs/pull/534657#pullrequestreview-4588034741)
to say:

> The only reasonable `AGENTS.md` file is:
>
> Get the hell out of here.

This named no defect, cited no rule, and offered no path to acceptance. It also
fell short of Nixpkgs's
[review guidance](https://github.com/NixOS/nixpkgs/blob/master/CONTRIBUTING.md#how-to-review-pull-requests),
which asks reviewers to focus on the change, keep the scope narrow, explain why
related work must block it, and drive it to a conclusion.

There were good reasons to question the pull request. Its checklist overstated
what had been tested. `CLAUDE.md` privileged one vendor. An agent file might
signal that a project wants more automated contributions. A reviewer could
reasonably ask for vendor-neutral wording or evidence that the file improved
policy compliance.

Instead, much of the thread became an argument about copyright, energy, water,
capitalism, employment, creativity, and whether LLM users belong in free
software. A mechanism for making tools read the rules became a vote on the
tools themselves.

After internal discussion and testing, the core team
[stated that a minimal agent file pointing to the policy was likely to benefit
the community](https://github.com/NixOS/nixpkgs/pull/534657#issuecomment-4982797048).
A core team member then
[clarified that this was an opinion, not a final decision](https://github.com/NixOS/nixpkgs/pull/534657#issuecomment-4984713552),
and that a continuing deadlock would ultimately be the core team's
responsibility to resolve.

Nine days later, a committer
[closed the pull request as "rejected by the community"](https://github.com/NixOS/nixpkgs/pull/534657#issuecomment-5074808692).
The closing comment relied on comments, reactions, and an informal Discourse
poll. It called the contribution "slop" and "vibe-checked," and argued that
"some kind of majority decision" was enough to reject it. It offered an appeal
to the core team, but no published rule defined that majority, when an appeal
applied, or what standard the core team would use.

Nixpkgs aims for bottom-up consensus, but consensus is not a count of whoever
shows up in a comment thread. Reactions and a voluntary poll can inform a
decision. The
[poll asked how people felt about LLM usage in general](https://discourse.nixos.org/t/llms-in-nixpkgs/78964),
not whether Nixpkgs should help contributors who already use LLMs work
productively while following its policy. Neutrality on the first question does
not imply opposition to the second. Nor can the poll represent "the community"
without a defined electorate, scope, quorum, threshold, or rule assigning the
decision to that vote. **The thread produced the appearance of direct democracy
without a democratic process.**

Perhaps the pull request should have been rejected. The problem is not that its
author disagreed. The problem is that no published rule authorized one
committer to convert informal feedback into a decision by "the community."
**GitHub permissions answered who *could* close the pull request. They did not
answer who had decided the policy question.**

# When review becomes personal

[Nixpkgs PR #535735](https://github.com/NixOS/nixpkgs/pull/535735) is the
opposite kind of change. It patches glibc, updates patchelf, touches the
bootstrap path, and causes a mass rebuild. Nobody should merge it casually.

The change addresses startup overhead paid by nearly every dynamically linked
Linux program in Nixpkgs. For short-lived tools, that overhead can rival the
useful work the program performs, and it compounds across shell prompts,
scripts, builds, and services that launch many processes. If it works at
Nixpkgs scale, the benefit would reach the whole package set rather than
[devenv](https://devenv.sh/) alone, with the largest gains on cold or slow
storage, network filesystems, and low-power systems.

That reach is also what makes the patch risky: a loader regression could affect
almost everything. I spent a full week at
[Tacosprint](https://tacosprint.org/)
[comparing five approaches and getting the change working end to
end](https://devenv.sh/blog/2026/06/26/making-devenv-start-fast-and-the-whole-nixpkgs-with-it/).
That effort did not make the patch merge-ready or lower the review bar.

One blocking review was explicitly preemptive. On June 26, the reviewer said
they would need to reserve several hours to examine the change and that this
would not happen for "the next few weeks," while using "Request Changes" to
[prevent an "overexcited committer" from merging it](https://github.com/NixOS/nixpkgs/pull/535735#pullrequestreview-4581645648).
I [asked on July 12 when the review might happen](https://github.com/NixOS/nixpkgs/pull/535735#issuecomment-4949271240)
and [again on July 25 after a month had passed](https://github.com/NixOS/nixpkgs/pull/535735#issuecomment-5079873068).
By the time of writing, no detailed review or deadline had followed, and the
block remained. Nixpkgs permits an abandoned review to be dismissed, but does
not say when a promised future review becomes abandoned.

The useful reviews were demanding. They found bounds-checking and 32-bit
overflow problems, questioned the cache format, asked about future loaders,
and challenged whether a downstream glibc patch should be enabled before going
upstream. The pull request improved because of them. This is what review is for.

Those technical concerns could independently justify blocking the patch. But
some comments moved from the patch to the author. A blocking review
[questioned what expertise I had acquired and whether I had a hidden goal](https://github.com/NixOS/nixpkgs/pull/535735#pullrequestreview-4780609181).
The original author of an earlier implementation called LLMs
["plagiarism machinery"](https://github.com/NixOS/nixpkgs/pull/535735#pullrequestreview-4781563382)
and asked that the work not be merged.

Attribution was a legitimate concern. I added the original author as a
co-author to the Nixpkgs commit and credited the earlier approach elsewhere,
but reviewers argued that the patchelf history still lacked durable attribution
and that the boundary between the old and new work was unclear. Those are
defects that can be fixed.

The work was public, licensed, and abandoned; continuing it did not require the
original author's permission. In hindsight, advance notice might have avoided
surprise and made collaboration easier.

The distinction is simple. "This must go upstream first" is a requirement.
"The cache needs a compatibility contract" is a requirement. "Credit the old
work in these permanent locations" is a requirement. "Answer these loader
questions and identify a maintainer" is a requirement.

"We do not know whether the author has expertise" becomes useful only when it
points to a specific unanswered question or maintenance risk. "Perhaps he wants
something else" is merely a guess about motive.

These cases differ in severity. In each, legitimate concerns became entangled
with an exercise of authority whose basis, limits, or remedy were unclear.

# The older problem

AI made this conflict visible, but did not create it.

Other open-source projects put explicit constraints around power. The Apache
Software Foundation says that
[a veto without technical justification is invalid](https://www.apache.org/foundation/voting.html#Vetoes).
Python's
[conduct-enforcement procedure](https://policies.python.org/python.org/code-of-conduct/Enforcement-Procedures/)
requires conflict checks, a two-thirds vote, a concrete plan, and
re-evaluation when the reported person responds. Rust provides
[independent audits](https://rust-lang.github.io/rfcs/3392-leadership-council.html#audits)
of visible sanctions and requires conflicted auditors to recuse themselves.
Debian developers can
[override delegated decisions](https://www.debian.org/devel/constitution#item-4.1),
while OpenStack requires
[notice, discussion, quorum, and a recorded vote](https://governance.openstack.org/tc/reference/charter.html#motions)
for governance motions.

The mechanisms differ. Their purpose is the same: make authority legible and
make mistakes correctable.

Pieter Hintjens's
[Collective Code Construction Contract](https://rfc.zeromq.org/spec/42/)
goes further. It defines a correct patch through written requirements, tells
maintainers not to make value judgments about one, and asks anyone who prefers
another correct solution to submit that solution as a competing patch.
Hintjens called review delay "change latency." He
[warned that delaying and blocking patches gives maintainers power over
contributors](https://hintjens.gitbooks.io/social-architecture/content/chapter4.html),
even when the abuse is subconscious, and argued that a project whose
maintainers cannot respond rapidly needs more hands.

Nixpkgs should not optimistically merge a world-rebuilding glibc patch. But it
can adopt the underlying rule: **a concrete risk may block; an unavailable
reviewer or an undocumented preference may not.** Risky experiments need an
isolated test path, not an indefinite veto.

Review friction has a real cost, though the evidence should not be overstated.
I am not aware of a controlled study showing that nitpicking is the main reason
people leave Nixpkgs. There are, however, repeated reports of contributors
losing interest when requirements are undocumented or inconsistent.

A 2021 contributor said conflicting formatter requests made them want to
[close their pull requests and spend their time elsewhere](https://discourse.nixos.org/t/formatters-contributing-guidelines/11883).
A 2023 thread collected similar reports about
[obstacles to contribution](https://discourse.nixos.org/t/accessibility-and-obstacles-to-community-contribution/32845).
The
[2022 community survey](https://discourse.nixos.org/t/2022-nix-survey-results/18983)
found that some respondents avoided opening pull requests because the backlog
made timely review seem unlikely. In the
[2025 survey](https://nixos.org/surveys/community/2025/#contributor-experience),
7.0% reported slow feedback, 5.8% got stuck after starting, and 2.1% found
feedback unhelpful or unclear. These categories overlap, and the survey does
not attribute them specifically to nitpicking.

Strict review is not itself a problem. The problem is a preference presented
as a requirement without a rule, a concrete risk, or a stable condition for
acceptance. If a mechanical rule matters enough to block a contribution, write
it down and automate it. If it is merely a preference, call it a suggestion.

# What should change

Nixpkgs does not need ideological agreement. It needs rules strong enough for
people who disagree to keep working together.

First, separate emergency suspension from indefinite removal. An indefinite
removal should require written allegations against published standards,
notice, time to respond, conflict checks, and agreement by a panel of at least
three disinterested people. It should end with a reasoned summary and an appeal
to an independent body. The newer guidelines are a good start; they should
replace the formal one-person rule.

Second, make blocking reviews actionable. Nixpkgs already says that comments
are non-blocking by default, that blocks must use "Request Changes," and that
[abandoned reviews may be dismissed](https://github.com/NixOS/nixpkgs/blob/master/CONTRIBUTING.md#review-and-merge-conventions).
A block should also identify a documented requirement, policy violation, or
technical risk, and say how it can be resolved.

Review feedback then falls into three categories. A required change names a
defect and a stable acceptance condition. A suggestion offers a preferred
alternative to an otherwise acceptable patch. A follow-up expands the scope
and belongs in a separate issue. Only the first should block.

Third, define how project-wide policy is decided. Name the decision-maker, who
may participate, the discussion period, the threshold, whether polls are
advisory, where reasons and dissent are recorded, and when the decision may be
revisited. GitHub reactions are feedback, not a constitution.

Fourth, apply the automation policy Nixpkgs actually adopted. Hold the human
responsible, require disclosure, and reject unreviewed or poor work. Then judge
compliant contributions against the stated technical rules. If Nixpkgs wants
to ban LLM assistance, it should change the policy explicitly.

Claims should be tested where possible. A vendor-neutral `AGENTS.md` proposal
could include a before-and-after test: does it improve disclosure, checklist
accuracy, test execution, and policy compliance? The policy itself could be
reviewed using data about reverts, CI failures, review time, violations, and
maintainer burden.

Finally, automate mechanical requirements. Formatting, metadata, and platform
checks should be reproducible commands or branch protections, not different
rules carried in different reviewers' heads.

These reforms should be separate decisions. My request for restored access
should not decide the general removal process. A two-line agent file should not
decide the whole automation policy. A risky glibc patch should not decide
whether LLM-assisted contributors belong.

The same rules should protect an anti-AI contributor under a future pro-AI
majority. Otherwise due process is only a request to replace one faction's
discretion with another's.

Write clear rules. Require actionable review. Give notice, reasons, recusal,
and appeal. Judge work under the policy that exists until that policy is changed
through a legitimate process.

**Due process requires clear rules for removals, review blocks, and policy
decisions. It also requires a way to correct mistakes.**
