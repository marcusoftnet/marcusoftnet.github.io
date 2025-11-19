---
layout: post
title: Using ATDD in conversion project
date: 2010-05-26T21:42:00.001Z
author: Marcus Hammarberg
tags:
  - BDD
  - .NET
  - Life of a consultant
  - Agile
modified_time: 2010-05-27T09:06:52.879Z
blogger_id: tag:blogger.com,1999:blog-36533086.post-6727733881573572513
blogger_orig_url: https://www.marcusoft.net/2010/05/using-atdd-in-conversion-project.html
---

I have been involved in a lot of conversion project. More specific it has been converting legacy VB6 applications to .NET applications. I’m not sure why or how but I have found myself in many project like this.

## Common scenarios in conversion project

Very often these project has an ideal picture that “it’s just a conversion”. “This is 1 to 1 project” is a very common phrase in many of the projects I have been involved in. That can be understood as: “just convert it in the new language – with the exact same features”. I have even been asked to do bug conversion – that is to also convert any bugs I find into the new language.

Moreover, these project very often lack interest, time and effort from the stakeholders/customers/business people. To non-technical persons conversion is purely technical thing. “Just recompile it – let me know when you’re done”.

And also as most VB6 applications still living today are old application the violation of the [DRY principle](http://en.wikipedia.org/wiki/Don't_repeat_yourself) in code and documentation has been painfully clear. What I mean by that is that the documentation (if present at all) very seldom reflect the actual behavior of the application.

So – as a developer you are asked to do conversion with no requirements except the old application. And the expectations is high. “How can you fail? It’s just a conversion…”

The tester also have a hard time. Since there of course cannot be a one-to-one-conversion (features change in languages, a rewrite change the behavior of the code etc) and there is not requirement, you have to test case by case with only the old application as verification.

### ATDD to the rescue?

As readers of this blog know, I have lately snowed in on [agile testing](https://www.marcusoft.net/2008/11/agile-testing-how-we-get-it-to-work.html) (or [agile acceptance testing](https://www.marcusoft.net/2010/03/bdd-with-specflow-some-thoughts-after.html), or [specification by example](https://www.marcusoft.net/2010/04/specification-by-example-missing-link.html), or [BDD](https://www.marcusoft.net/search/label/BDD)). Using this kind of specification by example will give you the most when collaborating on them with your customer, I know. But in many cases, in conversion projects like above that is simple not possible.

Can specification by example still be of use? [Jonas Bandi](http://www.jonasbandi.net/) ask (and answers) a [similar question here](http://blog.jonasbandi.net/2010/05/atdd-for-rewriting-legacy-application.html).  I think that it can be most useful. Using this approach you will get:

- a shared understanding of the task at hand in the team (developers and tester)
- an executable specification for the developers to code against. That gives them the possibility to work [outside in](http://en.wikipedia.org/wiki/Outside-in_software_development)
- the tester get a skeleton for a suite of automated regression tests
- the test can live during the sprint – that is developers and testers can introduce new specifications to verify behaviors as they are found.
- and finally; given that your using a tool with a readable language ([Gherkin](http://wiki.github.com/aslakhellesoy/cucumber/gherkin) in [SpecFlow](http://www.specflow.org) for example) – you can take it back to your customer for verification. That will hopefully get them to engage more in the process.

#### How it’s it done?

If I ever got the opportunity to decide on matters like this (and I DO, sometime) I would set it up like follows.

If we use the example that we’re converting a VB6 application, our most probable choice would be [WPF](http://en.wikipedia.org/wiki/Windows_Presentation_Foundation). One nice feature of WPF is that there are loads of great frameworks building on well known patterns, such as [MVP](http://en.wikipedia.org/wiki/Model_View_Presenter), [MVC](http://en.wikipedia.org/wiki/Mvc) and [MVVM](http://en.wikipedia.org/wiki/MVVM). I blogged about some of these [frameworks here](https://www.marcusoft.net/2010/05/wcf-mvvm-and-good-client-design.html).

So I would probably go with [Prism from Microsoft](http://msdn.microsoft.com/en-us/library/cc707819.aspx). That will give us a clean separation between the view (XAML code that only do [data binding](http://www.nbdtech.com/Blog/archive/2009/02/02/wpf-xaml-data-binding-cheat-sheet.aspx) and an abstraction of the view that holds the properties the view binds to; the ViewModel.

Given this setup you can write your the steps that the specifications are executing against the view model, leaving the View to be tested separately. This is not ideal but automatic GUI testing cannot take you all the way in any case. There will always be a human take on where stuff are best placed and how the interaction should be. This can never be automatically verified. I think. And hope – that would almost [be scary](http://en.wikipedia.org/wiki/HAL_9000).

My specifications would then look something like this

```gherkin
Given I’ve entered customer number 12345567
When I choose Open Customer
Then I should see the following information on the screen:
| ID       | Name            | Street   |…  | … |
| 12345567 | Marcus Hammarberg| My street| … | … |
```

I would have the test run against the “real system” with a real database and all the real dependencies (no mocking).

I get back to you when this is tried out, and I have ran into all the problems I didn’t foresee.
