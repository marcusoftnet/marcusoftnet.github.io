---
layout: post
title: When I learned a safety lesson - and did a little bit better
author: Marcus Hammarberg
date: 2021-06-19T18:32:01.000Z
tags:
  - Programming - Life of a consultant
---

I like to automate repetitive and boring things I do in my daily work. This lead to that me write bash scripts from time to time, but the problem is that I'm a newbie scripter. I'm learning as I go.

And the other day I did a cardinal sin in scripting. Not only that - I decided to show the world. Now that is a point to feel ashamed or to learn. I did both.

In this post, I will tell you about how I made my `curl`-script a little better and a lot safer, but using an old way that's been in `curl` for ages.

<!-- excerpt-end -->

## The background

I was waiting for the summer part of [Salt](https://www.salt.dev) to start and had an hour over. The weather was amazing and I found a nice tree to sit under. Of course, I flipped up the computer and did some scripting.

In fact, I thought that sight was pretty nerdy so I tweeted about it. When I did I added this picture to the tweet.

<img src="/img/codingInTheSun.jpg" width="100%" alt="Coding in the sun" />

Do you see the problem? Well, it took about 2 minutes before [consider the human](https://twitter.com/weitzelb) informed me that I just exposed my GitHub keys.

It was not **that** bad since this was actually an OAuth token that just has permission to list repositories on GitHub, but that is bad enough.

## The script

The script is something I'm very proud of since it saves us from A LOT of work in the instructor's team. I [wrote about it before](https://www.marcusoft.net/2020/08/bash-scripting-to-check-test-status-in-repos.html) but very shortly it verifies the integrity of all our labs, tests, and material. It's about 100 repositories so it's quite cumbersome to do manually.

The script starts with me getting a list of all the repositories using `curl` and the [GitHub API](https://docs.github.com/en/rest). Since I want to read the private repositories in our organization I have to use credentials that have those permissions.

This can be done by:

1. Creating a [personal OAuth token for your account](https://github.com/settings/tokens)
2. Give it the correct scope
3. Save the private key

## The error

You can then call the GitHub API like this:

```bash
curl -u {username}:{oauth toke} -H "Accept: application/vnd.github.v3+json" -s "https://api.github.com/orgs/appliedtechnology/repos?sort=full_name&per_page=100&page=${i}" | jq -r ".[] | select(.archived==false) | .name"
```

[Sad trombone moment](https://sadtrombone.com/), because I just exposed my private key to anyone that uses the script.

## The better way

I started to think about letting the user log on before using the script, but that will not use the OAuth token, and I just want the user to have the very limited privileges that I've given them.

But `curl` is amazing and of course, you can pass credentials in other ways. You could set them in environment variables, if you wanted or, the way that I like; use [`netrc`](https://community.apigee.com/articles/39911/do-you-use-curl-stop-using-u-please-use-curl-n-and.html)  as described [here](https://everything.curl.dev/usingcurl/netrc)

So, let's do that again:

1. Go to your [Developer Settings tokens](https://github.com/settings/tokens)
1. Generate a new token
1. The this token the full repo access, check the top-level scope for repos. Nothing else.
1. Remember to copy the OAuth token
1. Create a new file on your computer at `~/.netrc` with the following content

    ```text
    machine api.github.com
    login [your login]
    password [your generated OAuth token]
    ```

1. Nothing special in that file, no quotes, etc.

Then update the `curl`-command to this:

```bash
curl -n -H "Accept: application/vnd.github.v3+json" -s "https://api.github.com/orgs/appliedtechnology/repos?sort=full_name&per_page=100&page=${i}" | jq -r ".[] | select(.archived==false) | .name"
```

`curl -n` (or `curl --netrc`) will use the credentials from the `~/.netrc` , making your command clean AND safe to check in.

## The summary

So, that's a short little description of how I took someone's (Thank you [consider the human](https://twitter.com/weitzelb) ) advice, as just that, advice and tried to do better.

And I also realized how much greatness has been invested in those all commands that have been around forever.
