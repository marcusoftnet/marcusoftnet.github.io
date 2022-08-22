---
layout: post
title: Getting Visual Studio 2012 Test Explorer to work with NUnit,xUnit and SpecFlow
date: 2012-09-04T09:00:00.000+02:00
author: Marcus Hammarberg
tags:
  - BDD
  - .NET
  - Visual Studio
  - SpecFlow
  - TDD
modified_time: 2012-09-04T09:00:07.749+02:00
thumbnail: http://3.bp.blogspot.com/-FX9dvj7RrdI/UEOyDE4vZxI/AAAAAAAABTM/lXpDG8swOPk/s72-c/Screen+Shot+2012-09-02+at+21.18.46.png
blogger_id: tag:blogger.com,1999:blog-36533086.post-5998573811657878660
blogger_orig_url: http://www.marcusoft.net/2012/09/getting-visual-studio-2012-test.html
---

Yes, it's this is another "hey this is a cool feature of Visual
Studio 2012" post. If you know all about the new Test Explorer and how
to get NUnit, xUnit and by
association <a href="http://www.specflow.org/" target="_blank">SpecFlow</a> to
work with it - you can stop reading here. For me it took awhile to get
up and running.

I don't remember where I first read about it but I remember that I was
happy to read that Visual Studio 2012 comes with a new
<a href="http://msdn.microsoft.com/en-us/library/hh270865.aspx"
target="_blank">Test Explorer</a>. What's really cool about it is that
it's no longer limited to
just <a href="http://en.wikipedia.org/wiki/MSTest" target="_blank">MsTest</a> tests,
but can run NUnit, xUnit ... you name it.

This means that my SpecFlow tests can be run from the new Test Explorer
as well. You know, all SpecFlow actually does is translating the
<a href="https://github.com/cucumber/cucumber/wiki"
target="_blank">Gherkin</a> lines you write into unit tests of your
framework of choice. It should just work.

So they said...

Imagine my disappointment when the test explorer just reported "No unit
tests found in solution" over and over again.

So after awhile I picked up that you (of course!) need to install
adapters for the unit test frameworks you want to have the Test explorer
to pick up.

That's quite easy. You go to Tools -\> Extensions and Updates and search
the Visual Studio Gallery (you'll find it under the Online-tab in the
dialog) for NUnit, xUnit or whatever framework your using. What you are
looking for are Test adapters for Visual Studio 2012. Like these:

<div class="separator" style="clear: both; text-align: center;">

<a
href="http://3.bp.blogspot.com/-FX9dvj7RrdI/UEOyDE4vZxI/AAAAAAAABTM/lXpDG8swOPk/s1600/Screen+Shot+2012-09-02+at+21.18.46.png"
data-imageanchor="1" style="margin-left: 1em; margin-right: 1em;"><img
src="http://3.bp.blogspot.com/-FX9dvj7RrdI/UEOyDE4vZxI/AAAAAAAABTM/lXpDG8swOPk/s320/Screen+Shot+2012-09-02+at+21.18.46.png"
data-border="0" width="320" height="176" /></a>

</div>

<div class="separator" style="clear: both; text-align: left;">

When that is installed I was again happy to see that Visual Studio picks
up my SpecFlow specifications and I can run them from the test
explorer.

</div>

### But wait, there is more

<div>

When I started to use the Test Explorer I found a couple of nuggets in
there too, for us SpecFlow-users:

</div>

<div>

- Double clicking a test takes you too... The specification and not
    the generated test. Thank you very much mr Hidden pragma (#line
    hidden)
- You can run only failed, or passed for that matter and even a
    shortcut for rerunning the last test run. It seems like
    TDD practices are getting a firm footing at Microsoft...
   <a
    href="http://4.bp.blogspot.com/-P1R_y4OI1us/UET6sootD2I/AAAAAAAABTg/vqkwYj0uxPo/s1600/Screen+Shot+2012-09-03+at+20.43.51.png"
    data-imageanchor="1"
    style="margin-left: 1em; margin-right: 1em; text-align: center;"><img
    src="http://4.bp.blogspot.com/-P1R_y4OI1us/UET6sootD2I/AAAAAAAABTg/vqkwYj0uxPo/s320/Screen+Shot+2012-09-03+at+20.43.51.png"
    data-border="0" width="320" height="116" /></a>
- There is, from the Test menu, an option to rerun the tests on every
    build. So it's a bit like a poor
    mans <a href="http://continuoustests.com/" target="_blank">MightyMoose</a>
    and <a href="http://www.ncrunch.net/" target="_blank">NCrunch</a>
    test runners.
    <a
    href="http://3.bp.blogspot.com/-NdHpP_DIWSE/UET7XEpd_mI/AAAAAAAABTo/oqEboEjNNKE/s1600/Screen+Shot+2012-09-03+at+20.47.40.png"
    data-imageanchor="1"
    style="margin-left: 1em; margin-right: 1em; text-align: center;"><img
    src="http://3.bp.blogspot.com/-NdHpP_DIWSE/UET7XEpd_mI/AAAAAAAABTo/oqEboEjNNKE/s320/Screen+Shot+2012-09-03+at+20.47.40.png"
    data-border="0" width="320" height="104" /></a>

<div>

These small things made me happy and my productivity boost a bit again.
Once I knew who to get it to run with the testframeworks I normally
use.

</div>

</div>

<div>

</div>

<div>

I like it!

</div>
