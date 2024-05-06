---
layout: post
title: Marcus Node Bits - Ok then, Mongoose is pretty sweet
date: 2014-03-05T07:00:00.000Z
author: Marcus Hammarberg
tags:
  - MobProgramming
  - Javascript
  - Tools
  - Agile
modified_time: 2014-06-02T08:56:52.500Z
blogger_id: tag:blogger.com,1999:blog-36533086.post-2091121684384294337
blogger_orig_url: http://www.marcusoft.net/2014/03/mnb-mongoosejs.html
---

I often blog too early. I get excited and want to tell everyone as soon as possible. I whip together a demo and then write a blog post about my experience. Sometimes that is a bit too early. Sometimes you need another look to really appreciate a tool, or to realize that it doesn't do the job.

In my [blog post about Monk](http://www.marcusoft.net/2014/02/mnb-monk.html) (which I still think is great... Monk, that is, not the blog post) I wrote that I didn't like [Mongoose](http://mongoosejs.com/) that much. That was too early to say. I have now used it for real and I think I like it.

Let's me redeem my bad Mongoose-conscience and write a ~~short~~ post on what I've picked up when trying it... [for real](http://github.com/aptitud/AptiTalk).

The thing that ticked me off and actually made me turn away from Mongoose on the idea-stadium was the fact that it needs a typed model. To me, at the time, this seemed to go against the whole idea of simplicity and dynamicallity (yeah, made that word up... but I mean focus on dynamic stuff; I can store object that doesn't have exactly the same properties in the same collection for example) that can be seen through [Mongo](http://www.mongodb.org/) and [Monk](https://github.com/LearnBoost/monk) for example.

As always with Node frameworks Mongoose is really simple to install:

`npm install mongoose`

Optionally passing `--save` to update your package.json file.

Here's an example on how to create a new thing (in this case a Post in the [AptiTalk](http://github.com/aptitud/AptiTalk) application):

```javascript
var mongoose = require('mongoose');

var postSchema = new mongoose.Schema({
  title: String,
  body: String,
  date: { type: Date, default: Date.now }
});

var Post = mongoose.model('Post', postSchema);

Post.create({ title: 'First post', body: 'This is my first post!' }, function(err, post) {
  if (err) {
    console.error(err);
  } else {
    console.log('Post created:', post);
  }
});
```

Let's go through it in detail, since it's not the most basic example (that can be found on the [Mongoose](http://mongoosejs.com/) homepage - no use restating that here), but rather part of an API I wrote for our application:

- Line 1: We are requiring mongoose as normal.
- Lines 3-9: Declare our model. There are a lot of things that you can do here, like setting constraints (`{type: Date, default: Date.now}` and `{type: String, required: true}` are a couple that springs to mind). You can then use built-in [Mongoose validation](http://mongoosejs.com/docs/validation.html) to validate that. I have not and I will tell you more about why later.
- Lines 11-25: Storage takes place.
  - Line 12: We create a new Post object, a new instance of our Mongoose model.
  - Lines 13-16: Setting some values on it.
  - Line 18: Calls the `create()` method of the Post object. This can be thought of as a static method on the class rather than on the instance.
  - Lines 19-23: Callback function. In my case, I get the inserted post back with a generated id.

The callback checks for errors and returns success or failure via two methods I have created for that.

That's quite a lot of code you say. The good news, I respond, is that the model only needs to be declared once. And the rest of the operations you need (finding, updating, removing, etc.) look very similar indeed.

### Testing Mongoose

Testing Mongoose is pretty straightforward. If you can live with "integration"-tests that is. As I'm a recently converted C# developer doing JavaScript mostly now I find myself searching for concepts and implementations that I maybe shouldn't be looking for.

So for a long time I tried to mock the database out. Using a "tightly shut" abstraction like Mongoose I found this very hard indeed. I can mock out Mongoose itself... but then my tests are testing nothing.

(Mocking though, I should add, is pretty sweet in a dynamic language like JavaScript. You can just supply your own implementation in the test. Basically overriding the real implementation just for the test)

It all ended up with a real good comment from one of the best JavaScript devs I know - [Carl Bergquist](https://twitter.com/CarlBergquist):

> "How short are your feedback loops? Hit the database already!" (or something like that)

Hitting the database with Mongo and Mongoose is really, really fast. Mocha is reporting the tests that take longer than 100 ms as warnings and it very seldom reports any warning for me. I sucked it in and stopped trying mocking stuff out. I simply run my tests against a test version of my database.

However that means cleaning stuff up before and after your tests, since you cannot guarantee the order the tests are run in. Here's an example test of adding a post.

### ORM or Data Access framework?

Ok, so why did I diss this awesome framework the first time around? Because I didn't even think about an ORM, I just wanted data access. For a number of years I've just used very [simple tools](https://github.com/markrendle/Simple.Data) and shied away from the complex as much as I could. When I saw that I needed to create a model, and that Mongoose hid all things Mongo from me... I was a bit hesitant.

Now, when I've used the tool I feel much better. It's worth the "toll" I pay by creating models etc, I think. The API that Mongoose exposes is very nice and powerful and I have yet been near running into a situation that I cannot handle.

In short - I should have looked harder and longer. ORM can be lightweight too, apparently. Thank you Mongoose for showing me that.