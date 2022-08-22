---
layout: post
title: SOAPUi and testing WCF Services – how I made it work
date: 2010-03-03T12:12:00.001Z
author: Marcus Hammarberg
tags:
  - Tools
  - .NET
  - Agile
  - WCF
modified_time: 2010-12-14T15:22:38.160Z
blogger_id: tag:blogger.com,1999:blog-36533086.post-4181984269981750147
blogger_orig_url: http://www.marcusoft.net/2010/03/soapui-and-testing-wcf-services-how-i.html
---


I have <a
href="http://www.marcusoft.net/2008/12/soap-ui-great-way-to-do-integration.html"
target="_blank">already blogged</a> about
<a href="http://www.soapui.org/" target="_blank">SOAPUi</a> but then it
was more me thinking and seeing it was a good idea to use SOAPUi to do
testing of service.

Now I have actually done this – and I love it so far. In the last
project where we our deliverable was a service I think we spent about
30% of our time creating and maintaining the test client.

Not to speak about all the time we had to spend explaining for the
client that “no this is NOT the GUI you will see later on”.

So the thought of a general test client for SOAP services is very
compelling. And
<a href="http://www.soapui.org" target="_blank">SOAPUi</a> has done a
great job making your job easy and fun… Almost all of the time.

They have an amazing
<a href="http://www.soapui.org/userguide/index.html"
target="_blank">amount of documentation</a>. I guarantee that everything
I am about to tell you is in there somewhere… This is my short story for
our case.

So the case is as follows – I have a quite simple WCF service. One trick
is that we need to call a common security service (let’s call it SECI)
to get a token that we have pass into our operations.

We have worked contract first and started with a WSDL-file. I used
<a href="http://wscfblue.codeplex.com/" target="_blank">WSCF.blue</a>
(great tool) to generate the service stub. And then…

- I <a href="http://sourceforge.net/projects/soapui/files/soapui/3.5"
    target="_blank">downloaded SOAPUi</a>. Go on - do it now- it’s free!
- I created a <a
    href="http://www.soapui.org/userguide/projects/images/new_wsdl_project.gif"
    target="_blank">new project</a> by pointing the wizard to my
    WSDL-file. I also asked the tool to create a starter testcase for
    me.
    Beware of the location or endpoint address – it’s read from the
    WSDL-file and most likely you will need to change that to your
    computer or the server where your service is deployed.
- I then added a new WSDL to the SECI service to the project. This is
    needed to be able to call

I was now ready to create my test case with the test steps I need to
call the SECI service and insert the token into the request I wanted to
test.

First I created some parameters for my test suite. This is actually
hidden away a bit.

- Open the test suite editor by right clicking it and chose “Show
    TestSuite Editor”
- In the lower section of the editor you’ll find a “tab” that is named
    Properties
- Here you can add properties that will be visible for the whole test
    suite
- I added some inparameters to the SECI service and the token I will
    pass on

I then called the SECI service, passing it values from the parameters I
created in the earlier step.

To get the values from the response of the SECI service into the request
to my service I used a <a
href="http://www.soapui.org/userguide/functional/propertytransfers.html"
target="_blank">Property Transfer</a>. In it I transferred the value of
the token node into a variable that holds the property for the token.
It’s a quite deep structure with dropdown boxes and namespaces in the UI
here but it’s not to hard to understand.

Finally I could easily insert the value of the token variable into my
request, as before.

It wasn’t to hard after I got understanding about the variables for the
testsuite. I sure beats having to code your test client manually…

Great work SOAPUi!
