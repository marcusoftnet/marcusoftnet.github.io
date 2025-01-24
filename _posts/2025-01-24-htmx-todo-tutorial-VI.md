---
layout: post
title: "HTMx - tutorial part VI - Clean up"
author: "Marcus Hammarberg"
date: 2025-01-24 04:00:00
tags:
  - Programming
  - HTMx
  - Node
  - Express
---

When I describe what HTMx does to people that has never heard about it I often end up telling them about the good old days when we wrote server-side rendered apps, but sadly that replaced the whole page. And then came SPA frameworks and all you got downloaded in the first page access was a `<div id="app></div>`, then the app got rendered by JavaScript from JSON and the whole concept of the web, HTTP and REST got lost.

HTMx marries these two together. But showing the `main.ejs` as it stands right now reminds me too much about the old days. Let's clean it up, and we will soon see that it will look much like a modern SPA, with the huge difference that it is using server rendered HTML that and is easy to grasp.

This is the sixth post in a series that I'm making about HTMx that I think is utterly amazing and will change how I (we?) write web apps in the future.

You are more than welcome to read from here, but then I would recommend getting the [code from this point](https://github.com/marcusoftnet/htmx-todo-tutorial/tree/b8afbb18852890a591f23e26fa05dc70d171ee46), if you intend to type along.

<!-- excerpt-end -->

There's nothing wrong with the structure of today, other than it looks a bit like ASP-pages from 2001. But it works, is quite reasonable. Here's a snippet of `main.ejs` that shows the problem:

```html
<nav>
  <h1><%= envs.APP_NAME %></h1>
  <% if (!user) { %>
    <%- include("partials/auth/googleSignIn.ejs", {envs})%>
  <% } else { %>
    <%- include("partials/auth/userProfile.ejs", {user}) %>
  <% } %>
</nav>

<main class="todo-container">
  <% if (!user) { %>
  <h2>Log in to see your To-do list</h2>
  <% } else { %>
  <div hx-get="/todo/new" hx-trigger="load"></div>
  <hr>
  <div id="todo-list" hx-get="/todo" hx-trigger="load"></div>
  <% } %>
</main>
```

What if we just move that to an endpoint on the server? I was surprised that change did not only clean up `main.ejs` but also actually helped me refine and clarify each view.

### Nav-bar

The `<nav>` can be improved by adding a `hx-trigger="load"` which means that we will call to an endpoint when its first loaded:

```html
<nav hx-get="/nav" hx-trigger="load"></nav>
```

And the backend looks like this:

```javascript
app.get("/nav", (req, res) => {
  const templateName = req?.session?.user ? "userProfile.ejs" : "googleSignIn.ejs";
  return res.render(`partials/auth/${templateName}`, {
      envs,
      user: req?.session?.user,
    })
});
```

Here I check if there's a `req?.session?.user` and in that case render the `userProfile.ejs` (in the `partials/auth` folder), otherwise I render the `googleSignIn.ejs`.

The `googleSignIn.ejs` will post back to `HTTP POST /auth/login` (see [part II](https://www.marcusoft.net/2025/01/htmx-todo-tutorial-II.html)) and at the end of that route we see this code:

```javascript
// Login in firebase
// create session object
req.session.user = sessionData;
return res.redirect("/");
```

This feels reasonable for me; when we have logged in, we can rerender the entire page, since many things have to be updated.

Now, when the `<nav hx-get="/nav" hx-trigger="load">` fires we will `HTTP GET /nav` and then render the `userProfile.ejs` with some user data.

Each part is easy to understand and reason about. The `nav` bar too, which is now tiny.

### `<main>` - the home of the app

Let's make a similar change to the `<main>` element:

```html
<main class="todo-container" hx-get="/main" hx-trigger="load"></main>
```

And then we implement this backend:

```javascript
import { getAppViewData } from "./routes/todo.js";

app.get("/main", async (req, res) => {
  if (!req?.session?.user) {
    return res.send("<h2>Log in to see your Todo list</h2>");
  } else {
    return res.render("todo/app.ejs", await getAppViewData());
  }
});
```

I'm doing a similar check here and just send back a string when you don't have a session (i.e. are not logged in).

When you are logged in I render the `todo/app.ejs` which is a wrapper for the `new.ejs` and `list.ejs` template:

```html
<%- include("new.ejs") %>
<hr />
<%- include("list.ejs", {todos, counters}) %>
```

Notice that I need to pass `todos` and `counters` to the `list.ejs`. To get that data I need a helper function from the `todo/` route. I change that endpoint to this:

```javascript
export const getAppViewData = async () => {
  const todos = await getAllTodos();
  const counters = getCounters(todos);
  return {todos, counters};
}

router.get("/", async (req, res) => {
  const appViewData = await getAppViewData();
  res.render("todo/list.ejs", { ...appViewData, addSwapOOB: true });
});
```

Now I can pass that `getAppViewData` to the `app.ejs`-view.

But it felt a bit weird that the `counters.ejs` belonged to the `list.ejs`-view. We did that [when we created the out-of-bands update](https://www.marcusoft.net/2025/01/htmx-todo-tutorial-IV.html).

But the `counters.ejs` is not really part of the `list.ejs`. I update the `app.ejs`to this:

```html
<%- include("new.ejs") %>
<hr />
<%- include("list.ejs", {todos}) %>

<%- include("counters.ejs", {counters, addSwapOOB: true}) -%>
```

(That weird `addSwapOOB: true` is just me enabling different ways to show you event-driven-updates.)

That made the `list.ejs` very clean. I just wrapped it in it's `div` - that also belongs to the list, don't you think (before it was in `main.ejs`):

```html
<div id="todo-list">
  <% todos.forEach(todo => { %>
    <%- include("todo-list-item.ejs", {todo}) -%>
  <% }) %>
</div>
```

And with that we have refactored our application to be cleaner, and utilize more of the HTMx approach of building event-driven (`load`) applications so that it looks SPA-y but really is all just endpoints responding with HTML.

## Summary

This feels better since it now shows a very clean first page:

```html
 <body>
  <nav hx-get="/nav" hx-trigger="load"></nav>

  <main class="todo-container" hx-get="/main" hx-trigger="load"></main>

  <footer id="counters" hx-trigger="ITEM_UPDATED from:body" hx-get="/todo/counters">
    <p>There will be counters here when you log in</p>
  </footer>
</body>
```

Just like with a SPA, the first load is just _an empty div_. But in our case a `<main>` with a `hx-trigger="load"` that then fetch the other parts of the application. It becomes like a little component. Indeed - I can add more of them on my page, should I want to.

In the process we got an opportunity to make our application a little more DRY.

[The code is found here in the state that I left it in at the end of this post.](https://github.com/marcusoftnet/htmx-todo-tutorial/commit/https://github.com/marcusoftnet/htmx-todo-tutorial/tree/df40b673af570ba2ef12d5e3368221b93591cd0e). The current `main` is [found here](https://github.com/marcusoftnet/htmx-todo-tutorial).
