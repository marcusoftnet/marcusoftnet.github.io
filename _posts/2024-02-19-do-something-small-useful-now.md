---
layout: post
title: "Do something small useful now"
author: "Marcus Hammarberg"
date: 2024-02-19 08:00:00
tags:
  - Life of a consultant
  - Agile
---

A long time ago I stumbled over the motto of [Bob Bemer](2024-02-13-sender-is-also-responsible.md) and it is both cool, nerdy, and useful

```text
((((DO SOMETHING!) SMALL) USEFUL) NOW!)
```

In this post I wanted to unpack, what I think, it means and show you how it can be useful to tackle beasts that you haven't dared or have the strength to do something about.

I even have a screensaver picture that you can [download here](https://www.marcusoft.net/2023/03/screensavers-do-something-small-useful-now.html)

<!-- excerpt-end -->

### Bob Bemer

First a few words about Bob Bemer who seems to have been a pretty amazing guy, that very few have mentioned. 

Born in 1920 he was at his peak when programming and computing really took off and was involved in a few paramount inventions. He calls himself the "Grandfather of" COBOL (according to Admiral Grace Hopper) and the "Father of" ASCII and put the escape sequences into ASCII (`\n\t` for example). 

Yes. ASCII. The man invented text, friends. Sit down and listen. 

#### About the motto

The motto is brilliant in how it is written and what it means. It's a kind of [LISP](https://en.wikipedia.org/wiki/Lisp_(programming_language)), as far as I understand:

```text
((((DO SOMETHING!) SMALL) USEFUL) NOW!)
```

And I unpack it like this (realizing that I might sound like the [aliens in the storage box in Men in Black 2](https://www.youtube.com/watch?v=A9sd10CHAP8)): 

*`DO SOMETHING`* - this is first and the most important. Let's just do something rather than be paralyzed by analyzing the situation and just think. Rather `DO`.

*`DO SOMETHING SMALL`* - make sure that the thing you do is `SMALL`. It's better than doing something BIG. I promise, a story below 

*`DO SOMETHING, SMALL, USEFUL`* - it's good that the thing that we are doing is `USEFUL`, but honestly `SMALL` is more important. This channels the inner Woody Zuill in me when he said `We spend so much time ensuring that we work on the most important thing when working on something important is enough`. Yes - when it's `SMALL`. For `BIG` things priority work is very important. 

* `DO SOMETHING, SMALL, USEFUL, NOW` - in the end, Mr Bemer tells us to get going. `NOW` - don't wait, just `DO`

#### A story

Where I'm working right now we have a large legacy code base. Building it takes a very long time, 2 hours ca, and many of the parts that we are building are a bit scary to touch so we have just let it be and live with the fact that the build takes that long. 

Having such a slow build is slowing our feedback loop down too much for any agile person's liking so I asked if there wasn't something that we could do to make that build faster. 

Someone looked into the build and we found a little change that would make our SonarQube static code analysis go a bit faster. 

> But that is really only taking about 2-3 minutes of the total time. I don't really see the use. 

`DO SOMETHING`

So we made that change. And the build was a few minutes faster for a few sections. The build now took 1 hour 40 min. 

Then, just a few days later someone came up to me and said; we actually played around with parallellizing some of the build steps. But it was a bit messy, so we left it half-done. When asked how much was left they told me a few hours. 

Turns out it was a bit more complicated than that. But, they told me, `when i looked into parallellizing I thought about getting SSD-disks for our cloud service`.

`DO SOMETHING SMALL`

That takes about 30 seconds to change but the weekend to be applied. And it shaves of ca 5-10 minutes more per build step - the build now took ca 1 h and 10 minutes.

Another developer told me that he wanted to update the version of a tool that was old. `But it will probably not affect the build time`. It did - shave another 5-6 minutes of the build time. 

`DO SOMETHING SMALL`

At the [fika](https://destinationuppsala.se/en/guides/what-is-swedish-fika/) we happened to talk about this and realized that there are some parts of the build that we do many times over; one for each combination of language and browser we want to support. 

`That would make a huge impact if we could change that`, a developer lamented.
`But we don't need to support Russian anymore`, a product manager said. 

That would be useful since it would make the testing scope smaller too.

`DO SOMETHING SMALL USEFUL`

When we started to investigate making that change we realized that we are building for 3-4 browsers that we are not supposed to support anymore. 

All in all, this promises to take the build time down to around 20-30 minutes in total. (To be perfectly honest that's a calculation that we made - and I'll update the post here once we see the results).

## Summary

The thing here is not that we made good changes (although we did). It's that we made small changes and started to do something. 

`It is in doing the work we discover the work we need to do` is another Woody Zuil quote that I love. 

To conclude our journey is just one simple example of what can happen if we let people do something. But remember, that advice from Father ASCII: 

```text
((((DO SOMETHING!) SMALL) USEFUL) NOW!)
```