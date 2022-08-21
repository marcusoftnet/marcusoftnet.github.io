---
layout: post
title: "Make a command to count my files"
author: "Marcus Hammarberg"
date: 2015-06-01 09:11:03
tags:
 - Tools
 - Marcus private
 - Agile
---

This is a very hands-on post, since I thought the last couple of ones (including the one I just threw away) was a bit high flying.

Here we go - I have grown into a bit of a statistics maniac, especially [when it comes to my blog](https://page-logger.herokuapp.com/www.marcusoft.net). I'm not getting better and I like it. :)

I now found myself in a situation where I simply wanted to count the number of files in my <code>posts</code> directory. In the terminal of my Mac.

<!-- excerpt-end -->

# Count'em

First I found a nice little combination of commands that did exactly that:

<code>ls -1 | wc -l</code>

Yeah, exactly. That doesn't look to hard. And yes - I would never remember that either. My memory is excellent but very short.

# Remember it

Luckily there's a very simple little tool that can make commands like that easier to remember. You can create an *alias* with a name that's easier to remember. Like this for example:

<code>alias count='ls -1 | wc -l'</code>

Sweet! Now I can go <code>count</code> in the current directory and get the number of files, i.e. posts. 977 by the way. Yes I'm proud.

# Permanent it

However - should you close the Terminal window and then, tomorrow, open it again you will be sorry since the <code>count</code> command now is gone. This is a bit surprising and also disappointing.

Well the answer is, with OS X / Linux measures, relatively easy to fix. Open your <code>~/.bashrc</code> file in a text editor (for example with <code>sublime ~/.bashrc</code>) and add your alias in the end of the file.

Like this:

```bash
alias count='ls -1 | wc -l'
```

Now you can close the Terminal, reboot your computer or what ever you fancy and the <code>count</code> command will still be present.

# Parameterize it
Now I realized that I actually have to <code>cd</code> into the directory I wanted to check. And [apparently](http://superuser.com/questions/289117/creating-an-alias-or-function-need-to-be-able-to-pass-in-a-parameter) alias doesn't support parameters to be passed.

But that's easy to fix... Convert it to a function like this:

```bash
function count() {  ls -1 "$1" | wc -l; }
```

The <code>$1</code> is the first parameter passed to the function. The last ;-char is important, or you'll get a syntax error.

This is good because now I can do, for example this:

```bash
count ./Projects/blog/marcusoftnet.github.io/_posts/
```

And see my glorious 977 (sorry) posts again. But I *have* to supply a parameter. It would be cool if it used the current directory is nothing was supplied. Well... that [can be done](http://www.gnu.org/software/bash/manual/html_node/Shell-Parameter-Expansion.html) like this:

```bash
function count() {  ls -1 "${1:-.}" | wc -l; }
```

As everything Linux the commands are terse and super powerful, but basically the form is <code>{parameter:option}</code>. In the <code>option</code> part we give a <code>-</code> which translates to "if not supplied", or default value. In our case it's just the current directory, <code>.</code>.

Put that into your <code>~/.bashrc</code>, save it and restart your Terminal. And now you can go:

```bash
marcus$ count
      13
marcus$ count Projects/blog/marcusoftnet.github.io/_posts/
     977
```

Lovely!

# Summarize it
I love diving into stuff that I know little about. I will not make commands like this everyday but you never know when I (or you ^^) will look here again.