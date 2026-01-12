---
layout: post
title: "Making the change easy"
author: "Marcus Hammarberg"
date: 2026-01-12 04:00:00
tags:
  - Flow
  - Programming
  - Life of a consultant
---

One of Kent Beck's many great things to consider is this little mind-bender of a quote

> for each desired change, make the change easy (warning: this may be hard), then make the easy change

The quote is on [X](https://x.com/KentBeck/status/250733358307500032) but I first read it in his great little book [Tidy First?](https://www.amazon.se/-/en/Tidy-First-Personal-Exercise-Empirical/dp/1098151240). Yes, the question mark should be in there. Read the book for more.

Ok. This quote forces you to think for awhile, but is very good practical advise for any software developer I wanted to relate a story from last week where I used it.

<!-- excerpt-end -->

## The problem at hand

I have built an application for myself. But then people started to ask me to use it. The problem was that I had built it as a single-user system; no notion of users in the code and using [SQLite](https://sqlite.org/) using [better-sqlite3](https://github.com/WiseLibs/better-sqlite3).

I tackled the first ~~problem~~ improvement opportunity by simply adding a `user_id` in each table, adding login via Firebase and tweaking the entire code base. That was just a lot of work, but quite simple. Thank God for an agent that could push through it for me.

But the other improvement opportunity was a bit more challenging.

## The challenge

Since I hadn't designed the system for anything else than SQLite I had been a bit sloppy and there were database code (SQL-queries) in a few different place. Also I was using the better-sqlite3 abstractions in other placing, passing around a `Database`-reference.

Well, I thought to myself - that's a lot of places, but surely another agent can just fix that for me.

It could. But it caused a horrible mess. Not because it failed, but it was touching too many things at the same time.

The SQL needed to be updated (the dialects differs a bit), the `Database` abstraction from `better-sqlite3` doesn't behave in the same way as the PostGres (`pg`) abstractions.

All in all - the change was not at all easy. The AI agents could not save me. It was not just `a lot of work`, but complex and tricky.

## The approach

This was when Mr Beck's wise word above hit me like a brick wall. How can I `make this change easy`.

(There's no big innovation here, it's just my experience. Get your expectation on the right level, people)

I decided to implement an Adapter with a shared interface. Like this, for example:

```typescript
export type DatabaseProviderName = "sqlite" | "postgres";


export interface DbAdapter {
  query<T = unknown>(sql: string, params?: unknown[]): Promise<T[]>;
  queryOne<T = unknown>(sql: string, params?: unknown[]): Promise<T | null>;
  execute(sql: string, params?: unknown[]): Promise<void>;
  transaction<T>(fn: (db: DbAdapter) => Promise<T>): Promise<T>;
  close(): Promise<void>;
  databaseProvider: DatabaseProviderName;
}
```

I then implemented a `SQLiteAdapter` that implemented this interface.

```typescript
import Database from "better-sqlite3";
import { readFileSync, mkdirSync, existsSync } from "node:fs";
import { join, dirname } from "node:path";
import { DbAdapter } from "./DbAdapter";
import { DatabaseProviderName } from "..";

export class SqliteAdapter implements DbAdapter {
  private readonly db: Database.Database;
  public readonly databaseProvider: DatabaseProviderName = "sqlite";
  constructor(private readonly dbPath: string) {
    this.ensureDatabaseDirectory();
    this.db = new Database(dbPath);
    this.db.pragma("foreign_keys = ON");

    this.ensureSchema();
  }

  // ------------------------
  // Initialization helpers
  // removed for brevity
  // ------------------------
  private ensureDatabaseDirectory() {
    // code
  }

  private ensureSchema() {
    // more code
  }

  // ------------------------
  // DbAdapter implementation
  // ------------------------

  async query<T>(sql: string, params: unknown[] = []): Promise<T[]> {
    return this.db.prepare(sql).all(params) as T[];
  }

  async queryOne<T>(sql: string, params: unknown[] = []): Promise<T | null> {
    return (this.db.prepare(sql).get(params) as T) ?? null;
  }

  async execute(sql: string, params: unknown[] = []): Promise<void> {
    try {
      this.db.prepare(sql).run(params);
    } catch (error) {
      console.error("Error executing SQL:", error);
      throw error;
    }
  }

  async transaction<T>(fn: (db: DbAdapter) => Promise<T>): Promise<T> {
    return new Promise<T>((resolve, reject) => {
      const trx = this.db.transaction(() => {
        fn(this).then(resolve).catch(reject);
      });
      trx();
    });
  }

  async close(): Promise<void> {
    this.db.close();
  }
}
```

Now the `simple change` was to move all database access code to use this interface.

Turned out - that was hard (remember the quote `(warning: this may be hard)`). As in complicated by not that complex. There was A LOT (I'm ashamed) of places to change, but each place was pretty simple.

I had two tools at my disposal that was essentials

### Lean on the compiler

First I was using TypeScript, which means that I had a compiler to help me.

When I change a reference from a `import Database from 'better-sqlite3';` to my own `DbAdapter` deep down in the nitty gritty of the code, I got a lot of compilation errors.

This is a Good Thing (tm). Compilation errors is a very short feedback loop and fixing each of them is often relatively straight forward.

### Automated tests

The second thing I had in place was a bunch (700+) of automated tests. This means that I could know if the changes made broke the code as I went through each route or function.

Since my `SqliteDbAdapter` was the only adapter being used, I would expect the SQL-queries to behave in the same way.

So in a way - the change was `easy` but it was hard work. Took me almost 3 days to get through.

## After making the change easy

But once I was done implementing the DbAdapter throughout the codebase I was now in a much better place: the next change was now `easy`.

Meaning; all I had to do now was to implement a `PostGresDbAdapter : DbAdapter` and then start to use it, rather than the `SqliteDbAdapter`.

That was actually just one single row to change, but it caused a lot of problems (SQL didn't work, I had to setup a local database via Docker etc. etc.)

BUT - each of those steps was now easier.

## And with that

Often when faced with challenge we think that we can only do it in one go; making all the changes at once. I think this trap is especially easy to fall into with AI Agents doing the heavy lifting for us.

It's easy to think that if `I just let it run a bit more it will eventually come through with a solution`.

But just as with humans breaking the down the problem into smaller pieces will make each step not only easier, but also less risky.

Much of the work we do is shaping the work we need to do. Even more so with agents doing the actual work.

Hence;

> for each desired change, make the change easy (warning: this may be hard), then make the easy change
