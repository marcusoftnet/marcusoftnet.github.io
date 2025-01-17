---
layout: post
title: "HTMx - tutorial part III - Building the application"
author: "Marcus Hammarberg"
date: 2025-01-15 04:00:00
tags:
 - Programming
 - HTMx
 - Node
 - Express
---

This is the third post in a series that I'm making about HTMx that I think is utterly amazing and will change how I (we?) write web apps in the future. You are more than welcome to read from here, but it will be hard following along code-wise if you haven't stepped through [part I](https://www.marcusoft.net/2025/01/htmx-todo-tutorial.html) and [part II](https://www.marcusoft.net/2025/01/htmx-todo-tutorial-II.html) first

In this part we will build the core logic of the application and start to create todo-items and store them in Firestore.

<!-- excerpt-end -->

## Store data in Firestore

Let's get the storage stuff out of the way first. I really want to write some HTMx stuff, but we'll be better off having somewhere to store the items.

Head on over to the [Firebase Console](https://console.firebase.google.com) and create a database in a region of your choice.

Create a rule that looks like this, to allow authenticated users to read and write:

```javascript
rules_version = '2';
service cloud.firestore {
  match /databases/{database}/documents {
    // Allow users to read/write their own todos
    match /{userId}/{document=**} {
      allow read, write: if request.auth.uid == userId;
    }
  }
}
```

### Configuration application

We will use the firebase SDK to access Firestore, so install it with `npm i firestore`.

Then create a firebase app, by configuring it like this (I've put this in `lib/firebase/config.js`):

```javascript
import { initializeApp } from "firebase/app";

const firebaseConfig = {
  apiKey: process.env.FIREBASE_APIKEY,
  authDomain: process.env.FIREBASE_AUTHDOMAIN,
  projectId: process.env.FIREBASE_PROJECTID,
  storageBucket: process.env.FIREBASE_STORAGEBUCKET,
  messagingSenderId: process.env.FIREBASE_MESSAGINGSENDERID,
  appId: process.env.FIREBASE_APPID,
};

export default const app = initializeApp(firebaseConfig);
```

Yes. Let's play it safe and put all those keys in the `.env` file.

### Write a service

Create this file in `lib/firebase/todoService.js`:

```javascript
import {
  collection,
  getDocs,
  doc,
  getDoc,
  updateDoc,
  deleteDoc,
} from "firebase/firestore";
import { onAuthStateChanged } from "firebase/auth";

import { db, auth } from "./config.js";

async function getCurrentUser() {
  return new Promise((resolve, reject) => {
    const unsubscribe = onAuthStateChanged(auth, (user) => {
      unsubscribe();
      if (user) {
        resolve(user);
      } else {
        reject(new Error("User not authenticated"));
      }
    });
  });
}

export async function getAllTodos() {
  const user = await getCurrentUser();
  const userId = user.uid;
  const snapshot = await getDocs(collection(db, userId));
  return snapshot.docs.map((doc) => ({ id: doc.id, ...doc.data() }));
}

export async function getTodo(todoId) {
  const user = await getCurrentUser();
  const userId = user.uid;
  const docRef = doc(db, userId, todoId);
  const docSnap = await getDoc(docRef);
  if (docSnap.exists()) {
    return { id: docSnap.id, ...docSnap.data() };
  } else {
    return null;
  }
}

export async function updateTodo(todoId, updates) {
  const user = await getCurrentUser();
  const userId = user.uid;
  const docRef = doc(db, userId, todoId);
  return await updateDoc(docRef, updates);
}

export async function deleteTodo(todoId) {
  const user = await getCurrentUser();
  const userId = user.uid;
  const docRef = doc(db, userId, todoId);
  await deleteDoc(docRef);
}

export async function toggleTodoCompleted(todoId) {
  const user = await getCurrentUser();
  const userId = user.uid;
  const docRef = doc(db, userId, todoId);

  // Get the current completed status
  const docSnap = await getDoc(docRef);
  if (docSnap.exists()) {
    const currentCompleted = docSnap.data().completed || false; // Default to false if not set

    // Update with the toggled value
    await updateDoc(docRef, { completed: !currentCompleted });
  } else {
    throw new Error('Todo not found');
  }
}
```

This file is a pretty standard setup for storing data in for a logged in user.

### Log in to Firebase

One thing is left to, is to ensure that our user is logged into the Firebase. Go to `routes/auth.js` and add the following lines to the `router.post("/login")`:

```javascript
// Add these imports
import { auth } from "../lib/firebase/config.js";
import { signInWithCredential, GoogleAuthProvider } from 'firebase/auth';

router.post("/login", async (req, res) => {
  // As before until
  // const ticket = await client.verifyIdToken({

  // These lines to sign in to Firebase using the Google credential**
  const googleCredential = GoogleAuthProvider.credential(credential);
  await signInWithCredential(auth, googleCredential);

  // And then as before
});
```

## HTMx introduction

Finally! Let's dive into HTMx a bit more. I'll do a very basic introduction and then I'll redirect you to something deeper.

The thing that I love about HTMx is that it is so small and simple that you can explain it in 2-3 sentences. But at the same time powerful to move the world. With this "simple" tool you can build everything you want.

HTMx allows you to issue any type of `HTTP` request from any HTML element. It further allows you to decide where to target the response and how to replace the content of that target.

Consider these `<div>`:

```html
<div hx-post="/increase" hx-target="#result" hx-swap="outerHTML">+</div>
<div id="result">0</div>
```

When this button is clicked a `HTTP POST` request is sent to the `/increase` endpoint. The result is then replacing the `hx-target`. A suitable return value could be:

```html
<div id="result">0</div>
```

There are many things here that HTMx enables, that HTML doesn't have:

* We can issue any type of `HTTP` request from any type of HTML element
* We can easily control where the response should be placed (`hx-target`). Be default it is the `this`, meaning the same element. But you address elements using any valid CSS selector and some more [dynamic ways](https://htmx.org/attributes/hx-target/), such as `closest` and `next`.
* Using `hx-swap` we have control how to change the target with the response. We could, for example, replace the entire element using `outerHTML`, append at the end or the beginning and [much more](https://htmx.org/attributes/hx-swap/).

### HTMx Documentation

The HTMx website looks ... simple and dated, but has everything you need:

* The reference of [attributes](https://htmx.org/reference/) is very useful. And in combo with the [docs](https://htmx.org/docs/) is amazing.
* There are many [examples](https://htmx.org/examples/) about how you do common (and some uncommon) tasks.
* The [essays](https://htmx.org/essays/) gives you deeper understanding
* And if you want to there's a [complete book on REST, HATEOAS](https://hypermedia.systems/) and everything that you want to know on how and why HTMx was built.

This video will go through just about everything that you ever want to know, in break-neck speed.

<iframe width="560" height="315" src="https://www.youtube.com/embed/TT7SV-bAZyA" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>

## HTMX - Create new todo

Let's create a new todo and start by using HTMx to load the form. This is strictly not needed, but allows us to show off some HTMx features and build an application that looks a bit more like a SPA. We're going to lazy load the form to create new todo items.

### Show the form

First let's create the todo-routes in a separate file (`routes/todo.js`), and create the first route that returns the form to create a new todo:

```javascript
import express from "express";
const router = express.Router();

router.get("/new", (req, res) => res.render("/todo/new.ejs"));

export default router;
```

Then mount these routes like this in `server.js`:

```javascript
import todoRoutes from './routes/todo.js';
app.use("/todo", todoRoutes);
```

Then create the form in `views/todo/new.ejs`:

```html
<form id="new-todo-form">
  <input type="text" name="title" placeholder="Title" required />
  <input type="date" name="duedate" required />
  <button type="submit">Add Todo</button>
</form>
```

We'll soon add in the HTMx attributes.

Let's clean up the `main.ejs` and make the main section look like this:

```html
<main class="todo-container">
<% if (!user) { %>
    <h2>Log in to see your To-do list</h2>
<% } else { %>
  <div hx-get="/todo/new" hx-trigger="load"></div>
  <div id="todo-list"></div>
<% } %>
</main>
```

Notice the `hx-trigger="load"` that will issue a `HTTP GET` towards `/todo/new` when the div is loaded. That will then lazily load the list.

Also notice the `<div id="todo-list">` which will be the place where the todo list is generated.

That is enough for now.

### Create the todo

Let's think about to what should happen when this form is posted:

1. It should post to `/todo`
1. The item should be stored in firebase, which generates an id property.
1. HTML for the created item should be returned and prepended to the list called `#todo-list` (that we put in `main.ejs`)
1. The form should be cleaned out

Let's set up the form and button to issue the requests in the proper way :

```html
<form id="new-todo-form" hx-on::after-request="this.reset()">
  <input type="text" name="title" placeholder="Title" required />
  <input type="date" name="duedate" required />
  <button type="submit" hx-post="/todo" hx-target="#todo-list" hx-swap="afterbegin">Add Todo</button>
</form>
```

* With the help `hx-post`, `hx-target` and `hx-swap` we have told HTMx to post the form (it will automatically pick up all inputs in the form), and add the result to `#todo-list`
* HTMx has a [rich event system](https://htmx.org/attributes/hx-on/) that we can hook into. Here we are getting called after the request and reset the form.

Let's now build the backend that stores the todo in firestore and return a snippet of html to insert in `#todo-list`

```javascript
import { addTodo } from "../lib/firebase/todoService.js";

router.post("/", async (req, res) => {
  const postedTodo = {
    title: req.body.title,
    duedate: req.body.duedate,
    completed: false,
  };
  const createdTodo = await addTodo(postedTodo);

  res.render("todo/todo-list-item.ejs", { todo: createdTodo });
});
```

And the `todo/todo-list-item.ejs` can look like this:

```html
<div class="todo-item">
  <span class="todo-title"><%= todo.title %></span>
  <span class="todo-field"><%= todo.duedate %></span>
  <span class="todo-field"><%= todo.completed ? "✅" : "⏳" %></span>
</div>
```

(I made some styling changes here)

Perfect we can now create new todo items. AND they get prepended to the list. However, if you reload the page the list is gone.

### Lazy load the list of todos

That's because we are using HTMx capabilities to dynamically update the list, on the client. However, we have never loaded the list of items from the start (or when the page is reloaded).

But we have everything we know to do that. Let's lazily load the list. Here's the backend in `routes/todo.js`:

```javascript
import { addTodo, getAllTodos } from "../lib/firebase/todoService.js";

router.get("/", async (req, res) => {
  const todos = await getAllTodos();
  res.render("todo/list.ejs", {todos});
});
```

And here's the template `views/todo/list.ejs`, that in turn calls out to `views/todo/todo-list-item.ejs` for some nice reuse:

```html
<% todos.forEach(todo => { %>
  <%- include("todo-list-item.ejs", {todo}) -%>
<% }) %>
```

And `main.ejs` can now be rewritten like this.

```html
<main class="todo-container">
  <% if (!user) { %>
  <h2>Log in to see your To-do list</h2>
  <% } else { %>
  <div hx-get="/todo/new" hx-trigger="load"></div>
  <hr />
  <div id="todo-list" hx-get="/todo" hx-trigger="load"></div>
  <% } %>
</main>
```

In all honesty; we could also have preloaded these two `<div>`s with server-side rendering, but now that we are trying HTMx out I thought it would be cool to use the lazy loading feature.

### Morgan

Let's add some logging capabilities to better see what we are calling in the back end. That is super simple with [Morgan](https://www.npmjs.com/package/morgan) that is a middleware for Express:

```bash
npm i morgan
```

and then in `server.js`:

```javascript
import morgan from "morgan";

// Middleware
app.use(morgan("dev"));
```

Restart the application and log in and you can now see the different routes being hit, through our lazy-loading of the application.

### Toggle completion

Toggle completion will be implemented with a `HTTP PUT` and then I'll just replace the entire `#todo-item`.

```html
<div class="todo-item">
  <span class="todo-title"><%= todo.title %></span>
  <span class="todo-field"><%= todo.duedate %></span>
  <span class="todo-field completion"
    hx-put="/todo/<%= todo.id %>/toggle"
    hx-target="closest .todo-item"
    hx-swap="outerHTML"
    ><%= todo.completed ? "✅" : "⏳" %></span>
</div>
```

Notice the `hx-target="closest .todo-item" hx-swap="outerHTML"` that will find the parent and then replace the entire node with the returned content.

Also notice that I'm construction the URL to the `HTTP PUT` request using the `id` of the todo item (`hx-put="/todo/<%= todo.id %>/toggle"`)

Here's the backend code:

```javascript
router.put("/:id/toggle", async (req, res) => {
  await toggleTodoCompleted(req.params.id);
  const todo = await getTodo(req.params.id);
  res.render("todo/todo-list-item.ejs", {todo});
});
```

The `:id` construct is a way for Express to parse the querystring into `req.params.id`.

### Delete Todo items

While we're at it, lets create a delete feature. Its very much the same, here's the backend:

```javascript
import { deleteTodo } from "../lib/firebase/todoService.js";
const router = express.Router();
router.delete("/:id", async (req, res) => {
  await deleteTodo(req.params.id)
  res.send(); // No content
});
```

The correct way, according to REST principles, to respond to `HTTP DEL` is through `No Content` (status code 200 or 204). I've always wonder about that, but now it makes sense. Let's replace this element itself with the empty response, in effect deleting the the element.

In the template I also show off the `hx-confirm` that will pop-up a confirmation box.

```html
<div class="todo-item">
  <span class="todo-title"><%= todo.title %></span>
  <span class="todo-field"><%= todo.duedate %></span>
  <span
    class="todo-field todo-action"
    hx-put="/todo/<%= todo.id %>/toggle"
    hx-target="closest .todo-item"
    hx-swap="outerHTML"
    ><%= todo.completed ? "✅" : "⏳" %></span
  >
  <span
    class="todo-field todo-action"
    hx-confirm="Delete?! Sure about that?"
    hx-delete="/todo/<%= todo.id %>"
    hx-target="closest .todo-item"
    hx-swap="outerHTML"
    >❌</span
  >
</div>
```

Since the `hx-target` and `hx-swap` are the same for the two `<spans>` we can make use of the HTMx inheritance feature. All attributes are inherited from their parents, but can be overridden.

Here's the cleaned up code:

```html
<div
  class="todo-item"
  hx-target="closest .todo-item"
  hx-swap="outerHTML">
  <span class="todo-title"><%= todo.title %></span>
  <span class="todo-field"><%= todo.duedate %></span>
  <span
    class="todo-field todo-action"
    hx-put="/todo/<%= todo.id %>/toggle">
      <%= todo.completed ? "✅" : "⏳" %></span
  >
  <span
    class="todo-field todo-action"
    hx-confirm="Delete?! Sure about that?"
    hx-delete="/todo/<%= todo.id %>"
    >❌</span
  >
</div>
```

Nice! We're getting close to done. Let's make a Edit-feature too.

### Edit todo item

This is a bit trickier - we need a form to edit the item, and then a way to update the item using a `HTTP PUT`.

That's two backend features ordered:

```javascript
router.get("/:id/edit", async (req, res) => {
  const todo = await getTodo(req.params.id);
   res.render("todo/edit.ejs", {todo});
});

router.put("/:id", async (req, res) => {
  const postedTodo = req.body;
  await updateTodo(req.params.id, postedTodo);
  const todo = await getTodo(req.params.id);
  res.render("todo/todo-list-item.ejs", {todo});
});
```

Displaying the edit form is a little bit interesting. We're going to change

And the `edit.ejs` file looks different enough from the `new.ejs` to warren a separate file, but it's quite similar:

```html
<form id="new-todo-form">
  <input type="text" name="title" required value="<%= todo.title %>" />
  <input type="date" name="duedate" required value="<%= todo.duedate %>" />
  <button
    type="submit"
    hx-put="/todo/<%= todo.id %>"
    hx-target="closest .todo-item"
    hx-swap="outerHTML"
  >Update</button>
</form>
```

## Summary

That's it for this post. We have built a fully-fledge (albeit missing some error handling and validation, I'm happy to admit) todo application, storing the information in a collection per logged in user.

[The code will be update here](https://github.com/marcusoftnet/htmx-todo-tutorial/tree/8c5fa67aeaa48c866cc2e2aace32d12e513f7b17).

I have one more thing I wanted to build and that is the counters at the end. It will require some HTMx trickery and I'll explore some options on how to achieve that, and make some very lofty promises. But that is in the [next post](https://www.marcusoft.net/2025/01/htmx-todo-tutorial-IV.html).
