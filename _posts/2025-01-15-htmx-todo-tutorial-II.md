---
layout: post
title: "HTMx - tutorial part II - Sign In With Google"
author: "Marcus Hammarberg"
date: 2025-01-14 04:00:00
tags:
 - Programming
 - HTMx
 - Node
 - Express
---

This is the second post in a series that I'm making about HTMx that I think is utterly amazing and will change how I (we?) write web apps in the future. You are more than welcome to read from here, but it will be hard following along code-wise if you haven't stepped through [part I](https://www.marcusoft.net/2025/01/htmx-todo-tutorial.html)

In this part we will allow our users to sign in with Google.

<!-- excerpt-end -->

SPA frameworks have been around for quite some time now, and the tooling has really become quite impressive. For that reason I was a bit dismayed when I realized that a Google-Sign-in, was not as easy as just adding a component with one line. I really had to understand this on a little bit lower level than before.

I've found that this is the story for many things HTMx. HTMx is a tool that allows you to understand how the HTTP requests works and the workflow is. This has often been abstracted away with components and default configurations in React, Angular and Next.js.

Let see this in practice.

## Setup Firebase

We are going to user Firebase to store data and authenticate user. The Firebase UI changes quite a lot so I will not describe this in detail.

* Head over to the [Firebase console](https://console.firebase.google.com/) and create a new project. I didn't enable Google Analytics.
* Add a web application to your project (it was a strange `</>` symbol when I looked). I didn't add hosting
  * Right now we do not need the firebase npm installation, so we'll pick that up when we start to add things to the database.
* Add Authentication for the application using Google as the sign-in method
  * To make it look a bit more professional - set the `Public-facing name for project` to something meaningful.
  * Get the Web Client Id. This can also be found on the [API Service - OAuth Section](https://console.cloud.google.com/apis/credentials) for your project.

Put that Web Client Id in the `.env` file:

```text
GOOGLE_CLIENT_ID=1111111111111111.apps.googleusercontent.com
```

One final piece of configuration that is needed is on the OAuth API Service, we need to add `localhost` to the list of Authorized JavaScript origins.

* Click on the Client ID for Web Application and add `http://localhost:3001` as an URI for Authorized JavaScript origins
  * Don't forget to click on the Save-button at the end of the screen.
* Also add a call back-URI. It will be on `http://localhost:3001/auth/login` for our local development environment. Add that.
  * Don't forget to click on the Save-button at the end of the screen.

That's all we need to do in Firebase for Authentication.

## Configure the "Sign-in with Google Button"

Google have made it very simple to integrate [Sign-in with Google](https://developers.google.com/identity/gsi/web/guides/display-button) through pre-made markdown and javascript.

If you remember from the [last post](https://www.marcusoft.net/2025/01/htmx-todo-tutorial.html) we have broken out the Google Sign-In markdown into a separate file `/views/partials/googleSignIn.ejs`.

And the GOOGLE_CLIENT_ID is injected through with the `data-client_id="<%= GOOGLE_CLIENT_ID %>"`.

Now, we need to take care of what should happen when after the user has been authorized by Google. There are two options here; call a JavaScript callback function via the `data-callback`-attribute, or `HTTP POST`ing to an endpoint by setting the `data-login_uri`-attribute.

We are going to use the `data-login_uri`. Update the `/views/partials/googleSignIn.ejs` to look like this:

```html
<script src="https://accounts.google.com/gsi/client" async defer></script>

<div
  id="g_id_onload"
  data-client_id="<%= GOOGLE_CLIENT_ID %>"
  data-login_uri="http://localhost:<%= PORT %>/auth/login"
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

If you haven't already, start the application with `npm run dev` and you'll see an error, because `PORT is not defined`. That's because we are not passing that parameter in the render function.

Update `server.js` and the `/` route to this:

```javascript
app.get("/", (req, res) => {
  return res.render("main.ejs", { APP_NAME, GOOGLE_CLIENT_ID, PORT });
});
```

And in `main.ejs` pass `PORT` to the `include`-function:

```html
<nav>
  <h1><%= APP_NAME %></h1>
  <%- include("partials/googleSignIn.ejs", {GOOGLE_CLIENT_ID, PORT}) %>
</nav>
```

Now if you reload the page, you can inspect the Sign in with Google button and see that `data-login_uri="<http://localhost>:<%= PORT %>/auth/login"` has been unpacked to `data-login_uri="http://localhost:3000/auth/login"`.

You can actually click that button and log in, but our application doesn't do anything with the response. Let's fix that now.

## Creating the login_url POST route

Setting the `data-login_url` (Hours! I've spent HOURS when I wrote `data-login-url` instead of `data-login_url`. It should be `data-login_url`!) means that Google will issue an `HTTP POST` request to the URL in `data-login_url`. That `HTTP POST` will [get the following body posted](https://developers.google.com/identity/gsi/web/reference/html-reference#server-side).

It's now that our Express application needs to configure to parse the HTTP Body into a JavaScript object.

Let's create a `HTTP POST` route handler like this, just to see that we got something posted:

```javascript
// Auth Routes
app.post("/auth/login", async (req, res) => {
  const { credential } = req.body;
  console.log({req.body});
});
```

(You have no idea how long time it took me to get here... I don't even ...)

Put that route just before the `app.listen()` and then log in again. Now you'll see the body and specifically a LONG credentials string. That string, needs to be decoded to get some data. Let's do that using :

```javascript
import { OAuth2Client } from 'google-auth-library';
app.post("/auth/login", async (req, res) => {
  const { credential } = req.body;

  try {
    const client = new OAuth2Client(process.env.GOOGLE_CLIENT_ID);
    const ticket = await client.verifyIdToken({
      idToken: credential,
      audience: process.env.GOOGLE_CLIENT_ID,
    });

    const payload = ticket.getPayload();
    console.log({payload});
  } catch (err) {
    console.error(err);
    res.status(401).send({ message: "Authentication failed" });
  }
});
```

Now when you log in you see a lot of user information about yourself. We have authenticated with Google.

But we should probably take care of that information, and send back some instructions to the browser, before we call this post complete.

## Create a session object

Let's put that user information in an Express session. This will store data in cookies between request. The information will then be attached to the `req` objects, automatically. It's a pretty easy and has become a de facto standard to track data for users sessions.

There's some problems with this, that the sessions are not durable and that we are sending the data rather than some encrypted information across the network, but I'm gonna look past that now and set it up as safe (good enough) as we need through some configuration and a middleware.

Create a new file (and folder) in `middleware/session.js` and create this initial configuration:

```javascript
import session from 'express-session';

export const sessionConfig = session({
  secret: process.env.SESSION_SECRET,
  resave: true,
  saveUninitialized: true,
  cookie: {
    secure: process.env.NODE_ENV === "production", // Only true in production when using HTTPS
    httpOnly: true,
    sameSite: "Strict",
    maxAge: 24 * 60 * 60 * 1000,
  },
});
```

This will enable a `req.session` property and configure how sessions are handled in a safe way. We need to put another key, `SESSION_SECRET`, in the `.env`. It's just a random string of letters that is used to en/decode the session information. You can create some [random string data here](https://randomkeygen.com/).

Let's then write some middleware that will destroy sessions that are older than 30 minutes and force people to log back in:

```javascript
export const sessionTimeoutMiddleware = (req, res, next) => {
  if (req.session) {
    const currentTime = Date.now();
    const lastActivity = req.session.lastActivity || currentTime;

    const sessionTimeout = 30 * 60 * 1000; // 30 minutes
    if (currentTime - lastActivity > sessionTimeout) {
      req.session.destroy((err) => {
        if (err) return next(err);
        res.redirect("/"); // Redirect to login if session expired
      });
    } else {
      req.session.lastActivity = currentTime; // Update last activity timestamp
      return next();
    }
  } else {
    return next();
  }
};
```

Now we configure our Express application to use the session:

```javascript
//  at the top - import the functions
import { sessionConfig, sessionTimeoutMiddleware } from "./middleware/session.js";

// At the end of the middleware section - configure the sesions
// Configure sessions
app.use(appSession.config);
app.use(appSession.sessionTimeout);
```

We have configured our session handling.

## Store and retrieve session data

Now head back to our `POST /auth/login` handler make it look like this:

```javascript
app.post("/auth/login", async (req, res) => {
  const { credential } = req.body;

  try {
    const client = new OAuth2Client(process.env.GOOGLE_CLIENT_ID);
    const ticket = await client.verifyIdToken({
      idToken: credential,
      audience: process.env.GOOGLE_CLIENT_ID,
    });

    const payload = ticket.getPayload();
    const sessionData = {
        id: payload.sub,
        name: payload.name,
        email: payload.email,
        picture: payload.picture,
      };
    req.session.regenerate((err) => {
      req.session.user = sessionData;
      return res.redirect("/");
    });
  } catch (err) {
    console.error(err);
    res.status(401).send({ message: "Authentication failed" });
  }
});
```

The `sessionData` object stores some information that will be useful, we then re-generate the session, to further protect us from people using old sessions. We attach it to the `req.session.user`.

Finally we redirect back to the `/` route, with the difference that now our `req` object will have user data in the `req.session.user`.

Let's use it by sending this information to the view and render a nice badge and logout button.

Update the `/` route to look like this:

```javascript
app.get("/", (req, res) => {
  return res.render("main.ejs", { envs, user: req?.session?.user });
});
```

(I made a little improvement there... Sorry. The `envs` is me packing up environment variables for easier use:

```javascript
// At the top of the file
const envs = process.env;
```

```html
<nav>
  <h1><%= envs.APP_NAME %></h1>
  <%- include("partials/googleSignIn.ejs", {envs}) %>
</nav>
```

)

Alright - now we can use EJS to check if the users a user supplied or not, and render the template differently for logged in users; not render the login-button, and not showing the (now mocked) todo-list:

```html
<nav>
  <h1><%= envs.APP_NAME %></h1>
  <% if (!user) { %>
    <%- include("partials/googleSignIn.ejs", {envs}) %>
  <% } else { %>
    <div id="user-profile" class="user-profile">
      <img src="<%= user.picture %>" alt="<%= user.name %>" id="user-picture">
      <span class="user-name" id="user-name"><%= user.name %></span>
      <button id="logout-button" hx-get="/auth/logout" hx-target="body">Log out</button>
    </div>
    <% } %>
</nav>
```

EJS is simply JavaScript interject with the `<% %>` and it can be a bit hard to decipher at first glance. The code above checks for the presences of the `user` object and if not present I render the Google Sign In button. If the user is present I render the user-profile.

I've made similar `if`-statement around the (still hardcoded) Todo-list.

```html
<% if (!user) { %>
  <div class="todo-container">
    <h2>Log in to see your To-do list</h2>
  </div>
<% } else { %>
  <div class="todo-container">
    <h2>Todo items</h2>
    <!-- And so on -->
  </div>
<% } %>
```

The readability is enhanced by using `includes` and I've done that in the finished code, but I'm leaving that out for brevity.

### CSS-ing

To make the header look nice, you'll need to add the following css too:

```css
.user-profile {
  display: flex;
  align-items: center;
}

.user-profile img {
  width: 40px;
  height: 40px;
  border-radius: 50%;
  /* Make the image rounded */
  margin-right: 10px;
}

.user-profile .user-name {
  font-weight: bold;
}
```

## Logout route and refactoring

Finally - let's add a feature to log out. It will be quite easy. I'm using the HTMx attribute `hx-get="/auth/logout"` on the "Log out" button, to easily send a post request that will be handled by this route handler:

```javascript
app.get("/auth/logout", (req, res) => {
  req.session.destroy(() => {
    return res.redirect("/");
  });
});
```

We simply destroy the session and return a re-rendered home page.

## First HTMx attributes

And we also got to use our first HTMx attributes; `hx-get` and `hx-target`. Let me give a short introduction, but dive deeper in the next post.

The `hx-get="/auth/logout"` means that we issue a `HTTP GET` to the `/auth/logout` route, when the element is clicked. We could have set the `hx-trigger="click"`, but click is the default event for all elements except `<form>` and text input elements, so I left it out.

Using the `hx-target` I can indicate which element that should be replaced with the response of `GET`-request. I can use `hx-swap` to indicate which part of the element I want to replace (`outerHTML`, `afterEnd` and so on.). `innerHTML` is the default value, and will serve us fine here.

The `hx-target="body"` means that we replace the entire body element with the `HTTP GET` response. Not quite kosher, since this is almost a complete page reload, but I think it makes sense in this case.

Whoho! We can log in, get some user data shown, and then log out again.

## Refactor

Let's move the `/auth` routes to a separate file, as this is taking up space in the `app.js`.

One of [Express](https://express.js) super powers is how easy it is to move routes to another file. We just export routes from a `express.Router()` in one file and then import all the routes in the application.

Create a `routes/auth.js` file and move all the `/auth` routes there, here's a summarized version of the file.

```javascript
import express from "express";
const router = express.Router();

router.post("/login", async (req, res) => {
    // as before
});

router.get("/logout", (req, res) => {
  // as before
});

export default router;
```

Two things worth noticing:

1. I'm updating the routes names to *not* include `/auth`. We will *mount* all these routes under `/auth` in the `server.js` soon.
1. I'm declaring the routes to belong to the `router` object rather than the `app` object.

Finally let's import and *mount* these routes in `server.js`:

```javascript
import authRoutes from './routes/auth.js';

// REST OF THE FILE
// Routes
app.use("/auth", authRoutes);

app.get("/", (req, res) => {
  return res.render("main.ejs", { envs, user: req?.session?.user });
});

// REST OF THE FILE
```

This means that our `server.js` will stay clean and just contain the configuration, and we keep all the routes logic in separate files.

## Summary

Can you still login in and out? Good - the refactoring didn't break anything.

In this post we have set up authentication against Google, created a session to keep track of the logged in user's data and added a button to log out. And we dipped our toes into HTMx.

Not too shabby, BUT we haven't really done much with HTMx yet, let's go fully HTMx in the next post. Oh, and add data in the Firestore database, but that will be tiny.

The code at this point can be found here. (I'll update this further on).
