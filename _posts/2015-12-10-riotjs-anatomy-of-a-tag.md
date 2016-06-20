---
layout: post
title: "Riot.js: anatomy of a tag"
author: "Marcus Hammarberg"
date: 2015-12-10 14:22:34
tags:
 - Javascript
 - Tools
---

Remember back in the days when you (or me at least) proudly could say: "I'm a back end developer"? Well, sorry those days are gone since a few years. 

Now, front end can mean many different things and quite often, luckily for me, it's been just feeding data into a already structured framework, but what if you need to set the architecture? 

Naturally we turn to the frameworks of choice and ... about at this point I run into problems. Because I really have a problem with "big" frameworks like [Angular Js](https://angularjs.org/), [Ember](http://emberjs.com/), [Aurelia](http://aurelia.io/) or [React](https://facebook.github.io/react/). They look nice and I have really tried to learn, at least part of, them. Sometimes I've been close, but they just don't stick. Too much for my poor head. 

Maybe [Koa](http://koajs.com) and [Nancy](http://nancyfx.org) has destroyed me. I'm now a micro-framework guy. I just want my tools, as much as possible, to stay out of my way. A micro framework also opens more options for how to do things, what architecture to use etc. 

That's why [Riot Js](http://riotjs.com/) made me so happy, when I found it. Here's the tag line: 

>A React-like user interface micro-library
>CUSTOM TAGS • ENJOYABLE SYNTAX • VIRTUAL DOM • TINY SIZE

And I'm like: Yes! Yes! Yes!
Love it already! 

I wanted to share my very early learnings with you. Because [sharing is learning](/)
<a name='more'></a>
# Disclaimer and pointers
I'm new and no front-end guy. This is just my way of explaining what I've picked up elsewhere. 

If you really want to learn this from scratch you should take a look at the [YouTube videos of Andrew Van Slaars](https://www.youtube.com/watch?v=al87U6NgRTc). Great, clear stuff. 

Also the [Guide](http://riotjs.com/guide/) at Riot Js is good. But very dense. I had to read it a couple of times before I got it. I will actually use one of their examples in this post, and try to explain it a bit further. 

# Tags - the building blocks of interface
In Riot the idea is that we build the interface up out of small components of functionalities. Like a micro-service architecture for the GUI if you want. 

These components are called *tags* in Riot. The tag is a small piece of the UI with all HTML, layout and script functionality grouped together. 

These components are then used to build up your application. It's a very easy metaphor to take in and the way you build this is really easy to grasp too. 

In this post I wanted to examine the *tag* itself a bit closer. What does it consists of, how to structure it and some options. If it goes according to plan this might end up becoming a descent introduction too.

# Getting started
One of the great things about micro frameworks is that since they are small they also gives you great flexibility as to how to use them. Which is great when you know what you are doing... a bit harder when you're newbie like me. 

The simplest I've come up with is to just create an HTML document like this: 

{% highlight html  %}
<!doctype html>
<html>
  <head>
    <title>Riot todo</title>
    <script src="https://cdn.jsdelivr.net/riot/2.3/riot+compiler.min.js"></script>
  </head>
  <body>
    <!-- Tags added here -->
    <!-- <todo></todo> -->

    <!-- Links to the tags here -->
    <!-- <script src="tags/todo.tag" type="riot/tag"></script> -->

    <!-- Mount tags with riot.mount() -->
    <script>
        //riot.mount('todo')
    </script>
  </body>
</html>
{% endhighlight %}

This simple little starter template helps us to just get starting writing tags directly and have the compilation and transformations take place in the browser. 

Because the tags can (often are) stored in .tag files and get processed, compiled and distributed by the riot compiler. In this simple example this is done on the browser

As I mentioned there are other ways too; you can for example perform the compilation on the server and get .js files to use in your site, this seems to be the preferred way. You could even [prerender the tags on the server](https://www.youtube.com/watch?v=6ww1UXGJzcs). 

But is harder to get started like that. I'm running with this now. 

# Our first, pretty sophisticated, tag
Let's create a `index.html` page with the template above and uncomment lines 9, 12 and 16 which where my example code. 

Now create a directory called `tags` and it it add a file `todo.tag` with the following Hello World content:

{% highlight html %}
<todo>
    <h3>My todo list</h3>
</todo>
{% endhighlight %}

Here we declare the `todo` tag. 

Fire up a simple web server, if you're on OsX just go `python -m SimpleHTTPServer` and then point a browser to http://0.0.0.0:8000. Sit back and be amazed. You have created a Riot component. 

# First dissection of the tag
A tag can contain only HTML like this one. Or only Javascript, try just an empty logger for example with 

{% highlight html %}
<todo>
    console.log("The empty tag")
</todo>
{% endhighlight %}

The HTML, if present, by convention comes first. Let's tweak it a bit before we talk more about the scripting. And styling... 

# Passing data to the tag
It's pretty boring I admit... let's fix that. Let's add some make the title of our todo list dynamic. 

First we change the content of the `h3` into this `{ opts.title }`. Every tag have a couple of options that is passed into it from ... the where the tag is used. Let's try it on our `index.html`.

Replace the `<todo></todo>` with this `<todo title="Stuff to do"></todo>`. Reload the browser and see the new title. 

The attributes, that you make up btw, on the tag, becomes properties on the `opts` object, like `.title` for example. 

# Another list?! 
The great thing about components is that once you have defined them you can reuse them over and over. Let's add another todo list on our page. Let's make the `body` look like this:

{% highlight html %}
<body>
    <!-- Tags added here -->
    <todo title="Stuff to do"></todo>
    <hr>
    <todo></todo>
{% endhighlight %} 

For the second we didn't set a title and of course no title is display either. Let's create a sensible default. This can be done as you mount the tag, like this: 

{% highlight html %}
<script>
    riot.mount('todo', { 
        title: 'I want to behave!'
    })
</script>
{% endhighlight %} 

There we go. Now we get one todo list with our custom title and if no title is supplied from the tag we pick up the default from when we mount the tag.

# Our first script
Let's add some script to our tag, just to prove a thing. There's a [bunch of events](http://riotjs.com/guide/#mounting) that is fired during mounting on tags. Let's play with one just to get some scripting into our tag. 

Update `todo.tag` to this:

{% highlight html %}
<todo>
    <h3>{ opts.title }</h3>

    <script>
        this.on('mount', function () {
            console.log("Tag mounted")
        })
    </script>
</todo>
{% endhighlight %} 

This function will fire "right after the tag is mounted on the page". Let's try it by reloading our browser. Yes - we get that logging in the console twice, one per tag on the `index.html`

# Second dissection of the tag
OK, so now we have both HTML and some JavaScript in the tag. That's how it should be and the order it HTML first and JavaScript second, by convention. 

To see this in action, try removing the `script`-tags. No, for real. Just take'em out. Like this: 

{% highlight html %}
<todo>
    <h3>{ opts.title }</h3>

    this.on('mount', function () {
        console.log("Tag mounted")
    })
</todo>
{% endhighlight %} 

If you re-run it you'll see that it works just beautiful, we still get the 2 mounting logging messages. Right from the documentation its: 

>Without the script tag the JavaScript starts where the last HTML tag ends.

I tend to keep them in since it helps my editors with syntax highlighting in the editor I use. 

If we did the pre-processing on the server (remember that we do that in the browser) we could write our scripts in other languages or dialects too. For example coffee-script: 

{% highlight html %}
<script type="coffee">
    @hello = 'world'
    console.log @hello
</script>
{% endhighlight %}

There's also EcmaScript6 (`es6`), TypeScript (`typescript`) and `None`, which I don't really know what it means.

# Styling
There's one thing more I wanted to mention here. The component can also have it's own styling, by simply include a style tag. Let's add something that makes the header a bit bigger, just for this component: 

{% highlight html %}
  <style>
    todo h3 { font-size: 220%; color: red; }
  </style>
{% endhighlight %}

Yeah, it's really big. Now when we re-run that `h3` is indeed bigger and red. But behind the scenes something really nifty has happened. If you view the source of the page (inspect the h3-element) you can see that Riot has move this styling to the `head` of the document. 

You can even decided where you want Riot to inject this by adding a `<style type="riot"></style>` element somewhere on the page. 

Just for demo purposes I've added it at the end of the page.

# Third dissection of the tag
Tags can have HTML, Javascript and then some additional, tag-specific styling too. It's really a discrete, little, well-packaged component fully capable of handling itself. 

I like it.

This styling can, as far as I've know and tried, appear anywhere on the page.  But most people seems to put it right after the HTML. 

# Some todos
Let's make this baby function a little bit more, by looping out some todo items on the page. 

## Update the index page
First get the CSS from this [Plunker](http://riotjs.com/examples/plunker/?app=todo-app) and add a `todo.css` file in the root. Link it from the `index.html` with this line in the head: `<link rel="stylesheet" href="todo.css">`.

Secondly remove one of the `todo`-tags from the `index.html` file. One todo-list is enough. 

Finally we're going to feed in some default todo items into the list, just like we did on the title. Here's the full `index.html` page. The new items is found in the script at line 17-22.

{% highlight html  %}
<!doctype html>
<html>
  <head>
    <title>Riot todo</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <link rel="stylesheet" href="todo.css">
    <script src="https://cdn.jsdelivr.net/riot/2.3/riot+compiler.min.js"></script>
  </head>
  <body>
    <todo title="Stuff to do"></todo>

    <script src="tags/todo.tag" type="riot/tag"></script>
    <script>
    riot.mount('todo', {
      title: 'I want to behave!',
      items: [
        { title: 'Avoid excessive coffeine', done: true },
        { title: 'Hidden item',  hidden: true },
        { title: 'Be less provocative'  },
        { title: 'Be nice to people' }
      ]
    })
    </script>

    <style type="riot"></style>

  </body>
</html>
{% endhighlight %}

## Loop out the todo's in the tag
If you refresh the browser you'll see our empty list displayed in the center of the page, with the new CSS. But the `item` data, passed in, is not used and hence not displayed. 

Let's fix that, it's easy to do with Riot's `each`-loop functionality. Open the todo `todo.tag` file and add the following HTML. 

{% highlight html  %}
<h3>{ opts.title }</h3>

<ul>
  <li each={ items }>
    <label class={ completed: done }>
      <input type="checkbox" checked={ done } onclick={ parent.toggle }> { title }
    </label>
    <a href="#" onclick={ parent.remove }>X</a>
  </li>
</ul>
{% endhighlight %}

The [each loop](http://riotjs.com/guide/#loops) is the way you iterate over data (arrays or objects) in Riot. The loop reaches over the element that it is declared in, `<li> -- </li>` in our case. Within the loop we have a context for each item we loop over so we don't need to prefix `{title}` with item. 

Notice the nice `class={ completed: done }` syntax, which is a continent way to set a class (`completed`) based on a condition (is `done` truthy). There's another example on line 6 where we set the `checked` attributed based on the truthy-ness of the `done` value of the item.

If you refresh this it still doesn't show a list of items. There's on thing missing. The `{items}` is a local variable on our tag, but we have created it yet. Let's add a short line of JavaScript in, after the last HTML-tag, like this: `this.items = opts.items`.

This just takes the values passed in to our tag and saves them in a local (`this` is scoped to the component) for the tag-instance.

The whole `todo.tag` should now look like this: 

{% highlight html  %}
<todo>
    <h3>{ opts.title }</h3>

    <ul>
      <li each={ items }>
        <label class={ completed: done }>
          <input type="checkbox" checked={ done } onclick={ parent.toggle }> { title }
        </label>
        <a href="#" onclick={ parent.remove }>X</a>
      </li>
    </ul>

    this.items = opts.items

    this.on('mount', function () {
        console.log("Tag mounted")
    })
</todo>
{% endhighlight %}

And refreshing that will display a nice list of todos, based on the data we passed in from the `index.html` in the `riot.mount()` call. 

## Interactivity
That's nice but it doesn't do anything. Let's add some interactivity to our component. 

As you may or may not have noticed there's two `onclick` handlers defined on the `li`-item; one for the `input` called `{ parent.toggle }` and one for the ugly `remove` link called `{ parent.remove }`

These refer to function in our tag. They are prefixed with `parent` since we, in the loop are scoped to each item. We're now reaching to each items parent, which is the tag itself, where the `this.items` is defined. 

Let's add the functions that simply operate on the `this.items` array that we just created. Like this: 

{% highlight javascript  %}
    function toggle(e) {
      var item = e.item
      item.done = !item.done
      return true
    }

    function remove(e){
      var item = e.item
      this.items.splice(this.items.indexOf(item), 1)
    }
{% endhighlight %}

Notice that we just remove items from the array, or change the individual `done` flags, Riot updates the UI for us. There are cases where you want to update the UI manually and then you use the `this.update()` function.

Riot supports a nice little abbreviation too, that means that we can take out the `function`-keyword, allowing for even more succinct syntax. Here's the complete file now. 

{% highlight html %}
<todo>
    <h3>{ opts.title }</h3>
    <ul>
      <li each={ items }>
        <label class={ completed: done }>
          <input type="checkbox" checked={ done } onclick={ parent.toggle }> { title }
        </label>
        <a href="#" onclick={ remove }>X</a>
      </li>
    </ul>

    <style>
      todo h3 { font-size: 220%; color: red; }
    </style>

    this.items = opts.items
    
    toggle(e) {
      var item = e.item
      item.done = !item.done
      return true
    }

    remove(e){
      var item = e.item
      this.items.splice(this.items.indexOf(item), 1)
    }

    this.on('mount', function () {
        console.log("Tag mounted")
    })
</todo>
{% endhighlight %}

Now the component is coming together, we have the markup in the top of the tag and then the logic below. Looking good. 

Try it out. Clicking the item will cross it out and clicking the X will remove it from the page. But we can't add any new items. 

## Form for adding new todos
Let's create a form for that. In the example that Riot shows, that we have been following to the letter so far, they add this right into the same tag. But there's a feature called nested tags, tags within tags that I wanted to show you too. 

In the `todo.tag` file let's add a new top level tag below our `todo` tag. Yes, a `.tag` file can contain many tags. 

(In all honestly this is a bit contrived but works as a nice example).

We call our new `todo-form`. This component handles everything around the form for adding new items; markup and logic (possible styling). Here it is:

{% highlight html %}
<todo-form>
    <form onsubmit={ add }>
      <input name="input" onkeyup={ edit }>
      <button disabled={ !text } >Add #{ opts.number_of_todos }</button>
    </form>
    
    var parent = this.parent

    edit(e) {
      this.text = e.target.value
    }

    add(e){
        if (this.text) {
          parent.add(this.text)
          this.text = this.input.value = ''
        }
    }
</todo-form>
{% endhighlight %}

There's a number of things here, but really nothing new: 

* Line 4 uses `{ opts.number_of_todos }`, so we'll need to pass that in. **Let's remember to do that later**. 
* On line 7 we store a reference to the parent component, using the `this.parent` property that Riot hands us
    * This reference is used on line 15 where we call the `add` function on the parent. **We'll need to remember to implement that**.
* Line 9-11 defines a little toggle for the button, so that we cannot add empty todos. 
    * Notice the toggle of the `disable` attribute by checking the presence of `text` on line 4
* The `add` function implements some sanity check and then calls back to the parent. 

My plan (who said architecture?!) is that I'll keep all the operations that manipulate the `items` array in the main tag (`<todo></todo>`) and then have the underlying tags only handling their own stuff.

A trivial example is that the `<todo-form></todo-form>` does the incrementation of the number of todo items. Since that's a "service" that the `<todo-form></todo-form>` has. The `<todo></todo>` just pass the number of items in. 

## Using the form
Let's use our new form and implement the `add` function in the `<todo></todo>` tag. 

Using the `<todo-form></todo-form>` is trivial: 

{% highlight html %}
<todo-form number_of_todos="{ items.length + 1 }"></todo-form>
{% endhighlight %}

Attributes are all lower-case by convention and to handle some browser compatibility issues. I use underscore between words for readability. Use whatever floats your boat. 

Secondly we need to implement the `add` function of that actually adds the item to the `items` array. Pretty easy stuff: 

{% highlight html %}
add(itemText) {
  this.items.push({ title: itemText, done: false, hidden: false })
  this.update()
}
{% endhighlight %}

We're just pushing a new item into the array. Notice that in this case we need to trigger an update with `this.update()`. I'm not 100% sure as to why, but I'm guessing that the event was happening in a sub component and Riot cannot keep track of that... Have to check that one up. 

The whole `<todo></todo>` tag now looks like this: 

{% highlight html %}
<todo>
    <h3>{ opts.title }</h3>
    <ul>
      <li each={ items }>
        <label class={ completed: done }>
          <input type="checkbox" checked={ done } onclick={ parent.toggle }> { title }
        </label>
        <a href="#" onclick={ remove }>X</a>
      </li>
    </ul>

    <todo-form number_of_todos="{ items.length }"></todo-form>

    <style>
      todo h3 { font-size: 220%; color: red; }
    </style>

    this.items = opts.items
    
    toggle(e) {
      var item = e.item
      item.done = !item.done
      return true
    }

    remove(e){
      var item = e.item
      this.items.splice(this.items.indexOf(item), 1)
    }

    add(itemText) {
      this.items.push({ title: itemText, done: false, hidden: false })
      this.update()
    }

    this.on('mount', function () {
        console.log("Tag mounted")
    })
</todo>
{% endhighlight %}

If you run it it works just fine. 

## Extra points
Now that I did that... I just realized that the todo-item can be broken out too. I'll do that [in the code](http://github.com/marcusoftnet/anatomyOfATag) but don't talk you through it here. 

It *can* be broken out, but if it should will be up to you. Once I did it I now have nice discrete parts: 

* `todo` is the main component that holds all the others. It's responsible for operating on the todo list itself
* `todo-form` is used for adding new items and communicates back to the `todo` component when new items is added
* `todo-item` presents and handles a single item. Operations that affects the list is propagated back to the `todo` component

For this simple example this structure almost added overhead to have that many moving parts. In a larger application I can imagine that this could be very handy indeed. Of course you then would split the different tags to different file etc. For example, imagine separate teams working on the separate components, then a structure could prove useful. 

Go ahead and try to build it yourself before you peek. I learned a lot by doing that. 

Psst, there's another type of loop that allows you to get hold of the item that you're looping over, like this: <code>{ name, i in items }</code>. You can check it out in the [documentation](http://riotjs.com/guide/#loops). 

# Summary
Whoa - this post grew longer than I expected. Tags in Riot are really very simple. Now you got to tag (oooh, sorry. Totally unintended joke) along on my learning journey.

Custom tags are the building blocks of the UI when using Riot. They can consist of HTML, JavaScript or both in which the markup comes before the script. Optionally you can add styling for the component. 

In this case we have done the compilation of the `tag`, into JavaScript that the browser can understand, in the browser. This is handy for quick development, but lack some features such as being able to use EcmaScript6 or other scripting languages in your tags. 

I really like Riot so far. It feels very natural, I get it. It's small. It stays out of my way for the problem I try to solve.

[My code can be found here.](http://github.com/marcusoftnet/anatomyOfATag)