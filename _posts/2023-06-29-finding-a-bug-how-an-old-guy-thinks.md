---
layout: post
title: "'Inf' Finding a bug - how an old guy thinks"
author: "Marcus Hammarberg"
date: 2023-06-29 07:00:00
tags:
  - Programming
  - Life of a consultant
---

I ran into a problem when coding. But when I saw the error message, that meant nothing to me on its surface, I soon found the problem. After fixing it I realized that the way I approached finding and fixing this came from many years of ~~making mistakes~~ experience.

In this post, I wanted to share this. Not to show off (it's not that impressive) but to share some of my experience from hunting bugs. And maybe more important, the way that found and protected myself against this happening again.

<!-- excerpt-end -->

I saw this error message in a log

```text
mysql.connector.errors.ProgrammingError: 1054 (42S22): Unknown column 'inf' in 'field list'
```

To be honest I didn't really understand what this was or why it happened. But that column name... `inf` - I knew my code doesn't try to create a column with that name. I knew since I searched for the name in the code base.

But then I thought about the word itself. `inf` is the start of `infinite`. The only time I've been exposed to infinity in coding is when I try to divide with 0. And my code did a few divisions. This is most likely this.

I got even more convinced that this was the problem when is searched for `scala infinite`. Turns out that Scala, the language I'm using has built-in protection for division with 0:

```scala
val result = 15.0 / 0.0
println(result) // Infinity
println(result.isInfinite) // true
```

It seems like a very safe bet to think that somewhere I divided with 0 and ended up with not an error or an empty value (more on that later), but a value that is `Infinity`. And `Infinity` starts with `inf` which I'm trying to write in a column of `Float` type.

## What is the correct way?

Now, what do I want to do if this happens? There is no code where I _actually_ write `/ 0` but it is probably a missing value somewhere.

(Narrator: It was - Marcus searched the code base many times, sometimes for the same things, and wrote numerous `println` to find it, but it would 1. make this blog post very boring, 2. in reality took longer than Marcus wants to admit. Don't tell him I said this.)

The proper way to handle this would be to either stop the line, so to speak. Throwing an error and asking the programmer (hey - that's me!) to fix the code so it doesn't happen. But in my situation, this might happen from one time to another. So I need to indicate that this value is not present.

Turns out that Scala has a nice way to do this, using something called an `Option`

```scala
val resultIsNotThere: Option[Double] = None
val resultIsThere: Option[Double] = Some(14.0)

println(resultIsNotThere) // None
println(resultIsThere) // Some(14.0)
```

That `Some` part throws me, but now you can have values that either have a value or is `None`. This is the way that Scala wants to handle missing values. Much nicer than a value being `null`, if you ask me.

Also - I happen to know that it will be written to the database as a null value if the value is `None`, in our codebase.

So it seems to me that it's better to have an `Option[Double]` and then set it to `None` if it happens to be `Infinity`.

## Fixing it - fixing it real good

For that reason, I wrote a little helper function `infinityToOption`

```scala
def infinityToOption(value: Option[Double]): Option[Double] = {
  if (value.isDefined && value.get.isInfinity)
    None
  else
    value
}
```

But being paranoid about my programming skills and how often this will be run I also wrote a few tests to ensure that I got it right:

```scala
test("nanToNoneOrValue returns the value that is passed in when not None or NaN") {
  infinityToOption(Some(7.0)) should be(Some(7.0))
  infinityToOption(Some(14.0 / 2.0)) should be(Some(7.0))
  infinityToOption(Some(15.0 / 2.0)) should be(Some(7.5))
}

test("nanToNoneOrValue returns None if None is passed in") {
  infinityToOption(None) should be(None)
}

test("nanToNoneOrValue returns None if NaN or infinite") {
  infinityToOption(Some(Double.NaN)) should be(None)
  infinityToOption(Some(Double.NegativeInfinity)) should be(None)
  infinityToOption(Some(Double.PositiveInfinity)) should be(None)

  infinityToOption(Some(0.0 / 0)) should be(None)
  infinityToOption(Some(14.0 / 0)) should be(None)
}
```

Two things happened here. First I found a bug; Turns out that the special case `0.0 / 0.0` is not `isInfinite` but instead is `isNaN`. Secondly - this is a great way to document this little helper function.

I tweaked the code to

```scala
def infinityToOption(value: Option[Double]): Option[Double] = {
  if (value.isDefined && (value.get.isNaN || value.get.isInfinity))
    None
  else
    value
}
```

And then re-run the tests for the code that was using this little helper function. Once I've ironed out the failing tests I felt pretty confident that it would work.

## Summary

This was not a post showing you how to write brilliant Scala code. I'm sure that are better ways to do this. But I wanted to share the steps that went through my mind when I worked through this bug and its fix.

In reality, this took about 2 working days (spread out over 2 weeks) to nail properly, but that can be abbreviated into looking very smart in a blog post like this.
