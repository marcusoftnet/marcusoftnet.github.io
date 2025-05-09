---
layout: post
title: "package.json: Engines & engineStrict - And How to Use Them"
author: "Marcus Hammarberg"
date: 2015-03-24 11:14:54
tags:
  - Javascript
  - Tools
---

I've been diving into [io.js](https://iojs.org) recently for reasons that will soon become clear. In doing so, I've used my favorite Node version manager, [Node Version Manager](https://github.com/creationix/nvm), to handle different versions of [Node.js](http://nodejs.org) and io.js.

Switching between versions is straightforward, but occasionally I end up running code on a version of Node/io.js that the code doesn't support. For instance, running EcmaScript 6 `let` statements in Node.js.

I hoped for a [warning](https://www.marcusoft.net/2015/01/koa-and-the-referenceerror-promise-is-not-defined.html) or even an error to alert me to this mismatch, but none appeared. So...

In this post, I'll explain how to use the `package.json` file to get warnings and errors when running code on an unsupported version of the framework.

<!-- excerpt-end -->

## Engines

In `package.json`, there's an optional `engines` field. From the [documentation](https://docs.npmjs.com/files/package.json), we learn that:

> You can specify the version of node that your stuff works on.

This field allows you to list not only Node.js but also alternative runtimes like io.js and [npm](http://npmjs.org). You can specify versions or ranges:

```json
{ "engines": { "iojs": "1.6.1" } } // Exactly 1.6.1
{ "engines": { "npm": "~1.0.20" } } // Around 1.0.20
{ "engines": { "node": ">0.11.9" } } // Above 0.11.9
{ "engines": { "node": ">=0.10.3 <0.12" } } // Between 0.10.3 and 0.12 (exclusive)
```

You can also state that your application supports multiple versions of Node.js. For example, many Node applications that don't use EcmaScript 6 features compatible with io.js can work with both Node.js and io.js. The [Koa](http://koajs.com) framework's `package.json` looks like this:

```json
"engines": {
    "node": ">= 0.11.16",
    "iojs": ">= 1.0.0"
}
```

Koa supports both Node.js and io.js at the specified versions.

## engineStrict

There's another optional field in `package.json` called `engineStrict`. The documentation states:

> If you are sure that your module will definitely not run properly on versions of Node/npm other than those specified in the engines object, then you can set "engineStrict": true in your package.json file.

Additionally, regarding the engines field:

> ...unless the user has set the engine-strict config flag, this field is advisory only.

By default, `engineStrict` is false, making the `engines` field advisory only.

Setting `engineStrict` to true makes it more restrictive. For example, if you use features unique to io.js, like EcmaScript 6 `let` statements, you can use:

```json
"engineStrict": true,
"engines": {
    "iojs": "1.6.1"
}
```

This ensures that only io.js version 1.6.1 is used when running your module. But how is this enforced?

## Using the Engines Configuration

This is cool, but how do you use it? Let's test it. Suppose your `package.json` has:

```json
"engineStrict": true,
"engines": {
    "node": "0.12.0"
}
```

If you’re currently running Node.js version `v0.11.14` (for example, by running `nvm install v0.11.14`), and you run `npm install` in your application directory, you might expect an error due to the version mismatch. However, no error or warning appears. Everything installs happily, and the application starts, unless there’s a syntax error.

> Is this a bug?

Marcus, a few days ago.

It turns out that `engines` configuration is checked during the installation of **packages**. Remember that `npm` stands for Node **Package** Manager. The `engines` field is also part of `package.json`. I initially hoped this would be checked when running the application, but it's actually verified during **package** installation, not when running the application.

The `npm install` command in your application folder only installs your application's _dependencies_. If any dependencies require a different version of Node.js, you will get a warning or error (depending on the `engineStrict` setting).

Here’s a trick:

1. Go up one directory: `cd ..`
2. Run `npm install` on your application folder, for example: `npm install myApp`

This will install your application as a package and trigger the checks for `engines` and `engineStrict`.

Try it again with the same settings: `engines: node = 0.12.0`, and `engineStrict = true`. You’ll see the error:

```bash
npm ERR! notsup Not compatible with your version of node/npm: demoapp@1.0.0
npm ERR! notsup Required: {"node":"0.12.0"}
npm ERR! notsup Actual:   {"npm":"2.0.0","node":"0.11.14"}
```

With `engineStrict` set to false, you get warnings but the installation proceeds:

```bash
npm WARN engine demoapp@1.0.0: wanted: {"node":"0.12.0"} (current: {"node":"0.11.14","npm":"2.0.0"})
```

Finally, if you adjust the `engines` to match your running version (0.11.14), it installs without errors.

## Summary

With the advent of io.js, it’s important to be vigilant about the engines used for your code, especially when deploying to services like [Heroku](http://www.heroku.com).

Understanding how `engines` and `engineStrict` behave will be valuable, and I hope you find this information useful too.
