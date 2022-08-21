---
layout: post
title: Agile testing - how we get it to work date: '2008-11-06T22:06:00.001+01:00'
author: Marcus Hammarberg
tags:
  - Life of a consultant
 - Scrum
   - Agile - TDD
modified_time: '2008-11-06T22:06:01.170+01:00'
blogger_id: tag:blogger.com,1999:blog-36533086.post-3797196069848262973
blogger_orig_url: http://www.marcusoft.net/2008/11/agile-testing-how-we-get-it-to-work.html
---


This week I have made two discoveries that really has made me happy.
They are not news by any means but I has been like they have clicked
into place in my brain.

The first one is surrounding the subject of testing in agile projects,
which a [lot of
people](http://www.google.se/search?hl=sv&q=testing+in+agile+projects&btnG=Sök&meta=)
seems to have opinions about - but I haven't heard anyone go: "Do like
this!". I suspect that it has to do with current testing process are
rigid on many companies and there is a reluctantancy towards changing
the quality assurance process. Also the amount of regression testing
increases for each sprint.

We have had some trouble to get testing to work smoothly in our
projects, but we are closing in on a solution. I do not claim to have
the answerer or not even know much about the theories behind this big
subject - but this works fine for us. And the solution have two
trademarks that I like:

-   it simple ([KISS](http://en.wikipedia.org/wiki/KISS_principle))
-   I haven't invented anything (don't think - steal)

OK - finally. Here is how we make testing in our Scrum project work:

we add a column to our sprint backlog items stating "How to test (this
sprint backlog item)"

we have a [definition of
done](http://www.scrumalliance.org/articles/37-are-we-there-yet) that
includes:

-   unit tests to cover all code
-   tested according to the "How to test" in a separate test
    environment. These tests are made by a tester in order to challenge
    the functionality as well as how it's working.
-   integrationtest created/updated to test the sprint backlog item.
    These test are not written by the same developer that wrote the code

There are some other things in our definition of done also (maybe
another post) of course.

I think that combining manual testing of each sprint backlog item and
keeping automated regression/integration tests in sync will give you a
good quality assurance for things produced in the sprint.

Yes I know that Scrum dictates that you should take each "done" backlog
item all the way to production, but I don't think that's feasible for
large organizations. With our approach you at least can skip a large
amount of system test and go directly to system integration test or
acceptance test, in the normal test process.

As I said - this is my two cents. I really like the idea. Comments?
