---
layout: post
title: "Run react-script tests without watch"
author: "Marcus Hammarberg"
date: 2021-05-31 20:23:28
tags:
 - JavaScript
 - React
---

Oh, man! I'm so happy that I'm still sane. This error was about to drive me crazy. 

Here's the back story - we have about 120 repositories with a lot of exercises and tests. This is nigh on impossible to maintain by hand, so we have written scripts to verify the integrity of each repository. Each script is verifying that installation, linting, and testing works as expected.

The whole thing is built-in bash scripts and for the most part, works just fine.  It's quite rewarding to have it checked automatically, [read about it here](https://www.marcusoft.net/2020/08/bash-scripting-to-check-test-status-in-repos.html)

But the repositories that have been created with `create-react-app` have caused problems from day one. They work just fine when we use them normally, but in the script, it's flaky at best and just hangs at worst. 

But. Now. I've. Found. A. Solution.

<!-- excerpt-end -->

## More problem

### React-Scripts and Jest

When you use `create-react-app` it includes some special scripts that encapsulate much of the normal activities, such as starting a development server and running tests. This is done through the `react-scripts` package. For the `react-script test` it is internally calling [Jest](https://jestjs.io/). 

### No tests found related to files changed since the last commit

`No tests found related to files changed since the last commit.` is the error message that keeps popping up for us. It's not an error either but just some information. The problem is that no change has been made, and I still want to rerun all the tests. Force it to run, so to speak.

## No watch, please

And I don't, in the case of running tests, want it to automatically enable watching for file changes. In `react-script tests` this is the [default behaviour](https://github.com/facebook/jest/issues/2765)

## The solution

There is a [flag, `--watchAll=false`](https://jestjs.io/docs/cli#--watchall) that supposedly should help with this, but it didn't do much for me. But there's also a special environment variable `CI` that `react-scripts` (I think) is looking for. 

In the end, the solution was pretty simple (isn't it always), but it bugged the .... it bugged me for a long time:

Where I previously had 

```bash
testresult=$(npm t --silent -- --watchAll=false --json --passWithNoTests)
if [[ "$testresult" != *"\"numPassedTests\":0"* ]]
	# ... error reporting and stuff
fi
```

I now simple add this:

```bash
testresult=$(CI=true npm t --silent -- --watchAll=false --json --passWithNoTests)
if [[ "$testresult" != *"\"numPassedTests\":0"* ]]
	# ... error reporting and stuff
fi
```

`CI=true` was the solution. I don't dare to remove the `--watchAll` 

Hope you spent less time than I on this...