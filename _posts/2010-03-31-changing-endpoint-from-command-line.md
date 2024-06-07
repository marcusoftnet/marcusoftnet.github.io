---
layout: post
title: Changing endpoint from the command line when testing services with SOAPUi
date: 2010-03-30T19:42:00.002Z
author: Marcus Hammarberg
tags:
  - Tools
  - .NET
  - Life of a consultant
  - C#
  - WCF
modified_time: 2010-12-14T15:22:38.158Z
blogger_id: tag:blogger.com,1999:blog-36533086.post-7243669668355727942
blogger_orig_url: http://www.marcusoft.net/2010/03/changing-endpoint-from-command-line.html
---

I have been singing <a
href="http://www.marcusoft.net/2010/03/soapui-and-testing-wcf-services-how-i.html"
target="_blank">SOAPUi’s praises</a> <a href="http://www.marcusoft.net/2010/03/soapui-and-msbuild.html"
target="_blank">lately</a> and it’s really great for testing services.
In <a
href="http://www.marcusoft.net/2010/03/soapui-and-testing-wcf-services-how-i.html"
target="_blank">this post</a> I describe how I made the whole thing work
for testing WCF Services.
But, as stated in
<a href="http://www.marcusoft.net/2010/03/soapui-and-msbuild.html"
target="_blank">this post</a>, there was still one more thing to be
solved… The <a
href="http://www.soapui.org/userguide/commandline/testcaserunner.html"
target="_blank">endpoints from the command line</a>. You want to use
different endpoints in different environments. And in my specific
customer case I want one of them to stay the same all of the time, since
that endpoint points (sorry, could not resist myself) to a “singleton”
kind of service.
Luckily the SOAPUi team also have some great support (Thanks Ole, who
replied in Swedish!). So here you have it – how to change the endpoint
for one of your services under test from the command line –
<a href="http://www.marcusoft.net/2010/03/soapui-and-msbuild.html"
target="_blank">which in my case means the build script</a>.

1. I first created a sample WCF service project (very vanilla, I didn’t
   touch the code just the default generated code).
   By the way; really cool hosting and test client stuff in Visual
   Studio 2010

2. I changed the binding to basicHttpBinding since that’s the only
   thing that work with SOAPUi. I used the
   <a href="http://msdn.microsoft.com/en-us/library/ms732009.aspx"
   target="_blank">WCF Service Configuration tool</a> in Visual Studio
   of course.

3. I then created a normal SOAPUi project and let SOAPUi create
   testcases for me. I added asserts just to make sure that the I
   didn’t get an error back.

4. I started my service and ran the testcases – It worked!

5. I then, and here is the trick, created a project-wide property
   (Click project file and chose Custom properties in the lower part of
   the project window) to hold the endpoint value.

   1. I named the project wide property DemoServiceEndpoint
   2. I gave it the address of the service I was testing as value

6. I then opened the tree down to the test request in question and then
   chose the Test Property-tab in the lower part of the project tree

7. Here I entered this expression that reads the value from my project
   wide property:
       ${#Project#DemoServiceEndpoint}

8. I repeated for my other test request and tested. It still worked!

9. OK – we’re closing in now. Now I used the <a
   href="http://www.soapui.org/userguide/commandline/testcaserunner.html"
   target="_blank">Test Runner</a> to create my command (nifty stuff
   SOAPUi dudes!). Here I got the opportunity to set my parameter
   ${#Project#DemoServiceEndpoint}.

10. After some tweaking I managed to “harvest” the command into a
    .bat-file.

    "C:\Program Files (x86)\eviware\soapUI-3.5\bin\testrunner.bat" -sDemoTestSuite -PDemoServiceEndpoint=<http://localhost:8732/Design_Time_Addresses/Marcusoft.SOAPUiDemo.WCFService/Service1/> C:\Dev\Marcusoft.SOAPUiDemo\EndPointOverrideDemo-soapui-project.xml

11. And it worked!

So now I can change the endpoint from the command line! In my build
script when I have deployed the service to the testing environment for
example! Yeah!

You can download
<a href="http://dl.dropbox.com/u/2408484/Marcusoft.SOAPUiDemo.zip"
target="_blank">my example here</a>.
