---
layout: post
title: My post scaffolder for Jekyll
author: Marcus Hammarberg
date: 2014-12-09T08:09:13.000Z
tags:
  - Tools
---

I've just started to use <a href="http://jekyllrb.com">Jekyll</a> as my blogging engine. It's mostly nice but I'm getting used to a new tool. And maybe actually the lack of tools since it's just markdown and git.

One of the things that I found early to be a stumbling block was to create a new post. Since I'm still fresh to the structure of the YAML front-matter I found myself copying and pasting. Missing and missunderstanding.

So I looked for a post generator and found <a href="https://gist.github.com/kabrooski/6107707">this gist</a> that is used, at the command line, to scaffold up the structure of a new blog post.

Let me show you how I tweaked it and a problem that I ran into, being a newbie.
<!-- excerpt-end -->
## Tweaking the script

I'm very much a newbie in bash script files so bare with me and please enlighten me if this can be better.

First of all I changed the constants at the top to my settings:

* I'm always using Sublime so the editor becomes: <code>editor=sublime</code>
* My layout, template for the posts, is called post and my director for posts is also standard so I left those.
* I added a new constant for author <code>author="Marcus Hammarberg"</code>

Jekyll has something called categories and something called tags. I cannot really tell them apart but I'm using tags on my blog. So I went through the script and replaced "category(ies)" with "tag(s)".

Tags goes in the front matter and should be listed one tag per line, each line starting with a dash ("-"). This caused me some problems and I had to do some hair pulling and scratching of cheek to get it to work.

Here's the gist (pun intended) of it
<script src="https://gist.github.com/marcusoftnet/2eec785d3477beacf709.js"></script>

* On line 98 we issue the <code>read -p "Tags: " tags</code> command that prompts the user with a "Tags:" prompt and stores whatever he enters into the tags variable.

* The if statement on line 99 checks if any tags was created

* Line 100 to 103 is where the magic happens. This is where we write the tags to the file <code>echo "tags:" >> $filename</code>

  * Line 101 writes the first part, notice how the line *doesn't* end with a quotation. This is how you do newlines in a string on OSX. Very ugly in my mind... Moving on.

  * Line 102-103 uses the <code>sed</code> command to look through the <code>$tags</code> variable, replacing commas <code>/,</code> with a newline and a dash <code>\-</code>. Again notice the new line trickery.

  * The final part of line 103 just writes it out to the $filename

## Using the script

When I first used the script I was a bit surprised, because I thought that you just executed the script at the prompt. Apparently you have to send it to the bash command. Like this: <br>
<code>bash scaffold_post "A post title"</code>

<img src="/img/scaffoldedPost.jpg" style="float:right" width="50%">Once that you execute the script it will ask you for tags. Separate them with a comma as you remember and a nice post will be scaffolded for you. It will even open in Sublime (or what ever editor you have configured) and look something like this.

Thank you <a href="https://gist.github.com/kabrooski">Daara Shaw</a> for that great gist. Helped me lot!
