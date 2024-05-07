---
layout: post
title: "McDonalds - a tool to explain flow"
author: "Marcus Hammarberg"
date: 2015-06-16 06:57:25
tags:
 - Lean
 - Agile
 - Life of a consultant
---

This post brought to you in cooperation with ... no. Just kidding. 

The other day I went with my kids to McDonalds here in Bandung. For some reason this is still the incarnation of celebration for them. "Yah! Soft burgers with hard pressed meat!" And me; I'm happy when they are happy. 

As I stood in line I noticed a problem. The queue kept of customers kept piling up, but no one got served. Being the one I am I tried to analyze the situation and in doing so I realized that a McDonalds restaurant is a very good way to explain flow. 

In this post I'll try to tell you what I meant. 

<!-- excerpt-end -->

One thing that was a little bit strange, in our case, was that there was people at every cash register. They were taking orders like crazy. And getting drinks too. But no one got served. 

What instead ended up happening was that we all stood around the counter waiting. And blocking the access to the counter for other customers. The cashiers kept taking orders. The number of people waiting for their meal increased. 

# What happened?
As I stood their I noticed that there was a lot of people behind the counter as well. But they were moving in groups. Because they had a lot of people on training that day. 

Basically that meant that for each person on training they took up the attention for one of the ordinary staff too. Leading to that fewer staff where making fries or burgers. A bottleneck was created in "order fulfillment".

This in turn created a queue of people waiting, starving, to use another [theory of constraints](https://en.wikipedia.org/wiki/Theory_of_constraints) term, for their orders. 

# Analysis
Here's a few thoughts that flew through my mind.

## Wishful thinking
<img src="/img/donkey-in-air-cart.jpg" style="float:left" width="50%">
The cashiers that kept taking orders were operating driven by wishful thinking. Just feeding more work into an overloaded system doesn't help anyway. If anything it just slows down the work in the process more. This is what [Mary Poppendieck](http://www.amazon.com/Lean-Software-Development-Agile-Toolkit/dp/0321150783/ref=la_B001IGNU3O_1_2?s=books&ie=UTF8&qid=1434515796&sr=1-2) has called "wishful thinking". 

My favorite picture to explain this is the [poor donkey I've blogged about before](http://www.marcusoft.net/2013/03/between-chairs-management-and-thoughts.html) 

This is very much alike situations that keep coming up in software development: 

* We keep writing more user stories although we have more than plenty to do right now
* We start working on the next user story although we are not finished with the ones we have
* We keep feeding work into testing although the testing is not completed of our current work
* We have a lot of things waiting to be deployed and still we add more in that queue

In every single case this creates more items to handle, more complexity and longer lead times for the work. Without exception. We know that. And still we do that. Just like the cashiers taking more and more orders. 

Taking an order (or _____ in your case) is fast and easy. We take the order - we move on to the next. But not considering [the entire flow of the work](http://www.marcusoft.net/2015/05/flow-wip-and-waste.html) (my burger in this case) into consideration is just creating more problems. 

This is sometimes referred to, in the lean-world, as local optimizations. Which, unsurprisingly, often lead to 

## Why was this easy to spot in McDonalds? 
I then took a step back, in my thoughts, and wonder why this was so easy to spot in this restaurant? Well, first the place was *crowded* with people waiting. But that was not really what struck me. 

Rather, it's easy in a McDonalds restaurant to see and focus on the work flowing. It's me. The customer. 

1. Customer comes to the counter
1. Customer makes my order
1. A cashier dispatch the order to the burger makers
	1. Burger gets made
	1. Cashier picks up money
	1. Cashier picks up drinks
1. Cashier gets the food
1. Customer picks up my food and go to the table
1. Customer eats and enjoy the calm environment
1. Customer returns the tray to the bin. You do, right?
1. Customer leaves the restaurant

First of all the lead time for one customer is relatively short. 45 minutes if you are really slow. Most of that time is not engaging McDonald staff much. 

Secondly, Customers are tangible, easily spotted entities of work in our process. 

Thirdly, at first I thought about the food being the work. But that misses a part of the process - where Customer eats and enjoy the restaurant or leaves it. That's important too. 

If I only focus on making the food I again do a "local optimization". Dishing out burgers super fast will not, necessary, lead to more customers served.  

In other business, such as IT for example, the work is harder to spot and track. First of all it's longer in our process and hence moves slower. Also it's not tangible, although we can make it on a board etc.  

## What would have been better to do?
Being easy to spot, my mind also directly tried to solve the problem. This is not particularly interesting but a simple limit on the "number of people waiting for their food"-stage would of course have been a good start. This would have made sure that we don't overload the system with more orders, but instead made sure that the ones we had "in process" where handled. 

What was more interesting to me is that I realized that even my son came to that conclusion; 

<blockquote>Why do they let so many people wait, dad?</blockquote>

Now he's particularly brilliant, of course :), but the work in process was in fact easy to see and also easy to see and suggest improvements for. So he did. He saw the entire process and he knew the goal, because he was right in it. Waiting for his food.

* How can we make our **entire** process easier to see?
* How can we make sure that everyone understands the goal of each item we make? Sadly it varies a bit for other business...
* How can we harvest the ideas and suggestions from everyone in our team? 