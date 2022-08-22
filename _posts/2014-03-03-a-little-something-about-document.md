---
layout: post
title: A little lesson about document database modelling
date: 2014-03-03T07:00:00.000Z
author: Marcus Hammarberg
tags: null
modified_time: 2014-03-03T08:11:20.066Z
blogger_id: tag:blogger.com,1999:blog-36533086.post-3446493776187439494
blogger_orig_url: http://www.marcusoft.net/2014/03/a-little-something-about-document.html
---


<div dir="ltr" style="text-align: left;" trbidi="on">

This is just a short thing that I experienced when doing the data layer
for <a href="https://github.com/aptitud/AptiTalk/"
target="_blank">AptiTalk</a>. AptiTalk is an attempt to create a
corporate chat, we want something like <a
href="https://www.google.com/url?sa=t&amp;rct=j&amp;q=&amp;esrc=s&amp;source=web&amp;cd=1&amp;cad=rja&amp;ved=0CDIQFjAA&amp;url=http%3A%2F%2Fwww.google.com%2F%2B%2Flearnmore%2Fhangouts%2F&amp;ei=qRcTU-XJCsKzrgepiYFA&amp;usg=AFQjCNH-P70gSLr7wjgZKT-qqdr3n_4Vug&amp;sig2=au1emkig9IJYvXhJY4H2Lw&amp;bvm=bv.62286460,d.bmk"
target="_blank">Hangout</a> but better. Yeah, we're not only best - we
are the most humble as well!

Ok, in this simple setting I learned a thing about using document
databases (<a href="http://www.mongodb.org/" target="_blank">Mongo</a>
in this case).
The data model is really simple. It's just a
Posts, Replies and Hashtags. So we created the Posts like this (using
<a href="http://www.marcusoft.net/2014/03/mnb-mongoosejs.html"
target="_blank">Mongoose</a>):

Let's leave the Replies out of this discussion for now. I think I have
more to say about that, but I haven't tried it yet. The Hashtags in turn
is just the Tag and a reference to all the posts that contains that
hashtag. Like this:

Notice the reference to the Post-collection in the pots-array. Both me
and
<a href="http://twitter.com/hugohaggmark" target="_blank">Hugo</a> was
alright with that model. I started to implement the data layer and wrote
tests for it.
But... after awhile it started to squeak. A lot.

I noticed it when i started to put the whole thing together. In order to
create a post I had to:

Save the Post to the database

Check for errors

Now loop over all the hashtags in the message ("a \#message like \#this
\#contains 3 \#tags" for example)

For each of the tags...

add it to the database...

- check for error and ... ? remove the post too?

but if it exists I should instead get it and then update the array of
posts and update the Hashtag

- check for error and ... remove the post and stop processing further?

When everything is completed - and no errors has occurred in any of the
interactions with the database.

And then callbacks on top of that... It got hairy I'm telling you.

<div>

About this place I started to get second thoughts. Nothing had been this
hard with Mongo before. And this is a really simple data model. It
shouldn't be this hard.

</div>

<div>

</div>

<div>

Often when I get that feeling I try to take a break. For about 24 h. And
then approach the model again, as for the first time. I did that this
time and when I got back the answer was bright and clear for me: "we
don't need a Hashtag-collection. It's just what an old relation-dude
like I wanted to keep the 'tables' in order".

</div>

<div>

</div>

<div>

Instead this is just a function/index on the Post. Loop through the
hashtags of all the posts. This can easily be accomplished with Mongoose
like this:

</div>

<div>

The "trick" can be found on line 7 (<span
style="font-family: Courier New, Courier, monospace;">.find({hashtags :
hashtag})) which is Mongoose speak for: "find all the documents
that have the <span
style="font-family: 'Courier New', Courier, monospace;">hashtag in
the <span
style="font-family: 'Courier New', Courier, monospace;">hashtags array.".

### Summary

</div>

<div>

I'm still learning document databases and have not yet harness the full
power of them. I have a little feel that document database is to
relational databases what
<a href="http://www.manning.com/petricek/" target="_blank">functional
programming</a> is to object orientation. That is could can write the
code in the same way as you did, but then you're missing out on the
whole idea.

</div>

</div>
