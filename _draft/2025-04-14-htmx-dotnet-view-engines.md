---
layout: post
title: "Using HTMX on .NET - some different view engines"
author: "Marcus Hammarberg"
date: 2025-03-31 04:00:00
tags:
 - HTMx
 - .NET
---

HTMX is awesome! And one of the really cool things with it is that it runs on whatever-backend-you-want, affectional known as the ["The HOWL Stack"](https://htmx.org/essays/hypermedia-on-whatever-youd-like/). Since HTMX only requires you to return HTML - you can return HTML on platform of your choice.

Personally that have meant Node for me, and that journey is very smooth, using frameworks like Express and some template engines. But since I have been a .NET developer since before .NET I thought I'd try that approach out too.

And with the wonders of Minimal API the setup initally is very similar to an Express app, but the when it comes to template engines the story is a bit different.

In this blog post I thought I'd compare some options on how to use a template engine for .NET to render HTML. I have four options in mind:

- Scriban - a view engine, but lacks integration into ASP.NET
- Fluid.NET - a view engine with some better integration in ASP.NET
- Razor Slices - a lightweight version of Razor, that is easy to work with in the ASP.NET ecosystem
- Razor pages (or whatever is needed to get it to work) - which is one of the recommended ways to create web pages in ASP.NET. But it is suitable for HTMX?

These are more or less integrated with the .NET ecosystem, but (in my opinion) also a bit more or less heavy to work with.

<!-- excerpt-end -->

## The application - voting for desserts

The code can be found here XXX and is a simple little voting app where you can vote for your favorite dessert. I had to do something different than a to-do app. This application still features many HTMx-features. Each example will expose X endpoints:

1. `GET /desserts/` - shows a list of all the dessert, with its vote count and a button to add a vote with. I've tried to break out each item to a separate template, if possible.
1. `GET /desserts/new` - returns the form to use to add new desserts with
1. `POST /desserts/` - creates a new dessert. Returns the form with validation errors, or the added dessert UI to add in the list
1. `DELETE /desserts/{dessertId}` - deletes a dessert - returns 200 OK when deleted.
1. `PATCH /desserts/{id}/vote` - adds a new vote count to the `{id}` and returns the new count to be shown.

There's a lot of structure that is similar, and much of the things that differs is found in the `Views` and `Routes` folders, if I don't write about other things.

I've created a DessertVoter.Model library that contains the model class and the context. It might not be a best practice but allows me to reuse it in these 4 examples.

## Scriban - doing it from scratch

[Scriban](https://github.com/scriban/scriban) is

> a fast, powerful, safe and lightweight scripting language and engine for .NET, which was primarily developed for text templating with a compatibility mode for parsing liquid templates.

Hence, the template language is [Liquid](https://shopify.github.io/liquid/) that is used on many platform, Scriban is the .NET port.

## Scriban - setup

Since Scriban is not meant to be used in web-scenarios, it doesn't have a built-in integration with ASP.NET (to my knowledge) and hence we have to write everything from scratch. For example, the `GET /desserts/` template looks like this:

```liquid
{%{ in list.scriban }%}
<h2>Showing {{ desserts.size }} desserts</h2>
{{ for dessert in desserts }}
  {{ include "desserts/dessert.scriban" dessert }}
{{ end }}

{%{ in dessert.scriban }%}
<article class="dessert-card" id="dessert-{{ dessert.id }}">
  <div class="dessert-info">
    <h2>{{ dessert.name }}</h2>
    <p class="votes" id="dessert-{{ dessert.id }}-votes">{{ dessert.votes }} votes</p>
  </div>
  <button class="vote-btn" hx-patch="/desserts/{{ dessert.id }}/vote" hx-target="#dessert-{{ dessert.id }}-votes"
    hx-swap="innerHTML">
    Vote 👍
  </button>
  <button class="vote-btn" hx-delete="/desserts/{{ dessert.id }}" hx-target="#dessert-{{ dessert.id }}"
    hx-swap="outerHTML">
    Delete ❌
  </button>
</article>
```

And we need to ensure that Scriban knows about the file we are `include`-ing there is known. That gives us the following code:

```c#
app.MapGet("/desserts/", async (AppDbContext db) =>
{
  var desserts = await db.Desserts.OrderByDescending(d => d.Votes).ToListAsync();

  // Load templates into the Scriban Context
  var loader = new FileSystemTemplateLoader("Views");
  var context = new TemplateContext();
  context.TemplateLoader = loader;

  // Add data to the global context
  var scriptObject = new ScriptObject
  {
    { "desserts", desserts }
  };
  context.PushGlobal(scriptObject);

  // Load and render the main template
  var template = Template.Parse(await File.ReadAllTextAsync("Views/desserts/list.scriban"));
  var rendered = await template.RenderAsync(context);

  return Results.Content(rendered, "text/html");
});
```

Which is quite a lot of code for a simple route like that. But me and my AI worked a bit on it and created a few helpers that got the code to look like this using a `ScribanViewResult` that I wrote:

```c#
app.MapGet("/desserts/", async (AppDbContext db) =>
{
    var desserts = await db.Desserts.OrderByDescending(d => d.Votes).ToListAsync();
    return new ScribanViewResult("desserts/list.scriban", new { desserts });
});
```

Finally, we need to think about caching, and I've written some code that reads the templates and store them in a cache, which `ScribanViewResult` then reads from.

### The routes

With all of that in

### The templates


### Quirks

Scriban converts properties to camel case and for the life of me I couldn't really figure out how it works. I'm sure there's reason to this madness but that requires more time than I have:

```c#
// Works
var template = Template.Parse("Hello {{name}}!");
var result = template.Render(new { Name = "World" }); // => "Hello World!"

// But this doesn't work:
var template = Template.Parse("Hello {{fullName}}!");
var result = template.Render(new { FullName = "World" }); // => "Hello !"

// works
var template = Template.Parse("Hello {{fullname}}!");
var result = template.Render(new { Fullname = "World" }); // => "Hello World!"

// does not wor
var template = Template.Parse("Hello {{fullname}}!");
var result = template.Render(new { FullName = "World" }); // => "Hello !"
```

I haven't got all of it but

| C# Property                  | Scriban      |  Variable Template |  Result             |
|:---                          |:---          |:---                |:---                 |
| `new { FullName = "World" }` | `fullName` | `{{ fullName }}`     | `✅ "Hello World!"` |
| `new { Fullname = "World" }` | `fullname` | `{{ fullname }}`     | `✅ "Hello World!"` |
| `new { FullName = "World" }` | `fullName` | `{{ FullName }}`     | `❌ "Hello !"`      |
