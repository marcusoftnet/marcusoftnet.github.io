---
layout: post
title: Synchronization for Consultants – How I Got It to Work
date: 2009-09-22T19:19:00.002Z
author: Marcus Hammarberg
tags:
  - Tools
  - Life of a consultant
modified_time: 2010-12-14T15:22:38.188Z
blogger_id: tag:blogger.com,1999:blog-36533086.post-5160297474166719392
blogger_orig_url: https://www.marcusoft.net/2009/09/synchronization-for-consultants-how-i.html
---

OK – this has been quite a journey, and I'm not completely satisfied with the solution yet, but it works. Along the way, I've had to delete all my contacts and calendar items on my phone about five times... Brrr – equally scary each time.

Here's the problem: As a consultant, I work for customers who have their own Exchange Servers (or similar). When I start at a customer, I'm given an account, for example, <marcus.hammarberg@anycustomer.se>. My coworkers at AnyCustomer start sending me emails and making appointments in my AnyCustomer calendar.

I also work for [Avega](http://www.avega.se/), which provides me with an email address and calendar.

Lastly, I have a private Gmail account for personal stuff.

So, I have three synchronization issues: mail, contacts, and calendar items. Here’s how I’m handling them right now. I hope a better solution will present itself later.

## Contacts

I keep all my contacts in [Google Contacts](http://www.google.com/contacts). I then synchronize them with [Mac Address Book](http://support.apple.com/kb/HT2486) and my phone using [Google Mobile Sync](http://www.google.com/support/mobile/bin/answer.py?hl=en&answer=138636).

### Mail

The excellent [Apple Mail](http://support.apple.com/kb/HT2500) can handle multiple inboxes from several Exchange servers if you use IMAP Exchange. I do that, and it consolidates all my mail into one tool. The top-level inbox in Apple Mail shows all inboxes, which works like a charm.

#### Calendar

This is where it gets tricky because you need to synchronize calendar items in both directions. I first decided on [Google Calendar](http://www.google.com/calendar) as my “master” because it’s “in the cloud” and hence a good candidate.

I also found a tool that synchronizes [Outlook to Google Calendar](http://www.google.com/support/mobile/bin/answer.py?hl=en&answer=138636). So, I configure Outlook for each customer (and Avega) and install the synchronization tool.

That means I still need Outlook for each Exchange account (Avega and AnyCustomer) to get synchronization to work. In reality, that’s not a big issue since my customers provide me with Outlook. But it would be nicer to have a direct Exchange-to-Google sync…

#### Mobile

The final step is synchronizing my mobile (an HTC Touch Dual) with Google. This is [described here](http://www.google.com/support/mobile/bin/answer.py?hl=en&answer=138636) but seems to have some [issues](http://www.google.com/support/forum/p/Google+Mobile/thread?tid=493c34793bbff407&hl=en) [left](http://www.google.com/support/forum/p/Google+Mobile/thread?tid=4801dd2cba81edff&hl=en) [before](http://www.google.com/support/forum/p/Google+Mobile/thread?tid=3ee4959c6b22532e&hl=en) it works perfectly...

Might not go mobile just yet…

**[UPDATED]**

I eventually got it to work, but for now, I am only synchronizing the calendar with my mobile. The emails would just stress me out. And the contacts are fine living separate lives for now.

#### Epilogue

If Avega or AnyCustomer upgrades to Exchange 2007, Snow Leopard has built-in support to synchronize email, calendar, and contacts, which will make me revisit this process and possibly make my MacBook Pro the master…
