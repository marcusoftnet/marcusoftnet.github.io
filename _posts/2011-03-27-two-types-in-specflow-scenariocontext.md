---
layout: post
title: Two types in SpecFlow; ScenarioContext and
FeatureContext
date: '2011-03-26T22:04:00.001+01:00'
author: Marcus Hammarberg
tags:
  - BDD
  - .NET - SpecFlow
modified_time: '2013-04-07T20:31:58.395+02:00'
thumbnail: http://lh6.ggpht.com/\_TI0jeIedRFk/TY5UwUjWZkI/AAAAAAAAA7c/cCrQjjWIuao/s72-c/marking%20steps%20as%20pending_thumb.jpg?imgmax=800
blogger_id: tag:blogger.com,1999:blog-36533086.post-6352021831868808402
blogger_orig_url: http://www.marcusoft.net/2011/03/two-types-in-specflow-scenariocontext.html
---


<div dir="ltr" style="text-align: left;" trbidi="on">

The other day I got the opportunity to try to figure out some
elaborative error handling with
<a href="http://www.specflow.org/" target="_blank">SpecFlow</a> and had
to check up the ScenarioContext a bit closer. It turns out that there
are some stuff on it that can be useful from time to time. And that it
was a FeatureContext object as well.
This post looks a bit closer on these to guys and gives some tips on how
you might want to use them in your code.


### ScenarioContext

Most of us has at least seen the ScenarioContext from the the code that
SpecFlow generates when a missing step definition is found:

> ``` brush:
> [Binding]
> public class StepDefinitions
> {
>     [Then(@"I don't have this step definition in place yet")]
>     public void ThenIDonTHaveThisStepDefintionInPlaceYet()
>     {
>         ScenarioContext.Current.Pending();    }
> }
> ```


But there are some other interesting stuff you can do with and get from
that object. I’ve tried to write scenarios that show that off. You can
<a
href="https://github.com/marcusoftnet/ProgressiveNetDemos/tree/master/Specs/031ScenarioContext"
target="_blank">find the code here</a>.

#### ScenarioContext.Pending

Well – this method is known to most of us, as I said. This is default
behavior for a missing step definition, but you can also use it directly
if (why?) you want to.

[<img
src="http://lh6.ggpht.com/_TI0jeIedRFk/TY5UwUjWZkI/AAAAAAAAA7c/cCrQjjWIuao/marking%20steps%20as%20pending_thumb.jpg?imgmax=800"
title="marking steps as pending" data-border="0"
style="background-image: none; border-bottom: 0px; border-left: 0px; border-right: 0px; border-top: 0px; display: block; float: none; margin: 0px auto; padding-left: 0px; padding-right: 0px; padding-top: 0px;"
width="420" height="111" alt="marking steps as pending" />](http://lh4.ggpht.com/_TI0jeIedRFk/TY5Uv2c-s4I/AAAAAAAAA7Y/7qIUYw9rg-Y/s1600-h/marking%20steps%20as%20pending%5B2%5D.jpg)

[<img
src="http://lh5.ggpht.com/_TI0jeIedRFk/TY5UxZKJKTI/AAAAAAAAA7k/pUVR41aJoa4/step%20defintions%20with%20pending_thumb.jpg?imgmax=800"
title="step defintions with pending" data-border="0"
style="background-image: none; border-bottom: 0px; border-left: 0px; border-right: 0px; border-top: 0px; display: block; float: none; margin: 0px auto; padding-left: 0px; padding-right: 0px; padding-top: 0px;"
width="420" height="191" alt="step defintions with pending" />](http://lh5.ggpht.com/_TI0jeIedRFk/TY5Uw8mrBfI/AAAAAAAAA7g/meTAZ9NTztQ/s1600-h/step%20defintions%20with%20pending%5B2%5D.jpg)


#### ScenarioContext.Current

This is a very useful feature of the ScenarioContext that helps you to
store values in a Dictionary between the steps. This helps you to
organize your step definitions better that if you would use private
variables in the step definition class.

There are some type safe extension methods that helps you to get values
in and out of the dictionary in a safer way. To get that you need to
include the namespace TechTalk.SpecFlow.Assist, since they are extension
methods on the ScenarioContext.

Darren Cauthon has done a
<a href="http://www.youtube.com/watch?v=IGvxMPX55vE"
target="_blank">video on that</a> and written about it on
<a href="https://github.com/techtalk/SpecFlow/wiki/ScenarioContext"
target="_blank">the SpecFlow wiki</a>. Here is my example on that:

[<img
src="http://lh6.ggpht.com/_TI0jeIedRFk/TY5UyCf7WLI/AAAAAAAAA7s/OrA2eteYSl8/scenario%20for%20storing%20in%20dictionary_thumb.jpg?imgmax=800"
title="scenario for storing in dictionary" data-border="0"
style="background-image: none; border-bottom: 0px; border-left: 0px; border-right: 0px; border-top: 0px; display: block; float: none; margin: 0px auto; padding-left: 0px; padding-right: 0px; padding-top: 0px;"
width="420" height="84" alt="scenario for storing in dictionary" />](http://lh6.ggpht.com/_TI0jeIedRFk/TY5Ux9tI-OI/AAAAAAAAA7o/usnIwRMJAw4/s1600-h/scenario%20for%20storing%20in%20dictionary%5B2%5D.jpg)

[<img
src="http://lh3.ggpht.com/_TI0jeIedRFk/TY5UzsLaSwI/AAAAAAAAA70/684ao1Sf--k/storing%20and%20retriving%20via%20typesafe%20extensions_thumb.jpg?imgmax=800"
title="storing and retriving via typesafe extensions" data-border="0"
style="background-image: none; border-bottom: 0px; border-left: 0px; border-right: 0px; border-top: 0px; display: block; float: none; margin: 0px auto; padding-left: 0px; padding-right: 0px; padding-top: 0px;"
width="420" height="241"
alt="storing and retriving via typesafe extensions" />](http://lh4.ggpht.com/_TI0jeIedRFk/TY5UzPSVEwI/AAAAAAAAA7w/P9ppLVS-4xw/s1600-h/storing%20and%20retriving%20via%20typesafe%20extensions%5B2%5D.jpg)


#### ScenarioContext.ScenarioInfo

You can also get hold of some information about the scenario you’re
executing right now. For example the title and the tags of it:

[<img
src="http://lh3.ggpht.com/_TI0jeIedRFk/TY5U0o7mDwI/AAAAAAAAA78/yeoenqiIwdM/feature%20for%20scenarioInfo_thumb.jpg?imgmax=800"
title="feature for scenarioInfo" data-border="0"
style="background-image: none; border-bottom: 0px; border-left: 0px; border-right: 0px; border-top: 0px; display: block; float: none; margin: 0px auto; padding-left: 0px; padding-right: 0px; padding-top: 0px;"
width="420" height="136" alt="feature for scenarioInfo" />](http://lh4.ggpht.com/_TI0jeIedRFk/TY5UzyheXsI/AAAAAAAAA74/Fag-DN7_wcw/s1600-h/feature%20for%20scenarioInfo%5B2%5D.jpg)

[<img
src="http://lh4.ggpht.com/_TI0jeIedRFk/TY5U19GOIfI/AAAAAAAAA8E/GFzebkpXpRA/title%20and%20tags%20from%20scenarioinfo_thumb%5B1%5D.jpg?imgmax=800"
title="title and tags from scenarioinfo" data-border="0"
style="background-image: none; border-bottom: 0px; border-left: 0px; border-right: 0px; border-top: 0px; display: block; float: none; margin: 0px auto; padding-left: 0px; padding-right: 0px; padding-top: 0px;"
width="339" height="305" alt="title and tags from scenarioinfo" />](http://lh3.ggpht.com/_TI0jeIedRFk/TY5U1JOsMeI/AAAAAAAAA8A/DQPgOtdqd6o/s1600-h/title%20and%20tags%20from%20scenarioinfo%5B5%5D.jpg)

More interesting maybe is the ability to check if an error has occurred.
That’s done with the ScenarioContext.Current.TestError property, which
simply is the exception that has occurred.

You can use that to do some interesting “error handling” as I told you
above. Here is an un-interesting version:

[<img
src="http://lh4.ggpht.com/_TI0jeIedRFk/TY5U210K9II/AAAAAAAAA8M/_Uw2DHRKZaA/feature%20for%20test%20error_thumb.jpg?imgmax=800"
title="feature for test error" data-border="0"
style="background-image: none; border-bottom: 0px; border-left: 0px; border-right: 0px; border-top: 0px; display: block; float: none; margin: 0px auto; padding-left: 0px; padding-right: 0px; padding-top: 0px;"
width="420" height="70" alt="feature for test error" />](http://lh3.ggpht.com/_TI0jeIedRFk/TY5U2XKXNPI/AAAAAAAAA8I/eopgGbw6SP4/s1600-h/feature%20for%20test%20error%5B2%5D.jpg)


[<img
src="http://lh3.ggpht.com/_TI0jeIedRFk/TY5U33n9ecI/AAAAAAAAA8U/VQzGzzzrDhs/using%20test%20error%20to%20log_thumb.jpg?imgmax=800"
title="using test error to log" data-border="0"
style="background-image: none; border-bottom: 0px; border-left: 0px; border-right: 0px; border-top: 0px; display: block; float: none; margin: 0px auto; padding-left: 0px; padding-right: 0px; padding-top: 0px;"
width="420" height="229" alt="using test error to log" />](http://lh6.ggpht.com/_TI0jeIedRFk/TY5U3Vx22mI/AAAAAAAAA8Q/2izRZ0hIgHc/s1600-h/using%20test%20error%20to%20log%5B2%5D.jpg)

This is another example (which was the way I looked into this in the
first place):

[<img
src="http://lh3.ggpht.com/_TI0jeIedRFk/TY5U5GPcH6I/AAAAAAAAA8c/cSC7iqnD3CU/using%20mvccontrib%20to%20capture%20failing%20screen_thumb.jpg?imgmax=800"
title="using mvccontrib to capture failing screen" data-border="0"
style="background-image: none; border-bottom: 0px; border-left: 0px; border-right: 0px; border-top: 0px; display: block; float: none; margin: 0px auto; padding-left: 0px; padding-right: 0px; padding-top: 0px;"
width="420" height="189"
alt="using mvccontrib to capture failing screen" />](http://lh4.ggpht.com/_TI0jeIedRFk/TY5U4Z4YN7I/AAAAAAAAA8Y/ccbLsdGKHXQ/s1600-h/using%20mvccontrib%20to%20capture%20failing%20screen%5B2%5D.jpg)

Here I am using
<a href="http://mvccontrib.codeplex.com/" target="_blank">MvcContrib</a>
to capture the screen of the failing test, and naming the screen shot
after the title of the Scenario. So by combining the <a
href="http://www.marcusoft.net/2010/12/using-tags-in-specflow-features.html"
target="_blank">use of hooks</a> and the knowledge of ScenarioContext
when can do some interesting stuff, don’t you think?

#### ScenarioContext.Current.CurrentScenarioBlock

You can also get hold of the “type” of step your on (Given, When or
Then) which is pretty cool, but I cannot see and immediate use of it.

[<img
src="http://lh4.ggpht.com/_TI0jeIedRFk/TY5U54TeO4I/AAAAAAAAA8k/MT8wnactvhU/current%20scenarioblock%20feature_thumb.jpg?imgmax=800"
title="current scenarioblock feature" data-border="0"
style="background-image: none; border-bottom: 0px; border-left: 0px; border-right: 0px; border-top: 0px; display: block; float: none; margin: 0px auto; padding-left: 0px; padding-right: 0px; padding-top: 0px;"
width="414" height="130" alt="current scenarioblock feature" />](http://lh6.ggpht.com/_TI0jeIedRFk/TY5U5rqZTaI/AAAAAAAAA8g/OAD5NaejvUU/s1600-h/current%20scenarioblock%20feature%5B2%5D.jpg)

[<img
src="http://lh4.ggpht.com/_TI0jeIedRFk/TY5U6yuKLEI/AAAAAAAAA8s/uWegZLBHqlI/current%20scenarioblock%20stepdefinition_thumb.jpg?imgmax=800"
title="current scenarioblock stepdefinition" data-border="0"
style="background-image: none; border-bottom: 0px; border-left: 0px; border-right: 0px; border-top: 0px; display: block; float: none; margin: 0px auto; padding-left: 0px; padding-right: 0px; padding-top: 0px;"
width="420" height="138" alt="current scenarioblock stepdefinition" />](http://lh3.ggpht.com/_TI0jeIedRFk/TY5U6QnvCUI/AAAAAAAAA8o/CneKglARyLM/s1600-h/current%20scenarioblock%20stepdefinition%5B2%5D.jpg)


### FeatureContext

There is a FeatureContext as well. The difference of course is that the
FeatureContext exists during the execution of the complete feature while
the ScenarioContext only exists during a scenario.

The <a
href="https://github.com/marcusoftnet/ProgressiveNetDemos/tree/master/Specs/032FeatureContext"
target="_blank">code for my FeatureContext scenarios is here.</a>

#### FeatureContext.Current

FeatureContext also have a Current property which holds a Dictionary.
But I works in exactly the same way as the ScenarioContext.Current so I
won’t go into details of it. It’s actually implemented with the same
class SpecFlowContext so it IS the same behavior.

#### FeatureContext.FeatureInfo

The FeatureInfo is a bit more elaborative than the ScenarioInfo, but it
works in the same manner:

[<img
src="http://lh3.ggpht.com/_TI0jeIedRFk/TY5U8MRc1fI/AAAAAAAAA80/V5ecBAl1Zl4/featureInfo%20scenario_thumb.jpg?imgmax=800"
title="featureInfo scenario" data-border="0"
style="background-image: none; border-bottom: 0px; border-left: 0px; border-right: 0px; border-top: 0px; display: block; float: none; margin: 0px auto; padding-left: 0px; padding-right: 0px; padding-top: 0px;"
width="420" height="245" alt="featureInfo scenario" />](http://lh6.ggpht.com/_TI0jeIedRFk/TY5U7u3hNHI/AAAAAAAAA8w/QkvdsIaK-j4/s1600-h/featureInfo%20scenario%5B2%5D.jpg)

[<img
src="http://lh3.ggpht.com/_TI0jeIedRFk/TY5U9bary6I/AAAAAAAAA88/M51s91mRnAQ/step%20definition%20for%20featureinfo_thumb.jpg?imgmax=800"
title="step definition for featureinfo" data-border="0"
style="background-image: none; border-bottom: 0px; border-left: 0px; border-right: 0px; border-top: 0px; display: block; float: none; margin: 0px auto; padding-left: 0px; padding-right: 0px; padding-top: 0px;"
width="316" height="305" alt="step definition for featureinfo" />](http://lh4.ggpht.com/_TI0jeIedRFk/TY5U8qF_UZI/AAAAAAAAA84/_ZHJZlhIiXg/s1600-h/step%20definition%20for%20featureinfo%5B2%5D.jpg)

Also I should mention here that FeatureContext exposes a Binding Culture
property that simply points to the culture the feature is written in
(en-US in our example).

### Conclusion – what is this good for?

So now that we know about this – what is it good for?

For me this kind of information can be most useful combined with the <a
href="http://www.marcusoft.net/2010/12/using-tags-in-specflow-features.html"
target="_blank">use of hooks</a> so that you can get better logging,
better tracing and more customized logging of the execution of your
scenarios.

I hope you learned something. I sure did <img
src="http://lh6.ggpht.com/_TI0jeIedRFk/TY5U96X4E5I/AAAAAAAAA9A/HoE2No4q_FM/wlEmoticon-winkingsmile%5B2%5D.png?imgmax=800"
class="wlEmoticon wlEmoticon-winkingsmile"
style="border-bottom-style: none; border-left-style: none; border-right-style: none; border-top-style: none;"
alt="Winking smile" />.
<a href="https://github.com/marcusoftnet/ProgressiveNetDemos/"
target="_blank">The code is here.</a>

</div>
