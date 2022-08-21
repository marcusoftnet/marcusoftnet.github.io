---
layout: post
title: Configure WCF in IIS for anonymous access
date: '2010-05-06T09:15:00.001+02:00'
author: Marcus Hammarberg
tags:
  - Life of a consultant
   - MSBuild - WCF
modified_time: '2010-05-06T09:16:04.780+02:00'
blogger_id: tag:blogger.com,1999:blog-36533086.post-1742965287199499064
blogger_orig_url: http://www.marcusoft.net/2010/05/configure-wcf-in-iis-for-anonymous.html
---


This case may sound strange and I have seen loads of post that describes
how to get out of this behavior. But we have a case where we want to
allow anonymous access and the let a external component manage the
security validation.

This turned out to be very hard to figure out and required some
wizard-like skills of Anders Granåker amongst others.

OK – the case is very simple. I have a WCF Service that I want to allow
anonymous access to. I don’t care about message and transport security
(for now). Just allow anonymous access – I’ll take care of the
authorization in code.

Here is what I had to do to get it to work on Windows 2003 R2:

1.  Create a account on the server
2.  Put that account into the IIS_WPG group
3.  Create a virtual directory for my WCF service
4.  Create an application in that virtual directory
5.  Set the account as Identity on the application pool that the virtual
    directory is using (DefaultAppPool for example)
6.  Set the account as the anonymous account the virtual directory is
    running under (Directory Security)
7.  IISReset to get the settings to take

The last step is a bit interesting… In this time and age you could think
that a simple recycling of the application pool would be enough but …
no. Do an IISReset to be sure.

Another gotcha that confused us a lot was that when you set an account
to be the anonymous account for the virtual directory, you’re prompted
to set the password. And retype it to be sure. But that password is not
check if it’s the right password! Beware – I locked out our
administrator account due to this.

Now it works – and we have a build script that is doing <a
href="http://www.marcusoft.net/2010/04/calling-soapui-testscript-from-msbuild.html"
target="_blank">regressions tests via SOAPUI</a>.
