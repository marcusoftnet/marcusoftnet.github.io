---
layout: post
title: "Getting Started with HTMX and .NET"
author: Marcus Hammarberg
date: 2025-02-21 12:00:00
tags:
 - .NET
 - HTMX
 - Razor Slices
---

[HTMX is great!](https://htmx.org/) And I really like [.NET Minimal APIs](https://learn.microsoft.com/en-us/aspnet/core/fundamentals/minimal-apis). Let's put it together and see how it works.

When I first thought about creating a backend for HTMX using .NET I went down the rabbit hole of Razor Pages. Which was not great I have to say. That programming model is weird and I don't like it. But in my spelunking I found [Razor Slices](https://github.com/DamianEdwards/RazorSlices/) which will work great as a template engine.

That means that we have a lightweight and easy to grasp backend with Minimal API and then use Razor Slices to render the HTML.

<!-- excerpt-end -->

First a few words about each technology and get a starting point going.

## Minimal API

[Minimal APIs](https://learn.microsoft.com/en-us/aspnet/core/fundamentals/minimal-apis) is Microsoft's lightweight API framework that is great for building RESTful APIs. It is easy to understand and use. If you're coming from other "micro" like Express.Js, Flask or Sinatra (or NancyFx - oh the awesome NancyFX) you will feel right at home.

Create a new minimal API project with the following command:

```bash
dotnet new web -o HtmxWithRazorSlices
cd HtmxWithRazorSlices
```

This has created a new project for you, with a single file `Program.cs` that will contain all our logic. (Can but probably be split into multiple files in a real project. [Here's a great video on how to do that.](https://www.youtube.com/watch?v=2LvHXme-kcs)). For this tutorial we'll keep it in one file.

Let's edit the starting point to do something more interesting for our application, than the default "Hello World".

```csharp
var builder = WebApplication.CreateBuilder(args);
var app = builder.Build();

// Create an in-memory store for todos
var todos = new List<Todo>
{
    new Todo { Id = 1, Title = "Buy groceries", IsCompleted = false },
    new Todo { Id = 2, Title = "Walk the dog", IsCompleted = true }
};

// Routes handlers
app.MapGet("/", () => todos);

app.Run();

// Model - could be moved to a separate file
public class Todo
{
  public int Id { get; set; }
  public string? Title { get; set; }
  public bool IsCompleted { get; set; }
}
```

Now run it with `dotnet watch run` (or `dotnet run` if you don't want to have watch enabled), which will open the browser for you and ...

```json
[
  {
    "id": 1,
    "title": "Buy groceries",
    "isCompleted": false
  },
  {
    "id": 2,
    "title": "Walk the dog",
    "isCompleted": true
}
]
```

`app.MapGet("/", () => todos);` means, as for other micros web frameworks; take the incoming HTTP GET request for `/` and run this code (in this case a delegate,  lambda function) and return the result. In our case we are just returning the `todos` list. In .NET if you only have a single line in the lambda you don't need curly braces or the `return` keyword. Minimal.

This returns JSON. Yes - JSON. .NET Minimal APIs uses a lot of conventions over configuration to make it minimal. Automatically returning JSON for objects is one example.

### Static content

Let's add the ability to serve static content, such as CSS and a favicon. Add the following line to the `Program.cs`:

```csharp
app.UseStaticFiles();
```

Then create a folder called `wwwroot` and [download the content from my repo](https://github.com/marcusoftnet/HtmxWithRazorSlices/tree/main/wwwroot). This will give you some styling and a favicon to not get that pesky 404 in the browser tools.

You should have the following structure:

```text
HtmxWithRazorSlices/
├── HtmxWithRazorSlices.csproj
├── HtmxWithRazorSlices.sln
├── Program.cs
└── wwwroot/
    ├── favicon.ico
    └── site.css
```

Ok - things will soon start to look great. Don't worry - the CSS is not important here, and not made by me; so you are safe.

## Razor Slices

[Razor Slices](https://github.com/DamianEdwards/RazorSlices/) is a template engine for .NET that is great for rendering HTML using Razor syntax. It is quite easy to understand and use. It is created by Damian Edwards, who is a member of the ASP.NET Core team - and has a lot of great tools under his belt. From the repo we read:

> Lightweight Razor-based templates for ASP.NET Core without MVC, Razor Pages, or Blazor, optimized for high-performance, unbuffered rendering with low allocations.

[On NuGet it's called `RazorSlices`](https://www.nuget.org/packages/RazorSlices/) and there we can also see that it's not downloaded so often. Yet - a real shame. I think Razor Slices is a great fit for this use case, and hope that there will be an uptake in the community for it.

Let's add it to our project with the following command:

```bash
dotnet add package RazorSlices
```

I am now using .NET 9 SDK, which works with the latest version of Razor Slices. When I was on .NET 8 I had the hardest time to get it to work, until I used the version 0.8.1

To set it up we need to create folder `Slices` and then a file name `_ViewImports.cshtml` with the following content:

```html
@inherits RazorSliceHttpResult

@using System.Globalization;
@using Microsoft.AspNetCore.Razor;
@using Microsoft.AspNetCore.Http.HttpResults;

@tagHelperPrefix __disable_tagHelpers__:
@removeTagHelper *, Microsoft.AspNetCore.Mvc.Razor
```

Which will make Razor Slices work in our project.

Let's now create the first slice for our application. We'll just make a simple starting point in `Slices/Index.cshtml`:

```html
@inherits RazorSliceHttpResult<List<Todo>>

<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <title>Todo App</title>
  <script src="https://unpkg.com/htmx.org@1.9.4"></script>
  <link rel="stylesheet" href="/site.css">
</head>

<body>
  <h1>Todo List</h1>
  <ul id="todo-list">
    @foreach (var todo in Model)
    {
      <li>@todo.Title</li>
    }
  </ul>
</body>

</html>
```

Notice the `@inherits RazorSliceHttpResult<List<Todo>>` which tells Razor that we will have a list of Todo items to render. It is available in the `Model` variable, that we make use of when looping through the todos (`@foreach (var todo in Model)`)

That means that we now need to pass this list and render the slice. This syntax is a bit daunting, but bear with me. Update the `Program.cs` to have this single route instead of the one we had:

```csharp
app.MapGet("/", () => Results.Extensions.RazorSlice<HtmxWithRazorSlices.Slices.Index, List<Todo>>(todos));
```

`Results.Extensions.RazorSlice` is the method to render the slice. It takes two type parameters: the first is the type of the slice and the second is the type of the model. Type of the slice, you say? Yes. Behind the scenes Razor Slices (or if it is Razor itself), will create a class to represent the slice as a C# class. You can see it if you "Go to definition" on the `HtmxWithRazorSlices.Slices.Index`.

If you `dotnet run` the application you can now see the two hard-coded todos in a beautiful HTML list... Pretty underwhelming, but let's continue and use some of the features of Razor Slices to make this more interesting.

### Partial views

Let's add a partial view to our project. This will be the HTML snippet that we will render for each todo in the list. Create a file called `Slices/TodoItem.cshtml`:

```html
@inherits RazorSliceHttpResult<Todo>

<li>
  <input type="checkbox" @if (Model.IsCompleted) {<text>checked</text>} />

  <span @if (Model.IsCompleted) {<text>class="completed"</text>}>@Model.Title</span>

  <button>❌</button>
</li>
```

This will render a single todo item. Now we can update the `Index.cshtml` to use this partial view:

```html
@inherits RazorSliceHttpResult<List<Todo>>

<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <title>Todo App</title>
  <script src="https://unpkg.com/htmx.org@1.9.4"></script>
  <link rel="stylesheet" href="/site.css">
</head>

<body>
  <h1>Todo List</h1>
  <ul id="todo-list">
    @foreach (var todo in Model)
    {
      @(await RenderPartialAsync<HtmxWithRazorSlices.Slices.TodoItem, Todo>(todo))
    }
  </ul>
</body>

</html>
```

If you rerun that you will see the list of todos, but now looking a bit nice. Also, we have seen a feature of Razor Slices; the ability to render a partial view.

Great - let's start using HTMX.

## HTMX

[HTMX](https://htmx.org/) is a little library that changes how we write web applications. It basically allows you to return fragments, snippets (or slices, maybe) or HTML from a backend (HTMX doesn't care which this is). Which means that we declaratively update parts of the page, rather than change the whole thing. Read my [blog series here, for more details](https://www.marcusoft.net/2025/01/htmx-todo-tutorial.html), but shortly you need to know the following:

HTMX works in a declarative way using `hx-*` attributes. Every HTML element can have a `hx-` attribute. Adding these attributes to an element make it dynamic and interactive.

There are 4 basic attributes that you need to know about, in two groups:

To trigger _requests_:

- [`hx-{HTTP VERB}`](https://htmx.org/attributes/hx-get/) - Tells HTMX **where to get the data from**, and how to send it there. `hx-get="/todos/create"` means that we will issue a HTTP GET to `/todos/create`. Since we can use any HTTP verb we want, we can use `hx-post`, `hx-put`, `hx-delete` and so on, we can be very expressive and use the ideas behind REST in a proper way.

- [`hx-trigger`](https://htmx.org/attributes/hx-trigger/) - Tells HTMX **when to issue the request**. Normally this is `click` or `change` (for inputs), but it can be any Web Api event, for example `load` that triggers when the element is loaded.

To process the _response_:

- [`hx-target`](https://htmx.org/attributes/hx-target) - Tells HTMX **where to put the response**. `hx-target` uses normal CSS selectors for the most part, like `hx-target="#todo-list` to put the result in an element with the id `todo-list`. The default value is the element itself (`this`).
- [`hx-swap`](https://htmx.org/attributes/hx-swap/) - Tells HTMX **how to swap the content of the element**. Normally this is `outerHTML`, but it can be any of the values listed in the [HTMX documentation](https://htmx.org/attributes/hx-swap/).

Let's use it. Open the `Index.cshtml` and add this below the `</ul>` list of todos:

### Form to create todo

```html
<div
  id="todo-form"
  hx-trigger="load"
  hx-get="/todos/create"
  hx-swap="innerHtml"></div>
```

What does this do?

1. When the element is `load`ed, it will trigger a request
1. It will trigger a HTTP GET to `/todos/create`
1. It will take the response and replace (swap) all the content of the element with the response.
1. It will swap the element of `this` element, since we didn't specify a `hx-target`.

Only problem - we don't have a `/todos/create` route. Let's add one.

First create the Razor Slice with the form `Slices/TodoCreateForm.cshtml`:

```html
@inherits RazorSliceHttpResult<CreateFormViewModel>

<form id="todo-form" hx-post="/todos" hx-target="#todo-list" hx-swap="beforeend">
  <input type="hidden" name="@Model.AntiForgeryToken.FormFieldName" value="@Model.AntiForgeryToken.RequestToken" />

  <input type="text" name="title" id="title" placeholder="Add a new todo...">
  <button type="submit">Add</button>
</form>
```

It looks a bit daunting, but mostly this has to do with the AntiForgeryToken, that make our form protected from CSRF attacks. This is a good thing, and enabled by default in ASP.NET Core.

### Route and Anti forgery tokens

In essence it's just a simple form. I have used class `CreateFormViewModel` that will hold the instructions for the form. It will be useful later, promise.

Let's add the route and the view model class to our `Program.cs`:

```csharp
app.MapGet("/todos/create", (HttpContext context, IAntiforgery antiforgery) =>
{
  var vm = new CreateFormViewModel
  {
    AntiForgeryToken = antiforgery.GetAndStoreTokens(context)
  };
  return Results.Extensions.RazorSlice<HtmxWithRazorSlices.Slices.TodoCreateForm, CreateFormViewModel>(vm);
});

public class CreateFormViewModel
{
  public required AntiforgeryTokenSet AntiForgeryToken { get; set; }
}
```

First, notice that we are responding to a GET, since we are just returning the form to create new todos. No state changes here, hence HTTP GET is proper (according to REST principles).

Secondly, we need to generate a AntiForgeryToken, that we will use in the form. We can do that by using the `IAntiforgery` service. Notice how our delegate takes the `HttpContext` and the `IAntiforgery` service as parameters. This dependency injection is built into Minimal APIs (ah well, in all of ASP.NET Core).

To get it to work properly we need to tell Minimal API to enable this service using `builder.Services.AddAntiforgery` and `app.UseAntiforgery`.

Here's the complete `Program.cs` at this point. This is the last configuration we need to do, promise.

```csharp
using Microsoft.AspNetCore.Antiforgery;

var builder = WebApplication.CreateBuilder(args);
builder.Services.AddAntiforgery();

var app = builder.Build();
app.UseAntiforgery();
app.UseStaticFiles();


// Create an in-memory store for todos
var todos = new List<Todo>
{
    new Todo { Id = 1, Title = "Buy groceries", IsCompleted = false },
    new Todo { Id = 2, Title = "Walk the dog", IsCompleted = true }
};

app.MapGet("/", () => Results.Extensions.RazorSlice<HtmxWithRazorSlices.Slices.Index, List<Todo>>(todos));

app.MapGet("/todos/create", (HttpContext context, IAntiforgery antiforgery) =>
{
  var vm = new CreateFormViewModel
  {
    AntiForgeryToken = antiforgery.GetAndStoreTokens(context)
  };
  return Results.Extensions.RazorSlice<HtmxWithRazorSlices.Slices.TodoCreateForm, CreateFormViewModel>(vm);
});

app.Run();

public class Todo
{
  public int Id { get; set; }
  public string? Title { get; set; }
  public bool IsCompleted { get; set; }
}

public class CreateFormViewModel
{
  public required AntiforgeryTokenSet AntiForgeryToken { get; set; }
}
```

If you run it now, you will see the form on the page. But the really cool part comes when you open the developer tools and flip open the Network tab.

1. You will have one GET request to `<http://localhost:xxxx/>` that returns the page
1. The the favicon.ico and the site.css.
1. HTMX will also be loaded (and most likely cached)

But then you'll see an entry called `create` that is a HTTP GET to `
<http://localhost:xxxx/todos/create>`. This request was issued by HTMX when the `<div id="todo-form">` was loaded.

If you show the response it will be, not a complete page, but the fragment/slice that we had, including the AntiForgeryToken. Here's my response:

```html

<form id="todo-form" hx-post="/todos" hx-target="#todo-list" hx-swap="beforeend">
  <input type="hidden" name="__RequestVerificationToken" value="gibberish" />

  <input type="text" name="title" id="title" placeholder="Add a new todo...">
  <button type="submit">Add</button>
</form>
```

That's what HTMX do. Sends fragments of HTML that get replaced in the DOM. Declaratively.

### Create a new todo

Let's create the opportunity to create a new todo. We've already started - did you see that I added these `hx-*` attributes to the form:

```html
<form id="todo-form" hx-post="/todos" hx-target="#todo-list" hx-swap="beforeend">
```

This will:

1. Issue a HTTP POST to `/todos`
1. Target the `#todo-list` our main list of todos.
1. Swap in the response before the end of the list, appending items

There's no trigger declared, which means that it will be triggered when the form is submitted - the default trigger for forms.

Let's add the route to our `Program.cs`:

```csharp
app.MapPost("/todos", ([FromForm] Todo todo, HttpContext context, IAntiforgery antiforgery) =>
{
  todo.Id = todos.Max(t => t.Id) + 1;
  todos.Add(todo);
  return Results.Extensions.RazorSlice<HtmxWithRazorSlices.Slices.TodoItem, Todo>(todo);
});
```

Now we want to respond to a HTTP POST to `/todos`. POST is the proper thing to do here, since we are going to add things to the ... "database".

The response will be a new todo item, so we will use the `TodoItem` slice to render the new todo.

A special mention (to hide hours of frustration on my part) need to be made about the `[FromForm] Todo todo` parameter. This is a way to bind the form data to the `Todo` object. It is a way to tell .NET to take the form data and map it to the `Todo` object.

You have to do this, remember that Minimal APIs is all about JSON out-of-the-box and here we are binding the `Todo` to a posted form.

In order to get this to compile you need to add a using `using Microsoft.AspNetCore.Mvc;` at the top of `Program.cs`.

Let's do some simple things first, and then come back and talk about validation later. That will complicate this route a bit more.

### Delete a todo

Deleting a todo is pretty straightforward; we need a `hx-delete` attribute on each todo item, we need route and we need to return ... nothing. Just 200 OK.

Let's update the `TodoItem.cshtml` to trigger a HTTP DELETE from the button:

```html
<button
  hx-delete="@($"/todos/{Model.Id}")"
  hx-target="closest li"
  hx-swap="outerHTML">❌
</button>
```

`hx-target="closest li"` finds us the closest parent `<li>` element and swaps it with the response. We'll swap the `outerHTML` which will replace the whole `<li>` element with the response.

Let's add the route to our `Program.cs`:

```csharp
app.MapDelete("/todos/{id}", (int id) =>
{
  var todo = todos.Find(t => t.Id == id);
  if (todo == null)
  {
    return Results.NotFound();
  }
  todos.Remove(todo);
  return Results.Ok();
});
```

New things here, are the route parameter `"/todos/{id}"` that will be mapped to the parameter `id` of the lambda (and converted to the correct type, thank you very much.).

From there, we just remove the todo from the list, and return ... nothing. Just 200 OK. Yes, that could (should) have been a `NoContent` (204) response, but HTMX will not update the DOM for those codes. There's a long [philosophical discussion as to why here](https://github.com/bigskysoftware/htmx/issues/1130), but I'm not taking that fight. 200 OK is ok with me.

### Mark as complete

Let's also implement a way to mark a todo as complete. We'll add a checkbox to each todo item, and a route to update the todo.

Again - update the `TodoItem.cshtml` to have a checkbox with HTMX attributes like this:

```html
<input
  type="checkbox"
  hx-patch="@($"/todos/{Model.Id}/toggle")"
  hx-target="closest li"
  hx-swap="outerHTML"
  @if (Model.IsCompleted) { <text>checked</text> }
/>
```

Pretty similar to what we did with the delete button. Here we are updating an existing resource so a HTTP PATCH is proper. We are sending the HTTP PATCH request to `/todos/{id}/toggle` since we are only updating the toggle property of the resource.

We will, again, target the `closest li` and replace the whole thing, with a regenerated todo item (using the `TodoItem.cshtml` slice).

Let's add the route to our `Program.cs`:

```csharp
app.MapPatch("/todos/{id}/toggle", (int id) =>
{
  var todo = todos.Find(t => t.Id == id);
  if (todo == null)
  {
    return Results.NotFound();
  }
  todo.IsCompleted = !todo.IsCompleted;
  todos.Remove(todo);
  todos.Add(todo);

  return Results.Extensions.RazorSlice<HtmxWithRazorSlices.Slices.TodoItem, Todo>(todo);
});
```

Similar to the DELETE we get the id parsed from the URL and then use that to find and update the todo in the list. After flipping the toggle we replace the element and render a view for the todo item.

### Validate input

That's basically it, for a simple todo application using HTMX, Minimal APIs and Razor Slices. But I wanted to do one more thing as I think it shows a bit how to ... think in HTMX.

Let's do a server-side-validation of that `title` is not empty, or shorter than 3 characters (just because) before saving a new todo. If it is empty we want to show a validation error, and return what ever was present in the form.

Also, have you noticed that the form doesn't clear out when you post a new todo? Let's fix that to.

#### Server-side validation

In order to do the server-side validation we need to do the validation and _change_ what is returned from the route. Here's how the form tag looks now:

```html
<form id="todo-form" hx-post="/todos" hx-target="#todo-list" hx-swap="beforeend">
```

If we have a validation error we don't want to update the `#todo-list` but rather re-render this form. Also, we need to add the values of the input when re-rendering the form so that it doesn't get lost.

The way to do this in HTMX is to use two headers called `HX-Retarget` and `HX-Reswap` which allows the server to change the target and the swap-strategy.

Let's lay some ground work first. I added a validation method to the `Todo` class:

```csharp
public Dictionary<string, string> Validate()
  {
    var errors = new Dictionary<string, string>();
    if (string.IsNullOrWhiteSpace(Title))
    {
      errors.Add("Title", "The Title field is required.");
    }
    else if (Title?.Length <= 3)
    {
      errors.Add("Title", "The Title field must be a string with a minimum length of 3.");
    }
    return errors;
  }
```

Yes, there are probably attributes to do this, but I can't even...

Then I augmented the `CreateFormViewModel` to include the validation errors and the Todo item that the user tried to create.

```csharp
public class CreateFormViewModel
{
  public Todo? Todo { get; set; }
  public Dictionary<string, string> Errors { get; set; } = new Dictionary<string, string>();
  public required AntiforgeryTokenSet AntiForgeryToken { get; set; }
}
```

Now I can use this code in the route for POST like this:

```csharp
app.MapPost("/todos", ([FromForm] Todo todo, HttpContext context, IAntiforgery antiforgery) =>
{
  var validationErrors = todo.Validate();
  if (validationErrors.Count > 0)
  {
    var vm = new CreateFormViewModel
    {
      Todo = todo,
      AntiForgeryToken = antiforgery.GetAndStoreTokens(context),
      Errors = validationErrors,
    };

    context.Response.StatusCode = 422;
    context.Response.Headers.Add("HX-Retarget", "#todo-form");
    context.Response.Headers.Add("HX-Reswap", "innerHTML");

    return Results.Extensions.RazorSlice<HtmxWithRazorSlices.Slices.TodoCreateForm, CreateFormViewModel>(vm) as IResult;
  }

  todo.Id = todos.Max(t => t.Id) + 1;
  todos.Add(todo);

  return Results.Extensions.RazorSlice<HtmxWithRazorSlices.Slices.TodoItem, Todo>(todo);
});
```

If we have validation errors I want to return a 422 status code and set the `HX-Retarget` and `HX-Reswap` headers to change the target and the swap-strategy.

Then I render the form again, now including the validation errors and the Todo item that the user tried to create.

For now validation errors the code acts as before and uses the `hx-target` and `hx-swap` that the form originally had.

One Minimal API thing that bit me was that you need to cast the return type `as IResult;` or it will not compile.

Finally, let's tweak the `TodoCreateForm` to include the validation errors and the Todo item that the user tried to create.

```html
@inherits RazorSliceHttpResult<CreateFormViewModel>

<form id="todo-form" hx-post="/todos" hx-target="#todo-list" hx-swap="beforeend">
  <input type="hidden" name="@Model.AntiForgeryToken.FormFieldName" value="@Model.AntiForgeryToken.RequestToken" />

  @if (Model.Errors.ContainsKey("Title"))
  {
    <div id="title-error" class="error">@Model.Errors["Title"]</div>
  }

  <input type="text" name="title" id="title" placeholder="Add a new todo..." value="@Model.Todo?.Title">
  <button type="submit">Add</button>
</form>
```

Ok - that's the validation part done

#### Clearing form after submit

If you've noticed you might have seen that the form is not cleared after the todo is created. This default behavior of full-page-reloads after submitting forms is put out of play by HTMX.

But we can easily fix that using an event that HTMX fires after a request. HTMX fires a great deal of events, but the one we are interested in is `htmx:after-request`. You can listen for these events centrally using `document.body.addEventListener('htmx:after-request', (event) => { ... })`, or by adding some JavaScript to the element itself. I'm gonna use the latter approach here:

```html
<form
  id="todo-form"
  hx-post="/todos"
  hx-target="#todo-list"
  hx-swap="beforeend"
  hx-on::after-request="
  if(event.detail.successful && event.detail.pathInfo.requestPath == '/todos') {
    document.getElementById('title-error').innerHTML = '';
    document.getElementById('title').value = '';
  }">
```

`hx-on::after-request` is the way to declaratively listen for a specific event on an element. Then we inline some JavaScript that checks if the event was successful, so that we don't clear the form on errors, and only for the `/todos` route. We could also have checked for a POST request, but this is good enough.

## Conclusion

That's it. We have a fully functional todo application using HTMX, Minimal APIs and Razor Slices.

There are a few things that could clean this up significantly, like moving models and route handler delegates to separate classes. I left it like this for simplicity.

Also, I didn't do an inline edit form - can you? You'll need a GET route for to get the form, and a PATCH route to update the todo information.

[You'll find the code here.](https://github.com/marcusoftnet/HtmxWithRazorSlices)

Now, I'm going to update a pull request with a sample to the Razor Slices repo.
