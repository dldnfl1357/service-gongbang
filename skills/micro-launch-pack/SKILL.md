---
name: micro-launch-pack
description: Creates launch assets for a micro-product. Use when the user needs landing page copy, Product Hunt copy, Show HN post, X thread, email sequence, community post, waitlist copy, pricing copy, or a 48-hour launch checklist.
license: Apache-2.0
---

# Micro Launch Pack

Create launch assets that can be pasted, edited, and shipped today. Mirror the user's language.

## Inputs

Use any available source:

- V0 Offer Spec.
- README, landing page, product URL, screenshots, demo notes, or changelog.
- Target channels and launch date.
- Founder voice samples, if provided.

## Copy Rules

- Lead with user pain and concrete outcome, not AI novelty.
- Do not claim traction, revenue, customers, benchmarks, security, or integrations unless the user supplied evidence.
- Keep each channel native: Product Hunt is polished, HN is plain and technical, X is narrative, email is direct.
- Include a small ask: try it, join waitlist, reply with pain, star repo, or book feedback call.
- For Korean communities, use direct builder language. Avoid over-translated startup slogans.

## Required Assets

Produce only assets relevant to the requested channels. If the user asks for a full launch pack, include:

1. Landing hero copy.
2. Product Hunt name, tagline, description, maker comment.
3. Show HN title and post body.
4. X thread, 8-12 posts.
5. Email sequence, 3 emails.
6. Community post for the user's first channel.
7. 48-hour launch checklist.

## Output

Return:

```markdown
# Launch Pack

## Landing Page
- Hero:
- Subhead:
- CTA:
- Proof or evidence:
- FAQ:

## Product Hunt
- Name:
- Tagline:
- Description:
- Maker comment:

## Hacker News
- Title:
- Post:

## X Thread
1.
2.
3.

## Email Sequence
### Email 1
Subject:
Body:

### Email 2
Subject:
Body:

### Email 3
Subject:
Body:

## Community Post
- Channel:
- Post:

## Launch Checklist
- [ ] 24 hours before:
- [ ] Launch hour:
- [ ] 6 hours after:
- [ ] 24 hours after:
```

If a product is not built yet, make the copy honest: "building", "waitlist", "looking for first users", or "alpha".
