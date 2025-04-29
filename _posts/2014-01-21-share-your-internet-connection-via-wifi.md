---
layout: post
title: Share Your Internet Connection via WiFi on Windows 8.1
date: 2014-01-21T07:01:00.002Z
author: Marcus Hammarberg
tags:
  - Marcus private
  - Tools
  - Life of a consultant
modified_time: 2014-10-05T12:18:39.121Z
thumbnail: /img/network+configuration+for+wifi+hotspot.png
blogger_id: tag:blogger.com,1999:blog-36533086.post-70385268225734244
blogger_orig_url: https://www.marcusoft.net/2014/01/share-your-internet-connection-via-wifi.html
---

For the first time in years, I'm using a Windows PC as my main computer. It's Windows 8.1, and thanks to a [great introduction video](http://www.hanselman.com/blog/TheMissingWindows8InstructionalVideo.aspx), the transition was quite smooth. Of course, there are things that I miss and keep doing wrong (right-click... had forgotten all about that one), but overall I'm happy.

The first main issue I encountered was sharing my internet connection so that my phone could use it. Nothing strange really—I do this several times a day on my MacBook Pro, and it's dead simple. Click the Network symbol, select "Create network...", give it a name (and optional password), and you're done.

So you can imagine my surprise when I started searching for this in Windows 8.1. There were guides on how to use [DOS commands and other configurations](http://www.youtube.com/watch?v=edc8V9hjUw4) or [stuff to download](http://virtualrouter.codeplex.com/) and install, which ended up crashing on me anyway.

After a few frustrating moments, I found a solution that works, although it's not simple. I wouldn't let my mom do this, but she could probably set up a shared connection on a MacBook.

There's a post that [describes this approach in great detail](http://techotv.com/windows-8-internet-sharing-wifi-hotspot-wireless-ad-hoc/), so this is the short version plus my gotchas.

### Creating the Hosted Network

First, create a .bat file with the following content:

```batch
netsh wlan set hostednetwork mode=allow ssid=YourNetworkName key=YourPassword
netsh wlan start hostednetwork
```

This will create the hosted network (or hotspot if you prefer). The big gotcha here is that you need to run this with administrative privileges. But that's easy now that you have a .bat file. Right-click it and pick "Run as Administrator".

Oh yeah, remember to turn the WiFi on as well. If not, you'll see a decent error message:

> The wireless local area network interface is powered down and doesn't support the requested operation.

### Enabling Internet Access

Creating the network was the easy part. Now we need to let the hosted network use the internet. At this stage, it doesn't have internet access—it's just another network adapter, probably named "Network connection 24" or something.

Here's what you need to do:

![Network Configuration](/img/network+configuration+for+wifi+hotspot.png)

1. Open "Network and Sharing Center". This is easily done by typing "Network and" on the Start screen and selecting it.
2. Click the link to your network connection that has access to the internet. In my case, it was the "Ethernet" network.
3. Click Properties.
4. Click the Sharing tab and check the top box ("Allow other network users to connect through this computer's Internet connection").
5. Select your newly created hosted network.

Yeah, sorry Mum. You won't pull that off. The good news is that this configuration only needs to be done once. Once configured, it will stay this way even if you shut down the hosted network, as long as the network continues to get the same name ("Network connection 9" for example).

The gotcha here was that the first time I did this, the internet access didn't show up for my hosted network for quite some time, although it worked from my phone. It was probably a refresh problem in the "Network and Sharing Center".

### Troubleshooting

Thanks to [Shirai](https://disqus.com/home/user/disqus_8bpw1NO5Db) for this tip: if your laptop cannot create the hotspot:
- Open Network and Sharing Center.
- Change Adapter Settings.
- Right-click on your WiFi Adapter.
- Select Properties.
- Go to the Advanced tab.
- Click on Adhoc support and set the value to Enable.

Thanks a bunch, Shirai!

### Shutting Down the Network

You might want to turn off the network as well. This is easier and just requires you to run the following command from a command prompt with administrative privileges:

```bash
netsh wlan stop hostednetwork
```

### Conclusion

This is a real hassle and shouldn't be this hard. The setup I have now works fine, but it took me about two hours to get it to work. I hope you don't have to spend the same amount of time.

If anyone knows of a better, faster way of doing this, PLEASE let me know. I will happily delete this blog post.