# CLAUDE.md

Guidance for Claude when working in this repo. Keep it tight — update as conventions evolve.

## What this is

`marcusoft.net` — Marcus Hammarberg's personal blog. Jekyll site, live at <https://www.marcusoft.net>. Running since 2006. Tagline: *Learning by sharing since 2006.* There are 1000+ posts in [_posts/](_posts/); treat them as the source of truth for tone, conventions, and linking style.

## Repo layout

- [_posts/](_posts/) — published posts, one file per post
- [_draft/](_draft/) — work-in-progress posts, not yet published
- [_pages/](_pages/) — static pages (about, contact, archive, tags, talks, search, wordcloud)
- [_layouts/](_layouts/), [_includes/](_includes/) — Jekyll templates
- [assets/](assets/), [img/](img/), [fonts/](fonts/) — site assets; post images go in [img/](img/)
- [scripts/](scripts/) — tooling (spellcheck, lint, scaffolding, wordcloud). See [README.md](README.md) for usage.
- [.scripts/](.scripts/) — lower-level helpers (heading fixers)
- [data/](data/) — generated data (wordclouds)
- [_config.yml](_config.yml) — Jekyll config. Permalink format: `/:year/:month/:title.html`.
- [.markdownlint.json](.markdownlint.json) — linting rules (MD013, MD024, MD033, MD059 disabled)

## Posts — the important part

### Filename

`_posts/YYYY-MM-DD-kebab-case-title.md`. Date is the publish date. Filename title is lowercase with hyphens — no apostrophes, no punctuation.

### Front matter

```yaml
---
layout: post
title: "The post title in quotes"
author: "Marcus Hammarberg"
date: YYYY-MM-DD 04:00:00
tags:
  - Tag One
  - Tag Two
---
```

Common tags seen in recent posts: `AI`, `Agile`, `Lean`, `Flow`, `Programming`, `Life of a consultant`. Match existing tags — don't invent new variants (e.g. don't add `agile` when `Agile` already exists). Grep [_posts/](_posts/) before adding a new tag.

### Structure

- Open with a hook — an anecdote, a question, a quote. Not a summary.
- Put `<!-- excerpt-end -->` after the intro (usually 2–5 short paragraphs in). Everything before it shows on the index page.
- Break the body with `## H2` sections. `###` for sub-sections.
- Close with a short summary or a callback to the opening.
- Images live in [img/](img/) and are referenced as `/img/filename.ext`.
- Link generously — to prior marcusoft.net posts, to books, to the people Marcus learned from. This is a hypertext blog, not an island.

### Scaffolding a new post

```bash
bash scripts/scaffold_post.sh "The post title"
```

Creates the file with correct front matter and opens it in VS Code.

## Voice — Marcus's style, not generic blog-voice

Read a few recent posts before writing ([2026-03-02-navigating-uncertainty-ai-edition.md](_posts/2026-03-02-navigating-uncertainty-ai-edition.md), [2026-01-12-make-the-change-easy.md](_posts/2026-01-12-make-the-change-easy.md), [2025-12-17-on-yak-shaving.md](_posts/2025-12-17-on-yak-shaving.md), [2025-11-27-ai-and-lead-times.md](_posts/2025-11-27-ai-and-lead-times.md) are good recent samples). The voice is:

- **First-person, conversational.** "I", "you", "we". Contractions. Sentence fragments when they land.
- **Personal anecdote first, principle second.** A post about flow starts with Marcus waiting on a PR approval, not with a definition of flow.
- **Warm self-deprecation.** "I'm old", "feeble mind", "Marcus makes numbers up to prove a point". Small asides in parentheses are normal.
- **Credit generously.** Name the people you learned from (Kent Beck, Dan North, Woody Zuill, Gojko Adzic, Birgitta Böckeler, colleagues by first name). Link to their work.
- **Quotes in blockquotes.** Use `>` for quotes that carry the post — Kent Beck's "make the change easy", Woody Zuill's "we often don't discover the work we need to do until we are doing the work".
- **Emphasis is sparing.** *Italics* and **bold** for one-word emphasis or a pivotal phrase, not every sentence. ALL CAPS for a beat, occasionally.
- **Swedish context is welcome.** Umain, Avega, Aptitud, Salvation Army in Indonesia, School of Applied Technology — these are real parts of the story, not noise.
- **Ends with usefulness.** A summary, a three-bullet takeaway, or a "be curious, be humble, be kind" kind of close.

Do NOT write in a flat, AI-polished voice. Do NOT use emojis unless Marcus has used them in the piece already. Do NOT hedge everything — Marcus has opinions.

## When editing posts

- Preserve Marcus's voice — fix typos and clumsy phrasing, don't rewrite. If you're tempted to restructure, surface the suggestion instead of just doing it.
- Never silently change meaning. If a claim seems off, ask.
- Match the surrounding style for lists, headings, links. Look at the file, not generic Markdown norms.
- Respect the pre-commit hooks: spellcheck and markdown-lint must pass. See [scripts/git-hooks/pre-commit](scripts/git-hooks/pre-commit).

## Commands

```bash
# Build locally
bash scripts/build_locally.sh

# Spellcheck
bash scripts/check-spelling.sh _posts
bash scripts/check-spelling.sh _pages

# Lint markdown (--fix auto-applies safe fixes)
bash scripts/markdown_lint.sh _posts --fix
bash scripts/markdown_lint.sh _pages --fix

# Word clouds (run before committing when posts change significantly)
bash scripts/create_wordcloud_all.sh
```

The pre-commit hook in [scripts/git-hooks/pre-commit](scripts/git-hooks/pre-commit) runs spellcheck, lint, and regenerates wordcloud data.

The spellchecker pulls custom words from `$HOME/Library/Application Support/Code/User/settings.json`. If a legitimate word is flagged, add it there, not to the post.

## Memory / log

See [memory.md](memory.md) for the rolling log of work done in this repo. Update it at the end of non-trivial sessions: what changed, why, anything a future session should know.

## Don't

- Don't create new top-level docs unless asked. Edit existing files.
- Don't add "modernization" refactors to the Jekyll setup — it works, it's been working for years, leave it alone unless Marcus asks.
- Don't reformat old posts en masse. They're a 20-year archive; respect the history.
- Don't push or open PRs unless explicitly asked. This is Marcus's personal blog — he ships it.
