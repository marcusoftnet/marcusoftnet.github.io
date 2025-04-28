---
layout: post
title: "Make a copy of GitHub repo - the script way"
author: "Marcus Hammarberg"
date: 2018-12-14 13:54:21
tags:
 - Programming
 - Node
 - Life of a consultant
---

At [</salt>](https://www.study-at-salt.com/), a boot camp that I've been part of setting up, I get to try all kind of different things that I haven't done before. Mostly around configuring, management and supporting the students computers and our code.

Just last week we had the need for a simple way to do a copy of our GitHub repositories. I did some research and found a simple way that I've put together in a script. I wanted to share it here.

<!-- excerpt-end -->

## The case

At Salt we have all our code, exercises and test checked in at GitHub. A normal workflow includes the students, cloning the repository to a branch with the name of their mob (programming) team. They then commit code to this repository.

This becomes messy as we are running several courses per year and need to keep the different courses separated.

We have, therefor, created a template repository and then make need to make a copy of this template repository for the current course. So we might have a repository called `salt-jsfs-reactstarter` and want a copy, mostly just the master branch, called `salt-jsfs-reactstarter-vt19`, for example.

## What we need to do

Obviously we could do this by just going to the repository on GitHub and make a new repository and then make a local copy and push that. That is [described here](https://help.github.com/articles/duplicating-a-repository/).

But that is boring (i.e. not code :)) and also pretty slow to do if you are going to do it 35 times during 12 weeks.

We needed a way to do this in a single command.

## The tools of the trade

I found a nice little tool called `hub` that you can [read about here](https://hub.github.com/) and install, on OS X, with `brew install hub`.

This opens up a lot of nice commands, but the one that is of particular interest for us is: `hub create` which creates a GitHub repository for us.

In conjunction with `git` itself we now have all the parts we need.

## How to clone the repository - step-by-step

Let’s say that the template repository is called `marcusoft/salt-jsfs-reactstarter` and you want to create a version for the VT19 class called `marcusoft/salt-jsfs-reactstarter-vt19`

1. Open the terminal in any folder with a git repository (it can be an empty one, that you create using `git init .`)
2. Create the repository using `hub create marcusoft/salt-jsfs-reactstarter-vt19`
3. You will need to login in with the credentials you access the saltsthlm organisation
4. Now make a “bare” clone of the template repository `git clone --bare https://github.com/marcusoft/salt-jsfs-reactstarter`
   1. By adding a flag `--single-branch` we can ensure that we only copy the master branch (which is default, or by add a name). This what we need for the most cases and hence the script (below) has this set.
5. Now do: `cd salt-jsfs-reactstarter.git`
6. Mirror-push to the new repository: `git push --mirror https://github.com/marcusoft/salt-jsfs-reactstarter-vt19`
7. Finally remove the temporary clone stuff: `cd .. && rm -rf salt-jsfs-reactstarter.git`

Now you can ask the students to `git clone https://github.com/marcusoft/salt-jsfs-reactstarter-vt19`, but first give them read/write access in GitHub.

Notice that the name of the organization (or user) needs to be included in repository name (`marcusoft/salt-jsfs-reactstarter` for example)

## TL;DR - For the love of God - just give me the script!

Ok. Ok. Ok.

First you need to install [hub](https://hub.github.com/) with `brew install hub`.

Then you can run save the following script as `cloneRepository.sh` :

```bash
#!/usr/bin/env bash

echo "Making a copy of '$1/$2' to a new repo called '$1/$3'"
echo "Hold on ..."

## Store the current directory
cwd=$(pwd)

## Let go to the root and create a temporary place
## to execute the hub command in, because it needs to be run in a git repository
cd ~
mkdir aTemporaryPlace && cd aTemporaryPlace
git init .

## Creating a new empty repository
hub create $1/$3

## Make a new clone
git clone  --single-branch --bare https://github.com/$1/$2
cd $2.git

## Now push a mirror to the new repository
git push --mirror https://github.com/$1/$3

## And clean up after us
cd ~
rm -rf aTemporaryPlace

## Finally take us back to where we started
cd $cwd
```

And then run it with `bash cloneRepository.sh organization orginal-repo new-repo`, for example `bash cloneRepository.sh marcusoftnet salt-jsfs-reactstarter salt-jsfs-reactstarter`.

## Summary

This was pretty fun to work with. That `hub` command opened up the possibilities and made for a nice, short and useful command.

