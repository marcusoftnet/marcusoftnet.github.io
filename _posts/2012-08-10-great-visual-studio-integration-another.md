---
title: Great Visual Studio integration - another of the many reasons to upgrade to SpecFlow 1.9
date: 2012-08-09
author: Marcus Hammarberg
tags:
  - BDD
  - Tools
  - .NET
  - SpecFlow
thumbnail: http://lh3.ggpht.com/-D9-xHMNcQZs/UCQNLj2AYcI/AAAAAAAABRk/fMIrv2IHpLI/s72-c/Screen%252520Shot%2525202012-08-09%252520at%25252021.09.06_thumb.png?imgmax=800
---

This is a small tribute to a great tool. Mostly for fun but there are some great stuff in the latest release of SpecFlow. [Check it out](http://www.specflow.org/specflownew/WhatsNew19.html). And get the tool from the [Visual Studio Gallery](http://visualstudiogallery.msdn.microsoft.com/9915524d-7fb0-43c3-bb3c-a8a14fbd40ee), but be sure to uninstall any previous versions first.

For more serious look on some of the code features, head over to [Vagif Abilov's excellent post](http://bloggingabout.net/blogs/vagif/archive/2012/08/07/dry-one-of-the-many-reasons-to-upgrade-to-specflow-1-9.aspx).

Marcus enters the office. He boots up the computer and opens Visual Studio 2012. With a smile he thinks about that not only Vs2010 solutions opens nicely in Vs2012 but also the new release of [SpecFlow](http://www.specflow.org) works fine for both.

Where was he now again. There were something about the feature file. He opens it and due to the nice color coding of lines, Marcus is reminded of one of the steps that he didn't had written a step definition for.

![Screen Shot 2012-08-09 at 21.09.06](http://lh3.ggpht.com/-D9-xHMNcQZs/UCQNLj2AYcI/AAAAAAAABRk/fMIrv2IHpLI/Screen%252520Shot%2525202012-08-09%252520at%25252021.09.06_thumb.png?imgmax=800)

“Then the result should be 120”…

"This should not be too hard" - he thinks and hit F12 on the step in the .feature file. As always the helpful little dialog opens giving him the implementation. And look – it’s now parsing out a regular expression at the right place.

![Screen Shot 2012-08-09 at 20.39.22](http://lh3.ggpht.com/-OPKNKyc4ZdU/UCQNP76TgyI/AAAAAAAABR4/2_GBzVUDBn0/Screen%252520Shot%2525202012-08-09%252520at%25252020.39.22_thumb.png?imgmax=800)

He simply paste the implementation into the class file and fills out the implementation, with a couple of simple lines.

“Hmmm was that all then?”, Marcus thinks for himself. Inside the step definition method Marcus hits Ctrl+Shift+Alt+S and is taken back to the feature file. Hitting the same command again takes him back to the step definition. He goes back and forth a couple of times, just because it’s so slick.

“Ok – get a grip, Marcus. That just too geeky” he says out loudly and right-clicks the feature file and chose Run SpecFlow Scenarios. Immediately the Reshaper test runner is picked up and executes the tests. Green!

“Great – now what? Yeah – that’s right… The new scenario from big boss Hugo needed to be implemented”. Marcus adds the following scenario to the feature:

```gherkin
Scenario: Subtracting two numbers
    Given the first number is 50
    And the second number is 20
    When I do a subtract
    Then the presented result should be 30
```

“That was a lot of new step definitions… and very similar the ones we have. I’ll just implement these at they stand”. Marcus right-clicks the scenario and choses Generate Step Definitions. This open this dialog box:

![Screen Shot 2012-08-09 at 20.53.30](http://lh4.ggpht.com/-1_xC8jdpKt4/UCQNSZpOywI/AAAAAAAABSM/1NUwvxMX4PM/Screen%252520Shot%2525202012-08-09%252520at%25252020.53.30_thumb%25255B1%25255D.png?imgmax=800)

Marcus picks to go with Pascal-cased methods without regular expressions…
“Just as I started to pick that up…” he thinks but is also happy that the option exists.

He choses to copy the methods to the clipboard and simply paste the method stubs into the existing class.

The implementation of the step definitions and the subsequent production

 code goes smoothly and before long the scenario is passing.

Looking back over his work one final thing strikes him… “Look all the variables are *italics* and grey, nice! Huh – haven seen that before.”

![Screen Shot 2012-08-09 at 21.07.17](http://lh5.ggpht.com/-UJd95wDVfng/UCQNVVLPs3I/AAAAAAAABSc/WeUqXjsxxYw/Screen%252520Shot%2525202012-08-09%252520at%25252021.07.17_thumb.png?imgmax=800)

“I’m sure happy that I have such a great tool to help me out. Makes my work both easy and fun.”

Marcus heads over the SpecFlow website and is greeted with a new site. And a new logo!!!

![SpecFlow Logo](http://www.specflow.org/specflownew/css/logo.png)