---
layout: post
title: "HTMx - tutorial part V - Validation"
author: "Marcus Hammarberg"
date: 2025-01-22 04:00:00
tags:
  - Programming
  - HTMx
  - Node
  - Express
---

This is the fifth post in a series that I'm making about HTMx that I think is utterly amazing and will change how I (we?) write web apps in the future.

You are more than welcome to read from here, but then I would recommend getting the [code from this point](https://github.com/marcusoftnet/htmx-todo-tutorial/tree/5e25cb1ba031cf0ae688bf3c272ff1e8522fa5ad), if you intend to type along.

The application is working fine, but there's zero validation in place. I wanted to do some simple validation on the client (and here I have a bug) and then also show how to do validation on the server-side and return an error message from there.

Validation can be tricky and often lead to a lot of code. But it's an obvious addition to the code.

<!-- excerpt-end -->

## `required` attribute - simple client-side validation

HTML has a features to do some simple validation on the client-side. Using `required` fields is one of them. And if you check the `new.ejs` you can see that I actually used it.

```html
<form id="todo-form" hx-on::after-request="this.reset()">
  <input type="text" name="title" placeholder="Title" required />
  <input type="date" name="duedate" required />
  <button
    type="submit"
    hx-post="/todo"
    hx-target="#todo-list"
    hx-swap="afterbegin"
  >
    Add Todo
  </button>
</form>
```

However it's not triggering. And that is my fault, but not obvious to understand. The HTML validations are only firing on submission of the form. Since I put the `hx-post` attribute on the `<button>` it's is not the form that is submitting.

We still get the form data thanks to HTMx's awesomeness. But to trigger the `required` validations, we need to put the `hx-post` attribute on the form. I just move it up to the `<form>` tag and it gets trigger.

This will become a bit more troublesome later on, but we will fix it then. Read more abut this [_feature_ here](https://github.com/bigskysoftware/htmx/discussions/2493).

Anyhow - here's the updated form.

```html
<form
  id="todo-form"
  hx-on::after-request="this.reset()"
  hx-post="/todo"
  hx-target="#todo-list"
  hx-swap="afterbegin"
>
  <input type="text" name="title" placeholder="Title" required />
  <input type="date" name="duedate" required />
  <button type="submit">Add Todo</button>
</form>
```

Doing the same for the `edit.ejs`-file shows us some of HTMx's power with inherited attributes. Here's the form after my changes to have the `hx-put` on the `<form>`:

```html
<form
  id="todo-form"
  hx-put="/todo/<%= todo.id %>"
  hx-target="closest .todo-item"
  hx-swap="outerHTML"
>
  <input type="text" name="title" required value="<%= todo.title %>" />
  <input type="date" name="duedate" required value="<%= todo.duedate %>" />
  <button type="submit">Update</button>
  <button class="cancel-button" type="button" hx-get="/todo/<%= todo.id %>">
    Cancel
  </button>
</form>
```

Notice that:

The `.cancel-button` doesn't have the `hx-target` or `hx-swap` attributes. Any attribute that is put on a parent element is automatically inherited to children. Since these attributes should be the same, in this case, I can omit them on the `.cancel-button`

I can use any _action_ attributes (`hx-get`, `hx-put`, `hx-post` etc.) to trigger the validation on the form. In this case I'm using a `hx-put` since I'm going to update the resource using a `HTTP PUT`. The `.cancel-button` _overrides_ the `hx-put` action by issuing a `hx-get` and the `required`-validation is not run.

Ok - that is much better already. No empty todos allowed!

Side-note; [HTML has many great validation attributes](https://developer.mozilla.org/en-US/docs/Web/HTML/Constraint_validation) that you get for free by setting the correct input type, like `type="email"`, `type="url"` or `type="number"`. In combination with `pattern` and `step` for example this becomes very powerful. Using these fields is also helpful for people with screen readers etc.

## Server-side validation

We should validate the same thing on the server, but I thought it would be more interesting to do other validations there. I'm going to check that 1) a todo with the same name doesn't exists in the database for this user and 2) that the due date is not passed already.

Strictly speaking the second the item could be checked on the client, but I'm using it as a vehicle to show of server-side-validations (and to avoid JavaScript in my application on the client - it's HTMx, anyways.)

HTMx has [written an example on how to do this](https://htmx.org/examples/inline-validation/), and I'm following their lead.

### Validating dates

Firstly, I have redesigned the form a little bit, so that a error message `<span>` can fit. And added a lot of styles - [you can find them here](https://github.com/marcusoftnet/htmx-todo-tutorial/blob/main/public/style.css).

We will do an _inline validation_ here, which means that when the user changes the value of the `duedate` field we will trigger a `HTTP` request. In true HTMx (HATEOAS) style, this request will return a HTML snippet that contains any validation error.

We could, for example, create a `todo/partials/duedate.ejs` file and let it accept and `errormessage` and `duedate` to be generated like this:

```html
<div
  class="form-group <%= errormessage ? "error" : "valid"  %></div>"
  hx-target="this"
  hx-swap="outerHTML">

  <% if(errormessage) {%>
    <span class="error-message" id="duedate-error">
      <%= errormessage -%>
    </span>
  <% } %>

  <input
    class="<%= errormessage ? "error" : "valid"  %>"
    type="date"
    id="duedate"
    name="duedate"
    required
    hx-post="/todo/duedate"
    value="<%= duedate %>"
  />
</div>
```

Based on if the `errormessage` is empty or not we now:

- Generate a `<span>` with the `errormessage`
- Add a CSS class or use the `valid` that is the default
- We also add the value of `duedate` so that we can see what was faulty.

Notice that the `<input>` field now have a `hx-post="/todo/duedate"` attribute. The default `hx-trigger` event for inputs are `change` in most cases which means that when the user tabs out of the field, we will `HTTP POST` to the endpoint.

The response from the `HTTP POST /todo/duedate` endpoint will be a form updated with, potentially, an error message.

#### Backend

That means that we can now write the backend, including a function that validates the `duedate`:

```javascript
const validateDueDate = (inputDueDate) => {
  if (!inputDueDate) return "Due date is required.";

  const dueDate = new Date(inputDueDate);
  const today = new Date();
  today.setHours(0, 0, 0, 0);

  if (isNaN(dueDate.getTime())) return "Invalid date format.";
  if (dueDate < today) return "The due date has already passed.";

  return "";
};

// Validation routes
router.post("/duedate", (req, res) => {
  const { duedate } = req.body;
  const errormessage = validateDueDate(duedate);
  return res.render("todo/partials/duedate.ejs", { errormessage, duedate });
});
```

Pretty simple, when you see it like this. We just validate the incoming `duedate` and then render the `todo/partials/duedate.ejs` with the given parameters.

#### Update the `new.ejs` template

One thing left - let's update `todo/new.ejs` to use `todo/partials/duedate.ejs`, to keep our views DRY (don't-repeat-yourself) and nice. In the `new.ejs`-view we will pass empty values for `errormessage` and `duedate` (for now...):

```html
<form
  class="todo-form"
  hx-post="/todo"
  hx-target="#todo-list"
  hx-swap="afterbegin"
  hx-on::after-request="this.reset()"
>
  <div class="form-group" hx-swap="outerHTML">
    <input
      type="text"
      name="title"
      placeholder="Title"
      required
      hx-post="/todo/title"
    />
  </div>
  <%- include("partials/duedate.ejs", {errormessage: "", duedate: ""}) %>

  <div class="form-group">
    <button type="submit">Add Todo</button>
  </div>
</form>
```

#### The form reset

At this point I ran into problems (as I promised earlier), and I honestly don't remember the order I got them in. The `duedate` field was emptied on validation or it was not emptied on submit.

The problem has to do with the `hx-on::after-request="this.reset()"` functionality. My understanding is this: since we now trigger a `hx-post` from a child element, it will inherit the `hx-on::after-request` and run the trigger on those requests too. `this` will then refer to the `input` that trigger the event, and hence does not `.reset()`.

You can see this behavior by logging some data in the `hx-on::after-request` like this:

```html
<form
  class="todo-form"
  hx-post="/todo"
  hx-target="#todo-list"
  hx-swap="afterbegin"
  hx-on::after-request="
  console.log('Resetting');
  console.log(event.detail);
  "
>
```

I tried to move the `hx-on::after-request` to the `button` but then I didn't get it to fire at all. My understanding is that it's not firing since the `button` is not issuing the request.

We're stuck between a rock and hard place.

But did you see my log statement there - `console.log(event.detail)`? That object contains some information that we can use. Let's see - we want to reset the form when:

- The result was ok, so that we know that todo item was created properly
- The `<form />` was posted, not the underlying `<input />`

We can use JavaScript to accomplish this. Yes HTMx is declarative-first but not anti-JavaScript. Quite the [opposite actually](https://gitnation.com/contents/htmx-is-pro-javascript).

Here's some JavaScript, including some logging that you can remove, that shows how to accomplish the reset:

```html
<form
  class="todo-form"
  hx-post="/todo"
  hx-target="#todo-list"
  hx-swap="afterbegin"
  hx-on::after-request="
  console.log(event.detail);
  console.log(event.detail.pathInfo);
  if(event.detail.successful && event.detail.pathInfo.requestPath == '/todo') {
    console.log('Resetting the form');
    document.getElementById('title').value = '';
    document.getElementById('duedate').value = '';
  }"
>
```

When we validate the `duedate` the `event.detail.pathInfo.requestPath` will be the path that we `HTTP POST` to; `/todo/duedate`. Hence we can differentiate between the two types of requests and only reset the form when the actual `<form>` is posted.

The final thing that I didn't get to work was the `this.reset();`. I think it has to do with that `reset()` doesn't clear the form. It resets it.

What bothers me though is that the `this.reset()` doesn't seem to do anything. I think that it has to do with that is _reset_  not _clear_. When we validate the the information we set the `value` property of the `<input />` and it will be interpreted as the initial value.

Hence I have to reset the values to `''` manually.

PHEW - that was a lot of extra work that I didn't think of. But it works and I now validate the `duedate` both on the client (for `required`) and the server.

### Validate the title

We are going to do the same thing again, but now for `title`. We don't allow two todos with the same title. It's a little bit arbitrary but it will work as an example.

Here are my updated files:

**`views/todo/new.ejs`**

```html
<form
  class="todo-form"
  hx-post="/todo"
  hx-target="#todo-list"
  hx-swap="afterbegin"
  hx-on::after-request="
  if(event.detail.successful && event.detail.pathInfo.requestPath == '/todo') {
    document.getElementById('title').value = '';
    document.getElementById('duedate').value = '';
  }"
>
  <%- include("partials/title.ejs", {errormessage: "" , title: "" }) %>
  <%- include("partials/duedate.ejs", {errormessage: "", duedate: ""}) %>

  <div class="form-group">
    <button type="submit">Add Todo</button>
  </div>
</form>
```

**`views/todo/partials/title.ejs`**

```html
<div
  class="form-group <%= errormessage ? "error" : ""  %>"
  hx-target="this"
  hx-swap="outerHTML">

  <% if(errormessage) {%>
    <span class="error-message" id="title-error">
      <%= errormessage -%>
    </span>
  <% } %>

  <input
    class="<%= errormessage ? "error" : ""  %>"
    type="text"
    id="title"
    name="title"
    placeholder="Title"
    required
    hx-post="/todo/title"
    value="<%= title %>"/>
</div>
```

#### Update the `edit.ejs`

Before we leave the `dueDate`-validation, we can also update the `edit.ejs`-template to the partials.

```html
<form
  class="todo-form"
  hx-put="/todo/<%= todo.id %>"
>
  <%- include("partials/title.ejs", {errormessage: "", title: todo.title }) %>
  <%- include("partials/duedate.ejs", {errormessage: "", duedate: todo.duedate }) %>
  <div class="form-group">
    <button type="submit" hx-target="closest .todo-item" hx-swap="outerHTML">
      Update
    </button>
  </div>
  <div class="form-group">
    <button class="cancel-button" type="button" hx-get="/todo/<%= todo.id %>">
      Cancel
    </button>
  </div>
</form>
```

We do not need the `hx-on::after-request` stuff in the `edit.ejs` form since it will be updated with the list item.

### Wrong focus

This creates one final problem; after validating fields in the `edit.ejs`-file the field in the `new.ejs`-form gets focus.

This has to do with the fact that our controls have the same values in `id` and `name`. And after trying many alternatives I found a surprisingly easy solution; delete the `id` property.

It's not just me being lazy, but the only thing that we are using that property for is to get hold of the element when doing the `.reset()`

I tried to give it a prefix based on the form we are in, but since we replacing parts of the form from the backend that will become problematic.

I also thought about replacing the entire form (expand the target, as the HTMx-kids say) on my validations, but decided that it was too much and didn't really solve the problem at hand.

In the end, removing the `id` property works fine. It means `title.ejs` looks like this (and `duedate.ejs` is similar):

```html
<div
  class="form-group <%= errormessage ? "error" : ""  %>"
  hx-target="this"
  hx-swap="outerHTML">

  <% if(errormessage) {%>
    <span class="error-message" id="title-error">
      <%= errormessage -%>
    </span>
  <% } %>

  <input
    class="<%= errormessage ? "error" : ""  %>"
    type="text"
    name="title"
    placeholder="Title"
    required
    hx-post="/todo/title"
    value="<%= title %>"/>
</div>
```

I had to update the `hx-on::after-request` in `new.ejs`. We cannot use `document.getElementById` now, since there's no `id`. But since we want to reset the form in the `new.ejs` I can grab the first element with the name `title` and `duedate` like this:

```html
<form
  id="new-form"
  class="todo-form"
  hx-post="/todo"
  hx-target="#todo-list"
  hx-swap="afterbegin"
  hx-on::after-request="
  if(event.detail.successful && event.detail.pathInfo.requestPath == '/todo') {
    document.getElementsByName('title')[0].value = '';
    document.getElementsByName('duedate')[0].value = '';
  }"
>
```

Not beautiful, but works.

For the `new.ejs` I'm thinking that expanding the target would be a good idea. That would mean that the response would include the (empty) form and a new item to add to the list (as we are doing now with `hx-target="#todo-list"` and `hx-swap="afterbegin"`).

But I refrained from that since it would be a bit complicated by updating `hx-oob` etc.

## Summary

As many thing HTMx I learn so much about how HTML and HTTP really works by using it.

After I was done I didn't really write that much code to get it to work, but the journey there held a lot of learning. I like it!

The fact that many `hx-*` are inherited is a bit troublesome at times, but as with many tools you need to get into the thinking on how to use it before it starts to be easy. When working with it you also start to see the way that the tool nudges you to write it. At no point when writing this I felt completely stuck. There was always a new little nugget of knowledge, documentation or feedback that helped me moving forward.

[The code is found here in the state that I left it in at the end of this post.](https://github.com/marcusoftnet/htmx-todo-tutorial/commit/d13c4133a1f65288b56e66d4546bca94760b3c43). The current `main` is [found here](https://github.com/marcusoftnet/htmx-todo-tutorial).
