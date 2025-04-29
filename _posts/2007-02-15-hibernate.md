---
layout: post
title: NHibernate
date: 2007-02-15T13:23:00.001Z
author: Marcus Hammarberg
tags:
  - .NET
  - NHibernate
modified_time: 2010-01-29T12:51:21.367Z
blogger_id: tag:blogger.com,1999:blog-36533086.post-8056115601936291389
blogger_orig_url: https://www.marcusoft.net/2007/02/hibernate.html
---

OK - it is now official. I am in love!

For sometime now I have had some ideas that the Hibernate framework is
cool, but I have not seen it in action. But now I have and it is
wonderful... so nice and cool.

The [Hibernate](http://www.hibernate.org/) framework solves the tedious
work of mapping your objects in C# (or Java as it is originally) to
tables in the database. This is accomplished through mapping files in
XML, so it is easy to maintain over time.

It's so clean and reduce the database coding to a mere minimum. Also
this will make you focus on the right stuff, such as business logic.

I am still a rookie (just playing around with it for a short while yet)
but this will be my melody from now. Here is some code lines that
convinced me:
`// Open a new session to retrieve the just saved user  session = factory.OpenSession();  User joeUser = (session.Load(typeof(User), "[id]") as User);`
`// Update a property  joeUser.LastLogon = DateTime.Now;`
`// Flush the changes back  session.Flush();`

`// The database is now updated!!!`
