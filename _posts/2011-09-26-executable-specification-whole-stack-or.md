---
layout: post
title: Executable specification - the whole stack or not
date: '2011-09-26T14:45:00.001+02:00'
author: Marcus Hammarberg
tags:
  - BDD
  - .NET
  - Specification by example
modified_time: '2011-09-26T14:45:34.880+02:00'
blogger_id: tag:blogger.com,1999:blog-36533086.post-3657259940402708159
blogger_orig_url: http://www.marcusoft.net/2011/09/executable-specification-whole-stack-or.html
---


This is really an age-old BDD question that pops up from time to time.
Just now I got a question from an ex-colleague about it. A bit rephrased
it something like this:

> Should I test through the GUI all the way down to the database? How do
> you handle test-data in and test executing speed in those cases?

Many of us first got exposed to BDD tests through web applications and
the way that we could test through the actual web page. We use tools
like <a href="http://www.watin.org" target="_blank">Watin</a>, Selenium
and other automation tools to accomplish that. We structure our
automation code with page wrappers to get manageable automation code
that can be re-used in our step definitions. For some BDD even implies
automation (which is not at all the case).

On the "other" side we try to go through the whole stack and go through
all the of the application and hit the database as it's supposed to be
used by the application.
And that's when it strikes us - this thing with test-data is really
hard. And a bit slow also.

#### Through the GUI

Up to this summer I was all for the whole-stack approach since if you
don’t let your acceptance test run through the whole stack you might
leave stuff out. Just imagine how much of a web application today that
is made up by JavaScript for example, that would get tested if you
didn’t test your views. Or for mocked data-access you wouldn’t really
know if that integration actually worked until you tested it manually.

When I read the <a href="http://www.Specificationbyexample.com"
target="_blank">Specification by example</a> book this summer I realized
that many teams that are successful in implementing automated acceptance
tests didn’t test the whole stack with all of their tests. On the key
examples was implemented as full stack tests – while other test for edge
cases or test completeness was executed against the “controller level”
(as in Model-View-**Controller**) and mocked data.

I liked that approach very much. In my last project we ran in to major
problems with the test execution time. We had 300 acceptance tests that
just took too long to execute and was also quite brittle due to some
problems with out GUI automation tool of choice.

So if you don’t have to – don’t go through the GUI.

#### Mind your language

Please note that even if you test through the GUI you should not write
the test in terms of the GUI. Don’t write test scripts (“Click this”,
“Fill out those”, “Choose that” etc.) but rather what focus on the
behavior of the system ("Given I am logged in”, “When I add an item to
the shopping cart”)

#### How about the database

I would argue in the same manner for the database – if you don’t have
to, then don’t hit the real database. But let the key examples go
through the whole stack and hit the database directly.

If you go against a real database you have a few options for managing
test-data:

- Have setup/teardown method that creates (and deletes) the test data
    the tests need. This can in
    <a href="http://www.cukes.info" target="_blank">Cucumber</a>-like
    settings be accomplished with <a
    href="http://www.marcusoft.net/2010/12/using-tags-in-specflow-features.html"
    target="_blank">hooks and tags</a>. I would prefer this approach if
    there’s not too extensive test data to set up.
- Create a test database with known test-data and restore it before
    the tests. Use this approach by selecting out some of your real data
    too be used in tests. You have test data in a known state.

In the cases where you don’t go against real data (using mocks and
stubs) you’ll have more fine grained control over the data your testing
on and can create the edge cases (“should not happen”-stuff) easier.
Also for these test the execution time will be **much** lower.

#### Conclusion

If you don’t have to run through the GUI and the complete application
stack – don’t! Your test will run much faster and be less brittle.
