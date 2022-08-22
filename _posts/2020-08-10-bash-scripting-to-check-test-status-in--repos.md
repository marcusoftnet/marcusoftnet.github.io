---
layout: post
title: Bash scripting to check the status of 100 repositories
author: Marcus Hammarberg
date: 2020-08-10T15:38:56.000Z
tags:
  - Javascript - Programming - Life of a consultant
---

At [</salt>](https://salt.study) we have a lot of labs and tests. Last time I counted we just passed 100 repositories. And it's dawned on me that all of those need some love and attention from time to time. Stuff moves pretty fast in the JavaScript world and dependencies might start to act up etc.

At least you'd want to check out the code, do an installation of dependencies and then run the test and see that you get the expected behavior. Preferably you'd also wanna see that we don't have deprecated dependencies or broken stuff. And probably check this, at least once before each course.

This is what scripts are made for, right? Automate the boring stuff.

The only problem is that since we are teaching a lot of different technologies and tools, not two repositories are the same; this one uses Docker and this is actually just text, and over here we have one that is purely for CSS-stuff. In one repository we should have 4 failing tests but no linting errors. In the other, we need 42 liting errors but no failing tests. Etc, etc, etc. It's nigh on impossible to write a script that checks this for me. It's pretty much custom code and checks in every repository.

This problem pushed me to investigate how we could automate this process with bash scripts. I learned a lot and wanted to share a bit.

<!-- excerpt-end -->

## The plan

My [cunning plan](https://www.youtube.com/watch?v=Gp5St7hORyw&feature=youtu.be&t=31) to handle this combination of many repositories to check and custom need in every repository is to:

* create one script (`verifyAllRepos.sh` for example) that loops over all these repositories.
* I will then place a custom script (with a common name `salt_verify.sh` for example) in each repository. This script will do the necessary and customized steps and then report a status code, and some information per repository.

It should work. At this point, the only thing that worried me was that I had no idea how to write these scripts.

## The steps

I'm going to go through the different part and then share the completed script at the end of the post

### Looping over directories

First things first - let's loop over the directories. I have created three directories (`mkdir work fail empty`) to test some different cases later.

Getting the directories into an array turned out to be tricky in itself, but [I found a solution and used](https://stackoverflow.com/a/52281940/314670) it, making the starting script:

```bash
#!/bin/sh

# An array with the directories I'm interested in
dirs=(./*/)
dirs=("${dirs[@]%/}")
dirs=("${dirs[@]##*/}")

# Loop over the directories
for dir in "${dirs[@]}"
do
  echo "$dir"
done
```

Save that in a file called `sh verifyAllRepos.sh ` and then run with `sh verifyAllRepos.sh ` and you'd get a very unsurprising listing of those directories... Not too exciting, but a good start.

Not to make this blog post too long I have excluded the part where I `git clone` all repositories I'm interested in. Not to brag but it's using the GitHub API and filters ... bah, I'm gonna brag. Here's the curl command:

```bash
repos=( $(curl -u user:pwd -s "https://api.github.com/orgs/appliedtechnology/repos?per_page=200" | jq -r '.[].name') )

for repo in ${repos[*]}
do
  repoUrl="https://github.com/appliedtechnology/${repo}"
  git clone -q $repoUrl $repo
done
```

Ok - we have all the repositories and we can loop through them.

### Check for the script file

The next step is the protection step. Because for quite some time not all repositories will have a verification script. We obviously cannot run the script the so we will skip that directory, but we might wanna indicate that no script was present.

We can [use the `test` command to check if a file is NOT present](https://linuxize.com/post/bash-check-if-file-exists/#check-if-file-does-not-exist), or be even bashier and use the `[[ ]]` syntax that I barely understand. Let's go with the first variant that I do understand:

```bash
# as above
for dir in "${dirs[@]}"
 	echo "$dir"

  SCRIPT=$dir/saltVerify.sh
  if ! test -f "$SCRIPT" ; then
    echo "  $SCRIPT does not exist"
  fi
done
```

Let's put an empty `saltVerify.sh` script into the directories `work` and `fail` (`touch work/saltVerify.sh` and `touch fail/saltVerify.sh` should do it).

And now run the script and we should get a report that shows us that `empty` doesn't have a script.

But we forgot something if there's no script we want to break out of this iteration of the loop. Let's add a `continue` after the `echo`-statement. By doing this we have Failed Fast and can safely continue.

Perfect!

### Get the result and exit code from the scripts

The next step is to execute the script, once we know that it exists. But there's a twist - we want to capture the output AND the script result into variables so that we 1) can continue to process the main-script even though one of the `saltVerify.sh` fails and 2) want to do some nice presenting.

Let's make the script in the `fail`-directory fail:

```bash
#!/bin/sh

echo "FAILS"
exit 1
```

and the one in `work` should... eh well... work. I'm gonna fake it like this:

```bash
#!/bin/sh

echo "WORKS"
exit 0
```

The echo-statement is what we want to return as information, imagine this being the output of the installation script, or running the linting or tests. Some text that gives us some indications of if it works as expected or not.

But that's for later, now we just want to run the script and get the exit code and status. This is surprisingly simple:

* the output of a script can be captured in a variable by this command `VAR=$(...)`
* and the exit code even have [separate constant `$?`](https://unix.stackexchange.com/a/217767/163783)

Here's those lines, inside the for-loop, after the check that the script exists:

```bash
	SCRIPT_OUTPUT=$(sh $SCRIPT)
  SCRIPT_EXITCODE=$?
  if [[ $SCRIPT_OUTPUT == 1 ]]; then
    echo "  Verification FAILED"
    echo "  $SCRIPT_OUTPUT"
  else
    echo "  Verification OK"
  fi
```

Running that works just fine. Our skeleton is in place... Now we should just... do something in those scripts we are calling. But before that

## The finished script

The entire script looks like this:

```bash
#!/bin/sh

# An array with the directories I'm interested in
dirs=(./*/)
dirs=("${dirs[@]%/}")
dirs=("${dirs[@]##*/}")

# Loop over the directories
for dir in "${dirs[@]}"
do
  echo "$dir"

  SCRIPT=$dir/saltVerify.sh
  if [ ! -f "$SCRIPT" ]; then
    echo "  $SCRIPT does not exist"
    continue
  fi

  SCRIPT_OUTPUT=$(sh $SCRIPT)
  SCRIPT_EXITCODE=$?
  if [[ $SCRIPT_EXITCODE == 1 ]]; then
    echo "  Verification FAILED"
    echo "  $SCRIPT_OUTPUT"
  else
    echo "  Verification OK"
  fi
done
```

## do something useful

Ok - the content of the script will be different per repository, that was the whole idea, but I'm going to use a simple skeleton here, that we probably want to do for many of the repositories:

* Install the dependencies and count errors and warnings.

* Run linting scripts and make sure that it's the expected number of linting errors

  [^expected linting errors?]: Since most repositories are half-baked there will be many cases where linting errors might be ok. In the best of worlds, we would, of course, want to ensure that it's the **right** linting errors too, but for now, we'll just count'em

* Run the tests and make sure the right number of tests fails, as it should be once the repository is returned.

The script as a whole will return a string with information about the verification and exit status (if any of the tests fail, I'd like to indicate a failure, for example).

Phew - that's quite a tall order... Here's an example, I'll talk through the points below

```bash
#!/bin/sh

# cd to the location of the script
cd "$( dirname "${BASH_SOURCE[0]}" )"

installresult=$(npm i --silent)
if [[ "$installresult" == *"high"* ]]
then
  echo "Installation verified - NOT OK"
  echo $installresult
  exit 1
fi

lintresult=$(npm run lint --silent)
if [[ "$lintresult" == *"error"* ]]
then
  echo "Linting verified - NOT OK"
  echo $lintresult
  exit 1
fi

testresult=$(npm t --silent)
if [[ "$testresult" != *"3 failing"* ]]
then
  echo "Tests verified - NOT OK"
  echo $testresult
  exit 1
fi

# cd back to where we came from
cd - > /dev/null

echo "Installation, linting and testing verified - OK"
exit 0
```

First (and last) we make a little trick to change directory into the directory of the script.

- Getting the directory of the script can be accomplished with `cd "$( dirname "${BASH_SOURCE[0]}" )"`, which was a nifty little trick I [found here](https://unix.stackexchange.com/a/273380/163783)
- Going back to where we just were (last directory that is) is a built-in, but lesser-known command: `cd -`. Here I'm sending the output of the command to `/dev/null` to [supress the irritating output of the current directory](https://superuser.com/a/593697/128561).

A nice little side effect of using this technique is that we can run the script in the directory without any problems. Yay! Win!

We then use the same kind of construct for the three commands this file has:

* Run the command and get the output into a variable `testresult=$(npm t --silent)`
* We then check for content in the output using `if [[ "$testresult" != *"3 failing"* ]]`
  * In this case, we expect 3 tests to fail, for example.
  * If not we return the failure by echoing the output and
  * An exit code of 1 indicating failure

Finally, we exit with the code 0 to indicate success. We don't get there if any of the checks fail. I'm also sending back a nice message indicating what kind of tests we've done.

There are improvements to be made about the last part. We need some kind of `try..finally` handling of all the checks, to be sure to end up in the right spot, regardless of if the script fails or not. But I'll leave that for further examination.

## The summary

I'm no bash-script-guy and I'm sure this can all be shortened into something using `grep` or `awk` but I'm proud that I got this to work. And I picked up new skills:

* `test` and testing for the existence of a file
* looping over an array of strings - that I created from a list of directories!
* finding the location of a script and cd into that
* capturing exit codes and output from another script or command

See - even a bad script can have great learnings in it!

Now, let's just run it on all of those 100+ repositories. I suspect it to take some time.