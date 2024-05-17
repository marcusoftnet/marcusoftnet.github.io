---
layout: post
title: "Fun with scripting - running a test suite against 30 different solutions"
author: "Marcus Hammarberg"
date: 2019-10-08 17:34:43
tags:
 - Programming
 - Tools
---

In my current job ([School of Applied Technology](https://salt.dev)) we give out weekend tests each weekend of the 10 first week of each course. With 30 developers in each class, it means that on Monday after each weekend we have a lot of work to do to correct the developer's tests. 

We have basic validation through a suite of tests that we run against the developers' code. And we run linting. The real value, however, comes from comments and suggestions for improvements that we could give to the developer.

To speed the tedious part of the work up we have created a script that helps us:

* Get the developers code into the correct place. 
  The developers upload their solutions to a shared Google Drive and we have the Google Backup tool to synchronize those folders down to our local disk.
* Run the linting and test towards each developer's code. 
  Each test has a separate `test.js` file and quite often different scripts and dependencies to be installed for it to run well. We just want to replace the developers' code when running the tests against the test suite. 
* Report the errors in a nice way

It took some time but now we have a nice script that makes this a one-command exercise. And in the process, we learned a lot. I wanted to share this with you.

<!-- excerpt-end -->

## Disclaimer

I'm not an expert in bash scripting and this could probably be done more effectively and better. But I learned a lot in creating this script. Maybe you will too. 

## Saving my sanity - create a fast feedback loop

The first thing that I've found immensely useful in scripting things is to make the script so that you can run it over and over. For example; don't destroy the original data, but make a copy that you throw away as the script starts. 

And - make sure that the user ends up in the same directory as they started in. For this I used the following little hack:

```bash
# early in the script
# Store the current directory
cwd=$(pwd)

## DO LOADS OF WORK

## late in the script
# Go back to where we were
cd $cwd
```

It's simple but very effective; store the current directory in a variable `cwd=$(pwd)` and then just cd back into that place at the end. If the script crashes this will not happen but hey - I'm still learning. 

## Validation input parameters

A very common problem that causes a lot of problems for a script is that the user doesn't supply the correct number (or type of) parameters. 

Here are a couple of dead-simple checks that just ensures that we have the correct number of parameters. And allows us to inform the user of the usage: 

```bash

if [ $# -eq 0 ]
  then
    echo "No arguments supplied - need a test name and a GoogleDrive sync folder"
    exit 1
fi

if [ -z "$1" ]
  then
    echo "No test name supplied"
    echo "No arguments supplied - need a test name and a GoogleDrive sync folder"
    exit 1
fi

if [ -z "$2" ]
  then
    echo "No GoogleDrive sync folder supplied"
    echo "No arguments supplied - need a test name and a GoogleDrive sync folder"
    exit 1
fi
```

The `if` vs `fi` block has me in stitches every time. It looks weird. 

But basically `$# -eq 0 ` check if the number of arguments is 0. I've not looked into it deeply but I presume that `-z "$1" ` checks if the `$1` is set. The parameters to the scripts get numbered automatically by the order you pass to it `$2` is the second parameter to the script for example. 

There are probably good ways of giving them names and flags but this works for us. For it to be clearer I have instructed in each case that will tell the user what is missing. 

Once we have all the parameters we need (we pass the checks above) we can safely continue without a script. A good first thing to do is to tell the user what we are about to do: 

```bash
echo "Will now correct the '$1' test using test results from the '$2' folder"

```

At least the user will not see what happened if one of those parameters is wrong. 

### Other fixes

Another thing that had me pulling my hair was that we sometimes forgot to add (or not to add - that is the question) a slash at end of paths. This means that we could not safely concatenate paths. 

But I found a little way to put the elusive `/` in if it was missing: 

```bash
GOOGLEDRIVE=$2
length=${#GOOGLEDRIVE}
last_char=${GOOGLEDRIVE:length-1:1}
[[ $last_char != "/" ]] && GOOGLEDRIVE="$GOOGLEDRIVE/"; :
```

This just checks if the last char is a `/` and if not adds it in there. 

## The flow of the script

We now have all the parts we need to write the orchestration of the script. What we want to do is the following:

* Go into the directory for the test, where the `test.js` and `package.json` files exist
* Once in there, install dependencies
* Then loop over all the developers' names and
  * Copy their code
  * Execute the test script against their code
  * Execute the linting script against their code
  * Report to files their results



Let's check how we set that structure up and then talk about the actual work being done later. 

First of all, we need to head into the folder for this test. The script we are executing is the same for all tests but each test behaves a bit different. 

```bash
## cd into the correcting-directory
currentTestCorrectingFolder=./tests/$1/2-correcting
cd $currentTestCorrectingFolder
```

`$1` is the first parameter and holds the name of the rest. Here we are `cd`-ing into that test's `2-correcting` folder. I.e. where the tests and `package.json` file resides. 

Once there we run `npm install` to install all the dependencies. 

We then remove the directory where we will keep the result for all developers:

```bash
## Make a directory
rm -rf oneFolderPerDev
mkdir oneFolderPerDev
```

This is one of the tricks to ensure that we can run the script over and over easily. 



Now for the loop. We've stored all the developers' names in a text file called ... `allDevelopers.txt` and that is read into a variable with the same name: 

```bash
## Get all developers to a variable
allDevelopers=$(<./allDevelopers.txt
```

When we have that variable we can make a loop over each value like this: 

```bash
## Loop over all developers
for item in ${allDevelopers[*]}
do
   echo $item
done
```

This will print the name of each student. That is cool and if I wanted to print fewer (since I'm only handling one or two maybe) I could edit the `allDevelopers.txt` file. 

But we want to do more. First - let's create a folder for this developer and then copy her solution to the new folder: 

```bash
## Loop over all developers
for item in ${allDevelopers[*]}
do
    ## create folder for this developer
    currentDeveloperFolder=oneFolderPerDev/$item
    mkdir $currentDeveloperFolder

    ## copy the results files for this developer
    cp -r "$GOOGLEDRIVE$item/$1/" $currentDeveloperFolder
done
```

Wow! We are now happy that we have the `/` in the right place. That copy expression there will expand to something like: `cp -r "/Google\ Drive/Weekend\ tests/marcus.hammarberg/callbackCalculator oneFolderPerDev/marcus.hammarberg"` for a test called `callbackCalculator`. 

### Running the test script against different solution

There we are now ready to correct this test. 

Here is a command that will run the `test` script in the `package.json` of the current folder: 

```bash
npm t -- $currentDeveloperFolder
```

`npm t` is short for `npm test` (which is short for `npm run test`) and then we are using a feature that lets you pass on additional parameters to a script; `--`. 

This means that the full command would be something like: `npm t -- oneFolderPerDev/marcus.hammarberg `

What is cool about that is that in our test code we can pick up that parameter:

```javascript
const api = process.argv[3] ? require(`./${process.argv[3]}`) : require('.');
```

`process.argv[3]` means is the fourth parameter of the script, where the path to the current developers' solution is found. By checking for its existence we can switch between our, suggested, solution and the developers' solutions seamlessly. 

The `require('.')` means that we pick up the file indicated by the `main` value of the `package.json` . In most cases `index.js`. The same goes for not supplying a file name, in the case of `require('/oneFolderPerDev/marcus.hammarberg/')` for example. 

Our script then executes the test as normal. Our test script looks like this: 

```json
"scripts": {
  "test": "mocha ."
}
```

The last part of running the script is that we are not helped by vomiting 30 test runs to the terminal but we need to store it in a file per developer. This can be achieve by piping the output of the test command to a file: 

```bash
npm t -- $currentDeveloperFolder > $currentDeveloperFolder/mocha-result
```

Now the test result will end up in `/oneFolderPerDev/marcus.hammarberg/mocha-result`. 

### Linting

We are also exercising a strict linting ruleset on the developers' code and that works very much the same: 

```bash
npm run lint -- $currentDeveloperFolder
```

We run the lint command of our `package.json` scripts: 

```json
"scripts": {
  "lint": "eslint"
}
```

Notice how this linting command doesn't have a file name to run on. Typically we want to lint everything in a folder, but in our particular case, we need to set that file to the current developers' folder. So we need to pass it in and then we cannot have the more ordinary `eslint .` in place. 

The result of the linting goes into another file: 

```bash
npm run lint -- $currentDeveloperFolder > $currentDeveloperFolder/eslint-result
```

Now that will end up in `/oneFolderPerDev/marcus.hammarberg/eslint-result`

### The full monty

And that completes the script. It's quite a mouthful to look at, but as with all good code it has evolved in iterative increments. This is how it looks now: 

```bash
#!/bin/bash

if [ $# -eq 0 ]
  then
    echo "No arguments supplied - need a test name and a GoogleDrive sync folder"
    exit 1
fi

if [ -z "$1" ]
  then
    echo "No test name supplied"
    echo "No arguments supplied - need a test name and a GoogleDrive sync folder"
    exit 1
fi

if [ -z "$2" ]
  then
    echo "No GoogleDrive sync folder supplied"
    echo "No arguments supplied - need a test name and a GoogleDrive sync folder"
    exit 1
fi

## add a missing slash if needed on the google drive folder
GOOGLEDRIVE=$2
length=${#GOOGLEDRIVE}
last_char=${GOOGLEDRIVE:length-1:1}
[[ $last_char != "/" ]] && GOOGLEDRIVE="$GOOGLEDRIVE/"; :

echo "Will now correct the '$1' test using test results from the '$GOOGLEDRIVE' folder"

## Store the current directory
cwd=$(pwd)

## Get all developers to a variable
allDevelopers=$(<./allDevelopers.txt)

## cd into the correcting-directory
currentTestCorrectingFolder=./tests/$1/2-correcting
cd $currentTestCorrectingFolder

## Install dependencies
npm i

## Make a directory
rm -rf oneFolderPerDev
mkdir oneFolderPerDev

## Loop over all developers
for item in ${allDevelopers[*]}
do
    ## create folder for this developer
    currentDeveloperFolder=oneFolderPerDev/$item
    mkdir $currentDeveloperFolder

    ## copy the results files for this developer
    cp -r "$GOOGLEDRIVE$item/$1/" $currentDeveloperFolder

    ## run tests
    echo "Running tests in $currentDeveloperFolder"
    npm t -- $currentDeveloperFolder > $currentDeveloperFolder/mocha-result
    npm run lint -- $currentDeveloperFolder > $currentDeveloperFolder/eslint-result
done

## Go back to where we were
cd $cwd
```

## Conclusion

Once the scripts started to work, I almost long to correct the tests. I'm guessing that it saves us about 1-3 hours of tedious copying of files and tests, that have to be correctly done, every Monday.

That time can now be spent giving proper feedback to our developers so that they can improve. 

I learned loads by writing and evolving this script (it was started by someone else) and I hope that you picked something up too. 