---
layout: post
title: Testing WebAPI with AspNetCore.Mvc.Testing and xUnit Collections
author: Marcus Hammarberg
date: 2021-11-16 10:33:20
tags:
 - .NET

  - C#
 - Testing
---

I'm writing a boot camp for .NET core and have started to learn a lot of things that have changed since I last coded C#. One of them was shown to me by my good friend [John Magnusson](https://twitter.com/tenfortyeight). (I'm downplaying his knowledge and skills a lot here since I was close to tears and he sent me a link that saved by bacon, but hey - I'm telling the story :))

Anyhow - John showed me [Microsoft.AspNetCore.Mvc.Testing](https://www.nuget.org/packages/Microsoft.AspNetCore.Mvc.Testing) that really tells a nice story when it comes to testing an API. In this post I wanted to show you how I used it.

Also - I ran into problems, since I had a database seeding that didn't work when I used the suggested solution. I will show you how I solved that too, and in the process, tell you a little thing I picked up about [xUnit](https://xunit.net/). And a bit about how to set up a singleton in ASP.NET Web Api.

Phew - that's a truckload. Let's go! I hope you'll learn as much as I did.

<!-- excerpt-end -->

## Context

I'm writing an lab where our developers will write a RESTful API for a shopping cart. It has two parts: a list of products and the cart handling. The developers will get my tests and need to write the application based off what they learn from getting error messages. The focus of the lab is REST and not writing tests.

## Startup and seeding

The products are hard-coded and, for the sake of the exercise, just kept in-memory. Hence I will seed the in-memory database on startup of the WebAPI. In that seeding I will also clear out any carts.

I've added a switch for this seeding to ensure that it didn't run in production, but that is beyond the scope of this lab.

This seeding, "stolen" then tweaked from this [excellent course](https://www.youtube.com/watch?v=DgVjEo3OGBI&t=5143s), is done in a class that looks like this:

```csharp
public class SeedDatabase
{
  public void PrepPopulation(IApplicationBuilder app)
  {
    using (var serviceScope = app.ApplicationServices.CreateScope())
    {
      SeedData(serviceScope.ServiceProvider.GetService<AppDbContext>());
    }
  }
  private void SeedData(AppDbContext context)
  {
    clearCarts(context);
    if (!context.Products.Any())
    {
      addProducts(context);
    }
    context.SaveChanges();
  }

  private void addProducts(AppDbContext context)
  {
    Console.WriteLine("### Adding products to the empty database");

    context.Products.AddRange(
    	// list of products here...
    );
 }

 private void clearCarts(AppDbContext context)
 {
   Console.WriteLine("### Removing all carts");
   context.CartProducts.RemoveRange(context.CartProducts.ToList());
   context.Carts.RemoveRange(context.Carts.ToList());
 }
}
```

Nothing particular strange in here. The AppDbContext that I get `ServiceProvider.GetService<AppDbContext>()` is just a very ordinary EntityFramework context:

```csharp
public class AppDbContext : DbContext
{
  public AppDbContext(DbContextOptions<AppDbContext> options) : base(options)
  { }

  public DbSet<Product> Products { get; set; }
  public DbSet<Cart> Carts { get; set; }
  public DbSet<CartProduct> CartProducts { get; set; }
}
```

Ok - but the slightly more interesting part is to actually call the `SeedDatabase.PrepPopulation`. I did this as a singleton, rather than using static classes, as it felt more ... proper:

```c#
public class Startup
{
  // ...
  public void ConfigureServices(IServiceCollection services)
  {

    // Here we create the Singleton instance of the seeder
    services.AddSingleton<SeedDatabase>();
  }

  public void Configure(IApplicationBuilder app, IWebHostEnvironment env)
  {
    if (env.IsDevelopment())
    {
      // and then we get the singleton back out from the Application Services
      var seeder = app.ApplicationServices.GetService<SeedDatabase>();
      seeder.PrepPopulation(app);
    }
  }
}
```

Ok - this is all cool. Now I will seed the database using a singleton version of my seeder. On to the tests... where I ran into problems with the seeding.

## Writing tests for API methods using AspNetCore.Mvc.Testing

John, my hero, sent me an [excellent blog post](https://timdeschryver.dev/blog/how-to-test-your-csharp-web-api#a-simple-test) about using AspNetCore.Mvc.Testing that I started from. You can read that if you want to go deeper. Here's the gist of it:

```c#
public class ProductsControllerTests: IClassFixture<WebApplicationFactory<Startup>>
{
  readonly HttpClient _client;
  const string BASE_URL = "/api/Products";

  public ProductsControllerTests(WebApplicationFactory<Startup> fixture)
  {
    _client = fixture.CreateClient();
  }

  [Fact]
  public async Task getAllProducts_returns_OK()
  {
    // act
    var response = await _client.GetAsync(BASE_URL);

    // assert
    response.StatusCode.Should().Be(HttpStatusCode.OK);
  }


  [Fact]
  public async Task getAllProducts_returns_6_products()
  {
    // act
    var response = await _client.GetAsync(BASE_URL);

    // arrange
    var products = JsonConvert.DeserializeObject<List<Product>>(await response.Content.ReadAsStringAsync());
    products.Should().HaveCount(6);
  }
}
```

It's quite a lot going on in these lines of code. Let's go through them slowly.

* First, notice that the `ProductsControllerTests` inherits `IClassFixture<T>`. This is a xUnit thing that makes it possible to get that `T` injected into the constructor of the class.

  * This is how we can do things before all tests in the file
  * And we can hold state for all the tests in the file too...

* The `T` in our case is `WebApplicationFactory<T>` which comes from `Microsoft.AspNetCore.Mvc.Testing` and  is used to create the API in memory.  Pretty nifty, huh - becuase now we can test the whole thing in memory rather than kicking up a full webserver. Faster feedback for the win!

  * And the `T`  that gets passed to  `WebApplicationFactory<T>`  is our `Startup` class for the API, where all the initialisation code resides. The service injection and database seeding for example.

* But what do we want to do with that `IClassFixture` that we get into the constructor? We want to create the client that we will use to make calls to the API. We're getting it with a simple method call:

    ```csharp
    readonly HttpClient _client;
    public ProductsControllerTests(WebApplicationFactory<Startup> fixture)
    {
       _client = fixture.CreateClient();
    }
    ```

    * We just store the client in a field for our tests to use.

* Speaking of - let's FINALLY, write a test that use the client:

    ```csharp
    [Fact]
    public async Task getAllProducts_returns_OK()
    {
      // act
      var response = await _client.GetAsync(BASE_URL);

      // arrange
      response.StatusCode.Should().Be(HttpStatusCode.OK);
    }
    ```

* Notice that the `response`-object have a lot of useful properties, but you very often need to serialize the response into an object:

    ```csharp
    [Fact]
    public async Task getAllProducts_returns_6_products()
    {
      // act
      var response = await _client.GetAsync(BASE_URL);

      // arrange
      var products = JsonConvert.DeserializeObject<List<Product>>(
        			await response.Content.ReadAsStringAsync());
      products.Should().HaveCount(6);
    }
    ```

This is all fine - but in my use case it didn't work... Since I ran into problems with the fixtures, right after I added another test class.

## Running code before ALL tests with CollectionFixtures

From the fixture that gets passed in to the test constructor we create the client `fixture.CreateClient();`. And in this process we will run the `Startup`-code, which in my case runs the seeding of the database.

When I did that with a ClassFixture I got problems: `System.ArgumentException: An item with the same key has already been added.`. This was my products being added twice. Which is not so suprising when you think about it.

I now have two tests classes that both get `WebApplicationFactory<Startup>` injected. They run in-memory (which is cool and the whole idea of the AspNetCore.Mvc.Testing library) but that means that these two fixtures doesn't know about each other.

What I need is a fixture that runs for more than one class... like a CollectionFixture of sorts. Funnily enough - xUnit has this, through the [CollectionFixture attribute](https://xunit.net/docs/shared-context). Let's implement one for our needs:

```c#
public class HttpClientFixture : IDisposable
{
  public HttpClientFixture() => this.Client = new WebApplicationFactory<Startup>().CreateClient();

  public void Dispose() => this.Client.Dispose();
  public HttpClient Client { get; private set; }
}
```

I've now created a class that just creates a client and stores it in a property. I also added a `Dispose` for good measures.

We can now make an attribute for this:

```c#
[CollectionDefinition(nameof(HttpClientCollection))]
public class HttpClientCollection : ICollectionFixture<HttpClientFixture>
{ }
```

This is just an empty class that inherits the `ICollectionFixture<T>` that works just like `IClassFixture` but it can be applied through attributes. This is what the `[CollectionDefinition(nameof(HttpClientCollection))]` is used for

(I'm very proud of using `nameof` function that just returns the name of whatever class you give it. Makes it safer for refactoring the names of things. In this case I could equally well have written
`[CollectionDefinition("HttpClientCollection"]` but that would have been broken if I update the name of the HttpClientCollection class)

Now to the last part - let's apply the attribute to the test classes:

```csharp
[Collection(nameof(HttpClientCollection))]
public class ProductsControllerTests
{
  readonly HttpClient _client;

  public ProductsControllerTests(HttpClientFixture fixture)
  {
    _client = fixture.Client;
  }
}
```

In the same manner as for the `IClassFixture` we will get the `HttpClientFixture` injected, since our Collection inherits from  `ICollectionFixture<HttpClientFixture>`.

This means that we can now just pull the client from the passed in fixture (`_client = fixture.Client;`) - and it will only be created once, per collection name (`nameof(HttpClientCollection)`)

Ha! Let's do it again for the other tests:

```c#
[Collection(nameof(HttpClientCollection))]
public class CartsControllerTests
{
  readonly HttpClient _client;

  public CartsControllerTests(HttpClientFixture fixture)
  {
    _client = fixture.Client;
  }
}
```

Easy - and cleaner.

Let's run the tests:

```bash
dotnet test
```

And yes - we only get the seeding once. Hurray!

```bash
### Removing all carts
### Adding products to the empty database
```

It's is done. I'm happy!

## Conclusions

AspNetCore.Mvc.Testing is very useful, I just hinted about that here. [Read more here](https://timdeschryver.dev/blog/how-to-test-your-csharp-web-api#a-simple-test) .

Getting things to run only once for a suite of tests, even when they are in more than one class, in xUnit can be done through `CollectionDefinition`.

This cost me some tears, I will not lie. But now those are tears of pride and joy.
