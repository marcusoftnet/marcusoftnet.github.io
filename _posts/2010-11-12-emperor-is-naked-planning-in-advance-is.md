---
layout: post
title: The Emperor is Naked—Don’t Ask Me to Estimate!
date: 2010-11-12T11:18:00.001Z
author: Marcus Hammarberg
tags:
  - Life of a consultant
  - Agile
modified_time: 2010-11-12T15:12:30.686Z
thumbnail: /img/estimated+time+left.JPG
blogger_id: tag:blogger.com,1999:blog-36533086.post-6514925003307124771
blogger_orig_url: http://www.marcusoft.net/2010/11/emperor-is-naked-planning-in-advance-is.html
---

This is a well-known truth for all practicing agile methods.

### Introduction

I'm currently working on a migration project with a fantastic team—possibly the best I've ever worked with. We're converting a large VB6 application to VB.NET and WPF. Due to various reasons, we decided to do this in two phases:

1. **Migrate everything with a tool and then get it to work again.** Write an [integration test that ensures the function works as expected](http://www.marcusoft.net/2010/05/using-atdd-in-conversion-project.html).
2. **Rewrite the underlying architecture bit by bit.** Since we have integration tests in place, we are shielded from introducing any significant bugs.

In the first phase, we worked our way through the old code, form by form. There were 265 forms, and we created a simple tracking tool in Excel to classify each form as S, M, L, or XL (based on size in KB). As we progressed, we tracked the time spent on all activities. Eventually, we could estimate how long it would take us and how much work remained.

### Data Gathering

Of course, the usual stuff happened. Two days into phase 1, my project leader (who is also a great guy and has embraced agile thinking) asked, "When will you be done?" I hate answering that question without any data, so I put it off for two weeks. But then the question came again: "Now you must know... When will you be done?"

Since I knew this question couldn't be answered with any certainty, but rather a guess, I started to track data to back that up. Here is our last month, day by day, showing how much time was left to complete the work (and remember, this is a great team that updated this calculation several times every day):

![estimated time left](/img/estimated+time+left.JPG)

### Analysis

From this, we can see that:

- When we first started tracking time left (after a few days), we guessed that we had about 670 hours remaining.
- Just a few days later, we discovered how hard this was, and our estimate ballooned to 2108 hours left.
- It rolled along for a few weeks. We didn't add much, but no time was reduced either. Everyone was present; no one was sick. It just stayed in the 2100-range, peaking at 2268 on 2010-10-25.
- Then, all of a sudden, it started to fall. Why? We began to remove tasks that were no longer necessary, reused code we had already written, and improved our efficiency.
- As of now (2010-11-12), we're at 602 hours left.

I wouldn't be surprised if the hours rise and fall during the remaining days. I am quite sure it won't be a steady line down to zero from today.

### Conclusion

When I was first asked, "When will you be done?" I would have answered, "In 670 hours" based on the data we had. This was wrong. Two weeks later, I would have answered, "In 2074 hours," and I would still have been wrong.

So when could I have been right? Never! This is because [software development is a learning process](http://en.wikipedia.org/wiki/Lean_software_development#Amplify_learning) more than anything else. You uncover more and more complexities of the project as you go.

For agilistas, this is old news. We know this. But the question still comes. Just the other week, we were asked to estimate when phase 2 would be done. By then, we hadn't even decided what would go into it. So it still happens.

What to do? Just give me a date when you want it done, and we'll try to fill it with the most important functionality, with the best quality we can manage in that timespan. 

I'm sorry. The emperor is naked—you cannot estimate a software project with any certainty.
