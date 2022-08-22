---
layout: post
title: Automation of integration tests
date: '2008-10-28T21:03:00.001+01:00'
author: Marcus Hammarberg
tags:
  - Tools
  - Life of a consultant

  - TDD
modified_time: '2010-12-14T16:22:38.225+01:00'
blogger_id: tag:blogger.com,1999:blog-36533086.post-5393877567027229759
blogger_orig_url: http://www.marcusoft.net/2008/10/automation-of-integration-tests.html
---


In my current project we have reached a very good code coverage percent
(98,7 %, yes we are proud) - but we are aspiring to take it a step
further.

We are now constructing a series of integration test, used to run
through the actual production code an verifying that everything works as
expected.

Said and done - I implemented a few test that did that. Soon though some
questions and problems arose;

-   Integration test assumes that something is released and the that
    tests are executed against that release
-   You don't want the integration test to be executed when a developer
    is running the unit test on his development machine inside Visual
    Studio.

When looking around on the net it seems that many [people are
missing](http://timstall.dotnetdevelopersjournal.com/getting_categories_for_mstest_just_like_nunit.htm)
the
[Category](http://www.nunit.org/index.php?p=category&r=2.2)-attribute
from [NUnit](http://www.nunit.org/) in
[MSTest](http://msdn.microsoft.com/en-us/library/ms182489(VS.80).aspx).
That looked like a very nice way to solve the problem but it is not
present in MSTest. They instead talk about
[test-lists](http://geekswithblogs.net/colinbo/archive/2006/03/12/72122.aspx)
but that doesn't solve the problem with running the unit test locally on
the developer machine.

We solved it with a bit more brute force... I created a separate
solution with just the integration tests in it. That solution is added
to the
[SolutionToBuild](http://msdn.microsoft.com/en-us/library/bb399127.aspx)
property group in my build script so that it is compiled. Then I run the
test in the integration test dll via an
[exec-task](http://msdn.microsoft.com/en-us/library/x8zx72cd.aspx) that
run MSTest. That part is only run when a new deploy is made.

Quite easy and maybe not the most beautiful solution ... but it works.

**\[UPDATE\]**

See <a
href="http://www.marcusoft.net/2008/10/how-to-run-mstest-with-publish.html"
target="_blank">this for how we solved the testing in our build
script</a>
