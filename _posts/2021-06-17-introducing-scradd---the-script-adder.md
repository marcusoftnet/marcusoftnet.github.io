---
layout: post
title: "Introducing ScrAdd - the script adder"
author: "Marcus Hammarberg"
date: 2021-06-17 14:34:47
tags:
  - Javascript
  - Tools
---

I’ve been increasingly annoyed with the fact there’s no easy way to add scripts to a `package.json` file programmatically. It always messes up my lovely scripts for tutorial setups and other use cases. Very frustrating.

Well … until not that is.

I give you [ScrAdd](https://www.npmjs.com/package/scradd) - the script adder.

Let’s say that you are writing a tutorial on how to test next apps. You want the readers just to get to the place where you can start to talk about code. My friend - just `scradd` in that command and take the rest of the day off!

```bash
npx create-next-app demo
cd demo
npx scradd . test "mocha . -R dot -w"
npm i -D mocha
```

I don't expect this tool to be widely used and spread but I was pretty fun to write it - the testing was particularly tricky to get working.

Get the [code](https://github.com/marcusoftnet/scradd) or download the tool using `npx scradd`
