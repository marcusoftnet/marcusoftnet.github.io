---
layout: post
title: "McDonald's: A Tool to Explain Flow"
author: "Marcus Hammarberg"
date: 2015-06-16 06:57:25
tags:
 - Lean
 - Agile
 - Life of a consultant
---

This post is brought to you in cooperation with... just kidding.

The other day, I took my kids to McDonald's here in Bandung. For some reason, it's still a cause for celebration for them. "Yay! Soft burgers with hard-pressed meat!" And me? Well, I'm happy when they're happy.

As I stood in line, I noticed a problem: the queue of customers kept piling up, but no one was getting served. Being the analytical type, I tried to dissect the situation and realized that a McDonald's restaurant is actually a great way to explain flow.

In this post, I'll attempt to elucidate what I mean.

One peculiar thing I noticed was that there were people at every cash register, feverishly taking orders and fetching drinks. But still, no one was getting served.

Instead, we all stood around the counter waiting, inadvertently blocking access for other customers. The cashiers kept taking orders, and the number of people waiting for their meals continued to grow.

## What Happened?

As I stood there, I observed that there were plenty of staff behind the counter, but they were moving in groups because they were training new employees that day.

Essentially, for each person in training, one of the regular staff members had to oversee them, resulting in fewer staff members available to prepare orders. This created a bottleneck in "order fulfillment," leading to a queue of hungry customers waiting for their orders.

## Analysis

Here are a few thoughts that crossed my mind:

## Wishful Thinking

The cashiers who kept taking orders were operating based on wishful thinking. Simply feeding more work into an overloaded system doesn't help; if anything, it exacerbates the problem. Mary Poppendieck refers to this as "wishful thinking."

This scenario mirrors situations often encountered in software development:

- Writing more user stories without completing existing ones
- Starting new user stories before finishing current ones
- Continuously adding work to testing without completing ongoing tasks
- Accumulating tasks in the deployment queue without clearing it first

In each case, this approach only increases workload, complexity, and lead times without exception. Despite knowing this, we often succumb to this behavior, much like the cashiers taking on more orders.

Taking orders (or tasks) is quick and easy, but neglecting to consider the entire flow of work leads to more problems.

## Why Was This Easy to Spot in McDonald's?

I pondered why this issue was so evident in this restaurant. Firstly, it was crowded, but that wasn't what caught my attention.

In a McDonald's restaurant, it's easy to visualize and focus on the flow of work, with the customer as the focal point:

1. Customer places an order
2. Cashier dispatches the order to the kitchen
3. Burger gets made
4. Cashier collects payment
5. Cashier serves drinks
6. Cashier retrieves the food
7. Customer collects the food and proceeds to a table
8. Customer enjoys their meal in the restaurant or leaves
9. Customer disposes of the tray

The lead time for one customer is relatively short, with most of the time not requiring much engagement from McDonald's staff. Customers are tangible, easily identifiable entities in our process.

## What Would Have Been Better to Do?

Easy to spot, my mind immediately sought solutions. While implementing a simple limit on the "number of people waiting for their food" stage would have been a good start, what fascinated me more was my son's observation:

"Why do they let so many people wait, Dad?"

He's particularly brilliant, of course, but the work in progress was evident and easy to understand, prompting him to suggest improvements. He saw the entire process and knew the goal because he was right in it—waiting for his food.

- How can we make our **entire** process more visible?
- How can we ensure that everyone understands the goal of each task we undertake, given that it may vary across different businesses?
- How can we harness ideas and suggestions from everyone on our team?
