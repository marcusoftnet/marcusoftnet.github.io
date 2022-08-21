---
layout: post
title: Great Visual Studio integration - another of the
many reasons to upgrade to SpecFlow 1.9 date: '2012-08-09T21:19:00.001+02:00'
author: Marcus Hammarberg
tags: - BDD -
Tools
  - .NET - SpecFlow modified_time: '2012-08-09T21:19:52.184+02:00'
thumbnail:
http://lh3.ggpht.com/-D9-xHMNcQZs/UCQNLj2AYcI/AAAAAAAABRk/fMIrv2IHpLI/s72-c/Screen%252520Shot%2525202012-08-09%252520at%25252021.09.06_thumb.png?imgmax=800
blogger_id: tag:blogger.com,1999:blog-36533086.post-4917334123497966173
blogger_orig_url: http://www.marcusoft.net/2012/08/great-visual-studio-integration-another.html
---


This is a small tribute to a great tool. Mostly for fun but there are
some great stuff in the latest release of SpecFlow.
<a href="http://www.specflow.org/specflownew/WhatsNew19.html"
target="_blank">Check it out</a>. And get the tool from the <a
href="http://visualstudiogallery.msdn.microsoft.com/9915524d-7fb0-43c3-bb3c-a8a14fbd40ee"
target="_blank">Visual Studio Gallery</a>, but be sure to uninstall any
previous versions first.

For more serious look on some of the code features, head over to <a
href="http://bloggingabout.net/blogs/vagif/archive/2012/08/07/dry-one-of-the-many-reasons-to-upgrade-to-specflow-1-9.aspx"
target="_blank">Vagif Abilov's excellent post</a>.



Marcus enters the office. He boots up the computer and opens Visual
Studio 2012. With a smile he thinks about that not only Vs2010 solutions
opens nicely in Vs2012 but also the new release of
<a href="http://www.specflow.org" target="_blank">SpecFlow</a> works
fine for both.

Where was he now again. There were something about the feature file. He
opens it and due to the nice color coding of lines, Marcus is reminded
of one of the steps that he didn't had written a step definition for.

[<img
src="http://lh3.ggpht.com/-D9-xHMNcQZs/UCQNLj2AYcI/AAAAAAAABRk/fMIrv2IHpLI/Screen%252520Shot%2525202012-08-09%252520at%25252021.09.06_thumb.png?imgmax=800"
title="Screen Shot 2012-08-09 at 21.09.06"
style="background-image: none; border-bottom: 0px; border-left: 0px; margin: 0px auto; padding-left: 0px; padding-right: 0px; display: block; float: none; border-top: 0px; border-right: 0px; padding-top: 0px"
data-border="0" width="351" height="92"
alt="Screen Shot 2012-08-09 at 21.09.06" />](http://lh6.ggpht.com/-zcm6-na0LQQ/UCQNKnUjCnI/AAAAAAAABRg/p2wKrltLR64/s1600-h/Screen%252520Shot%2525202012-08-09%252520at%25252021.09.06%25255B2%25255D.png)

“Then the result should be 120”…

"This should not be too hard" - he thinks and hit F12 on the step in the
.feature file. As always the helpful little dialog opens giving him the
implementation. And look – it’s now parsing out a regular expression at
the right place.

[<img
src="http://lh3.ggpht.com/-OPKNKyc4ZdU/UCQNP76TgyI/AAAAAAAABR4/2_GBzVUDBn0/Screen%252520Shot%2525202012-08-09%252520at%25252020.39.22_thumb.png?imgmax=800"
title="Screen Shot 2012-08-09 at 20.39.22"
style="background-image: none; border-bottom: 0px; border-left: 0px; margin: 0px auto; padding-left: 0px; padding-right: 0px; display: block; float: none; border-top: 0px; border-right: 0px; padding-top: 0px"
data-border="0" width="404" height="212"
alt="Screen Shot 2012-08-09 at 20.39.22" />](http://lh6.ggpht.com/-kvK3pzQ-zd8/UCQNMVRUeUI/AAAAAAAABRs/Y85t3ukimjc/s1600-h/Screen%252520Shot%2525202012-08-09%252520at%25252020.39.22%25255B2%25255D.png)

He simply paste the implementation into the class file and fills out the
implementation, with a couple of simple lines.

“Hmmm was that all then?”, Marcus thinks for himself. Inside the step
definition method Marcus hits Ctrl+Shift+Alt+S and is taken back to the
feature file. Hitting the same command again takes him back to the step
definition. He goes back and forth a couple of times, just because it’s
so slick.

“Ok – get a grip, Marcus. That just too geeky” he says out loudly and
right-clicks the feature file and chose Run SpecFlow Scenarios.
Immediately the Reshaper test runner is picked up and executes the
tests. Green!

“Great – now what? Yeah – that’s right… The new scenario from big boss
Hugo needed to be implemented”. Marcus adds the following scenario to
the feature:

>     Scenario: Subtracting two numbers
>         Given the first number is 50
>         And the second number is 20
>         When I do a subtract
>         Then the presented result should be 30
>
>



“That was a lot of new step definitions… and very similar the ones we
have. I’ll just implement these at they stand”. Marcus right-clicks the
scenario and choses Generate Step Definitions. This open this dialog
box:



[<img
src="http://lh4.ggpht.com/-1_xC8jdpKt4/UCQNSZpOywI/AAAAAAAABSM/1NUwvxMX4PM/Screen%252520Shot%2525202012-08-09%252520at%25252020.53.30_thumb%25255B1%25255D.png?imgmax=800"
title="Screen Shot 2012-08-09 at 20.53.30"
style="background-image: none; border-bottom: 0px; border-left: 0px; margin: 0px auto; padding-left: 0px; padding-right: 0px; display: block; float: none; border-top: 0px; border-right: 0px; padding-top: 0px"
data-border="0" width="369" height="302"
alt="Screen Shot 2012-08-09 at 20.53.30" />](http://lh4.ggpht.com/-sD1ntd9K0Ak/UCQNRXuW4sI/AAAAAAAABSA/lqRRaJkENjU/s1600-h/Screen%252520Shot%2525202012-08-09%252520at%25252020.53.30%25255B6%25255D.png)



Marcus picks to go with Pascal-cased methods without regular
expressions…
“Just as I started to pick that up…” he thinks but is also happy that
the option exists.



He choses to copy the methods to the clipboard and simply paste the
method stubs into the existing class.



The implementation of the step definitions and the subsequent production
code goes smoothly and before long the scenario is passing.



Looking back over his work one final thing strikes him… “Look all the
variables are *italics* and grey, nice! Huh – haven seen that before.”



[<img
src="http://lh5.ggpht.com/-UJd95wDVfng/UCQNVVLPs3I/AAAAAAAABSc/WeUqXjsxxYw/Screen%252520Shot%2525202012-08-09%252520at%25252021.07.17_thumb.png?imgmax=800"
title="Screen Shot 2012-08-09 at 21.07.17"
style="background-image: none; border-bottom: 0px; border-left: 0px; margin: 0px auto; padding-left: 0px; padding-right: 0px; display: block; float: none; border-top: 0px; border-right: 0px; padding-top: 0px"
data-border="0" width="321" height="100"
alt="Screen Shot 2012-08-09 at 21.07.17" />](http://lh4.ggpht.com/-Eu3tyIwSG0E/UCQNURa2PsI/AAAAAAAABSU/J7x-w1WrYoE/s1600-h/Screen%252520Shot%2525202012-08-09%252520at%25252021.07.17%25255B2%25255D.png)



“I’m sure happy that I have such a great tool to help me out. Makes my
work both easy and fun.”



Marcus heads over the SpecFlow website and is greeted with a new site.
And a new logo!!!



<img src="http://www.specflow.org/specflownew/css/logo.png"
style="display: block; float: none; margin-left: auto; margin-right: auto" />



He almost, but only almost, misses the pixels, rough edges and 80-ies
look of the old logo.
