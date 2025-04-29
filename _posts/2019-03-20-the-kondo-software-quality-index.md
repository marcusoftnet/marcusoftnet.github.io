---
layout: post
title: "The Kondo Software Quality Index"
author: "Marcus Hammarberg"
date: 2019-03-20 18:16:46
tags:
 - Agile
 - Lean
 - Life of a consultant
---

I'd like to start by acknowledging the remarkable individuals I encounter as a consultant—those brilliant, fun, and experienced professionals who seldom surface online or at conferences. Scott Hanselman aptly dubs them [Dark Matter Developers](https://www.hanselman.com/blog/DarkMatterDevelopersTheUnseen99.aspx), and they are the unsung heroes of the industry. This blog post was sparked by one such individual, Yngve, whom I had the pleasure of collaborating with at a client's site.

At this client, where Yngve serves as an infrastructure architect, we faced a common challenge: measuring software quality. The teams felt overwhelmed by the perpetual neglect of technical debt, constantly being pushed to deliver new features without addressing underlying issues. We lacked a concise means of communicating this dilemma to our non-technical colleagues.

To address this, we devised a simple yet effective metric: the Marie Kondo-index for software quality.

## The Complexity of Measuring Quality

Measuring software quality is notoriously complex, as eloquently discussed by Gojko Adzic in his [blog post](https://gojko.net/2012/05/08/redefining-software-quality/). We struggled to distill this multifaceted concept into an accessible and visual format—until the idea of the Kondo-index emerged.

## The Birth of the Kondo-index

Despite the intricacies of quality measurement, developers and team members intuitively knew the state of the systems they worked on. Conversations revealed a shared sentiment regarding the quality of different components—ranging from enthusiastic pride to visible discomfort.

Drawing inspiration from [How to Measure Anything](https://www.marcusoft.net/2014/12/what-ive-learned-from-how-to-measure-anything.html), I proposed tracking how proud developers felt about the products they were building. This concept aligns with the XP value of simplicity, emphasizing the creation of work that instills pride and is maintainable over time.

It was during this discussion that Yngve humorously interjected:

> "Does it spark joy?"

And thus, the Kondo-index was born.

## A Primer on Marie Kondo

For those unfamiliar with Marie Kondo, she is a Japanese organizational consultant whose methodology has garnered widespread acclaim. Through her books and Netflix series, she advocates for de-cluttering and organizing one's living space to promote joy and serenity.

Her guiding question is simple yet profound:

> "Does it spark joy?"

## Applying the Kondo-index to Software Quality

Yngve's quip—“How much joy does it spark?”—resonated deeply as a quality metric. We experimented with several approaches:

* Regular team voting (1-5) to gauge overall joy sparked by the product, with a median value serving as the index.
* Voting on specific components of the system to generate a holistic quality assessment.

As with any metric, it's essential to remember two fundamental principles:

1. The Kondo-index is an indicator of quality, not a definitive measure.
2. Focus on trends and learning—celebrate improvements and address deteriorations over time.

## In Summary

Extreme Programming values simplicity and takes pride in our work. By asking the team, "Does it spark joy?" about our code, we can gauge our appreciation for the products we build. Regularly tracking this sentiment provides valuable insights into the progression of code quality.

Let's embrace this simple yet powerful metric to foster a culture of pride and excellence in our work.
