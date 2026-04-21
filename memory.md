# memory.md

Rolling log of work done on this blog with Claude. Append, don't rewrite. Newest on top.

The point is continuity — so the next session can pick up without Marcus having to re-explain. Keep entries short. Link to the posts / files / commits that matter.

## Template

```markdown
## YYYY-MM-DD — short title

**What:** one-line summary of what we worked on.
**Why:** the reason or ask behind it, if non-obvious.
**Changes:** bullet the concrete files touched or posts published.
**Notes:** anything surprising, any open loops, anything a future session should know.
```

## What belongs here

- Posts drafted, edited, or published — with the filename.
- Tooling changes (new script, changed hook, adjusted lint rule) and *why*.
- Editorial decisions that aren't written down elsewhere — e.g. "decided to stop tagging old posts with X", "merged two series into one".
- Open loops: drafts left in [_draft/](_draft/), ideas Marcus wants to come back to, things half-done.

## What doesn't belong here

- Routine typo fixes, small cleanups — the git log is enough.
- Code-level detail that's obvious from the diff.
- Anything Marcus wants kept private. This file is committed.

---

## 2026-04-21 — Added CLAUDE.md and memory.md

**What:** set up repo-level guidance for Claude sessions on this blog.
**Why:** Marcus wanted future sessions to be consistent with the blog's voice and conventions without having to re-brief every time.
**Changes:**

- Added [CLAUDE.md](CLAUDE.md) — repo layout, post conventions, voice notes, commands, don'ts.
- Added [memory.md](memory.md) — this file, for rolling session notes.

**Notes:** Voice guidance was built by reading recent posts from 2024–2026 ([2026-03-02 navigating uncertainty](_posts/2026-03-02-navigating-uncertainty-ai-edition.md), [2026-01-12 make the change easy](_posts/2026-01-12-make-the-change-easy.md), [2025-12-17 on yak shaving](_posts/2025-12-17-on-yak-shaving.md), [2025-11-27 AI and lead times](_posts/2025-11-27-ai-and-lead-times.md), [2026-02-06 how did I learn to code](_posts/2026-02-06-how-did-i-learn-to-code.md), [2026-01-20 naked meetings](_posts/2026-01-20-naked-meetings.md), [2025-09-15 SDD initial thoughts](_posts/2025-09-15-sdd-initial-thoughts.md), [2025-08-08 flow is sacred](_posts/2025-08-08-flow-is-sacred.md)). If the voice guidance in CLAUDE.md drifts from how Marcus actually writes, update it — the posts are the source of truth, not the doc.
