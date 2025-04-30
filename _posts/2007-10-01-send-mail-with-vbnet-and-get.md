---
layout: post
title: Send mail with VB.NET - and get notification if recipient couldn't be reached
date: 2007-10-01T10:50:00.000Z
author: Marcus Hammarberg
tags:
  - VB.NET
modified_time: 2007-10-02T07:40:30.677Z
blogger_id: tag:blogger.com,1999:blog-36533086.post-8792127585828094825
blogger_orig_url: https://www.marcusoft.net/2007/10/send-mail-with-vbnet-and-get.html
---

This has been a hard case to crack for quite sometime now... And it's really annoying since at first the task seems so simple. Bare with me for a short history:

Very often users of a system want to send emails through the application, or send things in the application (document etc.) via email.

That is no biggie, I'll use SMTP-mail - you think... until they add the demand "and of course we need to know if the mail reach the delivery address". Often that last part doesn't come up until the system is in production and the situation occurs.

Now you have some real tricky questions to handle. SMTP is a fire and forget protocol. There is no waiting until the mail has reached the recipient. Until .NET 2.0 that was also the case for us programmers. And of course you don't want to integrated with Outlook or whatever the user is using on there machine.

In .NET 2.0 Microsoft has introduced some asynchronous stuff surrounding SMTP-mail sending, and some great SmtpExceptions. But I am not sure how it's working in reality (see [these links](http://www.google.se/search?hl=sv&sa=X&oi=spell&resnum=0&ct=result&cd=1&q=.net+2.0+SmtpFailedRecipientsException+occurred&spell=1)).

But today I've found a new, easy and quick solution to the problem: "Can you send mail with the application and please inform me if the recipient couldn't be reached?"

The trick lies in a nice little enum on the MailMessage-class, DeliveryNotificationOptions. With this enum you can configure how notifications should be handled. All the notifications get send to the user that sent the email. Simple, yet brilliant.

Here are some example code that shows you how it works. Of course in my favorite language VB.NET:

```vb
' Create the messageDim message As New MailMessage`
' This is address that will get
notifiedmessage.From = New MailAddress("me@home.com")
message.To.Add("to@away.com")
message.Subject = "Subject"
message.Body = "The complete body of the mail"
' Set DeliveryNotificationOptions.OnFailure to state that the From-address
' should be notified if the recipient couldn't be
reachedmessage.DeliveryNotificationOptions = DeliveryNotificationOptions.OnFailure

' Create smtp-service
Dim smtpService As New Net.Mail.SmtpClient("mysmtp.server.com")
'Send the message
smtpService.Send(message)`
```

As i've told my project for some days now this problem is probably the one I've put in most effort on, in all my project, in total... and here is the solution.

Me so happy - me want to cry.
