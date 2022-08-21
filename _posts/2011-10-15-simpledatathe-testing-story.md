---
layout: post
title: Simple.Data–the testing story date: '2011-10-14T21:51:00.001+02:00'
author: Marcus Hammarberg
tags: -
Tools
  - .NET - C# modified_time: '2011-11-03T19:46:59.686+01:00'
blogger_id: tag:blogger.com,1999:blog-36533086.post-2699078655489363036
blogger_orig_url: http://www.marcusoft.net/2011/10/simpledatathe-testing-story.html
---

I
have fallen for <a href="https://github.com/markrendle/Simple.Data"
target="_blank">Simple.Data</a>. Big time. It’s so terse and concise
that you almost lose the need for data access abstractions altogether.
It’s just … there for you. Just <a
href="https://github.com/markrendle/Simple.Data/blob/master/README.md"
target="_blank">see for yourself here</a>. And when have this power at
your fingertips it’s easy to forget the testing story.
How should I use Simple.Data so that I still can write unit and
acceptance tests with code using it?
In my unit-tests I do not want to call the database, of course, because
that would slow my unit-level tests down. Also if I do automated
acceptance I want to go end-to-end, testing the full stack of the
application. But there the database access will slow me down, often in
the form of a network hop as well.
Have no fear!
<a href="http://twitter.com/#!/markrendle" target="_blank">Mr Rendle</a>
have set us up with a couple of ways to mock out the actual call to the
database on the lowest level, but still go through Simple.Data.
In this blog post I want to show you a couple of ways to write
unit-tests that doesn’t hit the database, but still use Simple.Data.


### Using the XmlMockAdapter

When you install Simple.Data via
<a href="http://www.nuget.org/" target="_blank">NuGet</a> you might be
surprised to find a lot of packages there. There one for each adapter
(supporting 7 different databases and counting), a core package, a
sample and our friend
<a href="http://nuget.org/List/Packages/Simple.Data.Mocking"
target="_blank">Simple.Data.Mocking</a>. This package installs,
according to the description; XML-based mocking for the Simple.Data data
access library.
I create a Class Library and NuGet’ed the following packages:

-   Install-Package
    <a href="http://www.nunit.org/" target="_blank">NUnit</a>
-   Install-Package ShouldFluent (<a
    href="http://www.marcusoft.net/2010/11/should-substitutetwo-new-great-friends.html"
    target="_blank">excellent assertion library</a>)
-   Install-Package Simple.Data.Mocking

I can now write some tests. Lets try to simply call a mocked database,
in a known state and return some rows for us:

<div id="codeSnippetWrapper">

<div id="codeSnippet"
style="background-color: #f4f4f4; border-bottom-style: none; border-left-style: none; border-right-style: none; border-top-style: none; color: black; direction: ltr; font-family: 'Courier New', courier, monospace; font-size: 8pt; line-height: 12pt; overflow: visible; padding-bottom: 0px; padding-left: 0px; padding-right: 0px; padding-top: 0px; text-align: left; width: 100%;">

```
   1: [TestFixture]
```

```
   2: public class CallingSimpleDataDirectlyTests
```

```
   3: {
```

```
   4:     private XmlMockAdapter _mockAdapter;
```

```
   5: 
```

```
   6:     [TestFixtureSetUp]
```

```
   7:     public void MyTestInitialize()
```

```
   8:     {
```

```
   9:         _mockAdapter = new XmlMockAdapter(
```

```
  10:                 @"<Root>
```

```
  11:                     <Users _keys=""Id"" Id=""System.Int32"" Key=""System.Guid"">
```

```
  12:                         <User Id=""1"" Email=""marcus@marcusoft.net"" Password=""secretPassword""/>
```

```
  13:                         <User Id=""2"" Email=""kalle@marcusoft.net"" Password=""qwerty""/>
```

```
  14:                         <User Id=""3"" Email=""john@marcusoft.net"" Password=""1q2s3e4r""/>
```

```
  15:                     </Users>
```

```
  16:                   </Root>");
```

```
  17: 
```

```
  18:         MockHelper.UseMockAdapter(_mockAdapter);
```

```
  19:     }
```

```
  20: 
```

```
  21:     [Test]
```

```
  22:     public void FindByEmail_ShouldFindRecord()
```

```
  23:     {
```

```
  24:         // Arrange
```

```
  25:         var db = Database.Open();
```

```
  26: 
```

```
  27:         // Act
```

```
  28:         var user = db.Users.FindByEmail("marcus@marcusoft.net");
```

```
  29:
```

```
  30:         // Assert
```

```
  31:         Assert.AreEqual(1, user.Id);
```

```
  32:         Assert.AreEqual("marcus@marcusoft.net", user.Email);
```

```
  33:         Assert.AreEqual("secretPassword", user.Password);
```

```
  34:     }
```

```
  35: }
```

</div>

</div>



<div>

</div>



<div>

So here (and yes, I’ve stolen the sample from the Simple.Data
repository’s test project) we create a XmlMockAdapter in the Setup. On
row 9 through 16 we load it up with some XML data. This can of course be
read from a file if you want to, but then your pushing the envelope on
what a **unit**-test is, in my opinion.

</div>


Line 18 is important – that tells Simple.Data to use our \_mockAdapter.
So that the next time we open a database the Xml mock adapter will be
used. In a later version of the code, I’ve peeked, you can write
something like this:


<div id="codeSnippetWrapper">



<div id="codeSnippet"
style="background-color: #f4f4f4; border-bottom-style: none; border-left-style: none; border-right-style: none; border-top-style: none; color: black; direction: ltr; font-family: 'Courier New', courier, monospace; font-size: 8pt; line-height: 12pt; overflow: visible; padding-bottom: 0px; padding-left: 0px; padding-right: 0px; padding-top: 0px; text-align: left; width: 100%;">

```
   1: Database.UseMockAdapter(_mockAdapter);
```

</div>

</div>


which in my opinion is much clearer. However it works in the same way.

On line 25 our test code begins by opening the database for us, which
will use the XmlMockAdapter, remember. The rest of the test is simple
data access code using Simple.Data to pull back a record and validating
against it. Note that we’re using “Users” that is the name of the
Xml-element Users as our table name.

Here are some other tests using the same setup method above, and
performing insert, updates and deletes:


<div id="codeSnippetWrapper">



<div id="codeSnippet"
style="background-color: #f4f4f4; border-bottom-style: none; border-left-style: none; border-right-style: none; border-top-style: none; color: black; direction: ltr; font-family: 'Courier New', courier, monospace; font-size: 8pt; line-height: 12pt; overflow: visible; padding-bottom: 0px; padding-left: 0px; padding-right: 0px; padding-top: 0px; text-align: left; width: 100%;">

```
   1: [Test]
```

```
   2: public void Delete_should_delete_a_user()
```

```
   3: {
```

```
   4:     // Act
```

```
   5:     int numberDeleted = Database.Default.Users.Delete(Id: 2);
```

```
   6: 
```

```
   7:     // Assert
```

```
   8:     numberDeleted.Should().Equal(1);
```

```
   9: }
```

```
  10: 
```

```
  11: [Test]
```

```
  12: public void Update_should_update_the_email()
```

```
  13: {
```

```
  14:     // Act
```

```
  15:     const string email = "marcus@marcusoft.net";
```

```
  16:     int updated = Database.Default.Users.UpdateById(Id: 3, Email: email);
```

```
  17: 
```

```
  18:     // Assert
```

```
  19:     updated.Should().Equal(1);
```

```
  20:     string updatedEmail = Database.Default.Users.FindById(3).Email;
```

```
  21:     updatedEmail.Should().Equal(email);
```

```
  22: }
```

```
  23: 
```

```
  24: [Test]
```

```
  25: public void Insert_should_insert_new_entry()
```

```
  26: {
```

```
  27:     // Arrange
```

```
  28:     var db = Database.Default;
```

```
  29:     var numberOfUsersBefore = db.Users.All().Count;
```

```
  30:
```

```
  31:     dynamic newUser = new ExpandoObject();
```

```
  32:     newUser.Id = 40;
```

```
  33:     newUser.Email = "newemail@marcusoft.net";
```

```
  34:     newUser.Password = "newpassword";
```

```
  35: 
```

```
  36:     // Act
```

```
  37:     db.Users.Insert(newUser);
```

```
  38: 
```

```
  39:     // Assert
```

```
  40:     var numberOfUsersAfter = db.Users.All().Count;
```

```
  41: }
```

</div>

</div>





I used the Database.Default property which simply gives us the default
database in the .config, or in our case just the database with the
mock-adapter. It’s just a shorthand for:


<div id="codeSnippetWrapper">

<div id="codeSnippet"
style="background-color: #f4f4f4; border-bottom-style: none; border-left-style: none; border-right-style: none; border-top-style: none; color: black; direction: ltr; font-family: 'Courier New', courier, monospace; font-size: 8pt; line-height: 12pt; overflow: visible; padding-bottom: 0px; padding-left: 0px; padding-right: 0px; padding-top: 0px; text-align: left; width: 100%;">

```
   1: var db = Database.Open();
```

```
   2: db.Users.WhatEver;
```

</div>

</div>

<span class="Apple-style-span"
style="font-size: 19px; font-weight: bold;">Using a repository</span>
In start of this post I said that the Simple.Data helps to write less
code. Maybe so that we don’t need to use a separate repository. But
maybe you want to use one anyway. To be able to mock out the repository
when you’re testing a class using the repository for example.

Simple.Data actually helps us to test the repository as well, using the
XmlMockAdapter. Here is a short example.

First my, very simple, repository:


<div id="codeSnippetWrapper">



<div id="codeSnippet"
style="background-color: #f4f4f4; border-bottom-style: none; border-left-style: none; border-right-style: none; border-top-style: none; color: black; direction: ltr; font-family: 'Courier New', courier, monospace; font-size: 8pt; line-height: 12pt; overflow: visible; padding-bottom: 0px; padding-left: 0px; padding-right: 0px; padding-top: 0px; text-align: left; width: 100%;">

```
   1: public interface IUserRepository
```

```
   2: {
```

```
   3:     IList<object> GetUsersNamedBob();
```

```
   4: }
```

```
   5: 
```

```
   6: public class UserRepository : IUserRepository
```

```
   7: {
```

```
   8:     private readonly dynamic _database;
```

```
   9: 
```

```
  10:     public UserRepository()
```

```
  11:     {
```

```
  12:         _database = Database.Open();
```

```
  13:     }
```

```
  14: 
```

```
  15:     public IList<object> GetUsersNamedBob()
```

```
  16:     {
```

```
  17:         return _database.Users.FindAllByName("Bob").ToList();
```

```
  18:     }
```

```
  19: }
```

</div>

</div>


Worth noting here might be that I am not sending anything in to this
repository as a dependency, typically you don’t do that to a repository.
I am simply using the Database.Open()-method to create a private field,
which I’m then using in my methods.

In my test code I will then use the MockHelper.UseMockAdapter to ensure
that the mock adapter will be used when I call the Database-object. Here
is my test code:


<div id="codeSnippetWrapper">



<div id="codeSnippet"
style="background-color: #f4f4f4; border-bottom-style: none; border-left-style: none; border-right-style: none; border-top-style: none; color: black; direction: ltr; font-family: 'Courier New', courier, monospace; font-size: 8pt; line-height: 12pt; overflow: visible; padding-bottom: 0px; padding-left: 0px; padding-right: 0px; padding-top: 0px; text-align: left; width: 100%;">

```
   1: [TestFixture]
```

```
   2: public class RepositoryTests
```

```
   3: {
```

```
   4:     [TestFixtureSetUp]
```

```
   5:     public void SetUp()
```

```
   6:     {
```

```
   7:         //Create a mock adapter with some suitable XML
```

```
   8:         var mockAdapter = new XmlMockAdapter(
```

```
   9:                 @"<Root>
```

```
  10:                     <Users _keys=""Id"" Id=""System.Int32"" Key=""System.Guid"">
```

```
  11:                         <User Id=""1"" Email=""foo"" Name=""Bob"" />
```

```
  12:                         <User Id=""2"" Email=""bar"" Name=""Bobelina""/>
```

```
  13:                         <User Id=""3"" Email=""baz"" Name=""Bob""/>
```

```
  14:                         <User Id=""4"" Email=""baz"" Name=""Bobelina""/>
```

```
  15:                      </Users>
```

```
  16:                    </Root>");
```

```
  17: 
```

```
  18:         // Set up the database to use our mock adapter
```

```
  19:         MockHelper.UseMockAdapter(mockAdapter);
```

```
  20:     }
```

```
  21: 
```

```
  22:     [Test]
```

```
  23:     public void using_mock_adapter_in_a_repository()
```

```
  24:     {
```

```
  25:         // Arrange
```

```
  26:         var repo = new UserRepository();
```

```
  27: 
```

```
  28:         // Act
```

```
  29:         var result = repo.GetUsersNamedBob();
```

```
  30: 
```

```
  31:         // Assert
```

```
  32:         Assert.AreEqual(2, result.Count);
```

```
  33:     }
```

```
  34: }
```

</div>

</div>



As you can see this gives me the ability to test out the code in the
repository.
<span class="Apple-style-span"
style="font-size: 19px; font-weight: bold;">The future of mocking in
Simple.Data</span>

In the GitHub repository there is a branch
(<a href="https://github.com/markrendle/Simple.Data/tree/dict-query"
target="_blank">dict-query</a>) that contains something really
interesting; an in-memory adapter for Simple.Data.

The things I’ve show so far is nice but they require you to write
(boring) Xml code. It might not be too bad but if we have an in-memory
adapter you can simply insert the data you need using the standard
Insert-methods of Simple.Data.

A test would then look something like this (peeking the source again):


<div id="codeSnippetWrapper">



<div id="codeSnippet"
style="background-color: #f4f4f4; border-bottom-style: none; border-left-style: none; border-right-style: none; border-top-style: none; color: black; direction: ltr; font-family: 'Courier New', courier, monospace; font-size: 8pt; line-height: 12pt; overflow: visible; padding-bottom: 0px; padding-left: 0px; padding-right: 0px; padding-top: 0px; text-align: left; width: 100%;">

```
   1: [Test]
```

```
   2: public void InsertAndFindWithTwoColumnsShouldWork()
```

```
   3: {
```

```
   4:     // Arrange
```

```
   5:     MockHelper.UseMockAdapter(new InMemoryAdapter());
```

```
   6:     var db = Database.Open();
```

```
   7: 
```

```
   8:     // insert some users
```

```
   9:     db.Users.Insert(Id: 1, Name: "Albert");
```

```
  10:     db.Users.Insert(Id: 2, Name: "Marcus");
```

```
  11:     db.Users.Insert(Id: 3, Name: "Gustav");
```

```
  12:     db.Users.Insert(Id: 4, Name: "Arvid");
```

```
  13: 
```

```
  14:     // Act
```

```
  15:     var numberOfRecords = db.Users.All().Count;
```

```
  16:     Assert.AreEqual(4, numberOfRecords);
```

```
  17: 
```

```
  18:     var albert = db.Users.FindByIdAndName(1, "Albert");
```

```
  19:     Assert.IsNotNull(albert);
```

```
  20:     Assert.AreEqual(1, albert.Id);
```

```
  21:     Assert.AreEqual("Albert", albert.Name);
```

```
  22: }
```

</div>

</div>


From the name of the branch (dict-query) you can deduce how that’s
implemented. It’s a Dictionary holding the tables and it’s rows. I
actually took a stab of implementing it myself but when I saw that Mark
had it in place already I thought I help him writing some documentation
instead . This blog post is a start.
<span class="Apple-style-span"
style="font-size: 19px; font-weight: bold;">Conclusion</span>
I am very impressed that Mark Rendle has supplied a mocking possibility
with Simple.Data. It gives us a way to mock out the absolutely lowest
level of database interaction, giving us the possibilities to test the
full stack of the application without having to pay the network or
database interaction toll.

I hope you found this helpful.
