---
layout: post
title: "Testing GitHub workflows locally – a study in Theory of Constraints"
author: "Marcus Hammarberg"
date: 2025-06-12 04:00:00
tags:
- Programming
- Agile
- Lean
---

In my [last post](https://www.marcusoft.net/2025/06/flow-is-sacred.html), I complained about my (and others’) flow being disrupted by institutionalized blockages — in that case, pull requests (PRs).

Often, when that happens, there are things you can do to improve the situation.

For example, let’s say (because it was the case) that I had to wait for an approved PR before I could test something — a GitHub Workflow, for instance. The workflow needed to be approved and merged into `main` before I could run it in GitHub Actions.

Now imagine that I waited for approval, only to discover — over the weekend, when I was off — that my fix was wrong. I’d need to make a tiny change and then wait for approval all over again. Annoying, right?

Being someone who cares about flow, I wanted something better. What could I do so that, once my code was ready to be run and verified, the chance of failure was lower? Well — what if I could verify the GitHub Action locally before pushing it to the repository?

Let me show you my reasoning around this. Say hello to my little friend: Theory of Constraints!

<!-- excerpt-end -->

## Theory of Constraints

What I just did was apply the [Five Focusing Steps](https://www.tocinstitute.org/five-focusing-steps.html) from the [Theory of Constraints](https://en.wikipedia.org/wiki/Theory_of_constraints) and the excellent book [The Goal](https://www.amazon.se/-/en/Eliyahu-M-Goldratt/dp/0884271951). Here’s how it went (I only needed the first 2-3 steps, luckily):

1. **Identify the bottleneck** that slows down (or stops) flow. In my case: waiting for PR approval.
2. **Exploit the system’s constraints**. For me, that meant only waiting for PRs for code I was confident in.
3. **Subordinate everything else** to the above decision. I could *change my ways* do this by testing my code locally before pushing.
4. **Elevate the constraint**. This would mean changing the PR process — expensive and tricky, so I focused on what I could control.
5. **Check that the constraint hasn’t moved**.

Ok — that was what was going through my head. Thank you, Mr. Goldratt, sir!

Now, how can I test this locally?

## Running GitHub workflows locally

There’s a tool for this: [`act`](https://github.com/nektos/act), which uses Docker to run GitHub workflows locally.

It’s a CLI tool with many parameters ([docs here](https://nektosact.com/)), but I only needed a few to run my workflow.

I wanted to test an action triggered by `workflow_dispatch`. By adding this to your workflow, you can trigger it manually from the GitHub Actions page of your repository.

In my case, I needed to pass some parameters (a list of files) to the action, implemented as a TypeScript script. I also had some secrets that I normally get from environment variables set in the GitHub repository.

## My workflow

Here’s how it looks:

```yaml
name: Export Docs
description: Exports documentation files to an external system when changes are made in the docs directory.

on:
  push:
    branches:
      - main
    paths:
      - 'docs/**'
  workflow_dispatch:
    inputs:
      paths:
        description: "Space-separated list of file paths to export (examples provided below)"
        required: true
        default: "docs/index.md docs/sub/01-demo.md"

jobs:
  export-docs:
    runs-on: ubuntu-latest

    steps:
      - name: Checkout repository
        uses: actions/checkout@v4

      - name: Setup Node.js
        uses: actions/setup-node@v4
        with:
          node-version: '24'

      - name: Install dependencies
        run: npm ci

      - name: Get changed files in docs/
        if: github.event_name == 'push'
        id: changed
        uses: tj-actions/changed-files@v44
        with:
          files: docs/**

      - name: Set file list
        id: files
        run: |
          if [ "${{ github.event_name }}" = "workflow_dispatch" ]; then
            echo "files=${{ github.event.inputs.paths }}" >> $GITHUB_OUTPUT
          else
            echo "files=${{ steps.changed.outputs.all_changed_files }}" >> $GITHUB_OUTPUT
          fi

      - name: Run export script using ts-node
        run: |
          files=(${{ steps.files.outputs.files }})
          npx ts-node scripts/exportToExternalSystem.ts "${files[@]}"
        shell: bash
        env:
          API_USER: ${{ secrets.API_USER }}
          API_KEY: ${{ secrets.API_KEY }}
```

Not super-complicated, but not dead simple either.

## The tricky part

The hardest part above was ensuring that the script in `run` gets the files as a space-separated list, regardless of whether I’m calling the `push` or the `workflow_dispatch` action.

That’s not the main point of this article, but I thought I’d share my solution for completeness. If anyone knows a better way — let me know.

### Sad trombone: not everything can be tested

In my case, I didn’t want to test the `push` action. That can be done (`act push`), but it turns out that `tj-actions/changed-files` requires more infrastructure than `act` provides out of the box. In other words; testing `push` is not possible for me.

That’s fine — I can verify that part by enduring the slowness of waiting for PRs.

## Running act

Running `act` (after installing it — I used Homebrew: `brew install act`) was actually the easy part:

```bash
act workflow_dispatch \
  -W .github/workflows/export-docs.yml \
  -j export-docs \
  --input paths="docs/index.md docs/sub/01-index.md" \
  --secret-file .env
```

Let’s break down some parameters:

- `act <event name>` — the second parameter is the name of the event to run. In my case: workflow_dispatch. This is a bit tricky to spot in the docs.
- `-W` — points to the workflow file. If there’s only one file in .github/workflows, you can skip this.
- `-j` — indicates the job name. If there’s only one job, you can skip this too.
- `--input paths=<value>` — passes parameters to the event. Notice how it matches the workflow structure:

    ```yaml
    workflow_dispatch:
      inputs:
        paths:
    ```

- `--secret-file` — passes secrets that will be read using `${{ secrets.API_USER }}`. You can reuse an `.env` file like I’m doing. There’s also a `--secret` flag to pass secrets directly (`--secret API_USER=user_name`).

By removing parameters that I can trust to be defaults, I can simplify to:

```bash
act workflow_dispatch \
  --input paths="./docs/index.md ./docs/sub/01-index.md" \
  --secret-file .env
```

This will download some Docker images and then run the workflow locally.

## Conclusion

I could do 2–5 iterations on this before pushing. That increased the likelihood of it working, once the PR was approved and merged, a lot.

Since “waiting for PR approval” is the bottleneck here, it was well worth to spend time on a non-bottleneck resource (me) to:

1. Learn, and,
2. Prepare the work so that the time it spends in the bottleneck is well-spent.
