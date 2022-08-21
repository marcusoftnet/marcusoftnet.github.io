---
layout: post
title: "Bash script to add file(s) to all repositories in an organisation"
author: "Marcus Hammarberg"
date: 2018-11-09 14:10:45
tags:
 - Programming
  - Life of a consultant
---

> Hey Marcus, can you just add a License file to each of our repositories?
>
> All of them?
>
> Yeah, all 42...

This was a task given to me about 50 minutes ago. I'm done now.

Obviously I spent all that time writing a script to do this. And I wanted to share this with you guys and my future self.

Obviously I learned a lot as well.

<!-- excerpt-end -->

## Game plan

My game plan was pretty easy:

1. Create a `LICENSE` with the proper text.
2. Clone all repositories of the organisation to a new folder
3. Loop over all the repositories and add the `LICENSE` file to each of them
4. Add and commit to git and then push to the remote repository

### Create a static license file

I went to [Choose A License](https://choosealicense.com) , picked an [appropiate license](https://choosealicense.com/licenses/mit/) and create a file out of that text. I ensured to update it with our company name.

### Clone all repository

First part was pretty each to find and [I just ripped this one-liner](https://gist.github.com/caniszczyk/3856584):

```bash
curl -u [[USERNAME]] -s https://api.github.com/orgs/[[ORGANIZATION]]/repos?per_page=200 | ruby -rubygems -e 'require "json"; JSON.load(STDIN.read).each { |repo| %x[git clone #{repo["ssh_url"]} ]}'
```

 Let's walk through this. First the simple things:

* I replaced `[[USERNAME]]` with my username `marcusoftnet`
* I replaced `[[ORGANIZATION]] `with my org ... that was secret. Let call it `MarcusCo` for now.

This created a script that looks like this:

```bash
curl -u marcusoftnet -s https://api.github.com/orgs/marcusco/repos?per_page=200 | ruby -rubygems -e 'require "json"; JSON.load(STDIN.read).each { |repo| %x[git clone #{repo["ssh_url"]} ]}'
```

 I then test ran that first part `curl -u marcusoftnet -s https://api.github.com/orgs/marcusco/repos?per_page=200 ` that just barfed a lot of JSON information about all my repos to the terminal.

That was good because that meant that I understood the second part much easier:

* With Ruby were using a gem call `json`.
* That lets us load that barfed json that `curl` command gave us.
* We loop over that array of results, i.e. the repositories
* For each (`.each { ... }`) we simply do a `git clone` and use the value in the `ssh_url`
  * That actuall didn't really work for me so I changed it into `clone_url`

All in all I ended up with this script:

```bash
curl -u marcusoftnet -s https://api.github.com/orgs/marcusco/repos?per_page=200 | ruby -rubygems -e 'require "json"; JSON.load(STDIN.read).each { |repo| %x[git clone #{repo["clone_url"]} ]}'
```

Running this would bring down all the repositories to the current directory.

Great - on to the next part

### Loop over directories and add a License file to each

This part could most definitely been done more effective, in lines of codes, but I actually understand this part now and it works. Good enough:

```bash
for dir in ./* ; do
  if [ -d "$dir" ]; then
    dir=${dir%*/}

    echo "Copying LICENCE"
    cp ~/cloner/LICENSE ${dir##*/}
  fi
done
```

* That `for dir in ./* ; do` loops over all the files in the current directory
* The `if [ -d "$dir" ]; then` checks that this is a directory
* I then pick out the directory name to a variable called `dir`
* Finally I just copy the `LICENSE` file, at a well known location to this directory

Done. File in place.

### Git add, commit and push

Now all I needed to do was to add this to git, then commit it and finally push it.

I did this in that same loop. Could probably have been done differently but again, I get this and it works.

Here are the commands I used:

```bash
echo "Doing git stuff"
cd ${dir##*/}
git add .
git commit -m "Added MIT license file"
git push
cd ..
```

* I first `cd` into the directory in question, where the `LICENSE` just was copied to.
* `git add .` will add the file to the staging area
* `git commit -m` commits the file with a nice message
* `git push` push the file to the remote
* And then I `cd` back out of the repository for the nex lap in the loop

### House keeping

On the top of the script I create a new directory where all of these actions will take place. I've found this very useful to be able to delete everything to start fresh.

```bash
mkdir tmpClone
cd tmpClone
```

At the end of the script I then list all the `LICENSE` in the sub-directories just to see what got created.

```bash
cd ..
ls tmpClone/**/LICENSE
```

## Full script

The full script looks like this:

```bash
#!/bin/bash

mkdir tmpClone
cd tmpClone

echo "Clone repos"
curl -u marcusoftnet -s https://api.github.com/orgs/marcusco/repos?per_page=200 | ruby -rubygems -e 'require "json"; JSON.load(STDIN.read).each { |repo| %x[git clone #{repo["clone_url"]} ]}'

echo "Repos cloned and ready"
for dir in ./* ; do
  if [ -d "$dir" ]; then
    dir=${dir%*/}

    echo "Copying LICENCE"
    cp ~/Downloads/cloner/LICENSE ${dir##*/}

    echo "Doing git stuff"
    cd ${dir##*/}
    git add .
    git commit -m "Added MIT license file"
    git push
    cd ..
  fi
done

echo "Here's the files I've added"
cd ..
ls tmpClone/**/LICENSE
```

I learned a lot by doing this - the number one thing is that writing script (and a blog post about it) is often faster than to do it by hand...