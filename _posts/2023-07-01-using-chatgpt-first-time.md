---
layout: post
title: "Using ChatGPT professionally for the first time"
author: "Marcus Hammarberg"
date: 2023-07-01 07:00:00
tags:
  - Programming
  - Life of a consultant
---

This week I used ChatGPT professionally for the first time.

It worked ... pretty well.

I can't write regular expressions. There was a time when I even wanted to learn them, but that has long since passed, and now I hate them with the heat of 10.000 suns. You can spare me any "But if you just look at this tutorial/book/video etc.", or "Take a look at regexp101.com that will help you, I promise".

No, thank you. I've done that. I even read the [best book (here as a post) on the topic, by Staffan Nöteberg](https://staffannoteberg.medium.com/regular-expressions-the-full-story-6cfa39d83bd3). Nothing helps.

When I need a regular expression I either solve it in a substandard way or spend waay too long to write something simple.

<!-- excerpt-end -->

But regular expressions are perfect for an AI. So I just asked ChatGPT; `Can you write me a regular expression that matches these strings XXX but not these strings YYY`. Where XXX and YYY were about 200 strings each.

He (I promise that ChatGPT is a man!) chirped: Of course. And then went on barfing out not only the regular expression but also an explanation. In short, ChatGPT mansplained me a regex.

I then went back and forth a few times, removing some examples to make the regular expression a bit more narrow.

Finally, I wrote test cases for all the strings that I had given ChatGPT and verified the code. That had me iterate a few more times over the suggested solution.

In the end, I had a few very small, understandable (even I got it) regular that I didn't write.

A few takeaways that made me hopeful that there will be a need for people skilled in programming in the future:

1. I would not have been able to iterate over the solution without some knowledge about regular expressions at all. I could never correct Greek if I don't know Greek.
2. I wrote test cases to verify the solution. This was paramount, because not only did I find a few bugs, but also a few improvements and finally a solution that was not apparent when I first asked ChatGPT for an answer. The code, written by an AI, is my responsibility. My users don't care that `someone else did it`.
3. I know how it is supposed to be used in a context. My code is running in a batch and operates on data from files. I know the limits of what data might be entered, and what will not be entered.

I will surely make use of this again, for other things that I have a hard time remembering or don't care how to learn. But I also realized my own value and importance to make it great.
