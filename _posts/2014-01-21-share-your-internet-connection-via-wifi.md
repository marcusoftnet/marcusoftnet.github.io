---
layout: post
title: Share your internet connection via WiFi on Windows 8.1
date: 2014-01-21T07:01:00.002Z
author: Marcus Hammarberg
tags:
  - Marcus private
  - Tools
  - Life of a consultant
modified_time: 2014-10-05T12:18:39.121Z
thumbnail: >-
  http://3.bp.blogspot.com/-8rPX2yoxHtc/Ut4bQmQgvFI/AAAAAAAAB2g/iG-Vu-z5u9s/s72-c/network+configuration+for+wifi+hotspot.png
blogger_id: tag:blogger.com,1999:blog-36533086.post-70385268225734244
blogger_orig_url: http://www.marcusoft.net/2014/01/share-your-internet-connection-via-wifi.html
---


<div>

<div>

For the first time in years, I'm using a Windows PC as my main computer.
It's Windows 8.1 and thanks to a <a
href="http://www.hanselman.com/blog/TheMissingWindows8InstructionalVideo.aspx"
target="_blank">great introduction video</a> the transition was quite
nice. Of course there are things that I miss and keep doing wrong
(right-click... had forgot all about that one), but overall I'm happy.

The first main thing that I ran into was when I was planning on sharing
my internet connection so that my phone could use it. Nothing strange
really. I do that several times a day on my MacBook Pro. And it's
dead-simple too. Click the Network-symbol and go "Create network...",
give it a name (and optional password) and you're done.
So you can imagine that I was surprised when I
started to search for this in Windows 8.1. It was guides on how to use
<a href="http://www.youtube.com/watch?v=edc8V9hjUw4"
target="_blank">DOS-commands and other configuration</a>. Or
<a href="http://virtualrouter.codeplex.com/" target="_blank">stuff that
I should download</a> and install (and that ended up crashing on me
anyway).

After a few hair pulls and, yes I admit, some screaming, I got around to
a solution that at least works. Even though it's not simple. I wouldn't
let my mom do this. And she could probably set up an shared connection
on a Mac Book.

There's a post that <a
href="http://techotv.com/windows-8-internet-sharing-wifi-hotspot-wireless-ad-hoc/"
target="_blank">describe this approach in great detail</a> and much
better than me, so this is the short version + my gotchas.

First, create a .bat-file with the following content.

</div>

This will create the hosted network (or hotspot if you want). The big
gotcha here is that you need to run this under Administrative
privileges. But that's easy now that you have a .bat-file. Right-click
it and pick "Run as Administrator".

Oh yeah, remember to turn the WiFi on as well. If not you'll see a
pretty decent error message so it's not biggie:

> > The wireless local area network interface is powered down and
> > doesn't support the requested operation.

### Let them use internet

Well, that was not so hard, you think to yourself. And so did I. But now
we actually need to let the hosted network use internet. Yes, I don't
really know what it's is in this stage, but it doesn't have internet
access. It's just another network adapter. Probably named "Network
connection 24" or something.

Here's what you need to do:

<div class="separator" style="clear: both; text-align: center;">

<a
href="http://3.bp.blogspot.com/-8rPX2yoxHtc/Ut4bQmQgvFI/AAAAAAAAB2g/iG-Vu-z5u9s/s1600/network+configuration+for+wifi+hotspot.png"
data-imageanchor="1"
style="clear: right; float: right; margin-bottom: 1em; margin-left: 1em;"><img
src="http://3.bp.blogspot.com/-8rPX2yoxHtc/Ut4bQmQgvFI/AAAAAAAAB2g/iG-Vu-z5u9s/s1600/network+configuration+for+wifi+hotspot.png"
data-border="0" width="320" height="212" /></a>

</div>

Open "Network and Sharing Center". This is easily done by a well-hidden
gem of Windows 8.1.

- Go to the Start-screen and just start typing "Network and" and it
    will show up for you to select.

Click the link to your network connection that has access to Internet.
In my case the "Ethernet"-network.

Click properties

Click the Sharing-tab and check the top box ("Allow other network users
to connect through this computer's Internet connection")

And ... select your newly created hosted network

<div>

Yeah, sorry Mum. You wont pull that off. The only good news is that this
configuration only needs to be done once. Once configured this will stay
this way even if you shutdown the hosted network. As long as the network
continues to get the same name ("Network connection 9" for example).

</div>

<div>

</div>

<div>

The gotcha here was that the first time I did this the Internet access
didn't show up for my hosted network for quite some time. Although it
worked from my phone. It was some kind of refresh problem in the
"Network and Sharing center" probably.

### Problems

Apparently some people have a few problems getting this far. Thanks to
<a href="https://disqus.com/home/user/disqus_8bpw1NO5Db"
target="_blank">Shirai</a> I've got this tip; if your laptop cannot
create the hotspot, open Network and Sharing Center -\> change Adapter
Setting -\> right click on your Wifi Adapter -\> Properties -\> Advanced
tab - \> Click on Adhoc support... -\> set value - Enable.

Thanks a bunch Shirai!

</div>

### Shutting the network down

<div>

Oh yeah, you might want to turn this off as well. That ~~easy~~ easier
and just requires that you run the following command, from a command
prompt with administrative privileges:

</div>

> <span style="font-family: monospace; white-space: pre;">netsh wlan
> stop hostednetwork

### Conclusion

This is a real hustle and shouldn't have to be this hard. The setup I
have now works fine, but it took me about 2 hours to try to get it to
work. I hope you don't have to spend the same amount of time.

If anyone knows of a better, faster way of doing this: PLEASE let me
know. I will happily delete this blog post.

</div>
