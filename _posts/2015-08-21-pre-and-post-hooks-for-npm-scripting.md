---
layout: post
title: "Pre and Post hooks for npm scripting"
author: "Marcus Hammarberg"
date: 2015-08-21 07:03:49
tags:
 - Javascript
 - NodeJs
 - Tools
---

[npm](http://www.marcusoft.net/2014/02/mnb-npm.html) is at the core of developing in [Node](http://www.nodejs.org). Most of us use it to get packages, set up the [package.json](http://www.marcusoft.net/2014/02/mnb-packagejson.html) etc. 

But when you put it together with the vast possibilities in package.json you get another gear. Then npm can actually become a [build tool](http://blog.keithcirkel.co.uk/how-to-use-npm-as-a-build-tool/) - driving every aspect of your development. Without getting unwieldy and out of control.

In this post I wanted to examine one of the lesser known features of scripting with npm and package.json; <code>pre</code>- and <code>post</code> hooks. In doing so I will most likely brush on a lot of other subjects too. 	We'll see how it goes. 

<a name='more'></a>

I'll keep my [code here](https://github.com/marcusoftnet/preposthooks)

# The scripts
Pretty soon after starting to use the package.json file we start to use the <code>scripts</code>-node. In fact when you use <code>npm init</code> to set up your <code>package.json</code> file a test script is created for you. Often it looks something like this: 

{% highlight javascript %}
"scripts": {
    "test": "echo \"Error: no test specified\" && exit 1"
}
{% endhighlight %}

That's not much to look at (and you should probably change it to something that actually does something useful, like running your tests), but it can still teach us some about the <code>scripts</code>-node. 

So, a command is defined for me. In this case an <code>echo</code> reminding me to add some test facilities to my application / package. 
How can I run this? 

All scripts under <code>scripts</code> can be executed with <code>npm run-script [script name]</code>. Like this, to run our test command: 

{% highlight bash %}
npm run-script test
{% endhighlight %}

This command with simply just run whatever code found under the <code>test</code>-key of the <code>scripts</code>-node.

Luckily there's a short form too and it's more commonly used:

{% highlight bash %}
npm run test
{% endhighlight %}

This is awesome because that means that we now can have scripts in our <code>package.json</code> that we can use <code>npm</code> to execute. A first, vital, step towards a build tool. 

## test and start
There are two scripts that <code>npm</code> supports out of the box; <code>test</code> and <code>start</code>. When I write _supports_ it's more like; there's very convenient, well-known short cuts for them. 

So instead of <code>npm run start</code> we can go <code>npm start</code>. Testing is even cooler; we can choose from these options:

{% highlight bash %}
npm run test
npm test
npm tst
npm t
{% endhighlight %}

But the really useful thing about these "well known" scripts is that tools and infrastructure in the Node world knows that they exists and can make use of them. For example, when you push code to [Heroku](http://www.heroku.com) it will launch your application with <code>npm start</code>. Or you continuous integration platform might run test, by convention by simply executing <code>npm test</code>.

# Hooks; pre and post
Before I get completely side tracked here let's go back to the theme of the this post; pre and post hooks. 

This is one of the lesser known and used features of npm scripting I think. And it's a bit funny that this is "lesser" known and used, since it's actually the first thing that they write about [in the documentation](https://docs.npmjs.com/misc/scripts).

Ok anyway; all scripts supports <code>pre</code> and <code>post</code> hooks or scripts. They are automatically run by <code>npm</code> before (<code>pre</code>) and after (<code>post</code>) their respectively script / command. Aka JustWhatIThought (tm)

The pre/post scripts are for all intents and purposes just another script in your <code>package.json</code> file. They are also defined under the <code>scripts</code>-node. 

For example; the script you've defined (if any) under <code>pretest</code> is run before the <code>test</code> script. And subsequently the <code>posttest</code> script is run after. 

Here's an example;, you can find all my [code here](https://github.com/marcusoftnet/preposthooks):

{% highlight javascript %}
"scripts": {
    "test": "mocha -u bdd -R spec",
    "pretest": "rm -r ./logs/ && mkdir logs",
    "posttest": "rm -r ./logs/ && mkdir logs"
}
{% endhighlight %}

In this contrived example my tests creates some log files and I need to remove them, and recreate the folder, before (and after) I run my test. Easy to accomplish with the <code>pre</code> and <code>post</code> hooks. If you haven't seen it <code>&&</code> is a simple way of running a few commands in a row.

<blockquote>Note that you should probably clean up test-data in your test code but it works as an example</blockquote>

## Hooks out the box
There's quite a few hooks that <code>npm</code> knows about out of the box, and hence will run for you, if they are defined: 

* The <code>npm</code> command <code>publish</code> will run: 
	* <code>prepublish</code>
	* then <code>publish</code> 
	* and finally <code>postpublish</code> 
* <code>install</code> has <code>preinstall</code> and <code>postinstall</code>
* <code>uninstall</code> also have pre and post hooks
* <code>version</code> 
* <code>test</code>, that we talked about
* <code>start</code> 
* <code>stop</code> 
* <code>restart</code>

For all of these there's respectively <code>pre</code> and <code>post</code> hook. This comes very handy to manage the life cycle of your application. 

# Custom scripts
What makes <code>npm</code> more useful, and what actually makes it a viable build tool, is that you can define your own, custom scripts. 

Remember that you <code>npm test</code> actually was a short-cut for <code>npm run test</code> (which in turn is a short-cut for <code>npm run-script test</code>)? 

Well there's nothing stopping you from defining your own script and run them. Here's a script that I've defined to run [jslint](http://www.jslint.com) over my code. The "tool that makes developer cry". I'm one of those guys I guess... 

{% highlight javascript %}
"scripts": {
    "lint": "jslint '*.js'"
}
{% endhighlight %}

I can now run this by simply going <code>npm run lint</code> and it will lint all my files in the root directory. 

Yes, I've could have defined the script as: 

{% highlight javascript %}
"scripts": {
    "lint": "jslint '**/*.js'"
}
{% endhighlight %}

to run it on **all** my files, but I grew tired trying to fix the lint issues with mocha. Sorry. 

## Dependencies and devDependencies
Now, there's a dependency problem here - that <code>jslint</code> command? What is that? Psst... [a Node package](http://npmjs.org/package/jslint).

And now everyone has to have it installed globally? No. This is a *development time* dependency for my package. It only needs to be installed if you're going to run <code>npm run jslint</code>.

This is what <code>devDependencies</code> in the <code>package.json</code> is for. You can install and save the dependency like this <code>npm install jslint --save-dev</code>. 

We don't have to give the path to the <code>node_modules</code>-folder (<code>./node_modules/jslint/bin/jslint</code>) since [npm will look for packages](http://www.bennadel.com/blog/2169-where-does-node-js-and-require-look-for-modules.htm) first the local <code>node_modules</code> and then continue upwards. 

## Pre and post hooks for custom script
Now, while that <code>npm run lint</code> is cool, I still have to remember to run it from time to time. If only I could run it just *before* testing, failing if the linting didn't pass 100%. What to do? What to do?

Aha! <code>pretest</code>! Yes, folks - this is a perfect scenario to run my custom <code>lint</code> script. Let's add it to the <code>pretest</code> script: 

{% highlight javascript %}
"scripts": {
    "lint": "jslint '*.js'",
    "test": "mocha -u bdd -R spec",
    "pretest": "npm run lint && rm -r ./logs/ && mkdir logs",
    "posttest": "rm -r ./logs/ && mkdir logs"
}
{% endhighlight %}

Now then I, or my continuous integration server or what have you, go <code>npm test</code> to test my application the following happens:

* The <code>pretest</code> script is executed 
	* it's first command <code>npm run lint</code> is run, and halt execution if <code>jslint</code> returns errors
	* we then clean the <code>./logs/</code> folder
	* and recreate it for good measures
* Now the <code>pretest</code> script is fully executed and the <code>test</code> script is run

## Refactor the script
My <code>package.json</code> is doing what I want, but starting to look messy. For example the <code>pretest</code> script is a bit ugly to read now, don't you think? Also the exact same script is used for <code>posttest</code> Let's fix it by refactoring a new script to clean logs. Like this:

{% highlight javascript %}
"scripts": {
    "cleanlogs" : "rm -r ./logs/ && mkdir logs",

    "lint": "jslint '*.js'",

    "test": "mocha -u bdd -R spec",
    "pretest": "npm run lint && npm run cleanlogs",
    "posttest": "npm run cleanlogs"
}
{% endhighlight %}

There - that's better. Now I simply call into my custom <code>cleanlogs</code> script from <code>pretest</code> and <code>posttest</code>. The <code>pretest</code> script calls two scripts after each other.

I played around with actually installing the <code>jslint</code> as a <code>prelint</code> task. It works but I don't think this is a good idea: 

1. The dependencies that is need to develop should be listed under <code>devDependencies</code>. This adds clarity and understanding.
2. Updating the <code>package.json</code> feels ... dirty me thinks

That said - it's totally possible. Here's how: 

{% highlight javascript %}
"scripts": {
    "lint": "jslint '*.js'",
    "prelint": "npm install jslint --save-dev"    
}
{% endhighlight %}

But I'd advice against it. 

## The 'npm run' command
Let me leave you with a nifty little feature more of <code>npm</code>. If you only go <code>npm run</code>, without _any_ parameters, <code>npm</code> will list all scripts in your <code>package.json</code>. Like a poor-mans-help. Here's what comes out if you go <code>npm run</code> on the file we've created:

{% highlight bash %}
Lifecycle scripts included in preposthooks:
  test
    mocha -u bdd -R spec
  pretest
    npm run lint && npm run cleanlogs
  posttest
    npm run cleanlogs

available via `npm run-script`:
  cleanlogs
    rm -r ./logs/ && mkdir logs
  lint
    jslint '*.js'
{% endhighlight %}

# Summary
As you can see the <code>pre</code> and <code>post</code> hooks are very powerful allies if you want to use <code>npm</code> and <code>package.json</code> as a build tool. 

You can find my [code here](https://github.com/marcusoftnet/preposthooks)

I'll write a post more about how we can integrate git, pushing and deploying into such script next. 

I hope you liked this post. 