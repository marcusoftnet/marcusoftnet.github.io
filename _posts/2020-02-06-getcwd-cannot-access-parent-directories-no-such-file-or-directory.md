---
layout: post
title: "getcwd: cannot access parent directories: No such file or directory"
author: "Marcus Hammarberg"
date: 2020-02-06 21:07:00
tags:
 - Programming
 - Life of a consultant
---

The other day we started a new course here at [</salt>](http://salt.study) And the first day we are used to seeing some confusion from the developers and the odd strange, wrongly configured computer (by us). But the error in the title of this blog post:

```bash
 getcwd: cannot access parent directories: No such file or directory
```

had me scratching my head for quite some time. Until I realized that the error message states what was wrong.

<!-- excerpt-end -->

The whole thing is quite simple: the team I was helping got this, or similar errors whatever command they tried to run:

`ls`?

```bash
shell-init: error retrieving current directory: getcwd: cannot access parent directories: No such file or directory
```

`open .`?

```bash
LSOpenURLsWithRole() failed with error -50 for the URL ./.
shell-init: error retrieving current directory: getcwd: cannot access parent directories: No such file or directory
```

Even `pwd` was just barfing out error:

```bash
/Users/marcus/adir
shell-init: error retrieving current directory: getcwd: cannot access parent directories: No such file or directory
```

But that last part had me thinking, maybe the directory was gone somehow?

Let's try it:

1. Open a terminal window and go `cd ~`
2. Create a new directory and cd into it `mkdir adir && cd adir`
3. Now, open a new terminal window and go to that same place `cd ~`
4. Now, delete the directory `rm -rf adir`
5. Finally - go back to the previous window and try to do just about any command you can come up with and it will give you errors like the ones above.

Not surprisingly, since you are in essence running the command in a directory that doesn't exist.

Easy to mix up when you are new to the terminal - and apparently hard to grasp even if you have been using the terminal for years...
