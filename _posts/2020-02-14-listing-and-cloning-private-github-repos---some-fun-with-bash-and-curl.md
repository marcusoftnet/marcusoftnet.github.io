---
layout: post
title: "Listing and cloning private GitHub repos - some fun with bash and curl"
author: "Marcus Hammarberg"
date: 2020-02-14 12:00:53
tags:
 - Programming
---

My current role is awesome - I get do do some agile coaching, quite a lot of teaching, reading up on new tech and from time to time some programming.

Yesterday evening someone just blurted out: what if all of us died at once?! All the code and documentation would be hidden in a cloud somewhere and we will not be able to get it.

That cloud is GitHub and I'm sure it would be safe and that the risk that we all die at the same time is relatively low. Then again - I have booked a raw chicken tasting for our next offsite ...

Just kidding - but when that was said my programmer-self sprung to life and I deviced, in my head, a simple script to make an offline copy.

This post describes that script. Oh - I only had 30 minutes spare time to do it in. That was my timebox and I actually managed to pull it off. The finished script is about 5 lines of code... but I'm still proud.

<!-- excerpt-end -->

The [GitHub Api](https://api.github.com/) is great and a display in a well designed REST-ful interface. You should check it out. In this post I will use that API... Yes I have heard about `hub` and the new GitHub CLI but now I will use the simple HTTP(s) API interface.

## Get all, even private, repositories of an organisation

Ok getting the respositories for an organization is just a GET request away:

```bash
curl -s "https://api.github.com/orgs/{orgname}/repos?per_page=200&type=all
```

Problem is that if I run that command using my orgname instead of `{orgname}` I only get the public repositories. Which is quite natural since I need to authenticate first.

You can authenticate in many different ways but I choose to create a personal access token for my user, by simply going to [my settings](https://github.com/settings/) and then [add a new token](https://github.com/settings/tokens) on that page. The upside of this approach is that I can easily setup the access rights to suit this scripts particular needs and I can revoke this permission from the site, should it go awry.

You can [create an access token from the command line](https://help.github.com/en/github/authenticating-to-github/creating-a-personal-access-token-for-the-command-line), but I didn't do that this time around. It felt a bit to tricky for me given the time scope. Let me know if you did it and I'll share it here.

We can now use this personal access token and authenticate that get request. It will look something like this:

```bash
curl -u marcusoftnet:{access token here} -s "https://api.github.com/orgs/{orgname}/repos?per_page=200&type=all"
```

If you ~~put that in your pipe and smoke it~~ run that you will see lovely blob of JSON being out ralphed out in the terminal. Bom - we have all the private repos listed.

## Get the urls for cloning

But that is very tricky to read - let's use a little command called `jq` (installable via Homebrew if you're on a Mac) and tidy it up a bit.

With `jq .` it will be pretty printed for us, which is nice - but we can also transform the data to only get the data we are actually interested in. For example we could write this to just get the `html_url` from each repository

```bash
jq -r '.[].html_url
```

And thanks to amazing wisdom of the bash Gods of old, we can then pipe one commands result into another. Putting the `curl` together with the `jq` it becomes something like:

```bash
curl -u marcusoftnet:{access token here} -s "https://api.github.com/orgs/{orgname}/repos?per_page=200&type=all" | jq -r '.[].html_url'
```

Lovely! A long list of only the URL to the repositories

## Looping over the result

This is nice and everything, don't get me wrong - but I want to loop over that list and issue a `git clone` for each.

First I want that list that we are now just displaying into a bash variable so that I can then write a loop over it. It's time to write a script.

```bash
#!/bin/bash

repos=( $(curl -u marcusoftnet:{access token here} -s "https://api.github.com/orgs/{orgname}/repos?per_page=200&type=all" | jq -r '.[].html_url'))

for repo in ${repos[*]}
do
  echo "Backing up $repo"
  git clone $repo
done
```

Let see:

* Creating a variable in bash is `var=value` and my array will be called `repos`
* But putting the result of the `curl | jq` was tricker but after a while I found that `($( command))` would do the trick
* We can now loop over these `repos`. Yes - there's probably a regex way of doing this in another one-liner but now I was running out of time. I whipped out the trusty old `for`-loop. A weapon for a more civlized age.
  * `for repo in ${repos[*]}` will iterate over the array of repos and creating a variable called `repo` that is the current item
  * In the `do ... done` block we can now operate on that variable
  * In my case this is pretty simple - I just clone the repository to my current directory `git clone repo`
* And Done

## Conclusion

That's it - this was my whole script. It took me about 35 mins to write and most of it was researching how to get the result of the `curl | jq` into an variable that I could loop over. And setting up the access token.

Now we can safely take that chain-saw juggling course and be comfortable that should something happen we have an offline backup that is stored ... ap ap ap - that is company secrets.
