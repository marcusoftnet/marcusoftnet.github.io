---
layout: post
title: Credentials passing in SOA-solutions for .NET
date: 2006-12-29T07:10:00.000Z
author: Marcus Hammarberg
tags:
  - .NET
  - SOA
modified_time: 2007-01-08T07:33:19.599Z
blogger_id: tag:blogger.com,1999:blog-36533086.post-1388415888810018347
blogger_orig_url: https://www.marcusoft.net/2006/12/credential-passing-in-soa-solutions-for.html
---

So finally I got the opportunity to write some about a finding that
has solved a major problem at my customer. A big thank you to Fredrik A
and Micke for the help on this solution.

The problem is a probably a common one; we have some external web
applications (that is: reachable from the Internet) that uses some
functionality from internal web service. These internal web service in
turn calls a database. The problem probably arise in many SOA solutions
since credentials will flow from server to server.

Since the users of the external applications may be anonymous or logged
into a portal we can't send the user credentials all the way to the
database.

So we thought that making the calls, to the internal web services, under
system account would solve the problem. But then the [double hop
problem](http://marcushammarberg.blogspot.com/2006/12/good-information-concering-double-hop.html)
kicked in and the credentials will "disappear" when going to the
database, resulting in the dreaded "User ('null')" error message from
SQL Server.

So far the problem, the solution was to do a Impersonate when the
internal web service executed. I first thought that this was impossible,
since you actually have to change the credentials for the user running
the current thread. However I was corrected via the [following
article](http://www.codeproject.com/csharp/ZetaImpersonator.asp) which
uses some Windows API to do a impersonation.

In our solution we are using that functionality in such way that the
external web applications are making the request to the internal web
applications under account that only has rights to run the web service.
In that the request a SOAP Header is sent that describes the application
and the type of operation request. The internal web service use the
information in the SOAP Header to do a Impersonation of a suitable
system account.

This works out very well indeed and is a much cleaner solution then
others I've seen. The impact on the code is as small as sending the SOAP
Header and then one using-statement in the internal web service to do
the Impersonation.
