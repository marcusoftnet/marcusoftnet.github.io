---
layout: post
title: Nancy.Testing - configure her boot...strapper
date: '2013-01-27T09:00:00.000+01:00'
author: Marcus Hammarberg
tags: -
Nancy
   - Tools
  - .NET - C# modified_time: '2014-06-21T02:09:55.455+02:00'
blogger_id: tag:blogger.com,1999:blog-36533086.post-2035700742916788295
blogger_orig_url: http://www.marcusoft.net/2013/01/NancyTesting2.html
---


<div dir="ltr" style="text-align: left;" trbidi="on">

<div class="separator" style="clear: both; text-align: center;">

<a href="http://nancyfx.org/images/logo.png" data-imageanchor="1"
style="clear: right; float: right; margin-bottom: 1em; margin-left: 1em;"><img
src="http://nancyfx.org/images/logo.png" data-border="0" width="178"
height="200" /></a>

</div>

This is the second post in my series on the awesome testability of
<a href="http://www.nancyfx.org/" target="_blank">Nancy</a> - a
minimalistic web framework on the .NET / Mono platform. Let's throw in
the logo again - it so nice.

The other posts can be found here:

1.  <a href="http://www.marcusoft.net/2013/01/NancyTesting1.html"
    target="_blank">Intro to testing with Nancy</a>
2.  <a href="http://www.marcusoft.net/2013/01/NancyTesting2.html"
    target="_blank">The Configurable bootstrapper</a>(this post)
3.  <a href="http://www.marcusoft.net/2013/01/NancyTesting3.html"
    target="_blank">The Browser and Response objects</a> 
4.  <a href="http://www.marcusoft.net/2013/02/NancyTesting4.html"
    target="_blank">Hat and shoeless testing with Simple.Data</a>
5.  <a href="http://www.marcusoft.net/2013/02/NancyTesting5.html"
    target="_blank">SpecFlow and Nancy</a>

<div>

This post covers a basic feature that makes up much of the awesomeness
that is around configurability in Nancy testing: the configurable
bootstrapper. 

</div>

<div>



</div>

<div>

There's a
<a href="https://github.com/NancyFx/Nancy/wiki/Testing-your-application"
target="_blank">wiki-post on testing on the Nancy Github wiki</a> but it
leaves the ConfigurableBootstrapper with a mere mentioning. I think it
deserves a deeper look, since you through this actually can control and
swap out most anything from the Nancy framework. Even ViewEngines and
the NancyEngine itself are possible to change to something that suits
you better. In the testing case - we can supply fakes and mocks. 

</div>

<div>



</div>

<div>

Let's get to it - there's a lot of code to get through.

</div>

<div>



### The Configurator and how we use it

<div>

To call into a Nancy module from a test the creators has given us the
Nancy.Testing.Browser class, as we said the last time. This class helps
us to create our HTTP-requests and call them.

To create a Browser-object we need to supply a bootstrapper, that sets
up the environment that our test is executing in. It can be the default
DefaultNancyBootstrapper that uses all the common Nancy conventions or
settings.

Or ... it can be a lamda. Like this:

<div>

</div>

<div>

Pardon the funky formatting, but I think that requires
some explanation.

-   On line 3 we're using a variable called "with". Hovering over that
    parameter we see that it's of (hold on to your
    hat...): ConfigurableBootstrapper.ConfigurableBoostrapperConfigurator.
    It's a class that implements the
    <a href="http://en.wikipedia.org/wiki/Builder_pattern"
    target="_blank">builder pattern</a>, which makes it excellent to use
    for building the executing context of our testing browser.
-   On line 4 we are then using the Configurator to tell the browser to
    just load the module called ConfigBootTestModule

<div>

It takes some getting used to but my suspicion is that users of Nancy
already use lambdas quite a lot and it doesn't scare them. The whole
routing feature is built around lambdas, for example. 

</div>

<div>

For us it means that we get a very crisp syntax to express how we want
the environment to be set up. 

</div>

<div>



</div>

<div>

The rest of this post dwells on some of the capabilities of the
Configurator and what we can use these capabilities for. I will not
cover everything, since that would be a very boring blog post and some
of the things you can swap out is beyond me why you would...
There's loads of code in here, but I reckon that's just what you wanted

</div>

</div>

### Module

<div>

The first and most obvious use for the ConfigurableBootstrapper is to
tell it to load the (Nancy)-Module your testing. Well actually if you
use the normal DefaultNancyBootstrapper it will load all the modules in
all referenced assemblies - that's the
<a href="https://github.com/NancyFx/Nancy#the-super-duper-happy-path"
target="_blank">Super Duper Happy Path</a> in action right there :).
Here's an example of that

But it could be cumbersome, clumsy and slow to load every module in a
project and hence there's a possiblity to just load the one(s) your
planning to test. I use it as a best practice since it also narrows down
my test scope and asserts that things are where I thought they would
be.
Here's an examples of using the Module-methods:



<div>

Go to the repository to see other [ways to call
Module(s)](https://github.com/marcusoftnet/DiscoveringNancyThroughTests/blob/master/DiscoverNancy.Tests/DiscoverNancy.Tests/ConfigurableBootstrapper_Module.cs)

</div>

### Dependencies

<div>

The next thing that I think that most people would want to use is the
Dependecy and Dependecies methods. With these you can supply fake
implementations for any Dependency that a Module have. Yes - without
flexing any IoC container (other than
<a href="https://github.com/grumpydev/TinyIoC"
target="_blank">TinyIoC</a> that's built into Nancy and that you almost
cannot see).
Let's see the Dependency-method in action:

<div>

</div>


As you can see it's merely a question of supplying the class as a type
parameter, but there's a number of ways to call the Dependency method.
<a
href="https://github.com/marcusoftnet/DiscoveringNancyThroughTests/blob/master/DiscoverNancy.Tests/DiscoverNancy.Tests/ConfigurableBoostrapper_Dependency.cs"
target="_blank">Look here</a> to see more of them in action.

Finally if your module have more than one dependency you can registrer
them all at once with the Dependencies-method. With this method you can
supply more than one Dependency.

<div>

</div>


This method also have a <a
href="https://github.com/marcusoftnet/DiscoveringNancyThroughTests/blob/master/DiscoverNancy.Tests/DiscoverNancy.Tests/ConfigurableBootstraper_Dependecies.cs"
target="_blank">lot of overloads, see here</a>. In one of them me an
<a href="http://twitter.com/grumpydev" target="_blank">@grumpydev</a>
found a bug here, where I plan to do my first contribution to the source
of Nancy, I've annotated the source to show the workaround. 

</div>

### AutoRegistration

<div>

When all of that is out of the way you start to think that this is not
very Super Duper Happy, letting me configuring my dependencies like
that. Well there's help to be had through our friend:
EnableAutoRegistration.

This little method simply allows for the <a
href="https://github.com/grumpydev/TinyIoC/wiki/Setup---getting-started"
target="_blank">convention based configuration that is found in
TinyIoC</a>, meaning that if your interface is called IFoo it will
registrer the implementation Foo for example. As far as I understand the
current assembly is scanned first and then the referenced ones. So if
you have some mock instances of the dependent interfaces in the testing
assembly that will get registered first.
This all results in this test. Note that I don't have to hand
Nancy.Testing my dependencies. It just works.

<div>

</div>


However - this is a bit dangerous, of course. What happen if you have
more than one implementation for your interfaces in the test assembly?
What if the production implementation get's registered first - can the
order be trusted..? But for simple cases it's really nice. 

</div>

### Other configurable properties

<div>

As I mentioned there's loads of things that you can swap out during
testing (or for your own implementation). All of it in fact. That's a
core property of Nancy itself, the whole framework. That in turn make
the testing experience excellent and apparently not that hard to write
for the NancyFx creators. They just used their own
frameworks extensibility.

</div>

<div>



</div>

<div>

So I wont write examples for all of them, but I thought I'd list them
and mention what you could use that for (in the cases I could see that):

</div>

<div>

-   Binder - this gives you the ability to swap out the Nancy model
    binder. If you are using one of your own or for some reason need to
    mock the Nancy model binder of the way, this is the method for
    you.
    There are 2 versions: Binder and Binder(IBinder) for you to chose
    from
-   ContextFactory - this gives you the ability to mock out how the
    Nancy Context-object is created. The Nancy Context the object that
    Nancy creates for each incoming HTTP request. Yes, it's in the guts.
    But you can still mock that stuff out and replace it with your own
    factory for Nancy contextes.
    There are 2 versions here too: ContextFactory
    and ContextFactory(INancyContextFactory)
-   StatusCodeHandlers - now we're venturing into countries that you can
    questions if you ever need to do but there's an option to swap out
    how a HTTP status code is handled.
    There are two ways to call this method: StatusCodeHandler() and
    StatusCodeHandlers(params Type\[\])
-   RouteResolver - gives you the ability to swap out how routes are
    resolved. Two versions: RouteResolver(IRouteResolver and
    RouteResolver
-   NancyModuleBuilder - this way you can swap the way that NancyModules
    are built, from a a sent-in context object. Two versions exists:
    NancyEngine(INancyEngine) and NancyEngine()
-   NancyEngine - yes people. You can swap out the entire NancyEngine
    itself. My guess is that many of the parts of that you can swap out
    stems from the fact that the NancyEngine has dependencies on them.
    But hey - <a
    href="https://github.com/NancyFx/Nancy/blob/master/src/Nancy.Tests/Unit/NancyEngineFixture.cs"
    target="_blank">it can be done</a>. Two version
    exists: NancyEngine(INancyEngine) and NancyEngine()

<div>

The rest of them, and some of the ones that I've mentioned are thing
that I cannot see being used often, but still. It can be done. Most of
them works the same way as the Module and Depencendy-methods I've
described above

</div>

</div>

### Hooking into the pipeline

<div>

There are two more methods that can be useful: ApplicationStartup and
RequestStartup. With these you can hook into the pipeline of a HTTP
request and add functionality to it as needed.

Here's one example using the ApplicationStartup-method:

<div>

</div>



</div>

<div style="text-align: left;">

As you can see it's as easy as registering a block of code that is run
before each request. There are other events that you can hook into as
well (OnError and AfterRequest) but that's not as common, and works
exactly the same. 

</div>

<div style="text-align: left;">



</div>

<div style="text-align: left;">

There's also a RequestStartup that works much the same way, but for a
single Request:

<div>

</div>

### Summary

</div>

<div>

As you can see there's loads of stuff that can be configured and swapped
out during testing of your Nancy application. In fact - it can be
replaced even when running the application in production. That's one of
the cornerstones of the design of Nancy - extensibility  You can replace
almost anything with your own implementations.

That just happens to play right in the hands of a tester - creating a
awesome testing experience.

But there's still more that can be configured and in the next post I'll
dive (maybe not as deep) into the configurability of the Request object.
And the assertions on the Response-object.


</div>

</div>

</div>

</div>

</div>
