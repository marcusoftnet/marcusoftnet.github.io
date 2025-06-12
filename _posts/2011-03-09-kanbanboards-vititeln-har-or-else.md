---
layout: post
title: KanbanBoards VI–OpenId Integration
date: 2011-03-08T19:03:00.000Z
author: Marcus Hammarberg
tags:
  - BDD
  - Tools
  - .NET
  - ASP.NET MVC
  - Kanban-boards project
modified_time: 2011-03-08T19:03:13.839Z
blogger_id: tag:blogger.com,1999:blog-36533086.post-1325740255107798275
blogger_orig_url: https://www.marcusoft.net/2011/02/kanbanboards-vititeln-har-or-else.html
---

It’s been a while since I did any work on the [KanbanBoards](https://www.marcusoft.net/search/label/KanbanBoards) project, but now I got around to add some more features. I planning on doing some acceptance tests for creating new boards. The controller functionality was spec'd out in then [last installment of the series](https://www.marcusoft.net/2011/02/kanbanboards-vcreating-new-boards.html).

To do that properly I need to touch on two main areas of functionality:

- Authentication – here I plan to use OpenID and see if I can plug-in some functionality that already exists.
- Uploading pictures – just for fun I will try to store the pictures in the database and see how that sits. I can already here give away the fact that I didn’t do this today.

And finally show that the whole thing works using an acceptance test that verifies the functionality end-to-end.

Let’s go.

### Feedback and updates

I got some great feedback from some people, foremost [Darren Cauthon](http://www.cauthon.com), that I’ve already implemented. That cleaned up my code a lot. Sadly I also messed up a lot when I tried to merge the code into my master. But after some manual hacking I think I’m back on track.

Darren showed two things that I haven’t thought of earlier:

- A new feature (upcoming in [SpecFlow](http://www.specflow.org)) is that you can store a factory method inside the ScenarioContext.Current. That method is executed when you Get the value out of the Current dictionary. That cleaned up a lot of stuff.
- A thing that I haven’t really thought of is that you can use attributes, such as BeforeScenario on more than one place. If you organize your steps in different logical blocks (for the controller, for the different repositories etc.) you can then have the setup for each under the BeforeScenario-step and get a nice clean structure.

Thanks Darren – I learn a lot from you. Hope I can pay you back some day.

### OpenID

To the business of the day. I want to log into the site somehow, but thought of storing users and passwords in my database doesn’t sit right nowadays. There’s [OpenID](http://openid.net/get-an-openid/what-is-openid/) for things like that. I simply want to plug that into my application.

So I did what we *used* to do; I started to browse the net and before long if found [OpenId Portable Area](http://openidportablearea.codeplex.com) which looks great. Right - so it looks like it depends on [MvcContrib](http://mvccontrib.codeplex.com/) and something called [DotNetAuth](http://www.dotnetopenauth.net/). All I need to do now is to find the right versions of that and put them in my lib folder and then find some example code and ... BAM! Not anymore, my good friend [NuGet](http://nuget.codeplex.com/) will do all that for you with the simple command:

```text
Install-Package OpenIdPortableArea
```

Haha – it even gives me intellisense support for the name of the package. Ok – I’m officially impressed! NuGet is something every .net developer need to know. Full stop!

And while I wrote that NuGet did this:

```text
Install-Package OpenIdPortableArea
'MvcContrib' not installed. Attempting to retrieve dependency from source...
Done.
'MicrosoftWebMvc (≥ 2.0)' not installed. Attempting to retrieve dependency from source...
Done.
'Mvc2Futures (≥ 2.0.50217.0)' not installed. Attempting to retrieve dependency from source...
Done.
'DotNetOpenAuth' not installed. Attempting to retrieve dependency from source...
Done.
Successfully installed 'Mvc2Futures 2.0.50217.0'.
Successfully installed 'MicrosoftWebMvc 2.0'.
Successfully installed 'MvcContrib 2.0.95.0'.
Successfully installed 'DotNetOpenAuth 3.4.6.10357'.
Successfully installed 'OpenIdPortableArea 1.0.0.3'.
Successfully added 'Mvc2Futures 2.0.50217.0' to Web.
Successfully added 'MicrosoftWebMvc 2.0' to Web.
Successfully added 'MvcContrib 2.0.95.0' to Web.
Successfully added 'DotNetOpenAuth 3.4.6.10357' to Web.
Successfully added 'OpenIdPortableArea 1.0.0.3' to Web.
```

Lala – now I just need to wire it up. Btw – a portable area is views, controllers and model bundled up into a portable component or .dll.

From the [OpenIdPortableArea documentation](http://openidportablearea.codeplex.com/documentation) I get some help to wire it up. Let’s see:

- Need to AreaRegistration.RegisterAllAreas() in Global.asax. That’s done already in MVC3 applications.
- Use the Authorize-attribute for the controller actions I want the user to be authenticated to run. In my case, so far, it’s the Create-action.
- And then I need to point the forms authentication in the web.config to the controller action “~/OpenId” which is supplied by the portable area.
- OpenIdPortableArea uses a [message bus supplied by MvcContrib](http://www.code-magazine.com/article.aspx?quickid=1003111&amp;page=4) to communicate with OpenID. So I need to use that, which is done with this simple row in Application_Start in Global.asax:

```text
MvcContrib.Bus.AddAllMessageHandlers();
```

That last part means that I can handle messages that the MvcContrib bus sends out. For example the ClaimsRequestMessage. So I created a PortableAreaHandlers-folder and popped the following (shamelessly stolen) code in there (moved to separate files after you read this):

![openid message handlers](/img/openid%2520message%2520handlers_thumb.jpg)

In the top part I set up the things I require that the user supplies (name and email) and down below is the code that gets called when the user is authenticated.

Finally I changed the implementation of my logon-partial view by (again) stealing a partial that OpenIdPortableArea supplies. Like this:

![openIdPortableArea login widget](/img/openidportablearea%2520loginwidget_thumb.jpg)

To get this to work you need to add the OpenIdPortableArea into the `<namespaces>` section of the Web.Config in the Views-folder. That’s just to let your views to know that OpenIdPortableArea is something that they can use.

All of this was stolen from the [excellent screencast](http://www.userinexperience.com/post/Mvc-Screencast-4-MvcContrib.aspx) of [Brandon Satrom](http://stackoverflow.com/users/380135/brandon-satrom) on MvcContrib.

### Problems

But just as I thought this was going to be a breeze I ran into problems. The version of OpenIdPortableArea I used (1.0.0.3) only supported WebForms (aspx) views. And I used Razor.

### OSS and social media to the fore

What then happened was a powerful testament to the powers of Twitter and the OSS-community. I am just humbled by this community. The willingness to share and help each other is just amazing. I haven’t once been put down or frowned on by any of the (sometimes very famous) people I’ve asked for help.

Here how it happened;

- I contacted ([Brandon Satrom](http://twitter.com/brandonsatrom)) and asked if he had had the same problem when he did his screen casts.
- He experienced the same thing when he used Razor views.
- So I contacted ([John Nelson](http://twitter.com/johncoder)) who created the OpenID Portable Area in the first place.
- Aware of the problems he was just about to release a new version of the OpenId Portable Area.
- Two days later it was on [NuGet.org](http://nuget.org/) and it contained support for Razor.

### Conclusion

I hope this post will help you with implementing OpenID in your own projects. It was a fun adventure with some small bumps along the road, but that’s how it is when you are trying out new things.

I hope it also shows how amazing the OSS-community is and that it is actually worth getting involved with that world.

I’ll keep you updated with more adventures in KanbanBoards.

Happy coding!
