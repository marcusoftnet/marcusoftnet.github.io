---
layout: post
title: NUnit testing asynchronous events
date: 2006-10-25T10:14:00.000Z
author: Marcus Hammarberg
tags:
  - Tools
  - .NET
modified_time: 2010-12-14T15:22:38.409Z
blogger_id: tag:blogger.com,1999:blog-36533086.post-2786272295120950128
blogger_orig_url: https://www.marcusoft.net/2006/10/nunit-testing-asynchronous-events.html
---

In my current project we are using a some asynchronous web service method calls. The actual call are in turn encapsulated in a layer that is used by the GUI, the "ClientCommand"-layer.

However when writing tests for these method we ran into trouble....  First the NUnit-framework is not very good at handling events at all, but by using this excellent [article](http://www.peterprovost.org/archive/2005/05/29/3497.aspx) by Peter Provost I got a nice, compact way of doing the tests.

Then it was the whole asynchronous thing, which really was hard to get by. The solution given above worked out fine as long as not any assertions went threw exceptions - but what is the use of that?

So the simple solution to the problem was to simply wait for the event to fire and be handled. This was solved by setting a bool variable (`bEventHandled`) and not continue with the assertions until that bool was true.

The event handling delegate sets the method variables to the return values from the event and finally switch the `EventHandled` - to true so that the assertions can be run.

Here's the code for an example:

```c#
[Test(Description = "Demo Async call")]
public void DemoAsyncTest(){
  // Create the variables to hold result
  EpasAsyncUserStateArgs argsActual = null;
  DataSet dsActual = null;
  bool bEventHandled = false;

  // Create the object to test
  ClaimsReportClientCommand c = new ClaimsReportClientCommand();

  // Subscribe to the event with a delegate
  c.LoadClaimInfoCompleted += delegate(EpasAsyncUserStateArgs args, DataSet dsResult){

  // Set the method variable
  // This can be done because of the anonymous delegate
  argsActual = args;
  dsActual = dsResult;

  // set the event handle
  dbEventHandled = true;};

  // Do call that generates the event
  c.LoadClaimInfoById(CLAIMREPORT_ID_EXISTING, "se");

  // Wait until the event is handled
  while (!bEventHandled){System.Threading.Thread.Sleep(50);}

  // Result received - do assertions (whatever...)
  Assert.IsNotNull(argsActual);
  Assert.IsNotNull(dsActual);
}
```

So, as you can see, most of it is a complete rip of from Peters article. The delegate-stuff is the key for this to work. If the event handler is a standard event handler it cannot set the variables in the method for the later assertions. Also the whole test code is in one method which also is good.

I realize that it probably could be another, better and slicker way of testing asynchronous web service methods, but I haven't found it. After quite a while of googling I must add. If you know one, please let me know too :-)
