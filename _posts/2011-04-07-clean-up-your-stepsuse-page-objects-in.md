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
thumbnail: >-
  http://lh6.ggpht.com/\_TI0jeIedRFk/TZ1Im7jduEI/AAAAAAAAA9U/L1rx7v20vnc/s72-c/step%20defintion_thumb.jpg?imgmax=800
blogger_id: tag:blogger.com,1999:blog-36533086.post-2188015318186471315
blogger_orig_url: http://www.marcusoft.net/2011/04/clean-up-your-stepsuse-page-objects-in.html
---


If you are a developer doing
<a href="http://en.wikipedia.org/wiki/Behavior_Driven_Development"
target="_blank">BDD</a>, as me, you’ll soon run into the joys of UI
automation. The BDD community to day seems to lean towards running your
specifications/test end-to-end in order to capture the whole stack of
the application as well as getting great regression tests.

But tests against the GUI can be brittle, that part of the application
is the one that most often is changed, in my experience. So writing
automated stuff (in essence programs) against a changing environment is
not very pleasant as you might well know.

This is post is about using the Page Object pattern that can help you
handle this brittleness as well as structuring your test code in a nice,
maintainable way. That in turn will help us to place code in the right
place – which I like. Some guidelines, if you like.

### Inspiration

I have of course not invented this by myself, but rather been inspired
by thoughts from the Ruby on Rails community. Actually (as a side note),
during the last year I have learned a LOT from reading, watching and
looking towards the Rails community. Those guys are way ahead of us (in
the .NET community) and we can learn much by “stealing” from them.

In this particular case I read a series of post by
<a href="http://twitter.com/chzy" target="_blank">Jeff Morgan</a> and
his blog <http://www.cheezyworld.com/>. Here are the posts:

- <a href="http://www.cheezyworld.com/2010/11/09/ui-tests-not-brittle/"
    target="_blank">UI Tests – How do we keep them from being brittle?</a>
- <a href="http://www.cheezyworld.com/2010/11/13/ui-tests-part-two/"
    target="_blank">UI Tests – Part Two</a>
- <a
    href="http://www.cheezyworld.com/2010/11/19/ui-tests-introducing-a-simple-dsl/"
    target="_blank">UI Tests – Introducing a simple DSL</a>
- <a href="http://www.cheezyworld.com/2010/11/21/ui-tests-default-dat/"
    target="_blank">UI Tests – Default Data</a>
- <a
    href="http://www.cheezyworld.com/2010/12/16/ui-tests-putting-it-all-together/"
    target="_blank">UI Tests – putting it all together</a>

They are all excellent – I recommend that you read them. I’ll be here
waiting. To tell you how to I have started to implement this in .NET

### Page Object pattern

The basis for the implementation is the
<a href="http://code.google.com/p/selenium/wiki/PageObjects"
target="_blank">page object pattern</a>, which basically can be thought
of as a wrapper for the data and functionality that the page (or screen
if you doing a desktop application) exposes. This give the developer
using the page a nice API to access the data of the page and invoke
actions on it without having to known about the details on how the
browser automation is handled.

### Benefits

It might seem simple but in implementing this you gain some great
benefits, I think. Here are a couple of this that I have noticed while
using this approach.

#### Hidden complexity

The complexity in how to talk to the application (web browser, desktop
application) is hidden from the person writing the step definitions.

Say that you have an application handling activities for contractors. To
check if an activity with a certain heading is present on a list, for
example, could be done with this simple step definition:

[<img
src="http://lh6.ggpht.com/_TI0jeIedRFk/TZ1Im7jduEI/AAAAAAAAA9U/L1rx7v20vnc/step%20defintion_thumb.jpg?imgmax=800"
title="step defintion"
style="background-image: none; border-right-width: 0px; margin: 0px auto; padding-left: 0px; padding-right: 0px; display: block; float: none; border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; padding-top: 0px"
data-border="0" width="420" height="81" alt="step defintion" />](http://lh5.ggpht.com/_TI0jeIedRFk/TZ1ImuN1cjI/AAAAAAAAA9Q/TgjpO34Z_0Q/s1600-h/step%20defintion%5B2%5D.jpg)

Which can be accomplished by a page object that exposes the following
property that implement the functionality to get all values from a
certain column in a table:

[<img
src="http://lh6.ggpht.com/_TI0jeIedRFk/TZ1In3OxEHI/AAAAAAAAA9c/yyJSThVh1m8/getting%20all%20values%20from%20a%20certain%20column_thumb.jpg?imgmax=800"
title="getting all values from a certain column"
style="background-image: none; border-right-width: 0px; margin: 0px auto; padding-left: 0px; padding-right: 0px; display: block; float: none; border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; padding-top: 0px"
data-border="0" width="420" height="167"
alt="getting all values from a certain column" />](http://lh5.ggpht.com/_TI0jeIedRFk/TZ1InfcyghI/AAAAAAAAA9Y/p3hMvoQPqgQ/s1600-h/getting%20all%20values%20from%20a%20certain%20column%5B2%5D.jpg)

Or to take another example, setting data in a form (i.e. filling out
forms). You can simple exposes properties for each value that you want
to fill out from your specification like this (yes I only have setters
right now, because my specifications have not have had need for anything
else... yet... <img
src="http://lh4.ggpht.com/_TI0jeIedRFk/TZ1IoFmOtuI/AAAAAAAAA9g/rKNfFAwh4AQ/wlEmoticon-winkingsmile%5B2%5D.png?imgmax=800"
class="wlEmoticon wlEmoticon-winkingsmile"
style="border-bottom-style: none; border-right-style: none; border-top-style: none; border-left-style: none"
alt="Winking smile" />):

[<img
src="http://lh6.ggpht.com/_TI0jeIedRFk/TZ1Ioz-hUrI/AAAAAAAAA9o/dx9SVqiTH3M/properties%20for%20field%20on%20form_thumb.jpg?imgmax=800"
title="properties for field on form"
style="background-image: none; border-right-width: 0px; margin: 0px auto; padding-left: 0px; padding-right: 0px; display: block; float: none; border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; padding-top: 0px"
data-border="0" width="420" height="286"
alt="properties for field on form" />](http://lh5.ggpht.com/_TI0jeIedRFk/TZ1IoqZ5BCI/AAAAAAAAA9k/H2Vvu_Boz3A/s1600-h/properties%20for%20field%20on%20form%5B2%5D.jpg)

and this is used by the following simple step definition:

[<img
src="http://lh3.ggpht.com/_TI0jeIedRFk/TZ1IpvQHUaI/AAAAAAAAA9w/yUhywu0O5K0/filling%20out%20form_thumb.jpg?imgmax=800"
title="filling out form"
style="background-image: none; border-right-width: 0px; margin: 0px auto; padding-left: 0px; padding-right: 0px; display: block; float: none; border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; padding-top: 0px"
data-border="0" width="420" height="228" alt="filling out form" />](http://lh5.ggpht.com/_TI0jeIedRFk/TZ1IpXlGz1I/AAAAAAAAA9s/bkOcgOj3VPk/s1600-h/filling%20out%20form%5B2%5D.jpg)

#### Default data

A continuation from the above set stage is the ability to use default
data. I have simply exposed a method that fill out the form with default
data, like this:

[<img
src="http://lh6.ggpht.com/_TI0jeIedRFk/TZ1IqlH2YeI/AAAAAAAAA94/urqPnlzc7B4/set%20deafult%20data_thumb.jpg?imgmax=800"
title="set deafult data"
style="background-image: none; border-right-width: 0px; margin: 0px auto; padding-left: 0px; padding-right: 0px; display: block; float: none; border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; padding-top: 0px"
data-border="0" width="420" height="199" alt="set deafult data" />](http://lh4.ggpht.com/_TI0jeIedRFk/TZ1IqEoq9qI/AAAAAAAAA90/0p00eeftVg8/s1600-h/set%20deafult%20data%5B2%5D.jpg)

This is great because now I don’t have to repeat all the default
information when my scenario just is managing one field. So for example,
if I want to specify how required fields should be handled, I can write
the following scenario:

[<img
src="http://lh5.ggpht.com/_TI0jeIedRFk/TZ1IsOiD41I/AAAAAAAAA-A/ilZtTMq717I/scenario%20for%20required%20fields_thumb.jpg?imgmax=800"
title="scenario for required fields"
style="background-image: none; border-right-width: 0px; margin: 0px auto; padding-left: 0px; padding-right: 0px; display: block; float: none; border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; padding-top: 0px"
data-border="0" width="420" height="151"
alt="scenario for required fields" />](http://lh6.ggpht.com/_TI0jeIedRFk/TZ1IrcDL3rI/AAAAAAAAA98/0DkCSomtReI/s1600-h/scenario%20for%20required%20fields%5B2%5D.jpg)

with this step definition:

[<img
src="http://lh5.ggpht.com/_TI0jeIedRFk/TZ1Isu1R9BI/AAAAAAAAA-I/EjEqPblRllc/required%20fields%20step%20defintion_thumb.jpg?imgmax=800"
title="required fields step defintion"
style="background-image: none; border-right-width: 0px; margin: 0px auto; padding-left: 0px; padding-right: 0px; display: block; float: none; border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; padding-top: 0px"
data-border="0" width="420" height="126"
alt="required fields step defintion" />](http://lh4.ggpht.com/_TI0jeIedRFk/TZ1IsWOReOI/AAAAAAAAA-E/Q2vPEcA4XPs/s1600-h/required%20fields%20step%20defintion%5B2%5D.jpg)

So I only have to worry about the field in question per scenario. This
form was quite small but you can imagine how this can be of great use
when you have to fill out several bigger forms in sequence to get to the
point you want to test.

Also the specification is less verbose and only have to state the fields
that you care about for this scenario.

#### Base class

Pretty soon you can see that much behavior is common for all pages. And
being an OO-programmer you’ll see a base class emerge. I encourage you
to let it emerge after your needs and not try to invent the whole thing
at once. But pushing down behavior into a base class can greatly reduce
the code and complexity for each page object.

Here for example is all that need to be written for a typical listing
screen in my application (listing customers):

[<img
src="http://lh3.ggpht.com/_TI0jeIedRFk/TZ1ItmP3sCI/AAAAAAAAA-Q/h3KSN901cLA/customers%20page%20object_thumb.jpg?imgmax=800"
title="customers page object"
style="background-image: none; border-right-width: 0px; margin: 0px auto; padding-left: 0px; padding-right: 0px; display: block; float: none; border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; padding-top: 0px"
data-border="0" width="420" height="245" alt="customers page object" />](http://lh4.ggpht.com/_TI0jeIedRFk/TZ1ItCju-DI/AAAAAAAAA-M/AcYbC3oqq8k/s1600-h/customers%20page%20object%5B2%5D.jpg)

Using my base class correctly this class just contains stuff that has to
do with this specific page:

- <div align="left">

   It sets the relative address in the constructor (“/Customers”)
   </div>

- <div align="left">

   It knows about specific columns in a table on the page
   </div>

- <div align="left">

   You can get the data of the page (customer names) in appropriate
    format, and that implementation is simplified by the use of an
    method in the base class (TableCellsById)
   </div>

- <div align="left">

   The actions of the page is represented as methods GotoNewCustomer is

    </div>

My base class, as it looks now, can <a
href="https://github.com/marcusoftnet/HairAndSoleless/blob/master/Specs.EndToEnd/Steps/PageObjects/PageObjectBase.cs"
target="_blank">be found here.</a>

#### Structure of your test code

Using page objects you also get an simplified “architecture” for your
test code. It’s easy to know where to place functionality for step
definitions, browser interactions etc. Three layers emerge:

1. <div align="left">

   The scenarios the text and the generated code from them. They serve
    the purpose of communicating with the different team member what the
    feature should be able to do.
    A bit like a View if you like
   </div>

2. <div align="left">

   The step definitions ties the code with the current implementation.
    It should only know about the Page Object and dispatch calls to
    them. We don’t want much code here – just enough to control the flow
    of the test.
    A bit like a controller.
   </div>

3. <div align="left">

   The page object contains the nitty gritty details in how you
    automate the browser to read values from the page, fill out a form
    and submit it.
    The work of a model, in my opinion.
   </div>

So in a way you can structure your code in MVC fashion, which I find
very helpful. And before the bashing begins – this is of course not MVC
pattern in full. Nothing is handed back to the view (or specification)
but the structure the other way (sending stuff in) is a *bit* like
MVC. I think.

**\[UPDATED\]**

Actually, when I  think a bit more about it the MVC concepts lend
themselves perfectly for another thing in this context. You know, one
good thing, to strive for,  when writing a MVC application you want your
<a href="http://www.youtube.com/watch?v=91C7ax0UAAc"
target="_blank">Controller thin and your model fat</a>.

And that holds in out example as well; keep your step definitions thin
and your page object fat.That is; write page objects that contain all
the complexity to enable your step definitions to just do simple things,
redirecting all complex stuff into the page objects.

Your step definition (or controller) should just dispatch or control
(duh!) the flow of the step. Like this for example:

[<img
src="http://lh5.ggpht.com/_TI0jeIedRFk/TaMQsqsv0cI/AAAAAAAAA-s/Pt9p2BxGojg/required%20fields%20step%20defintion_thumb.jpg?imgmax=800"
title="required fields step defintion"
style="background-image: none; border-bottom: 0px; border-left: 0px; margin: 0px auto; padding-left: 0px; padding-right: 0px; display: block; float: none; border-top: 0px; border-right: 0px; padding-top: 0px"
data-border="0" width="420" height="126"
alt="required fields step defintion" />](http://lh4.ggpht.com/_TI0jeIedRFk/TaMQr-4VZ5I/AAAAAAAAA-o/P9ibJUdnPIM/s1600-h/required%20fields%20step%20defintion%5B3%5D.jpg)

or this:

[<img
src="http://lh6.ggpht.com/_TI0jeIedRFk/TaMQthHQ0TI/AAAAAAAAA-0/MXWwWAJ0ztg/step%20defintion_thumb.jpg?imgmax=800"
title="step defintion"
style="background-image: none; border-bottom: 0px; border-left: 0px; margin: 0px auto; padding-left: 0px; padding-right: 0px; display: block; float: none; border-top: 0px; border-right: 0px; padding-top: 0px"
data-border="0" width="420" height="81" alt="step defintion" />](http://lh5.ggpht.com/_TI0jeIedRFk/TaMQtK_hQjI/AAAAAAAAA-w/4Imz7hOBCzQ/s1600-h/step%20defintion%5B3%5D.jpg)

#### Step definition structure and reuse

I try to keep step definitions surrounding a logical thing in the same
file, often it’s a page but not always. So I might have a <a
href="https://github.com/marcusoftnet/HairAndSoleless/blob/master/Specs.EndToEnd/Steps/CustomerSteps.cs"
target="_blank">CustomerSteps</a> class or a <a
href="https://github.com/marcusoftnet/HairAndSoleless/blob/master/Specs.EndToEnd/Steps/CreateCustomerSteps.cs"
target="_blank">CreateCustomerPageSteps</a> class if there are special
steps on the Create Customer page. But there are also classes for <a
href="https://github.com/marcusoftnet/HairAndSoleless/blob/master/Specs.EndToEnd/Steps/DBSteps.cs"
target="_blank">steps for manipulating the database</a> and other
generic stuff

That could become a lot of classes for steps files, but with the latest
features of
<a href="http://www.specflow.org" target="_blank">SpecFlow</a> 1.6 (Go
to definition on a scenario step) navigating them is a breeze.

### Conclusion

Using the Page Object my test code has cleaned up significantly and I
have gained a lot of insight in how to better structure my code. I
recommend using it in any project that automate a GUI. It’s not only
useful for web pages, of course, but work equally good with desktop
applications.

The code for this post is found in
<a href="https://github.com/marcusoftnet/HairAndSoleless"
target="_blank">this project</a> which was supposed to be about
something completely different <img
src="http://lh5.ggpht.com/_TI0jeIedRFk/TZ1IuDU7UiI/AAAAAAAAA-U/DGl1xxbyRkc/wlEmoticon-smile%5B2%5D.png?imgmax=800"
class="wlEmoticon wlEmoticon-smile"
style="border-bottom-style: none; border-right-style: none; border-top-style: none; border-left-style: none"
alt="Smile" />.

Finally, since I just found it, I think that if you had something like
the
<a href="https://github.com/remi/Mara" target="_blank">Mara project</a>,
it would replace about 90 % of my code here. So then I gladly update my
code for that.
