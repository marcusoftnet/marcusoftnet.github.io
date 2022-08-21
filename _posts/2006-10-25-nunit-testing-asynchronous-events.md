---
layout: post
title: NUnit testing asynchronous events
date: '2006-10-25T12:14:00.000+02:00'
author: Marcus Hammarberg
tags:
  - Tools
  - .NET
modified_time: '2010-12-14T16:22:38.409+01:00'
blogger_id: tag:blogger.com,1999:blog-36533086.post-2786272295120950128
blogger_orig_url: http://www.marcusoft.net/2006/10/nunit-testing-asynchronous-events.html
---

In my current project we are using a some asynchronous <span
id="SPELLING_ERROR_0" class="blsp-spelling-error"
onclick="BLOG_clickHandler(this)">webservice</span> method calls. The
actual call are in turn encapsulated in a layer that is used by the GUI,
the "<span id="SPELLING_ERROR_1" class="blsp-spelling-error"
onclick="BLOG_clickHandler(this)">ClientCommand</span>"-layer.

However when writing tests for these method we ran into <span
id="SPELLING_ERROR_2" class="blsp-spelling-corrected">trouble</span>....
First the <span id="SPELLING_ERROR_3" class="blsp-spelling-error"
onclick="BLOG_clickHandler(this)">NUnit</span>-framework is not very
good at handling events at all, but by using this excellent
[article](http://www.peterprovost.org/archive/2005/05/29/3497.aspx) by
Peter Provost i got a nice, compact way of doing the tests.

Then it was the whole asynchronous thing, which really was hard to get
by. The solution given above worked out fine as long as not any
assertions went threw exceptions - but what is the use of that?

So the simple solution to the problem was to simply wait for the event
to fire and be handled. This was solved by setting a <span
id="SPELLING_ERROR_4" class="blsp-spelling-error"
onclick="BLOG_clickHandler(this)">bool</span> variable (<span
id="SPELLING_ERROR_5" class="blsp-spelling-error"
onclick="BLOG_clickHandler(this)">bEventHandled</span>) and not continue
with the assertions until that <span>="blsp-spelling-error"
onclick="BLOG_clickHandler(this)">bool</span> was true.

The event handling delegate sets the method variables to the return
values from the event and finally switch the <span>="blsp-spelling-error"
onclick="BLOG_clickHandler(this)">EventHandled</span>-<span
id="SPELLING_ERROR_8" class="blsp-spelling-error"
onclick="BLOG_clickHandler(this)">bool</span> to true so that the
assertions can be run.

Here's the code for a
example:`[Test(Description = "Demo Async call")]public void DemoAsyncTest(){// Create the variables to hold resultEpasAsyncUserStateArgs argsActual = null;DataSet dsActual = null;bool bEventHandled = false;// Create the object to testClaimsReportClientCommand c = new ClaimsReportClientCommand();// Subscribe to the event with a delegatec.LoadClaimInfoCompleted += delegate(EpasAsyncUserStateArgs args, DataSet dsResult){// Set the method variable`
`// This can be done because of the a``nonymous delegateargsActual = args;dsActual = dsResult;// set the event handledbEventHandled = true;};// Do call that generates the eventc.LoadClaimInfoById(CLAIMREPORT_ID_EXSTING, "se");// Wait until the event is handledwhile (!bEventHandled){System.Threading.Thread.Sleep(50);}// Result recived - do assertions (whatever...)Assert.IsNotNull(argsActual);Assert.IsNotNull(dsActual);}`So,
as you can see, most of it is a complete rip of from Peters article. The
delegate-stuff is the key for this to work. If the <span
id="SPELLING_ERROR_40" class="blsp-spelling-error"
onclick="BLOG_clickHandler(this)">eventhandler</span> is a standard
<span id="SPELLING_ERROR_41" class="blsp-spelling-error"
onclick="BLOG_clickHandler(this)">eventhandler</span> it cannot set the
variables in the method for the later assertions. Also the whole <span
id="SPELLING_ERROR_42" class="blsp-spelling-error"
onclick="BLOG_clickHandler(this)">testcode</span> is in one method which
also is good.

I realise that it probably could be another, better and slicker way of
testing asynchronous <span id="SPELLING_ERROR_43"
class="blsp-spelling-error"
onclick="BLOG_clickHandler(this)">webservice</span> methods, but I
haven't found it. After quite a while of googling i must add. If you
know one, please let me know too :-)
