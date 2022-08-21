---
layout: post
title: Great Silverlight 2.0 Tutorial date: '2008-04-22T07:40:00.005+02:00'
author: Marcus Hammarberg
tags:
  - Life of a consultant
   - ASP.NET MVC
modified_time: '2008-11-11T15:29:36.806+01:00'
blogger_id: tag:blogger.com,1999:blog-36533086.post-5211319906040566630
blogger_orig_url: http://www.marcusoft.net/2008/04/great-silverlight-20-tutorial.html ---
<span>="blsp-spelling-corrected">Everybody</span> who knows me knows my
feelings on doing complex <span>="blsp-spelling-error">WebGUI</span>. In short i think it is
stupid - and also i have never met a developer yet who can show me a
robust and simple way of managing the events of a web page. It is
always, always fixes like; hidden fields, setting stuff in <span
id="SPELLING_ERROR_2" class="blsp-spelling-error">prerender</span> etc
etc.

So my personal opinion of this is - don't do it! Web is for simple
stuff. The moment a request about a <span>="blsp-spelling-corrected">tab control</span> or thing posting back
is being said I would raise a big <span>="blsp-spelling-corrected">warning flag</span>. You'll get into
trouble. (Of course I can only speak for ASP.NET, and love to be
convinced otherwise).

<span>="blsp-spelling-corrected">Luckily</span> there is help on the
way.

-   You could either stick with simple HTML and use [ASP.NET <span
    id="SPELLING_ERROR_6"
    class="blsp-spelling-error">MVC</span>](http://weblogs.asp.net/scottgu/archive/2007/10/14/asp-net-mvc-framework.aspx)
    which removes all the crazy event-handling from the ASP.NET <span
    id="SPELLING_ERROR_7" class="blsp-spelling-error">WebForm</span>
    model. Basically this solution could be called "Someone <span
    id="SPELLING_ERROR_8" class="blsp-spelling-corrected">Else's</span>
    Problem" since someone have to figure out the <span
    id="SPELLING_ERROR_9" class="blsp-spelling-corrected">web
    page</span>. But they can go crazy with it, separate from the logic.
    You are providing a controller form the design-folks to use. The
    person most <span id="SPELLING_ERROR_10"
    class="blsp-spelling-corrected">appropriate</span> for the job - in
    my case anyway.
-   Another way is to design the application as an [<span
    id="SPELLING_ERROR_11"
    class="blsp-spelling-error">Sliverlight</span>
    application](http://weblogs.asp.net/scottgu/archive/2008/02/22/first-look-at-silverlight-2.aspx).
    This gives you the <span id="SPELLING_ERROR_12"
    class="blsp-spelling-corrected">opportunity</span> to really go
    crazy with the layout. With <span id="SPELLING_ERROR_13"
    class="blsp-spelling-error">Silverlight</span> you can do anything
    you can do in a Windows Form, <span id="SPELLING_ERROR_14"
    class="blsp-spelling-corrected">design wise</span>, and more. For
    the client the download of the [<span id="SPELLING_ERROR_15"
    class="blsp-spelling-error">Silverlight</span>
    executable](http://silverlight.net/) is done in seconds and then the
    application is run in the browser.

As you might notice both these suggestions are explained by my new <span
id="SPELLING_ERROR_16" class="blsp-spelling-corrected">house god
</span>Scott <span id="SPELLING_ERROR_17"
class="blsp-spelling-error">Gutrie</span> ([<span id="SPELLING_ERROR_18"
class="blsp-spelling-error">ScottGu</span>](http://weblogs.asp.net/scottgu/)).
He seems to have something to say about almost everything in our area.
Check him out - well worth the time.
