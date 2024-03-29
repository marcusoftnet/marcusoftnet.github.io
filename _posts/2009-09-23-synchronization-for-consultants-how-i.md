---
layout: post
title: Synchronization for consultants – how I got it to work
date: 2009-09-22T19:19:00.002Z
author: Marcus Hammarberg
tags:
  - Tools
  - Life of a consultant
modified_time: 2010-12-14T15:22:38.188Z
blogger_id: tag:blogger.com,1999:blog-36533086.post-5160297474166719392
blogger_orig_url: http://www.marcusoft.net/2009/09/synchronization-for-consultants-how-i.html
---


OK – this has been quite a journey and I am not completely satisfied
with the solution yet – but I works. During the journey I have also
deleted all my contacts and calendar items on my phone about five times…
Brrr – equally scary each time.

The problem is as follows; as a consultant I am working for customers
that have their own Exchange Server (or similar). When I start there I
am given an account for example <marcus.hammarberg@anycustomer.se>. So
my coworkers at AnyCustomer will start sending me emails and making
appointments in my AnyCustomer-calendar.

Also I work for <a href="http://www.avega.se/" target="_blank">Avega</a>
– that of course supplies me with an email address and accompanying
calendar.

Finally I have a private Gmail account for private stuff.

So I have three synchronization problems; mail, contacts and calendar
items. Here is how I am synching them right now. I hope that a better
solution will present itself later.

#### **Contacts**

I have all my contacts in
<a href="http://www.google.com/contacts" target="_blank">Google
Contact</a>. Then I synchronize them with
<a href="http://support.apple.com/kb/HT2486" target="_blank">Mac Address
Book</a> and with my phone using <a
href="http://www.google.com/support/mobile/bin/answer.py?hl=en&amp;answer=138636"
target="_blank">Google Mobile Sync</a>

#### **Mail**

The excellent
<a href="http://support.apple.com/kb/HT2500" target="_blank">Apple
Mail</a> can handle several inboxes, from several Exchange servers, if
you use IMAP Exchange. I do that and get all my mail into one tool.
Since the top level inbox in Apple Mail shows all inboxes I works like a
charm.

#### Calendar

This is where it gets done to business, because you need to synchronize
calendar items in both directions. So I first decided where my “master”
will be; <a href="http://www.google.com/calendar" target="_blank">Google
Calendar</a> is “in the cloud” and hence is a very good candidate.

I also found a tool that synchronize (watch closely now) <a
href="http://www.google.com/support/mobile/bin/answer.py?hl=en&amp;answer=138636"
target="_blank">Outlook to Google Calendar</a>. So I configure my
Outlook for each customer (and Avega) and then install the
synchronization tool and of we go.

Yeah that means that I still need an Outlook for each exchange account
(Avega and AnyCustomer in my example) in order to get the
synchronization to work. In reality that is not a biggie since my
customers supplies me with Outlook. But it would have been much nicer
with a Exchange to Google sync…

#### Mobile

OK – the final step is to synchronize the mobile (a HTC Touch Dual) with
the Google Stuff… This is <a
href="http://www.google.com/support/mobile/bin/answer.py?hl=en&amp;answer=138636"
target="_blank">described here</a> but seems to have some <a
href="http://www.google.com/support/forum/p/Google+Mobile/thread?tid=493c34793bbff407&amp;hl=en"
target="_blank">things</a> <a
href="http://www.google.com/support/forum/p/Google+Mobile/thread?tid=4801dd2cba81edff&amp;hl=en"
target="_blank">left</a> <a
href="http://www.google.com/support/forum/p/Google+Mobile/thread?tid=3ee4959c6b22532e&amp;hl=en"
target="_blank">before</a> it’s working like a charm…

Might not go mobile yet…

**\[UPDATED\]**

I got it to work after a while. But right now I am only synching the
calendar with my mobile. The emails will only stress me. And the
contacts is alright that they live separate lives for now.

#### Epilogue

If Avega or AnyCustomer decides to upgrade to Exchange 2007, then Snow
Leopard have built in support to synchronize email, calendar and
contacts. Which will make me go through this again and have my Mac Book
Pro as master…
