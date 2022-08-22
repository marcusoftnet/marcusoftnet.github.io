---
layout: post
title: In SpecFlow the test runner is just glue
date: '2011-02-10T01:34:00.001+01:00'
author: Marcus Hammarberg
tags:
  - .NET
  - SpecFlow
modified_time: '2011-02-10T01:34:51.789+01:00'
thumbnail: http://lh6.ggpht.com/\_TI0jeIedRFk/TVMykeuNQqI/AAAAAAAAA4w/41Mn4IdgjXc/s72-c/stupid%20steps%20in%20scenario_thumb.jpg?imgmax=800
blogger_id: tag:blogger.com,1999:blog-36533086.post-1569234750775344083
blogger_orig_url: http://www.marcusoft.net/2011/02/in-specflowa-test-runner-is-just-glue.html
---


I answered a question on Twitter today from a guy who had problems
running <a href="http://www.specflow.org" target="_blank">SpecFlow</a>
scenarios with MSTest. That shouldn’t be I thought to myself – in
SpecFlow the test runner is only used for the auto-generated stuff (#2
in this pictures) and shouldn’t affect the code you write. Lets try it.

The default test runner is NUnit so first I simply create a new
Specs-project and created the following scenario:

[<img
src="http://lh6.ggpht.com/_TI0jeIedRFk/TVMykeuNQqI/AAAAAAAAA4w/41Mn4IdgjXc/stupid%20steps%20in%20scenario_thumb.jpg?imgmax=800"
title="stupid steps in scenario"
style="background-image: none; border-bottom: 0px; border-left: 0px; margin: 0px auto; padding-left: 0px; padding-right: 0px; display: block; float: none; border-top: 0px; border-right: 0px; padding-top: 0px"
data-border="0" width="420" height="114"
alt="stupid steps in scenario" />](http://lh5.ggpht.com/_TI0jeIedRFk/TVMyjuJn5sI/AAAAAAAAA4s/Xe7j2xMEEY0/s1600-h/stupid%20steps%20in%20scenario%5B2%5D.jpg)

I then Nuget’d SpecFlow, Should and NUnit with these commands:

> Install-Package SpecFlow
> Install-Package NUnit
> Install-Package ShouldFluent

And sure enough – when I compile some NUnit code is auto generated for
me:

[<img
src="http://lh5.ggpht.com/_TI0jeIedRFk/TVMymOwl8cI/AAAAAAAAA44/uxKoDqAfkJo/generated%20nunit%20code_thumb.jpg?imgmax=800"
title="generated nunit code"
style="background-image: none; border-bottom: 0px; border-left: 0px; margin: 0px auto; padding-left: 0px; padding-right: 0px; display: block; float: none; border-top: 0px; border-right: 0px; padding-top: 0px"
data-border="0" width="420" height="145" alt="generated nunit code" />](http://lh6.ggpht.com/_TI0jeIedRFk/TVMylcYRZvI/AAAAAAAAA40/9WMJaYg_c3k/s1600-h/generated%20nunit%20code%5B2%5D.jpg)

Just for good manners I implemented the steps and ran the specification.
It worked with these (naïve) steps in place:

[<img
src="http://lh4.ggpht.com/_TI0jeIedRFk/TVMynbozE6I/AAAAAAAAA5A/1c1Cx6LUgS0/naive%20steps_thumb.jpg?imgmax=800"
title="naive steps"
style="background-image: none; border-bottom: 0px; border-left: 0px; margin: 0px auto; padding-left: 0px; padding-right: 0px; display: block; float: none; border-top: 0px; border-right: 0px; padding-top: 0px"
data-border="0" width="420" height="247" alt="naive steps" />](http://lh4.ggpht.com/_TI0jeIedRFk/TVMymoc65fI/AAAAAAAAA48/6d49Kh8UvSU/s1600-h/naive%20steps%5B2%5D.jpg)

If I now change the app.config (added by NuGet install of SpecFlow) and
configures it to use MsTest, like this:

[<img
src="http://lh3.ggpht.com/_TI0jeIedRFk/TVMyomZZ1VI/AAAAAAAAA5I/fsoSoBbBnhk/mstest%20in%20app.config_thumb%5B1%5D.jpg?imgmax=800"
title="mstest in app.config"
style="background-image: none; border-bottom: 0px; border-left: 0px; margin: 0px auto; padding-left: 0px; padding-right: 0px; display: block; float: none; border-top: 0px; border-right: 0px; padding-top: 0px"
data-border="0" width="420" height="87" alt="mstest in app.config" />](http://lh3.ggpht.com/_TI0jeIedRFk/TVMyoPTDQcI/AAAAAAAAA5E/Hb_6LebG-Cg/s1600-h/mstest%20in%20app.config%5B6%5D.jpg)

And then add MsTest with a reference. Finally I save the scenario file
which triggers the SpecFlow custom command for the file to run and
generate the code. I now get the following code generated instead:

[<img
src="http://lh6.ggpht.com/_TI0jeIedRFk/TVMyqiVs4SI/AAAAAAAAA5Q/I_zCfSLsKSE/generated%20mstest%20code_thumb.jpg?imgmax=800"
title="generated mstest code"
style="background-image: none; border-bottom: 0px; border-left: 0px; margin: 0px auto; padding-left: 0px; padding-right: 0px; display: block; float: none; border-top: 0px; border-right: 0px; padding-top: 0px"
data-border="0" width="420" height="150" alt="generated mstest code" />](http://lh6.ggpht.com/_TI0jeIedRFk/TVMyp8G_VcI/AAAAAAAAA5M/fw9ZotqG2FA/s1600-h/generated%20mstest%20code%5B2%5D.jpg)

Sadly the test don’t run because I forgot the fact that in order to get
MsTest to run the project they reside in need to be a test project but
you get what I mean. Try to switch to xUnit or MbUnit for example.

### Conclusion

So to sum up – the test runner in SpecFlow is not very important. It’s
just the auto generated stuff. Your steps, SpecFlow attributes etc. will
still be the same; it’s just being called by a different test runner.

Note that there’s not great use case for this – it’s just demoing that
the test framework doesn’t matter much.
