---
layout: post
title: "Speed up Jekyll site regeneration"
author: "Marcus Hammarberg"
date: 2015-11-26 09:51:58
tags:
 - Tools
 - Life of a consultant
---

I'm a happy [Jekyll](http://jekyllrb.org) user since about 1 year ago. Really nice experience so far and the auto-hosting on [GitHub](http://github.com) is just an added bonus that lifts the joy a little more. 

The only thing is that I have 1017 posts on this blog. When I write the posts, locally, Jekyll rerenders all of them. That takes up to 50 seconds. 

I feel the need. The need for more speed. 

<a name='more'></a>

# TL;DR
Use the <code>--limit_posts</code> switch to your <code>jekyll serve</code> command to significantly speed up re-generation and hence feedback.

# Longer version
I've written before [my post scaffolder](/2014/12/my-post-scaffolder-for-jeyll) which is a handy little script to get started. The other script I have made is a very simple script for starting my site locally. Here it is: 

```bash
jekyll serve --watch
```

This just starts my blog locally and <code>watch</code> all folders for changes. If a change is found the entire site is regenerated. A normal editing round might look like this: 

```bash 
$ ./start_local 
Configuration file: /Users/marcus/Projects/blog/_config.yml
            Source: /Users/marcus/Projects/blog
       Destination: /Users/marcus/Projects/blog/_site
      Generating... 
                    done.
Auto-regeneration: enabled for '/Users/marcus/Projects/blog'
Configuration file: /Users/marcus/Projects/blog/_config.yml
Server address: http://127.0.0.1:4000/
Server running... press ctrl-c to stop.
    Regenerating: 1 file(s) changed at 2015-11-26 09:43:32 ...done in 48.513174 seconds.
    Regenerating: 1 file(s) changed at 2015-11-26 09:44:20 ...done in 43.576925 seconds.
    Regenerating: 1 file(s) changed at 2015-11-26 09:46:13 ...done in 45.518559 seconds.
```

That's too slow, since I in this stage of editing mainly fix layout and typos. 

But today I saw a switch called <code>--limit_posts</code> and gave it a try with only the last 1 post regenerated. Sure enough the time dropped significantly, almost instant feedback. Awesomery! 

Here's my new command

```bash 
jekyll serve --watch --limit_posts 1
```

And now when I save I get times like these:

```bash 
Regenerating: 1 file(s) changed at 2015-11-26 10:06:44 ...done in 1.745348 seconds.
Regenerating: 1 file(s) changed at 2015-11-26 10:07:09 ...done in 1.845595 seconds.
Regenerating: 1 file(s) changed at 2015-11-26 10:07:41 ...done in 1.764797 seconds.
Regenerating: 1 file(s) changed at 2015-11-26 10:07:52 ...done in 1.793467 seconds.
Regenerating: 1 file(s) changed at 2015-11-26 10:08:02 ...done in 1.735383 seconds.
```

A much more workable solution. Fast feedback is key for a good writing flow. Note that this only happens on my local development machine. Once I push it to [GitHub](http://www.github.com) I presume an full site regeneration happens. 

**NOTE** The obvious drawback is that only the last 1 posts is generated. Are you editing all post you need to regenerate the whole thing. 

I'm now looking into adding some kind of auto-refresh of the browser too. Post that later. 

