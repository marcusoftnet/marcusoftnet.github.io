---
layout: post
title: "Nancy.Testing - configure her boot...strapper"
date: 2013-01-27T08:00:00.000Z
author: Marcus Hammarberg
tags:
  - Nancy
  - Tools
  - .NET
  - C#
modified_time: 2014-06-21T00:09:55.455Z
blogger_id: tag:blogger.com,1999:blog-36533086.post-2035700742916788295
blogger_orig_url: https://www.marcusoft.net/2013/01/NancyTesting2.html
---

![Nancy Logo](http://nancyfx.org/images/logo.png)

This is the second post in my series on the awesome testability of [Nancy](http://www.nancyfx.org/) - a minimalistic web framework on the .NET / Mono platform. Let's throw in the logo again - it's so nice.

The other posts can be found here:

1. [Intro to testing with Nancy](https://www.marcusoft.net/2013/01/NancyTesting1.html)
2. [The Configurable bootstrapper](https://www.marcusoft.net/2013/01/NancyTesting2.html) (this post)
3. [The Browser and Response objects](https://www.marcusoft.net/2013/01/NancyTesting3.html)
4. [Hat and shoeless testing with Simple.Data](https://www.marcusoft.net/2013/02/NancyTesting4.html)
5. [SpecFlow and Nancy](https://www.marcusoft.net/2013/02/NancyTesting5.html)

This post covers a basic feature that makes up much of the awesomeness that is around configurability in Nancy testing: the configurable bootstrapper.

There's a [wiki-post on testing on the Nancy Github wiki](https://github.com/NancyFx/Nancy/wiki/Testing-your-application) but it leaves the ConfigurableBootstrapper with a mere mentioning. I think it deserves a deeper look, since through this, you can actually control and swap out most anything from the Nancy framework. Even ViewEngines and the NancyEngine itself are possible to change to something that suits you better. In the testing case - we can supply fakes and mocks.

Let's get to it - there's a lot of code to get through.

### The Configurator and how we use it

To call into a Nancy module from a test, the creators have given us the Nancy.Testing.Browser class, as we said the last time. This class helps us to create our HTTP requests and call them.

To create a Browser-object we need to supply a bootstrapper, that sets up the environment that our test is executing in. It can be the default DefaultNancyBootstrapper that uses all the common Nancy conventions or settings.

Or ... it can be a lambda. Like this:

Pardon the funky formatting, but I think that requires some explanation.

- On line 3 we're using a variable called "with". Hovering over that parameter we see that it's of (hold on to your hat...): ConfigurableBootstrapper.ConfigurableBootstrapperConfigurator. It's a class that implements the [builder pattern](http://en.wikipedia.org/wiki/Builder_pattern), which makes it excellent to use for building the executing context of our testing browser.
- On line 4 we are then using the Configurator to tell the browser to just load the module called ConfigBootTestModule

It takes some getting used to but my suspicion is that users of Nancy already use lambdas quite a lot and it doesn't scare them. The whole routing feature is built around lambdas, for example.

For us it means that we get a very crisp syntax to express how we want the environment to be set up.

The rest of this post dwells on some of the capabilities of the Configurator and what we can use these capabilities for. I will not cover everything, since that would be a very boring blog post and some of the things you can swap out are beyond me why you would...
There's loads of code in here, but I reckon that's just what you wanted.

### Module

The first and most obvious use for the ConfigurableBootstrapper is to tell it to load the (Nancy)-Module your testing. Well actually if you use the normal DefaultNancyBootstrapper it will load all the modules in all referenced assemblies - that's the [Super Duper Happy Path](https://github.com/NancyFx/Nancy#the-super-duper-happy-path) in action right there :).
Here's an example of that

But it could be cumbersome, clumsy and slow to load every module in a project and hence there's a possibility to just load the one(s) you're planning to test. I use it as a best practice since it also narrows down my test scope and asserts that things are where I thought they would be.
Here's an example of using the Module-methods:

Go to the repository to see other [ways to call Module(s)](https://github.com/marcusoftnet/DiscoveringNancyThroughTests/blob/master/DiscoverNancy.Tests/DiscoverNancy.Tests/ConfigurableBootstrapper_Module.cs)

### Dependencies

The next thing that I think most people would want to use is the Dependency and Dependencies methods. With these, you can supply fake implementations for any Dependency that a Module has. Yes - without flexing any IoC container (other than [TinyIoC](https://github.com/grumpydev/TinyIoC) that's built into Nancy and that you almost cannot see).
Let's see the Dependency-method in action:
As you can see it's merely a question of supplying the class as a type parameter, but there are a number of ways to call the Dependency method. [Look here](https://github.com/marcusoftnet/DiscoveringNancyThroughTests/blob/master/DiscoverNancy.Tests/DiscoverNancy.Tests/ConfigurableBoostrapper_Dependency.cs) to see more of them in action.

Finally, if your module has more than one dependency you can register them all at once with the Dependencies-method. With this method, you can supply more than one Dependency.
This method also has a [lot of overloads, see here](https://github.com/marcusoftnet/DiscoveringNancyThroughTests/blob/master/DiscoverNancy.Tests/DiscoverNancy.Tests/ConfigurableBootstraper_Dependecies.cs). In one of them, me and [Grumpy Dev](http://twitter.com/grumpydev) found a bug here, where I plan to do my first contribution to the source of Nancy. I've annotated the source to show the workaround.

### AutoRegistration

When all of that is out of the way you start to think that this is not very Super Duper Happy, letting me configure my dependencies like that. Well there's help to be had through our friend: EnableAutoRegistration.

This little method simply allows for the [convention based configuration that is found in TinyIoC](https://github.com/grumpydev/TinyIoC/wiki/Setup---getting-started), meaning that if your interface is called IFoo it will register the implementation Foo, for example. As far as I understand, the current assembly is scanned first and then the referenced ones. So if you have some mock instances of the dependent interfaces in the testing assembly that will get registered first.
This all results in this test. Note that I don't have to hand Nancy.Testing my dependencies. It just works.
However - this is a bit dangerous, of course. What happens if you have more than one implementation for your interfaces in the test assembly? What if the production implementation gets registered first - can the order be trusted..? But for simple cases it's really nice.

### Other configurable properties

As I mentioned there's loads of things that you can swap out during testing (or for your own implementation). All of it in fact. That's a core property of Nancy itself, the whole framework. That in turn makes the testing experience excellent and apparently not that hard to write for the NancyFx creators. They just used their own frameworks' extensibility.

So I won't write examples for all of them, but I thought I'd list them and mention what you could use that for (in the cases I could see that):

- Binder - this gives you the ability to swap out the Nancy model binder. If you are using one of your own or for some reason need to mock the Nancy model binder of the way, this is the method for you.
    There are 2 versions: Binder and Binder(IBinder) for you to choose from
- ContextFactory - this gives you the ability to mock out how the Nancy Context-object is created. The Nancy Context is the object that Nancy creates for each incoming HTTP request. Yes, it's in the guts.
    But you can still mock that stuff out and replace it with your own factory for Nancy contexts.
    There are 2 versions here too: ContextFactory and ContextFactory(INancyContextFactory)
- StatusCodeHandlers - now we're venturing into countries that you can question if you ever need to do but there's an option to swap out how a HTTP status code is handled.
    There are two ways to call this method: StatusCodeHandler() and StatusCodeHandlers(params Type[])
- RouteResolver - gives you the ability to swap out how routes are resolved. Two versions: RouteResolver(IRouteResolver and RouteResolver
- NancyModuleBuilder - this way you can swap the way that NancyModules are built, from a sent-in context object. Two versions exist: NancyEngine(INancyEngine) and NancyEngine()
- NancyEngine - yes people. You can swap out the entire NancyEngine itself. My guess is that many of the parts of that you can swap out stems from the fact that the NancyEngine has dependencies on them.
    But hey - [it can be done](https://github.com/NancyFx/Nancy/blob/master/src/Nancy.Tests/Unit/NancyEngineFixture.cs). Two versions exist: NancyEngine(INancyEngine) and NancyEngine()

The rest of them, and some of the ones that I've mentioned are things that I cannot see being used often, but still. It can be done. Most of them work the same way as the Module and Dependency-methods I've described above.

### Hooking into the pipeline

There are two more methods that can be useful: ApplicationStartup and RequestStartup. With these, you can hook into the pipeline of an HTTP request and add functionality to it as needed.

Here's one example using the ApplicationStartup-method:
As you can see it's as easy as registering a block of code that is run before each request. There are other events that you can hook into as well (OnError and AfterRequest) but that's not as common, and works exactly the same.

There's also a RequestStartup that works much the same way, but for a single Request:

### Summary

As you can see there's loads of stuff that can be configured and swapped out during testing of your Nancy application. In fact - it can be replaced even when running the application in production. That's one of the cornerstones of the design of Nancy - extensibility. You can replace almost anything with your own implementations.

That just happens to play right into the hands of a tester - creating an awesome testing experience.

But there's still more that can be configured and in the next post I'll dive (maybe not as deep) into the configurability of the Request object. And the assertions on the Response-object.
