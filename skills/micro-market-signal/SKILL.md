---
name: micro-market-signal
description: Finds and scores painful, buildable micro-SaaS opportunities from market signals. Use when the user needs product ideas, niche validation, customer pain research, competitor gaps, or a ranked list of micro-product opportunities before writing a spec.
license: Apache-2.0
---

# Micro Market Signal

Find micro-product opportunities from real user pain. Mirror the user's language.

## Pre-Research Gate

Do not start idea discovery, browsing, or ranking until the search bounds are tight. The bounds are tight only when these fields are known:

| Field | Tight enough | Too vague |
| --- | --- | --- |
| Buyer | "Korean indie hackers paying for Claude/Codex workflow tools" | "developers" |
| Arena | "AI coding agent workflows, launch prep, market research" | "AI" |
| Constraints | "paid V0 in 1-3 days, no SEO/content arbitrage, no enterprise sales" | "simple SaaS" |

If any field is missing, ask exactly one compact intake block and stop:

```markdown
D1 — Market Search Bounds
Before I search, answer in three short lines. Recommendation: use defaults if speed matters.

1. Buyer: who can pay or adopt quickly?
2. Arena: which category/community/workflow should I inspect?
3. Constraints: what should I avoid, and how small must V0 be?

Default for this project: Korean indie hackers; AI/devtool micro-SaaS workflows around Claude Code, Codex, and Gemini; paid V0 in 1-3 days; no SEO/content arbitrage; no enterprise sales.
Stakes: vague bounds create generic ideas that are hard to sell.
Reply with edits, or say "use defaults".
```

After the user answers, continue without additional intake unless there is a hard contradiction. Record the locked bounds in `Search Scope`.

## Inputs

Accept any of these:

- A category, audience, community, keyword, or competitor.
- A blank slate request such as "find me a micro-SaaS idea".
- A user-provided list of complaints, links, posts, notes, or interview snippets.

## Research Rules

- If the user asks for current market research or if web access is available and needed, browse current sources. Prioritize Product Hunt, Hacker News, Reddit, X, Indie Hackers, Disquiet, GeekNews, GitHub issues, app store reviews, and competitor forums.
- Gather direct user-language evidence. Use short quotes only when useful, and include links when browsing.
- Separate evidence from inference. Mark assumptions with `Assumption:`.
- Reject ideas based only on trendiness, model capability, or "could be useful" reasoning.
- Prefer boring urgent workflow pain over broad consumer novelty.

## Scoring

Score each opportunity from 0-5:

- **Pain frequency**: repeated complaints from different users.
- **Urgency**: users lose money, time, status, or business flow.
- **Buyer clarity**: identifiable person can pay without committee approval.
- **Build size**: V0 can ship in 1-3 days.
- **Distribution access**: reachable first channel exists.
- **Competition gap**: current alternatives are too expensive, broad, manual, or hard to use.

Reject an opportunity if any of these are true:

- No direct user pain.
- Buyer is vague.
- V0 requires marketplace liquidity, regulated compliance, or enterprise sales.
- The first version is mainly content, SEO arbitrage, or generic AI wrapper output.

## Output

Return this:

```markdown
# Market Signal Report

## Search Scope
- Buyer:
- Arena:
- Constraints:
- Category:
- Sources checked:
- Gaps in evidence:

## Ranked Opportunities
| Rank | Pain | ICP | Evidence | Current workaround | Score | V0 wedge |
| --- | --- | --- | --- | --- | ---: | --- |

## Top Pick
- Why this one:
- First paid user:
- First distribution channel:
- 1-day validation test:
- Fastest V0:

## Anti-Ideas
Ideas rejected and why.

## Next Step
Use `micro-offer-spec` on the top pick, or ask the user to choose from the ranked list.
```
