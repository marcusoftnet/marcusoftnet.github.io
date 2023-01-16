---
layout: post
title: "Learning about Python list comprehensions"
author: "Marcus Hammarberg"
date: 2023-01-16 18:45:35
tags:
 - Programming
 - Life of a consultant
 - Python
---

I'm learning a brand new programming language. That should probably say, *new for me*.Because it's Python. I haven't touched it before. Yes yes - I'm slow, old and everything. But I am still learning new things... so I'm not all in all bad.

Ok - Python is for the most part very nice to work with and reading and writing code has been easy so far. Until I saw a backwards `for`-loop. It just looked... weird.

Turns out it was not a `for`-loop at all, but rather a [list comprehension](https://www.geeksforgeeks.org/python-list-comprehension/).

<!-- excerpt-end -->

My need was not super basic, and it bothered me that I couldn't solve it nicer than I did, so I wanted see if I can understand how I could make it better. Hence this blog post.

## List comprehensions

Let's first just checkout the most basic case. List comprehensions are pretty cool. Here's the basic structure:

```text
newList = [ expression(element) for element in oldList if condition ]
```

It's basically a way to create list from list. This can be used for transformations, filtering, mapping and all kinds of coolness. Like some of the array methods in JavaScript, or LINQ in C# etc.

Let's see one in action. :

```python
someNumbers = [1, 3, 56, 2, 4]
theNumbersDoubled = [num * 2 for num in someNumbers if num < 50]
print(theNumbersDoubled)  # [2, 6, 4, 8]
```

Pretty cool, huh?

First let me just say that I like that you wrap the whole thing in a `[]`. It's like saying: here's the recipe for the new list I'm want to make. Inside is the declarative code.

The thing that threw me off is the backwards (I think...) structure. The `for num in someNumbers` comes at the end. It can, optionally have an `if`-statement as you see me do there `if num < 50`.

The projection, restructuring of the code, comes first; `num * 2`. `num` is what I call the variable I'm iterating over.

Let's make something a bit more advanced, by having object in the array, so that we can show a bit more of the projection powers. Also, I will learn a bit more Python.

```python

class person:
    def __init__(self, name, birthYear):
        self.name = name
        self.birthYear = birthYear


theHammarbergs = [
    person('Marcus', 1972),
    person('Elin', 1977),
    person('Albert', 2008),
    person('Arvid', 2010),
    person('Gustav', 2020)
]

current_year = date.today().year

adults = [p.name for p in theHammarbergs if current_year - p.birthYear >= 18]

print(adults)
```

First - I created a class for `person` and then filled up an array with the people in my family. Yes - we have twins.

(I then found out how to get the current year... Yes I'm new at this)

Finally I could now write a little expression that filters the array and selects only the name from those people. Beautiful.

## Making dictionaries

My problem included using a Dictionary. Or rather, I needed to output a Dictionary with a key and value for a number of items... Yeah it's a bit complicated, but like this: I have one list of strings that are the keys, and then a list of list of strings that are the rows. From this I need to create a list of Dictionaries.

First things first - here's a list of strings, in Python:

```python
columns: list[str] = ['Name', 'Age', 'Shoe-size']
```

Then a list of list of strings, for the values:

```python
rows: list[list[str]] = [
    ['Marcus', '1972', '46'],
    ['Elin', '1977', '37'],
    ['Albert', '2008', '40'],
    ['Arvid', '2010', '38'],
    ['Gustav', '2010', '38']
]
```

And my goal is to create a list of dictionary of string keys and string values (let's make it easy). It will look something like this:

```python
result: list[dict[str, str]] = [
    {"Name": "Marcus", "BirthYear": "1972", "Shoe-size": "46"},
    {"Name": "Elin", "BirthYear": "1977", "Shoe-size": "38"},
    # and so on
]
```

Now, there's a very cool way of creating a Dictionary from two arrays, by using `zip` like this:

```python
result = dict(zip(["a", "b", "c"], [1, 2, 3]))
print(result)  # {'a': 1, 'b': 2, 'c': 3}
```

We could use this and create a dictionary for every row. That makes the whole code like this:

```python
results = [dict(zip(columns, row)) for row in rows]

print(results)
```

## Summary

Using List comprehensions in Python makes your code much smaller and more effective. But it can get some getting used to read them. I think we will be friends.

