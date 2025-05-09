---
layout: post
title: A Conchango Scrum TFS Template introduction
date: 2008-03-11T14:48:00.007Z
author: Marcus Hammarberg
tags:
  - TFS
modified_time: 2010-12-14T15:22:51.429Z
blogger_id: tag:blogger.com,1999:blog-36533086.post-309585422301317756
blogger_orig_url: https://www.marcusoft.net/2008/03/short-conchango-scrum-tfs-template.html
---

I have been quite [frustrated](https://www.marcusoft.net/2008/03/conchango-burndown-char-not-showing.html) with the [Conchango Scrum TFS Template](http://scrumforteamsystem.com/).

And not so much because the template is no good - its just that I can't get up and running to be able to validate if the template is any good. The reason for this is the lack of introduction documentation. There are some pages on their site, but it doesn't show me any good ways on how to get started.

Now after my [last post](https://www.marcusoft.net/2008/03/conchango-burndown-char-not-showing.html) I've got a suggestion to mail the Conchango-guys and they actually got back to me pretty fast. And from them I got another lead to one of their forum (that you of course have to register to see, excuse my stupidity).

The post the pointed me to clarified a lot of stuff for me;

- the data showing in reports and burn downs is not online. It comes from a data warehouse that is updated hourly. This explain why my updates didn't take... There are also reports that need an overnight to update.
- It seems to be better to use the web-client (Team Plain) since it supports the command Add related item that automatically relates a Sprint backlog item with a product backlog item. You can do it via the Links-tab in Team Explorer - but it feels a bit cumbersome...

OK - so how do you get started then. This is by the way ripped from the [excellent post](http://scrumforteamsystem.com/cs/forums/1646/ShowPost.aspx)
(ap ap ap... members only) by Crispin Parker

1. **Set up your sprint**. Sprints need to have a start and end date before they can be reported on. *Marcus comment* Here you'll need to ponder how to use areas and iterations, since sprints are completely based on them
2. **Create your Environments and Teams.** You can do this from the project portal (right click on the project name in Team Explorer) and it only needs to be done once per project.
3. **Create your user stories.** Define a list of product backlog items (PBI). Don't forget to assign the iteration path, this links PBIs to sprints.
4. **Create your sprint backlog tasks** Using the "Add related item" menu option from the PBI context menu sets up the links automatically. Otherwise you can set PBI  ->  SBI relations in the links tab.
5. **Burn-down your backlog.** As work is completed and progress is made, mark the changes on the SBIs. Reducing the work remaining figures as needed.

This was all that I needed.... Why couldn't a short list like this be included in the documentation from the outset? Well now it's here instead.
