---
layout: post
title: "Getting Elixir to run on my OsX (init terminating in do_boot)"
author: "Marcus Hammarberg"
date: 2015-06-29 08:59:55
tags:
 - Tools
 - Life of a consultant
---

I hear more and more about [Elixir](http://elixir-lang.org) from [some](https://twitter.com/DevLCSC) [people](https://twitter.com/jlind) that I really trust and respect. That means checking-out-new-technology-time for Marcus.

Luckily installing Elixir on Os X (Yosemite 10.10, that I'm running) is super simple with [Homebrew](http://brew.sh/):

{% highlight bash%}
brew update
brew install elixir
{% endhighlight%}

Or is it ...

Not for me as it turns out. I hope you had a better fate. This is my story.

<a name='more'></a>

Becasue when that was all done I ran <code>elixir -v</code> to check my version number and got: 

{% highlight bash%}
"{"init terminating in do_boot",{undef,[{elixir,start_cli,[],[]},{init,start_it,1,[]},{init,start_em,1,[]}]}}"
{% endhighlight%}

In the output from Homebrew I saw just a little warning but nothing that was particularly scary. So I did what every professional programmer does; searched the Internets. And on [GitHub I found this issue](https://github.com/elixir-lang/elixir/issues/2911) for Elixir, which sounds exactly like that I was looking for.

# Yak-shaving: Erlang
Ok... it seems like my version of [Erlang](http://www.erlang.org/), since Elixir "leverages the Erlang VM" was out of date. 

But when I ran (in all honestly after I've spent ca 45 minutes finding out how to start anything Erlang): <code>erl</code>, to run the Erlang interperator, it looked great:

{% highlight bash%}
Marcus-Bandung-MBP:~ marcus$ erl
Erlang R15B02 (erts-5.9.2) [source] [smp:4:4] [async-threads:0] [hipe] [kernel-poll:false]

Eshell V5.9.2  (abort with ^G)
1> 
{% endhighlight%}

Erlang is doing great. Hmmm... Could it be a old version of Erlang? Erlang is also installed with Homebrew, so I tried to install it again and hopefully update it: <code>brew install erlang</code>. Now it got interesting: 

{% highlight bash%}
Marcus-Bandung-MBP:~ marcus$ brew install erlang
Warning: erlang-17.5 already installed, it's just not linked
{% endhighlight%}

# Yak-shaving: Homebrew
Installing a package with Homebrew consists of several step: download, install and linking (I think). One of the steps has failed. This was the little warning I got when I installed Elixir as I mentioned above. 

Luckily you can <code>link</code> a package after it's been downloaded. For example <code>brew link erlang</code>, or to force it <code> brew link --overwrite erlang</code>. 

{% highlight bash%}
Marcus-Bandung-MBP:~ marcus$ brew link --overwrite erlang
Linking /usr/local/Cellar/erlang/17.5... 
Error: Could not symlink lib/erlang/Install
/usr/local/lib/erlang is not writable.
{% endhighlight%}

And do not try <code>sudo</code> in front of it. Homebrew doesn't think that's a good idea and tells you with a hilarious error message...

But what did it say? <code>/usr/local/lib/erlang is not writable.</code> Maybe I can help it?

# Yak-shaving: Os X
Ha! Writable my aXX! I can fix that: <code>sudo chmod -R 777 /usr/local/lib/erlang</code>.

Sadly that didn't help much. The linking command from above (<code> brew link --overwrite erlang</code>), still failed with the same error (<code>/usr/local/lib/erlang is not writable</code>).

And the folder, and sub-folders (the <code>-R</code>-switch), was indeed writable. 

# Yak = shaved clean
What to do? Well, out of a whiff I just tried: <code>brew reinstall erlang</code> again. And it worked. 

When you do a <code>brew reinstall</code> the old installation is removed first. This basically just <code>uninstall</code> and then directly <code>install</code> a formula. 

My thinking is that I had, for some reason, an older version of Erlang installed. Maybe even failed install. When Homebrew tried to install a new version of Erlang it failed, since the folders was not writable. When I made them writable the <code>reinstall</code> worked. 

# Conclusion
Just for good measures I actually did a <code>brew reinstall elixir</code> too. Just to make sure that the dependencies was in good order. 

After that I could start coding Elixir. This is the full extent of my Elixir knowledge. Strap in: 

{% highlight bash%}
Marcus-Bandung-MBP:~ marcus$ elixir -v
Elixir 1.0.4
Marcus-Bandung-MBP:~ marcus$ iex
Erlang/OTP 17 [erts-6.4] [source] [64-bit] [smp:4:4] [async-threads:10] [hipe] [kernel-poll:false] [dtrace]

Interactive Elixir (1.0.4) - press Ctrl+C to exit (type h() ENTER for help)
iex(1)> 4+4
8
{% endhighlight%}

Yeah. This tool looks amazing! 

Thanks to the [Stockholm Elixir Slack-group](https://stockholm-elixir.slack.com/messages/elixir/) that listen to me while I hammered away to fix this. 