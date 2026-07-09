---
name: micro-founder-loop
description: End-to-end micro-product startup workflow. Use when the user wants to go from idea, niche, pain point, or blank slate to a launch-ready micro-SaaS plan using market signal, offer/spec, build loop, and launch assets across Claude Code, Codex, or Gemini.
license: MIT
---

# Micro Founder Loop

Run the shortest path from raw intent to a launchable micro-product. Mirror the user's language. Default to English artifacts only when the user is writing for a global launch.

## Operating Rules

- Optimize for one paid V0 that can be built by one builder in 1-3 days.
- Prefer direct market evidence over clever ideas. If evidence is missing, label the result as unverified.
- Keep the wedge narrow: one audience, one painful job, one acquisition channel, one obvious paid action.
- Default stack for web SaaS: Next.js, TypeScript, Supabase or Neon, Stripe or Lemon Squeezy, Vercel. Use the existing repo stack when one exists.
- Produce concrete artifacts, not brainstorming. Every phase ends with a table, spec, prompt, checklist, or copy block.
- Stop and ask only for one-way decisions: product name, pricing commitment, irreversible repo/deploy action, or paid service setup.

## Tight Intake Gate

Before idea discovery or market research, lock the search box. Do not brainstorm from a blank slate until these three answers are known or safely inferred from project context:

1. **Buyer**: who can pay or adopt quickly?
2. **Arena**: which category, community, workflow, or competitor space should we inspect?
3. **Constraints**: what must we avoid, and what counts as a shippable V0?

Ask once, in a compact decision-brief style inspired by gstack's `AskUserQuestion` pattern:

```markdown
D1 — Idea Discovery Bounds
Before I search, answer these three lines. Recommendation: use the defaults below if you want the fastest path.

1. Buyer: <recommended default based on context>
2. Arena: <recommended communities/categories/sources>
3. Constraints: <recommended kill criteria and build-time limit>

Stakes: if these stay vague, the market report will produce clever but unfocused ideas.
Reply with edits, or say "use defaults".
```

Rules:

- Ask no more than three questions before research.
- Do not ask questions already answered by the user or `DESIGN.md`.
- If the user says "use defaults", proceed with this project's defaults: Korean indie hackers, AI/devtool micro-SaaS workflows, 1-3 day paid V0, no SEO/content arbitrage, no enterprise sales.
- If the user gives a broad answer, tighten it into one sentence and confirm only if the interpretation changes the search direction.
- After the user answers, restate the locked bounds in one line and start `micro-market-signal`.

## Workflow

1. **Intake**
   - Capture the user goal, available time, target market, existing repo or blank slate, preferred agent tool, budget, and launch deadline.
   - Apply the Tight Intake Gate before market signal work.
   - If the user has no idea, proceed to market signal. If they already have a pain point, skip to offer/spec.

2. **Market Signal**
   - Use `micro-market-signal` when the idea, audience, or pain is unclear.
   - Require direct user-language evidence when browsing is available. If browsing is not available, produce hypotheses plus the exact research queries to verify next.

3. **Offer and Spec**
   - Use `micro-offer-spec` to turn the chosen signal into a paid V0.
   - Force tradeoffs: must-have, nice-to-have, explicit non-goals, price test, first distribution channel.

4. **Build Loop**
   - Use `micro-build-loop` to convert the spec into implementation tasks for Claude Code, Codex, or Gemini.
   - Prefer a thin vertical slice that can be verified by a real workflow over broad scaffolding.

5. **Launch Pack**
   - Use `micro-launch-pack` once the offer or build is concrete enough to sell.
   - Generate channel-specific copy for Product Hunt, Hacker News, X, email, and the user's highest-trust community.

6. **Decision**
   - End with `KILL`, `PIVOT`, or `CONTINUE`.
   - `CONTINUE` requires a next action that can be completed in less than 2 hours.

## Final Output

Use this structure:

```markdown
# Micro-Product Launch Brief

## Verdict
KILL | PIVOT | CONTINUE, with one sentence why.

## User and Pain
- ICP:
- Pain:
- Evidence:
- Existing workaround:

## Offer
- One-liner:
- Paid action:
- Price test:
- Promise:
- Non-goals:

## V0 Scope
- Must ship:
- Must not ship:
- Data model:
- Acceptance tests:

## Build Plan
- Tool path: Claude Code | Codex | Gemini | mixed
- First vertical slice:
- Verification command or manual check:
- Known risks:

## Launch Plan
- First channel:
- Launch assets needed:
- 48-hour action list:
```
