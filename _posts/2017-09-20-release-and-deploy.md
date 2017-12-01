---
layout: post
title: "Deploy and release"
author: "Marcus Hammarberg"
date: 2017-09-20 16:53:42
tags:
 - Agile
 - Lean
 - Kanban
 - Life of a consultant
---

Today I got a call from a friend that works in a big organisation. A bank with very old fashion and rigid processes for how software is handled and released. 

Needless to say my friend ran into a wall of pain and trouble as he tries to introduce agile values of small things moving quickly though the value chain. Specifically the client was reluctant to release until `everything is completely done - otherwise there's no value at all`.

An old trick came to mind as I tried to help him with his conundrum:

> There's a difference between **deploy** and **release**

<a name='more'></a>

I had the same problems as my colleague at another client and we solved part of that by just making a clear distinction between deploying and releasing. 

**Deploying**, in this context, is a technical activity. It means putting new versions of the code onto a production server or released to some clients. We might hid some features behind a feature toggle or just hide the link to the new page or … you are probably much more creative than I.  

In essence the deployment just means that we, ourselves, can see the new code but (most) end customers cannot. 

**Releasing** is a business decision and might require coordination of many other activities such as marketing, coordination with other releases, training users and reporting of different kinds. 

At first most people around me, didn't see the greatness with this distinction but we decided to use these two concept anyway. Then one day, the product area manager made the value clear to all of us:

> You deploy how much you want - as long as I can release when **I want**. 

## Conclusion

There's much more to be said around this, the concept of feature toggle alone is book-worth of material. But I'm commuting on a ferry that's about to land so I just want to jot down this idea for further reference. I hope you found it useful.

This is another concept (see [my post on pull priority](http://www.marcusoft.net/2017/08/from-push-to-pull-the-essence-of-lean.html) for another example) where I've found that splitting up decisions into smaller, separate parts is very useful and gives a competitive advantage over doing both **release and deploy** (in this case) in one bigger decision and action. 