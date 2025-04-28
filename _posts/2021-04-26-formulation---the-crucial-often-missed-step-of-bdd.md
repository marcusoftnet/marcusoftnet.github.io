---
layout: post
title: "Formulation - the crucial (often missed) step of BDD"
author: "Marcus Hammarberg"
date: 2021-04-26 20:25:02
tags:
 - BDD
 - Specification by example
 - Books
---

Very early in my agile journey, I stumbled over [behavior Driven Development](https://dannorth.net/introducing-bdd/) (in that exact blog post, in fact - Thanks Dan). And like many, I first thought of it as a more user-friendly way of writing tests.

But pretty soon (through the help of [Specifcation By Example](https://www.manning.com/books/specification-by-example) - Thanks Gojko) I realized that the true power comes from the shared understanding that stakeholders and delivery team can get from writing the specifications together, before we start, as examples/tests using concrete data.

I was hooked and [Cucumber](https://cucumber.io/) was my poison. A programming language for requirements. Executable specifications, I mean - come on! This is now 15 years ago and I still am a big fan of this way of working.

Hence I was really happy to see that two of my BDD-heroes ([Gaspar](https://twitter.com/gasparnagy) and [Seb](https://twitter.com/sebrose)) have come together ([again](https://leanpub.com/bddbooks-discovery)) to write about the often neglected and missed part of BDD - how to actually formulate the scenarios.

The book is aptly named [Formulation](https://leanpub.com/bddbooks-formulation) and it is packed with goodness as it goes through not only the syntax and possibilities of Gherkin (which is the way you write specifications in Cucumber) but also many examples on how the crucial collaboration can be done.

Throughout the book, we follow a few sessions with an imaginary team, which teach us good ways but also warns us about pitfalls and problems. Seb and Gaspar also sprinkle the book full of their own experiences and anecdotes, which provides good real-life applications of their advice.

What really stands out for me is the emphasis on reaching for shared understanding, with the automation of the features being a `valuable side effect`. This is the one thing that I see most people misunderstand and, like me, think of Cucumber as a way to write tests. Which misses out on the main benefit of this **collaboration tool**.

The chapter on organizing the specifications to help them support the goal of living documentation was really useful too.

I also appreciate the chapter on Legacy code and using their suggested work patterns there. No software is an island (is that a song yet?) and writing down your current understanding as business readable specifications is a really good way to strike up a conversation about what the system actually does now. You'd be surprised how often that is not known...

All in all, I would recommend this book to anyone that wants to find a better, more fun, and effective way to handle specifications. And, since I read it, you should buy the Discovery book too...
