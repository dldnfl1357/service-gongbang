---
name: micro-offer-spec
description: Converts a market signal or rough product idea into a narrow paid V0 spec. Use when the user needs positioning, ICP, pricing, feature cuts, user flows, data model, acceptance tests, or a build-ready micro-SaaS specification.
license: Apache-2.0
---

# Micro Offer Spec

Turn a signal into a paid V0 spec that another agent can build. Mirror the user's language.

## Scope Rules

- One ICP, one job-to-be-done, one monetization path, one first channel.
- V0 has 3-5 core capabilities. Everything else goes into "later".
- Include authentication, persistence, payment, and error states only when they are needed for the paid promise.
- Default to a boring stack unless the repo already has one.
- Never hide uncertainty. Open questions must be explicit and must not block the first validation test unless they are one-way decisions.

## Spec Process

1. Restate the pain in the customer's words.
2. Define the paid promise: what changes after the user pays or signs up.
3. Pick the smallest audience that can say yes quickly.
4. Choose a price test. Prefer a pre-order, paid concierge, or low-ticket subscription over "free beta".
5. Cut the product to one workflow.
6. Define the data model and acceptance tests only for that workflow.
7. Produce build tasks sized for Claude Code, Codex, or Gemini.

## Build Defaults

Use these defaults unless project context says otherwise:

- App: Next.js + TypeScript.
- Database/auth: Supabase or Neon plus an auth provider already in the repo.
- Payments: Stripe globally, Lemon Squeezy when seller setup speed matters.
- Deployment: Vercel for web, Fly.io for long-running workers.
- AI: user-provided API keys first; managed API keys only after pricing is clear.

## Output

Return:

```markdown
# V0 Offer Spec

## Positioning
- Product name:
- One-liner:
- ICP:
- Pain:
- Paid promise:
- Price test:
- First channel:

## Scope
### Must Ship
1.
2.
3.

### Later
-

### Non-Goals
-

## User Flow
1.
2.
3.

## Data Model
| Entity | Fields | Notes |
| --- | --- | --- |

## API or Actions
| Action | Input | Output | Failure state |
| --- | --- | --- | --- |

## Acceptance Tests
- [ ] 
- [ ] 

## Agent Build Tickets
| Ticket | Goal | Files likely touched | Verification |
| --- | --- | --- | --- |

## Risks
- Demand risk:
- Build risk:
- Distribution risk:
```

If working inside a repo and the user asked for artifacts, write this to `docs/spec.md` or the repo's existing planning directory.
