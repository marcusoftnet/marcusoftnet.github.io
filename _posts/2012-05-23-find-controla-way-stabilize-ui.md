---
layout: post
title: Find the control–a way to stabilize UI automation… a bit
date: 2012-05-23T09:07:00.001Z
author: Marcus Hammarberg
tags:
  - Tools
  - .NET
  - Agile
  - SpecFlow
modified_time: 2012-05-23T09:09:35.847Z
blogger_id: tag:blogger.com,1999:blog-36533086.post-4713664336685455661
blogger_orig_url: https://www.marcusoft.net/2012/05/find-controla-way-stabilize-ui.html
---

I have been diving deep into automating web pages for my current client. I have a love – hate relationship with this. It’s quite cool but I would also recommend against using it. I [wrote about why just a post](https://www.marcusoft.net/2012/05/specflow-page-objects-and.html) or two ago so I won’t repeat it here.

In this post I will instead acknowledge the fact that we are going to automate against the web page and do our [best to handle the brittleness of such tests](https://www.marcusoft.net/2012/05/specflow-page-objects-and.html). One challenge that you are facing when writing code to automate elements of a page is to actually get hold of the elements themselves. This is done in different ways with different automation frameworks, but typically you can search by Id (or other attributes on the elements), order in the page, and position.

In this post, I will examine those different approaches and suggest one way that I’ve found very useful to further handle the brittleness of a webpage.

## What was the problem now again?

The problem with testing against a web page is that those tests tend to be brittle. This has to do with the web page (or other GUI for that matter) being one of the parts of a system that changes a lot. There are ways to [cushion the blow from that a bit](https://www.marcusoft.net/2012/05/specflow-page-objects-and.html), but it’s still a reality that we have to live with.

In this post, when I write automation code I mean the code that actually automates the browser, however well encapsulated and well-structured it might be. Somewhere you still have to hit the web page and find the control.

### Using position and order

Both of these are not a very good idea. This means that you need to change the automation code if a new element is added in the hierarchy of elements, or even if it’s displayed in another place. We don’t want that – we can do better!

#### Using ID or other attributes

All frameworks for UI automation I’ve used have some way to search for a control by ID or other attributes of the element. This seems to be the preferred way in most frameworks and is also one that I recommend. The main advantage of this is that your search is agnostic to the position and order of the control. The disadvantage is that you need to have an Id or another attribute that is a stable way to find the control.

My favorite framework lately, [FluentAutomation](http://fluent.stirno.com/blog/), uses [CSS Selectors](http://www.w3.org/TR/CSS2/selector.html), which is a very flexible and powerful query language against the DOM elements. You can write really flexible stuff such as:

> .liveExample td.quantity input:eq(1) - which means; find the first input element with the class “.liveExample” in the TD-element with class “.quantity”

Yes – it’s powerful and flexible indeed. One thing worries me though; the things we are using to find that control are also used for styling and positioning. We might change the “.liveExample” class into another, or stop using a table for layout, etc.

By using those, we could say that we are violating the [Single Responsibility Principle (SRP)](http://en.wikipedia.org/wiki/Single_responsibility_principle) since the CSS class now has 2 reasons to change.

One could argue, at least with certain web frameworks, that even the ID or Name couldn’t safely be used to find the control when Automating. Using [WebForms](http://msdn.microsoft.com/en-us/library/ms973868.aspx) from way back then, in earlier versions than .NET 4, the ID and Name of the control are generated for you. And they change if you put them into a user control.

#### Create an ID for you and your automation needs

A couple of years ago, I did some [automation against WPF](https://www.marcusoft.net/2010/08/using-bdd-with-specflow-wpf-and-white_14.html) and found an attribute, found on every WPF control, that I never saw the use for before: [the AutomationID property](http://msdn.microsoft.com/en-us/library/aa349646.aspx). That property solely exists for you to set an ID that you can use when automating the application. It’s separate from the ID property of the control and can be thought of as an alternative key to the control.

That would be something, right? Fortunately, we can create one of our own!

The main browsers simply ignore attributes that they don’t understand, but you can still find it with CSS Selectors. So that’s great – we can make up an attribute for UI Automation. But a validator tool might be upset. Luckily in the HTML5 specification, there is help in the [form of the `data-* attributes`](http://dev.w3.org/html5/spec/global-attributes.html#embedding-custom-non-visible-data-with-the-data-attributes).

I do NOT claim to be an expert here, but basically, you can make up any attribute you like, prefix it with “data-” and it will pass even validation in HTML5.

So why not simply add a “data-automation-id” attribute to the element you want to reach with your automation code? Not all of them, but the few that you actually need to reach from your automation code. That would give us the following example control:

```html
<input type="text" id="ucMarcus1_ucMarcus2_ucMarcus3_userName" class="myNiceFormattingClass" data-automation-id="userNameField" />
```

And you can easily reach it with a CSS selector (here in turn used in FluentAutomation):

#### Conclusion

So that’s a nice way to have one single ID to reach the control you’re writing automation code against. There is only one reason for the automation-id to change now and it’s easy to find.

However, as some colleagues pointed out, we’re changing our production code in order to test it easier… So what? is my response. I think it’s worth it.
