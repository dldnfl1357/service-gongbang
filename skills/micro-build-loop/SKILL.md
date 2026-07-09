---
name: micro-build-loop
description: Drives Claude Code, Codex, or Gemini through a fast micro-product implementation loop. Use when the user has a V0 spec and wants repo inspection, task slicing, agent handoff prompts, implementation, verification, review, or ship readiness.
license: Apache-2.0
---

# Micro Build Loop

Ship the smallest verified product slice from a V0 spec. Mirror the user's language.

## Agent Routing

- **Claude Code**: best for broad repo edits, subagents, browser verification, and long-running implementation loops.
- **Codex**: best for disciplined code edits, tests, CLI workflows, reviews, and applying repository patterns.
- **Gemini CLI**: best as an alternate reviewer, large-context exploration, and extension-based workflows.

If another agent CLI is available and the user wants cross-agent work, produce handoff prompts or run the CLI only when local policy allows it. Never pretend another agent reviewed something unless it actually ran.

## Build Rules

- Inspect the repo before editing. Find package manager, test commands, app entry points, env examples, and deployment assumptions.
- Implement one vertical slice at a time: data path, user action, visible result, failure state.
- Prefer tests for business logic and browser/manual verification for user workflows.
- Keep changes scoped to the V0 spec. Put unrelated improvements into "Later".
- Run the cheapest meaningful verification after each slice.
- If tests or build fail, report the exact command and highest-signal error.

## Workflow

1. **Repo Read**
   - List stack, package manager, scripts, relevant directories, and missing env vars.
   - Identify whether this is a new app or existing codebase.

2. **Task Slice**
   - Convert the spec into tickets small enough for one agent turn each.
   - Mark each ticket as `must`, `should`, or `later`.

3. **Implementation**
   - For each `must` ticket: edit, run focused verification, then continue.
   - Create only the files required for the slice. Avoid framework churn.

4. **Review**
   - Review the diff for broken flows, missing states, security boundaries, and payment/auth mistakes.
   - Use a second agent only when available or requested.

5. **Ship Readiness**
   - Confirm install, test/build, launch command, env vars, and known gaps.

## Handoff Prompt Template

Use this when delegating to Claude Code, Codex, or Gemini:

```markdown
You are implementing a micro-product V0. Keep scope narrow.

Spec:
<paste V0 Offer Spec>

Task:
<one ticket only>

Constraints:
- Follow existing repo patterns.
- Do not add unrelated refactors.
- Verify with the listed command or a better focused check.
- Report files changed, commands run, and remaining risk.
```

## Output

Return:

```markdown
# Build Loop Report

## Repo Facts
- Stack:
- Package manager:
- Key scripts:
- Entry points:

## Tickets
| Priority | Ticket | Agent | Verification |
| --- | --- | --- | --- |

## Completed
- 

## Verification
- Command:
- Result:

## Risks
- 

## Next 2-Hour Action
-
```
