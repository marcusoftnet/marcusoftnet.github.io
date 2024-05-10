---
layout: post
title: Clean up your steps–use page objects in SpecFlow step definitions
date: 2011-04-07T05:16:00.001Z
author: Marcus Hammarberg
tags:
  - BDD
  - .NET
  - Life of a consultant
  - SpecFlow
modified_time: 2011-04-11T14:31:19.845Z
thumbnail: http://lh6.ggpht.com/_TI0jeIedRFk/TZ1Im7jduEI/AAAAAAAAA9U/L1rx7v20vnc/s72-c/step%20defintion_thumb.jpg?imgmax=800
blogger_id: tag:blogger.com,1999:blog-36533086.post-2188015318186471315
blogger_orig_url: http://www.marcusoft.net/2011/04/clean-up-your-stepsuse-page-objects-in.html
---

If you are a developer doing [BDD](http://en.wikipedia.org/wiki/Behavior_Driven_Development), as me, you’ll soon run into the joys of UI automation. The BDD community to day seems to lean towards running your specifications/test end-to-end in order to capture the whole stack of the application as well as getting great regression tests.

But tests against the GUI can be brittle, that part of the application is the one that most often is changed, in my experience. So writing automated stuff (in essence programs) against a changing environment is not very pleasant as you might well know.

This is post is about using the Page Object pattern that can help you handle this brittleness as well as structuring your test code in a nice, maintainable way. That in turn will help us to place code in the right place – which I like. Some guidelines, if you like.

### Inspiration

I have of course not invented this by myself, but rather been inspired by thoughts from the Ruby on Rails community. Actually (as a side note), during the last year I have learned a LOT from reading, watching and looking towards the Rails community. Those guys are way ahead of us (in the .NET community) and we can learn much by “stealing” from them.

In this particular case I read a series of post by [Jeff Morgan](http://twitter.com/chzy) and his blog [http://www.cheezyworld.com/](http://www.cheezyworld.com/). Here are the posts:

- [UI Tests – How do we keep them from being brittle?](http://www.cheezyworld.com/2010/11/09/ui-tests-not-brittle/)
- [UI Tests – Part Two](http://www.cheezyworld.com/2010/11/13/ui-tests-part-two/)
- [UI Tests – Introducing a simple DSL](http://www.cheezyworld.com/2010/11/19/ui-tests-introducing-a-simple-dsl/)
- [UI Tests – Default Data](http://www.cheezyworld.com/2010/11/21/ui-tests-default-dat/)
- [UI Tests – putting it all together](http://www.cheezyworld.com/2010/12/16/ui-tests-putting-it-all-together/)

They are all excellent – I recommend that you read them. I’ll be here waiting. To tell you how to I have started to implement this in .NET

### Page Object pattern

The basis for the implementation is the [page object pattern](http://code.google.com/p/selenium/wiki/PageObjects), which basically can be thought of as a wrapper for the data and functionality that the page (or screen if you doing a desktop application) exposes. This give the developer using the page a nice API to access the data of the page and invoke actions on it without having to known about the details on how the browser automation is handled.

### Benefits

It might seem simple but in implementing this you gain some great benefits, I think. Here are a couple of this that I have noticed while using this approach.

#### Hidden complexity

The complexity in how to talk to the application (web browser, desktop application) is hidden from the person writing the step definitions.

Say that you have an application handling activities for contractors. To check if an activity with a certain heading is present on a list, for example, could be done with this simple step definition:

![step defintion](http://lh6.ggpht.com/_TI0jeIedRFk/TZ1Im7jduEI/AAAAAAAAA9U/L1rx7v20vnc/step%20defintion_thumb.jpg?imgmax=800)

Which can be accomplished by a page object that exposes the following property that implement the functionality to get all values from a certain column in a table:

![getting all values from a certain column](http://lh6.ggpht.com/_TI0jeIedRFk/TZ1In3OxEHI/AAAAAAAAA9c/yyJSThVh1m8/getting%20all%20values%20from%20a%20certain%20column_thumb.jpg?imgmax=800)

Or to take another example, setting data in a form (i.e. filling out forms). You can simple exposes properties for each value that you want to fill out from your specification like this (yes I only have setters right now, because my specifications have not have had need for anything else... yet... ![Winking smile](http://lh4.ggpht.com/_TI0jeIedRFk/TZ1IoFmOtuI/AAAAAAAAA9g/rKNfFAwh4AQ/wlEmoticon-winkingsmile%5B2%5D.png?imgmax=800)):

![properties for field on form](http://lh6.ggpht.com/_TI0jeIedRFk/TZ1Ioz-hUrI/AAAAAAAAA9o/dx9SVqiTH3M/properties%20for%20field%20on%20form_thumb.jpg?imgmax=800)

and this is used by the following simple step definition:

![filling out form](http://lh3.ggpht.com/_TI0jeIedRFk/TZ1IpvQHUaI/AAAAAAAAA9w/yUhywu0O5K0/filling%20out%20form_thumb.jpg?imgmax=800)

#### Default data

A continuation from the above set stage is the ability to use default data. I have simply exposed a method that fill out the form with default data, like this:

![set deafult data](http://lh6.ggpht.com/_TI0jeIedRFk/TZ1IqlH2YeI/AAAAAAAAA94/urqPnlzc7B4/set%20deafult%20data_thumb.jpg?imgmax=800)

This is great because now I don’t have to repeat all the default information when my scenario just is managing one field. So for example, if I want to specify how required fields should be handled, I can write the following scenario:

![scenario for required fields](http://lh5.ggpht.com/_TI0jeIedRFk/TZ1IsOiD41I/AAAAAAAAA-A/ilZtTMq717I/scenario%20for%20required%20fields_thumb.jpg?imgmax=800)

with this step definition:

![required fields step defintion](http://lh5.ggpht.com/_TI0jeIedRFk/TZ1Isu1R9BI/AAAAAAAAA-I/EjEqPblRllc/required%20fields%20step%20defintion_thumb.jpg?imgmax=800)

So I only have to worry about the field in question per scenario. This form was quite small but you can imagine how this can be of great use when you have to fill out several bigger forms in sequence to get to the point you want to test.

Also the specification is less verbose and only have to state the fields that you care about for this scenario.

#### Base class

Pretty soon you can see that much behavior is common for all pages. And being an OO-programmer you’ll see a base class emerge. I encourage you to let it emerge after your needs and not try to invent the whole thing at once. But pushing down behavior into a base class can greatly reduce the code and complexity for each page object.

Here for example is all that need to be written for a typical listing screen in my application (listing customers):

![customers page object](http://lh3.ggpht.com/_TI0jeIedRFk/TZ1ItmP3sCI/AAAAAAAAA-Q/h3KSN901cLA/customers%20page%20object_thumb.jpg?imgmax=800)

Using my base class correctly this class just contains stuff that has to do with this specific page:

- It sets the relative address in the constructor (“/Customers”)
- It knows about specific columns in a table on the page
- You can get the data of the page (customer names) in appropriate format, and that implementation is simplified by the use of an method in the base class (TableCellsById)
- The actions of the page is represented as methods GotoNewCustomer is

My base class, as it looks now, can [be found here](https://github.com/marcusoftnet/HairAndSoleless/blob/master/Specs.EndToEnd/Steps/PageObjects/PageObjectBase.cs).

#### Structure of your test code

Using page objects you also get an simplified “architecture” for your test code. It’s easy to know where to place functionality for step definitions, browser interactions etc. Three layers emerge:

1. The scenarios the text and the generated code from them. They serve the purpose of communicating with the different team member what the feature should be able to do. A bit like a View if you like
2. The step definitions ties the code with the current implementation. It should only know about the Page Object and dispatch calls to them. We don’t want much code here – just enough to control the flow of the test. A bit like a controller.
3. The page object contains the nitty gritty details in how you automate the browser to read values from the page, fill out a form and submit it. The work of a model, in my opinion.

So in a way you can structure your code in MVC fashion, which I find very helpful. And before the bashing begins – this is of course not MVC pattern in full. Nothing is handed back to the view (or specification) but the structure the other way (sending stuff in) is a *bit* like MVC. I think.

**[UPDATED]**

Actually, when I think a bit more about it the MVC concepts lend themselves perfectly for another thing in this context. You know, one good thing, to strive for, when writing a MVC application you want your [Controller thin and your model fat](http://www.youtube.com/watch?v=91C7ax0UAAc).

And that holds in out example as well; keep your step definitions thin and your page object fat. That is; write page objects that contain all the complexity to enable your step definitions to just do simple things, redirecting all complex stuff into the page objects.

Your step definition (or controller) should just dispatch or control (duh!) the flow of the step. Like this for example:

![required fields step defintion](http://lh5.ggpht.com/_TI0jeIedRFk/TaMQsqsv0cI/AAAAAAAAA-s/Pt9p2BxGojg/required%20fields%20step%20defintion_thumb.jpg?imgmax=800)]
or this:

![step defintion](http://lh6.ggpht.com/_TI0jeIedRFk/TaMQthHQ0TI/AAAAAAAAA-0/MXWwWAJ0ztg/step%20defintion_thumb.jpg?imgmax=800)]

#### Step definition structure and reuse

I try to keep step definitions surrounding a logical thing in the same file, often it’s a page but not always. So I might have a [CustomerSteps](https://github.com/marcusoftnet/HairAndSoleless/blob/master/Specs.EndToEnd/Steps/CustomerSteps.cs) class or a [CreateCustomerPageSteps](https://github.com/marcusoftnet/HairAndSoleless/blob/master/Specs.EndToEnd/Steps/CreateCustomerPageSteps.cs) class if there are special steps on the Create Customer page. But there are also classes for [steps for manipulating the database](https://github.com/marcusoftnet/HairAndSoleless/blob/master/Specs.EndToEnd/Steps/DBSteps.cs) and other generic stuff.

That could become a lot of classes for steps files, but with the latest features of [SpecFlow](http://www.specflow.org) 1.6 (Go to definition on a scenario step) navigating them is a breeze.

### Conclusion

Using the Page Object my test code has cleaned up significantly and I have gained a lot of insight in how to better structure my code. I recommend using it in any project that automate a GUI. It’s not only useful for web pages, of course, but work equally good with desktop applications.

The code for this post is found in [this project](https://github.com/marcusoftnet/HairAndSoleless) which was supposed to be about something completely different ![Smile](http://lh5.ggpht.com/_TI0jeIedRFk/TZ1IuDU7UiI/AAAAAAAAA-U/DGl1xxbyRkc/wlEmoticon-smile%5B2%5D.png?imgmax=800).

Finally, since I just found it, I think that if you had something like the [Mara project](https://github.com/remi/Mara), it would replace about 90 % of my code here. So then I gladly update my code for that.
