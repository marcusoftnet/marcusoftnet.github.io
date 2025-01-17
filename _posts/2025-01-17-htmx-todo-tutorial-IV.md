---
layout: post
title: "HTMx - tutorial part IV - Updating other parts of the application"
author: "Marcus Hammarberg"
date: 2025-01-16 04:00:00
tags:
 - Programming
 - HTMx
 - Node
 - Express
---

This is the fourth post in a series that I'm making about HTMx that I think is utterly amazing and will change how I (we?) write web apps in the future. You are more than welcome to read from here, but it will be hard following along code-wise if you haven't stepped through [part I](https://www.marcusoft.net/2025/01/htmx-todo-tutorial.html), [part II](https://www.marcusoft.net/2025/01/htmx-todo-tutorial-II.html) and [part III](https://www.marcusoft.net/2025/01/htmx-todo-tutorial-III.html) first.

In the last part we built out most the actual application, which means that we are left with the fun part here. There's one section of the application that is not working yet - the footer. In the footer I wanted to show a tally of the number of items, the number of completed items, and also the number of late items.

Keeping track of numbers like that can be a bit messy since we need to update them when we are doing other actions, like adding, deleting or simply when time has passed.

HTMx has a few different strategies to handle this and I wanted to show you two.

<!-- excerpt-end -->

## Swap out of bands

The first strategy has a name that doesn't really roll of the tongue that easy; [Out of bands swap](https://htmx.org/attributes/hx-swap-oob/). It simply means that we can tell HTMx to do more than one update in the page based of the response. I think about it as us throwing in additional update instruction in another response.

It's easiest to show you with an example; let's update the counters as part as showing the list.

### Get the counters

First - let's write a function that makes the counting. I flexed my functional brain and created the following function that will do just that, but using `.map` and `.reduce` (and also looping through the list only once):

```javascript
const getCounters = (todos) => {
  const today = new Date();

  return todos
    .map(todo => ({
      late: new Date(todo.duedate) < today ? 1 : 0,
      completed: todo.completed ? 1 : 0
    }))
    .reduce((acc, curr) => ({
      total: acc.total + 1,
      late: acc.late + curr.late,
      completed: acc.completed + curr.completed
    }), { total: 0, late: 0, completed: 0 });
};
```

The `.map` step creates a new object for each todo and tracks if the item is late and completed. Then in the `.reduce` step we accumulate those numbers, adding a total, to get a final counter object.

Put that function in the `routes/todo.js` file.

### Updating the `GET /` end point

In that same file, we can now update `router.get("/")` to use this function and pass the result on to the the `views/todo/list.ejs` template:

```javascript
router.get("/", async (req, res) => {
  const todos = await getAllTodos();
  const counters = getCounters(todos);
  res.render("todo/list.ejs", { todos, counters });
});
```

### Updating the `views/todo/list.ejs` template

Now, here is the HTMx part. In the `list.ejs` view we are going to render two snippets of HTML; the list and the counters. I KNOW - it's super weird.

```html
<% todos.forEach(todo => { %>
  <%- include("todo-list-item.ejs", {todo}) -%>
<% }) %>

<p hx-swap-oob="innerHtml:#counters">
  Total items: <span id="total-items"><%= counters.total %></span>
  | Completed: <span id="completed-items"><%= counters.completed %></span>
  | Late:  <span id="late-items"><%= counters.late %></span>
</p>
```

The trick lies in the `hx-swap-oob="innerHtml:#counters"` attribute, which tells HTMx to swap the inner HTML of the #counters element with this element. You can [read more about the capabilities of `hx-swap-oob` here](https://htmx.org/attributes/hx-swap-oob/).

It basically means that the `<p  hx-swap-oob>` will not be displayed in the `list.ejs`, but rather HTMX will, when the `HTTP GET` response for `/` returns the to client, swap the `innerHTML` for the `#counters` selector.

Let's make that work by updating the `main.ejs` footer section to this:

```html
<footer id="counters">
  <p>There will be counters here when you log in</p>
</footer>
```

And, just because we can, let's clean up the `list.ejs` to include a `counters.ejs` file. Here's the updated `list.ejs` template:

```html
<% todos.forEach(todo => { %>
  <%- include("todo-list-item.ejs", {todo}) -%>
<% }) %>

<%- include("counters.ejs", {counters}) -%>
```

And then here's the `views/todo/counters.ejs`:

```html
<p hx-swap-oob="innerHtml:#counters" >
  Total items: <span id="total-items"><%= counters.total %></span>
  | Completed: <span id="completed-items"><%= counters.completed %></span>
  | Late:  <span id="late-items"><%= counters.late %></span>
</p>
```

That will soon become useful...

## Expand the target

HTMx have actually written about the different strategies to handle these types of updates, but hidden in a post about tables. It's a [great read](https://htmx.org/examples/update-other-content/) and I just want to mention one strategy that we will not use: [Expand the target](https://htmx.org/examples/update-other-content/#expand).

That simply means, in our case, that we would include the `<footer>` in the all responses where it's needed to be displayed. That is by far the easiest to do, but also a bit crude and might not support all use-cases.

For example ours. And to be honest, even using the `hx-swap-oob` is a bit too clumsy for us.

When you think about it means that we need to include the counting of items and the `counters.ejs` template, in just about all responses our little app send back. Not that it's heavy or request intensive but it gets pretty hard to understand when reading the codebase.

If only there was a way to inform the counters about that they need to be updated. Some kind of ... event that we could trigger

## Trigger events to update

And sure there is... [`hx-trigger`](https://htmx.org/attributes/hx-trigger/) can respond to custom events as well as standard such as `click` or `change`.

And we can trigger these events, server-side, by using the `HX-Trigger` header.

That will create a nice event-driven system where events that happens server-side can be propagated back to the client. The client can then use the standard `hx-trigger` setting to indicate that when it should be updated.

I'm going to leave the `hx-swap-oob` for the `/` route, and then use the `HX-Trigger` approach for all other routes (that updates any data).

### Set a header using Express

Let's take the `router.delete("/:id")` as an example. Add the `HX-Trigger` header in the response by making the route look like this:

```javascript
router.delete("/:id", async (req, res) => {
  await deleteTodo(req.params.id);
  res
    .status(204) // no content
    .header("HX-Trigger", '{"ITEM_UPDATED": `The ${id} item was DELETED`}')
    .send();
});
```

The `HX-Trigger` header can consist of whatever you want, but should at least be a name of the event, and in my case I'm passing along a little message too. I'm just that nice!

We can now update the `<footer>` in `main.ejs` to listen for the `ITEM_UPDATED` event like this:

```html
<footer id="counters" hx-trigger="ITEM_UPDATED from:body" hx-get="/todo/counters">
  <p>There will be counters here when you log in</p>
</footer>
```

When the `ITEM_UPDATED` is triggered, which it will be using the `HX-Trigger` header, we promptly `HTTP GET /todo/counters` that will return the counters.

That `from:body` part is needed since the event is bubbling up from the body. Straight [from the docs](https://htmx.org/attributes/hx-trigger/)

> This is because the header will likely trigger the event in a different DOM hierarchy than the element that you wish to be triggered

### `/todo/counters` endpoint

Writing the endpoint is pretty straight-forward, and we can reuse the `getAllTodos` function and the `counters.ejs` template:

```javascript
router.get("/counters", async (req, res) => {
  const todos = await getAllTodos();
  const counters = getCounters(todos);
  res.render("todo/counters.ejs", { counters });
});
```

There's only one problem, it's not showing up. That's because our `counter.ejs` template included that `hx-swap-oob` statement. Now, in normal cases I could just have removed that, but since I wanted this to show off both variants I'm going to add a little switch for that:

```html
<% if(typeof addSwapOOB !== 'undefined') { %>
  <p hx-swap-oob="innerHtml:#counters">
<%} else { %>
  <p>
<% } %>
  Total items: <span id="total-items"><%= counters.total %></span>
  | Completed: <span id="completed-items"><%= counters.completed %></span>
  | Late:  <span id="late-items"><%= counters.late %></span>
</p>
```

And then, only for the `/` route I can pass `addSwapOOB:true`:

```javascript
```

I'm not too happy but it will help to show the different approaches.

### Updating the other action endpoints

I then went through the other endpoints that are not `HTTP GET` and added the `HX-Trigger`-header. All of these end points changes the values I want to display and should trigger an update of the counters.

After some refactoring they look like this example:

```javascript
const TRIGGER_HEADER = "HX-Trigger";

router.put("/:id/toggle", async (req, res) => {
  await toggleTodoCompleted(req.params.id);
  const todo = await getTodo(req.params.id);

  res.setHeader(TRIGGER_HEADER, `{"ITEM_UPDATED": "The ${req.params.id} completion was toggled"}`)
  res.render("todo/todo-list-item.ejs", { todo });
});
```

And now the counters are updated through the events that gets triggered

## Summary

There's immense power in the event driven approach to update parts of the UI. Not only can very complex and previously tricky relationships between different parts of the UI be created. They can also be handled in a declarative and easy-to-understand way.

For example, imagine that we instead of `ITEM_UPDATED` had specialized events for every typ of update; `ITEM_DELETED`, `ITEM_ADDED` etc.

Then different parts of the UI could subscribe on one or more of these events:

```html
<footer id="counters" hx-trigger="ITEM_UPDATED, ITEM_ADDED from:body" hx-get="/todo/counters">
  <p>There will be counters here when you log in</p>
</footer>
```

Some very interesting and advanced UIs could be built this way.

I learned a lot by writing this series and I hope you found it useful too.

I think HTMx is a breath of fresh air for web developers that, like me, have got lost in SPA frameworks and JSON-to-HTML parsing. It brings the pure ideas of the web back to the forefront while still allows me to write websites that only rerenders the part of the application that has changed.

[The code is found here in the state that I left it in at the end of this post.](https://github.com/marcusoftnet/htmx-todo-tutorial/tree/406bda133d83410d85c52286f66a4f0124b19e6e)
