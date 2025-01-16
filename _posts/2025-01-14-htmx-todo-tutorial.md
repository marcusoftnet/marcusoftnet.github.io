---
layout: post
title: "HTMx - back to basics"
author: "Marcus Hammarberg"
date: 2025-01-14 04:00:00
tags:
 - Programming
 - HTMx
 - Node
 - Express
---

I felt the urge to write a tutorial. Maybe I'm the last human that will write one now that AIs are baked in everywhere. But that urge comes when I stumble on a new things, ways of working or ideas - and now I've reading, playing around with and used [HTMx](https://htmx.org) for awhile and I'm hooked.

HTMx totally rubs me the right way now that building a plain old web site, with some login-capabilities and personal data requires a SPA framework of hundreds of megabytes (2.802.804 lines of code...).

That's a lot. And a lot to learn. Finally, the whole "API returns JSON" - "SPA framework turns JSON to HTML" dance feels pretty redundant, when you think about it.

I'm going to try to avoid to make this and Old Man Rant (tm), but first let's go back in time to life before SPAs, and I'll show how we did web back then.

This first post will be a bit theoretical but then we will write a Todo application (had to be one of those, right?) that stores data in Firebase and allows you to log in with Google.

<!-- excerpt-end -->

## Multi-page applications

When I first used the web it was a simpler time. You wrote an URL (not seldomly by hand, from a magazine with lists of URL). That URL typically ended in `.html` to indicate the file name you wanted to see.

That issued a `HTTP GET`-request to the server and the server got the name of the file and sent it back in a response.

Sometimes the file contained `<a href="/newpage.html">New page</a>` links to other pages. Clicking one of those links issued another `HTTP GET` request, and meant that the entire page was replaced with the content of the new page.

After a while we got sneakier on the server side and created the pages dynamically. That is; when someone sent information to the server (like a `HTTP POST`:ed body) we could use this information and create the response dynamically.

This was the rise of the template engines. Elegant tools that allowed us to sprinkle in some dynamical data into a document, for example HTML. We used tools like [Active Server Pages](https://en.wikipedia.org/wiki/Active_Server_Pages) to do this. Again - returning HTML from the server, and re-rendered the entire page.

Simpler times. But also pretty slow, because the pages became bigger and bigger. And we started to include loads of interactivity on the client side. Full applications written in JavaScript which would be reloaded if we reloaded the page.

We looked into the problem and realized that the best way of solving this is to not update the entire page, but rather update only a small part of the page.

Our solution was to do all of that in a framework that runs in the browser. Hence the first page that a SPA returns, looks like something this:

```html
<!DOCTYPE html>
<html lang="en">
  <head>
    <title>React App</title>
    <script defer src="/static/js/bundle.js"></script>
  </head>
  <body>
    <noscript>You need to enable JavaScript to run this app.</noscript>
    <div id="root"></div>
  </body>
</html>
```

The `bundle.js` is the application that then turns your JavaScript (that operates on JSON) into HTML and inject it in the `<div id="root"></div>`

Imagine if the community instead, back in the 00-ies, would have said: Hold on, what if HTML itself could replace part of the page.

If that was the case - then HTMx would have been born then

## HTMX

HTMx is a brilliant little piece of technology that does few things, but do them well; 1) it allows you to let any HTML element issue all types of HTTP request, and 2) it gives you control over how to replace, augment or change the HTML based on the response.

The simplest way to describe it is through an example (based on HTMx own first example):

```html
<button hx-trigger="click" hx-post="/clicked" hx-swap="outerHTML">
  Click Me
</button>
```

Then someone `click` the button, send a `HTTP POST` to `/clicked`. Take the content of that response and replace / `swap` the `outerHTML` (that is; the entire button) with that content.

That means that `HTTP POST` to `/clicked` should return a HTML snippet. Not a complete page, but the thing that you want to replace the button with. For example:

```html
<h2>You clicked the button</h2>
<p>Well done!</p>
```

That's it. This is all HTMX does. Ah, there are many variants for [`hx-` attributes](https://htmx.org/reference/#attributes) and a lot of subtleties. But using HTMx you can build just about all web interactions you can think of, including some pretty [advanced user interfaces](https://htmx.org/examples/), that you naturally would gravitate towards JavaScript for.

Oh, missed that almost; the code above is all you need. No JavaScript is needed to use HTMX. HMTx itself is written in JavaScript, and adds those `hx-` attributes on all web elements.

HTMx is included on your webpage and is small (52k):

```html
<script src="https://unpkg.com/htmx.org@2.0.4"></script>
```

## What does this mean?

I was super excited when I saw this because I think this make the web world a whole lot simpler than it has become in SPA-land.

In many ways I can go back to the web from days yonder:

- Use bare-bones [REST principles](https://restfulapi.net/) (and even [HATEOAS](https://en.wikipedia.org/wiki/HATEOAS)), such as resources, verbs and headers to describe and drive the API
  - But still be lightweight and make fast front-ends that only reloads parts of the web page
- Return HTML rather than JSON
  - This means that designing can be done in pure HTML and CSS
- Use whatever backend technology I want
  - I just need to return HTML from the endpoints. The client just need to HTTP-request HTML. HTMx doesn't care either.

## Wasn't this supposed to be a tutorial?

Yes, yes you are correct. Let's build something with HTMx. I will admit that writing this sentence I don't know yet how it will end up - but that will be part of the journey.

I will use:

- [Express](https://expressjs.com/) to build my backend API. [2014 was the date of my first post on Express](http://www.marcusoft.net/2014/02/mnb-express.html), I still love Express.
  - I will also use the `express-sessions` to keep track of user data.
- [EJS template](https://ejs.co/) - it's old, it's still used a lot and works well with Express. AND it looks a bit like Active Server Pages.
- [HTMx](https://htmx.org), kinda goes without saying for this tutorial.

This post will just get us up and running, but I picked up some news about Node on the way. I hope you find it useful too.

### Setup

Open a terminal and execute the following commands that will create our skeleton app:

```bash
mkdir htmx-todo-tutorial
cd htmx-todo-tutorial

touch server.js
touch .env

npm init -y; npm pkg set type="module";
npm pkg set scripts.start="node --env-file=.env server.js"
npm pkg set scripts.dev="node --watch --env-file=.env server.js"
npm pkg delete scripts.test

mkdir public views views/partials
touch public/style.css
touch views/main.ejs
touch views/partials/googleSignIn.ejs

npx -y gitignore node

npm i express ejs express-session google-auth-library

code .
```

A few things that I picked up when writing this:

- *`npm pkg set`* - programmatically make changes to `package.json`, for example adding and deleting scripts.
- *`node --env-file=.env server.js`* - means that I can pick up environment variables from a file using pure Node.
- *`node --watch`* - node has a built-in watch feature.

I opened this in Visual Studio Code, but code in whatever you like.

### Environment variables

The `.env`-file holds our secrets (excluded from being checked in by the `.gitignore` that `npx gitignore node` created for us) and environment variables, right now we will only have one parameter there.

Add this in the `.env`-file:

```text
PORT=3001
```

### Setting up Express

Let's start our Express server, write the following code in `server.js`:

```javascript
import express from "express";

const { PORT } = process.env;

const app = express();

// Middleware
app.use(express.static("public"));
app.use(express.json());
app.use(express.urlencoded({ extended: true }));

// Routes
app.get("/", (req, res) => {
  return res.render("main.ejs");
});

// Start server
app.listen(PORT, () => {
  console.log(`Server listening on http://localhost:${PORT}`);
});
```

Pretty standard stuff, but let me walk you through it:

- `const { PORT } = process.env;` - get the value of `PORT` in the `.env` file, thanks to the `--env-file=.env` parameter to Node
- `app` refers to our Express app and one of it's powers is that it is very easy to extend it. This is done through [middlewares](https://expressjs.com/en/guide/using-middleware.html) and we are enabling a few here:
  - `express.static("public")` - allows us to send raw files from the `public` folder, for example the `style.css` that is in there now. It can now be addressed using `http://localhost:3001/style.css` for example
  - `express.json()` and `express.urlencoded()` - will turn HTTP posted bodies into JavaScript objects, which will become handy.
- `app.get("/", fn)` - is how we declare request handlers. Basically, when someone calls `/` run this code.
  - We use `res` (response) and it's `render` method that will render a template using EJS. To be honest I don't know if EJS is default in Express or not, but I didn't have to configure either that I wanted to use EJS, or that it's views are found in `views`. It works out of the box.
- `app.listen` - finally we can start listening for incoming requests and print a nice little message using the `PORT` environment variable.

Start the development server using `npm run dev` and it should show you an empty page. Let's make it look nicer.

### Style it

I have learned CSS more times than you care to remember. And I have forgot it just about as many. I cannot style for the life of me.

But that problem is not big with a little help from my AI-friend Gemini. Here's a simple style that he came up with.

Put this in `public/style.css`:

```css
* {
  margin: 0;
  padding: 0;
  box-sizing: border-box;
}

body {
  font-family: sans-serif;
}

 nav {
   background-color: #f0f0f0;
   padding: 10px;
   display: flex;
   justify-content: space-between;
   align-items: center;
 }

.todo-container {
  display: flex;
  flex-direction: column;
  width: 50%;
  margin: 20px auto;
  padding: 20px;
  border: 1px solid #ccc;
  border-radius: 5px;
}

.todo-item {
  display: flex;
  align-items: center;
  padding: 10px;
  border-bottom: 1px solid #eee;
}

.todo-title {
  flex-grow: 1;
}

.todo-duedate {
  margin-left: 20px;
  font-size: 0.8em;
  color: #777;
}

.todo-completed {
  text-decoration: line-through;
  color: #ccc;
}

#new-todo-form {
  display: flex;
  justify-content: space-around;
  align-items: center;
  gap: 10px;
  margin-bottom: 20px;
}

#new-todo-form input[type="text"],
#new-todo-form input[type="date"] {
  padding: 8px;
  border: 1px solid #ccc;
  border-radius: 4px;
}

#new-todo-form button {
  padding: 8px 12px;
  background-color: #4CAF50;
  color: white;
  border: none;
  border-radius: 4px;
  cursor: pointer;
}

footer {
  text-align: center;
  padding: 10px;
  background-color: #f0f0f0;
  margin-top: 20px;
}
```

You can download the css using `http://localhost:3001/style.css`, remember the `public` folder. Yah - our web server is serving files!

### First page

Add the following dummy HTML todo list in the `views/main.ejs` file

```html
<!DOCTYPE html>
<html>
  <head>
    <title>Todo App</title>
    <link rel="stylesheet" href="/style.css" />
    <script src="https://unpkg.com/htmx.org@2.0.4"></script>
  </head>
  <body>
    <nav>
      <h1>HTMx Todo</h1>
      <script src="https://accounts.google.com/gsi/client" async defer></script>

      <div
        id="g_id_onload"
        data-client_id="YOUR CLIENT ID"
        data-auto_prompt="false"
      ></div>
      <div
        class="g_id_signin"
        data-type="standard"
        data-size="large"
        data-theme="outline"
        data-text="sign_in_with"
        data-shape="rectangular"
        data-logo_alignment="left"
      ></div>
    </nav>

    <div class="todo-container">
      <h2>Todo items</h2>

      <form id="new-todo-form">
        <input type="text" id="todo-title" placeholder="Title" required />
        <input type="date" id="todo-duedate" required />
        <button type="submit">Add Todo</button>
      </form>

      <div class="todo-item">
        <span class="todo-title">Grocery Shopping</span>
        <span class="todo-duedate">2025-01-18</span>
      </div>

      <div class="todo-item">
        <span class="todo-title todo-completed">Book Doctor Appointment</span>
        <span class="todo-duedate">2025-01-15</span>
      </div>

      <div class="todo-item">
        <span class="todo-title">Pay Bills</span>
        <span class="todo-duedate">2025-01-22</span>
      </div>
    </div>

    <footer>
      <p>
        Total items: <span id="total-items">3</span> |
        Completed: <span id="completed-items">1</span> |
        Late: <span id="late-items">0</span>
      </p>
    </footer>

  </body>
</html>
```

Now reload `http://localhost:3000` and the `app.get("/")` route handler will kick in and show you a wonderful static page. Just as we did back in the 90-ies.

Notice that we have include HTMx on this page.

### Use EJS

Before we close this first part of the tutorial, that has used 0% HTMx, let's at least start to use EJS to make the page a bit more dynamic.

Add two keys for in the `.env` file to make it look like this (GOOGLE_CLIENT_ID will get another value in the next post):

```text
PORT=3001
APP_NAME=Marcus Todo App
GOOGLE_CLIENT_ID=Not known yet
```

Then add pass the APP_NAME and GOOGLE_CLIENT_ID to EJS when we render `main.ejs`:

```javascript
// At the top of the file get the values from the .env file
const { PORT, APP_NAME, GOOGLE_CLIENT_ID } = process.env;

// make the route look like this:
app.get("/", (req, res) => {
  return res.render("main.ejs", { APP_NAME, GOOGLE_CLIENT_ID });
});
```

Now update the `main.ejs` to output these two values, using `<%= %>` (output value HTML escaped), which makes my ASP-heart overflow:

```html
<!DOCTYPE html>
<html>
  <head>
    <title><%= APP_NAME %></title>
```

and here

```html
<body>
    <nav>
      <h1><%= APP_NAME %></h1>
```

The ["Google Sign In"-button](https://developers.google.com/identity/gsi/web/guides/display-button) code can be move to a separate file. This is known as a partial view.

Write this code in the `views/partials/googleSignIn.ejs` file:

```html
<script src="https://accounts.google.com/gsi/client" async defer></script>

<div
  id="g_id_onload"
  data-client_id="<%= GOOGLE_CLIENT_ID %>"
  data-auto_prompt="false"
></div>
<div
  class="g_id_signin"
  data-type="standard"
  data-size="large"
  data-theme="outline"
  data-text="sign_in_with"
  data-shape="rectangular"
  data-logo_alignment="left"
></div>
```

And then replace that code in the `main.ejs` and make the `<nav>`-section look like this:

```html
<nav>
  <h1><%= APP_NAME %></h1>
  <%- include("partials/googleSignIn.ejs", {GOOGLE_CLIENT_ID}) -%>
</nav>
```

That's pretty neat, right? Now we can keep our `main.ejs` clean and short while at the same time make each partial easy to understand and reusable.

A few words on EJS:

- `<%-` means that we output the result / variable unescaped, i.e. including the tags
- `-%>` means that we remove newlines
- `include` allows us to render another template (`"partials/googleSignIn.ejs"` in our case) and pass it some data `{GOOGLE_CLIENT_ID}`
  - You can see the value of `{GOOGLE_CLIENT_ID}` if you inspect the page.
  - We will give it some proper data in the next post

Reload `http://localhost:3001/` and now see the page work again.

I might want to add that the value of Google Client Id can / needs to be exported in the HTML. It's safe to use like that. We keep it in the `.env` for ease-of-use, not for secrecy.

## Summary

Ok - we have an 2000-ies web page up and running, using a multi-page approach and return dynamically created content.

In the next post I'll move this into the 2010-ies and log in using a third party provider, before creating the actual application in the last post (taking us into the 2020-ies using a non-SPA approach).

I'll update these post with a link to the source code, once I've written it.
