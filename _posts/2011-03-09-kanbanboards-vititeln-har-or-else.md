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
  - KanbanBoards
modified_time: 2011-03-08T19:03:13.839Z
thumbnail: http://lh5.ggpht.com/\_TI0jeIedRFk/TWfHO5e-0HI/AAAAAAAAA6I/mmMSFVaF2Y8/s72-c/openid%20message%20handlers_thumb.jpg?imgmax=800
blogger_id: tag:blogger.com,1999:blog-36533086.post-1325740255107798275
blogger_orig_url: http://www.marcusoft.net/2011/02/kanbanboards-vititeln-har-or-else.html
---


It’s been a while since I did any work on the
<a href="http://www.marcusoft.net/search/label/KanbanBoards"
target="_blank">KanbanBoards</a> project, but now I got around to add
some more features. I planning on doing some acceptance tests for
creating new boards. The controller functionality was spec'd out in then
<a
href="http://www.marcusoft.net/2011/02/kanbanboards-vcreating-new-boards.html"
target="_blank">last installment of the series</a>.

To do that properly I need to touch on two main areas of functionality:

- Authentication – here I plan to use OpenID and see if I can plug-in
    some functionality that already exists.
- Uploading pictures – just for fun I will try to store the pictures
    in the database and see how that sits. I can already here give away
    the fact that I didn’t do this today.

And finally show that the whole thing works using an acceptance test
that verifies the functionality end-to-end.

Let’s go.

### Feedback and updates

I got some great feedback from some people, foremost
<a href="http://www.cauthon.com" target="_blank">Darren Cauthon</a>,
that I’ve already implemented. That cleaned up my code a lot. Sadly I
also messed up a lot when I tried to merge the code into my master. But
after some manual hacking I think I’m back on track.

Darren showed two thing that I haven’t thought of earlier:

- A new feature (upcoming in
    <a href="http://www.specflow.org" target="_blank">SpecFlow</a>) is
    that you can store a factory method inside the
    ScenarioContext.Current. That method is executed when you Get the
    value out of the Current dictionary. That cleaned up a lot of stuff
- A thing that I haven’t really thought of is that you can use
    attributes, such as BeforeScenario on more than one place. If you
    organize your steps in different logical block (for the controller,
    for the different repositories etc.) you can then have the setup for
    each under the BeforeScenario-step and get a nice clean structure.

Thanks Darren – I learn a lot from you. Hope I can pay you back some
day.

### OpenID

To the business of the day. I want to log into the site somehow, but
thought of storing users and passwords in my database doesn’t sit right
nowadays. There’s
<a href="http://openid.net/get-an-openid/what-is-openid/"
target="_blank">OpenID</a> for things like that. I simply want to plug
that into my application.

So I did what we *used* to do; I started to browse the net and before
long if found <http://openidportablearea.codeplex.com> which looks
great. Right - so it looks like it depends on
<a href="http://mvccontrib.codeplex.com/" target="_blank">MvcContrib</a>
and something called
<a href="http://www.dotnetopenauth.net/" target="_blank">DotNetAuth</a>.
All I need to do now is to find the right versions of that and put them
in my lib folder and then find some example code and ... BAM! Not
anymore, my good friend
<a href="http://nuget.codeplex.com/" target="_blank">NuGet</a> will do
all that for you with the simple command:

> Install-Package OpenIdPortableArea

Haha – it even gives me intellisense support for the name of the
package. Ok – I’m officially impressed! NuGet is something every .net
developer need to know. Full stop!

And while I wrote that NuGet did this:

> Install-Package OpenIdPortableArea
> 'MvcContrib' not installed. Attempting to retrieve dependency from
> source...
> Done.
> 'MicrosoftWebMvc (≥ 2.0)' not installed. Attempting to retrieve
> dependency from source...
> Done.
> 'Mvc2Futures (≥ 2.0.50217.0)' not installed. Attempting to retrieve
> dependency from source...
> Done.
> 'DotNetOpenAuth' not installed. Attempting to retrieve dependency from
> source...
> Done.
> Successfully installed 'Mvc2Futures 2.0.50217.0'.
> Successfully installed 'MicrosoftWebMvc 2.0'.
> Successfully installed 'MvcContrib 2.0.95.0'.
> Successfully installed 'DotNetOpenAuth 3.4.6.10357'.
> Successfully installed 'OpenIdPortableArea 1.0.0.3'.
> Successfully added 'Mvc2Futures 2.0.50217.0' to Web.
> Successfully added 'MicrosoftWebMvc 2.0' to Web.
> Successfully added 'MvcContrib 2.0.95.0' to Web.
> Successfully added 'DotNetOpenAuth 3.4.6.10357' to Web.
> Successfully added 'OpenIdPortableArea 1.0.0.3' to Web.

Lala – now I just need to wire it up. Btw – a portable area is views,
controllers and model bundled up into a portable component or .dll.

From the <a href="http://openidportablearea.codeplex.com/documentation"
target="_blank">OpenIdPortableArea documentation</a> I get some help to
wire it up. Let’s see:

- Need to AreaRegistration.RegisterAllAreas() in Global.asax. That’s
    done already in MVC3 applications
- Use the Authorize-attribute for the controller actions I want the
    user to be authenticated to run. In my case, so far, it’s the
    Create-action.
- And then I need to point the forms authentication in the web.config
    to the controller action “\~/OpenId” which is supplied by the
    portable area.
- OpenIdPortableArea uses a <a
    href="http://www.code-magazine.com/article.aspx?quickid=1003111&amp;page=4"
    target="_blank">message bus supplied by MvcContrib</a> to
    communicate with OpenID. So I need to use that, which is done with
    this simple row in Application_Start in Global.asax:
       MvcContrib.Bus.AddAllMessageHandlers();

That last part means that I can handle messages that the MvcContrib bus
sends out. For example the ClaimsRequestMessage. So I created a
PortableAreaHandlers-folder and popped the following (shamelessly
stolen) code in there (moved to separate files after you read this):

[<img
src="http://lh5.ggpht.com/_TI0jeIedRFk/TWfHO5e-0HI/AAAAAAAAA6I/mmMSFVaF2Y8/openid%20message%20handlers_thumb.jpg?imgmax=800"
title="openid message handlers"
style="background-image: none; border-right-width: 0px; margin: 0px auto; padding-left: 0px; padding-right: 0px; display: block; float: none; border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; padding-top: 0px"
data-border="0" width="420" height="255"
alt="openid message handlers" />](http://lh4.ggpht.com/_TI0jeIedRFk/TWfHOCsoKPI/AAAAAAAAA6E/gCLhjc3g_iU/s1600-h/openid%20message%20handlers%5B2%5D.jpg)

In the top part I set up the things I require that the user supplies
(name and email) and down below is the code that get called when the
user is authenticated.

Finally I changed the implementation of my logon-partial view by (again)
steal a partial that OpenIdPortableArea supplies. Like this:

[<img
src="http://lh4.ggpht.com/_TI0jeIedRFk/TWfHP5C5_xI/AAAAAAAAA6Q/uaJ_2A4Vfds/openidportablearea%20loginwidget_thumb.jpg?imgmax=800"
title="openidportablearea loginwidget"
style="background-image: none; border-right-width: 0px; margin: 0px auto; padding-left: 0px; padding-right: 0px; display: block; float: none; border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; padding-top: 0px"
data-border="0" width="358" height="112"
alt="openidportablearea loginwidget" />](http://lh5.ggpht.com/_TI0jeIedRFk/TWfHPRBgz3I/AAAAAAAAA6M/a53OQmf4TOs/s1600-h/openidportablearea%20loginwidget%5B2%5D.jpg)

To get this to work you need to add the OpenIdPortableArea into the
\<namespaces\> section of the Web.Config in the Views-folder. That’s
just to let your views to know that OpendIdPortableArea is something
that they can use.

All of this was stolen from the <a
href="http://www.userinexperience.com/post/Mvc-Screencast-4-MvcContrib.aspx"
target="_blank">excellent screencast</a> of [Brandon
Satrom](http://stackoverflow.com/users/380135/brandon-satrom) on
MvcContrib.

### Problems

But just as I thought this was going to be a breeze I ran into problems.
The version of OpenIdPortableArea I used (1.0.0.3) only supported
WebForms (aspx) views. And I used Razor.

### OSS and social media to the fore

What then happened was a powerful testament to the powers of Twitter and
the OSS-community. I am just humbled by this community. The willingness
to share and help each other is just amazing. I haven’t once been put
down or frowned on by any of the (sometimes very famous) people I’ve
asked for help.

Here how it happened;

- I contacted Brandon Satrom
    (<a href="http://twitter.com/brandonsatrom"
    target="_blank">@brandonsatrom</a>) and asked if he have had the
    same problem when he did his screencasts
- He experienced the same thing when he used Razor views.
- So I contacted John Nelson
    (<a href="http://twitter.com/johncoder" target="_blank">@johncoder</a>)
    who created the OpenID Portable Area in the first place.
- Aware of the problems he was just about to release a new version of
    the OpenId Portable Area.
- Two days later it was on
    <a href="http://nuget.org" target="_blank">NuGet.org</a> – one
    version for <a
    href="http://nuget.org/Packages/Packages/Details/OpenIdPortableArea-RazorViews-2-0-0-0"
    target="_blank">Razor views</a> and one for <a
    href="http://nuget.org/Packages/Packages/Details/OpenIdPortableArea-WebFormsViews-2-0-0-0"
    target="_blank">WebForms</a>
- John kindly contacted me back. I downloaded and ran into some small
    understanding problems. But John “held my hand” and pretty soon I
    had a working integration (see below)

### Retake – wiring up OpenId Portable Area

So here is what you (nowadays) need to do to get OpenId Portable Area
into your application and working.

Uninstall any previous version of the OpenId Portable Area (<a
href="http://www.marcusoft.net/2011/02/nuget-uninstall-remove-dependencies.html"
target="_blank">and dependencies</a>)

Get the version of your choice with one of these commands:

- Install-Package OpenIdPortableArea.RazorViews
- Install-Package OpenIdPortableArea.WebFormsViews

Add the following little snippet to get a “login widget”; you know the
little thing that says “Login” and “You’re logged in as”: [<img
src="http://lh5.ggpht.com/_TI0jeIedRFk/TXZ81RL1KhI/AAAAAAAAA6w/JstSzgd0ZnA/Screen%20shot%202011-03-08%20at%2019.19.25_thumb.jpg?imgmax=800"
title="Login status widget"
style="background-image: none; border-right-width: 0px; margin: 0px auto; padding-left: 0px; padding-right: 0px; display: block; float: none; border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; padding-top: 0px"
data-border="0" width="420" height="62" alt="Login status widget" />](http://lh5.ggpht.com/_TI0jeIedRFk/TXZ80k1YCpI/AAAAAAAAA6s/Ts-uwV56taw/s1600-h/Screen%20shot%202011-03-08%20at%2019.19.25%5B2%5D.jpg)

And finally add a AuthenticatedMessageHandler. Here is a new version
that get the work done. This is the bare minimum you have to write but I
have some more comments below
[<img
src="http://lh6.ggpht.com/_TI0jeIedRFk/TXZ83HmjsgI/AAAAAAAAA64/BBtKX6tqCV4/Screen%20shot%202011-03-08%20at%2019.18.57_thumb.jpg?imgmax=800"
title="Authentication message handler"
style="background-image: none; border-bottom: 0px; border-left: 0px; margin: 0px auto; padding-left: 0px; padding-right: 0px; display: block; float: none; border-top: 0px; border-right: 0px; padding-top: 0px"
data-border="0" width="420" height="204"
alt="Authentication message handler" />](http://lh6.ggpht.com/_TI0jeIedRFk/TXZ82VcOcXI/AAAAAAAAA60/vkDvA2zaTXQ/s1600-h/Screen%20shot%202011-03-08%20at%2019.18.57%5B2%5D.jpg)

The rest is configured by the NuGet package. It:

- Adds the appropriate configuration to your web.config
- Adds Views and controllers under the Area-folder

### The message handlers

The whole idea with the OpenId Portable Area is to minimize your work
and that really works great. Although you need to know how to stich it
together with your application. Typically that involves the steps I’ve
outlined above and one more; ClaimsRequestMessageHandler.

With both the ClaimsHandler and the AuthenticationMessageHandler you
hook into events fired by a bus (implemented by
<a href="http://mvccontrib.codeplex.com/" target="_blank">MVCContrib</a>
if I understood it correctly). So you simply need to tell the messages
(requests or responses) what to do.

For the claims request handler we need to specify the claims we have on
the OpenId provider. Like this:

[<img
src="http://lh6.ggpht.com/_TI0jeIedRFk/TXZ83wDw-eI/AAAAAAAAA7A/zLF738tWSgU/Screen%20shot%202011-03-08%20at%2019.27.11_thumb.jpg?imgmax=800"
title="Claims Request Message handler"
style="background-image: none; border-bottom: 0px; border-left: 0px; margin: 0px auto; padding-left: 0px; padding-right: 0px; display: block; float: none; border-top: 0px; border-right: 0px; padding-top: 0px"
data-border="0" width="420" height="117"
alt="Claims Request Message handler" />](http://lh5.ggpht.com/_TI0jeIedRFk/TXZ83oXYFzI/AAAAAAAAA68/YuAQ3xhJ5PI/s1600-h/Screen%20shot%202011-03-08%20at%2019.27.11%5B2%5D.jpg)

Sadly not all (blogger.com) of the OpenId providers adhere to all your
claims so you need to check carefully when the answer returns
(AuthenctionMessageHandler).

[<img
src="http://lh6.ggpht.com/_TI0jeIedRFk/TXZ85rsBwsI/AAAAAAAAA7I/Uu8G3wSIa40/Screen%20shot%202011-03-08%20at%2019.18.57_thumb%5B1%5D.jpg?imgmax=800"
title="Screen shot 2011-03-08 at 19.18.57"
style="background-image: none; border-bottom: 0px; border-left: 0px; margin: 0px auto; padding-left: 0px; padding-right: 0px; display: block; float: none; border-top: 0px; border-right: 0px; padding-top: 0px"
data-border="0" width="420" height="204"
alt="Screen shot 2011-03-08 at 19.18.57" />](http://lh3.ggpht.com/_TI0jeIedRFk/TXZ84zSt4kI/AAAAAAAAA7E/_yPCiRAiJMQ/s1600-h/Screen%20shot%202011-03-08%20at%2019.18.57%5B6%5D.jpg)

Also there’s a method being used in my AuthenctionMessageHandler that I
didn’t get at first. The method is OpenIdHelpers.Login. That performs
the Forms-login, but the values you send it is not username / password.
That what’s got me I think. From the documentation we read:

> Creates a FormsAuthenticationTicket, and adds a FormsAuthentication
> Cookie

So rather the method might have been called
CreateFormsAuthenticationTicket. I would probably missed that too but
the login was really confusing. John Nelson kindly explained it to me so
I thought I pay it forward.

With all this in place I can simply login in to my own site using my
Google account (for example). Pretty slick with a total of 15 lines of
significant code (not counting class declarations etc.).

[<img
src="http://lh3.ggpht.com/_TI0jeIedRFk/TXZ86nx639I/AAAAAAAAA7Q/qJstJeZXK08/logged%20in_thumb.jpg?imgmax=800"
title="logged in"
style="background-image: none; border-bottom: 0px; border-left: 0px; margin: 0px auto; padding-left: 0px; padding-right: 0px; display: block; float: none; border-top: 0px; border-right: 0px; padding-top: 0px"
data-border="0" width="420" height="106" alt="logged in" />](http://lh6.ggpht.com/_TI0jeIedRFk/TXZ86E6TRKI/AAAAAAAAA7M/8q5T6D2uNyI/s1600-h/logged%20in%5B2%5D.jpg)

### Conclusion

The <a
href="http://www.marcusoft.net/2011/01/developing-in-neta-new-era-has-begun.html"
target="_blank">starting point for this series</a> was to explore the
new way you do code. For me the
<a href="http://en.wikipedia.org/wiki/Test-driven_development"
target="_blank">TDD</a> and
<a href="http://en.wikipedia.org/wiki/Behavior_Driven_Development"
target="_blank">BDD</a> revolution has change that the most during the
last years. But lately it’s the NuGet and inclusion of ready-made
functionality that super-easy can be integrated and used in your code,
that make a big impact on me.

OpenId Portable Area is such a great addition. I wouldn’t dream of
writing that myself. But with Johns help and the powered by NuGet I
could do it in a matter of minutes. Not counting the OSS / Twitter
hallelujah waiting time <img
src="http://lh5.ggpht.com/_TI0jeIedRFk/TXZ87KQigwI/AAAAAAAAA7U/ObTfJJiHuDc/wlEmoticon-smile%5B2%5D.png?imgmax=800"
class="wlEmoticon wlEmoticon-smile"
style="border-bottom-style: none; border-right-style: none; border-top-style: none; border-left-style: none"
alt="Smile" />

A final word; I am on parental leave during the upcoming six months.
(Yeah – Sweden is a great country for parents...). As I take care of
twins and with a wife working during the nights (sleeps during the days)
I suspect that I wont have much time to blog for a while.

I will try to get the site running – but probably not blog about the
process, since that slows the creation down a lot, but makes me think a
lot also – which is great of course.

You are more than welcome to follow
<a href="https://github.com/marcusoftnet/KanbanBoards"
target="_blank">the project on the github location</a> where I will
continue to check in the code. <a
href="https://github.com/marcusoftnet/KanbanBoards/commit/cb0b45eb005feb9c245c2c95a1ac7d3bce09bd51"
target="_blank">Here’s the commit for this post</a>

Thank you for reading this far – I’ve learned a lot.
