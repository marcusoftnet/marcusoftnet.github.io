---
layout: post
title: Simple.Data–the testing story
date: 2011-10-14T19:51:00.001Z
author: Marcus Hammarberg
tags:
  - Tools
  - .NET
  - C#
modified_time: 2011-11-03T18:46:59.686Z
blogger_id: tag:blogger.com,1999:blog-36533086.post-2699078655489363036
blogger_orig_url: http://www.marcusoft.net/2011/10/simpledatathe-testing-story.html
---

## Simple.Data–the testing story

I've fallen for [Simple.Data](https://github.com/markrendle/Simple.Data) big time. It’s so terse and concise that you almost lose the need for data access abstractions altogether. It’s just … there for you. Just [see for yourself here](https://github.com/markrendle/Simple.Data/blob/master/README.md). And when you have this power at your fingertips, it’s easy to forget the testing story. How should I use Simple.Data so that I can still write unit and acceptance tests with code using it?

In my unit tests, I do not want to call the database, of course, because that would slow my unit-level tests down. Also, if I do automated acceptance testing, I want to go end-to-end, testing the full stack of the application. But there the database access will slow me down, often in the form of a network hop as well.

Have no fear! [Mr. Rendle](http://twitter.com/#!/markrendle) has set us up with a couple of ways to mock out the actual call to the database on the lowest level, but still go through Simple.Data.

In this blog post, I want to show you a couple of ways to write unit tests that don’t hit the database but still use Simple.Data.

### Using the XmlMockAdapter

When you install Simple.Data via [NuGet](http://www.nuget.org/), you might be surprised to find a lot of packages there. There's one for each adapter (supporting 7 different databases and counting), a core package, a sample, and our friend [Simple.Data.Mocking](http://nuget.org/List/Packages/Simple.Data.Mocking). This package installs, according to the description, XML-based mocking for the Simple.Data data access library.

I create a Class Library and NuGet the following packages:

- `Install-Package NUnit`
- `Install-Package ShouldFluent` ([excellent assertion library](http://www.marcusoft.net/2010/11/should-substitutetwo-new-great-friends.html))
- `Install-Package Simple.Data.Mocking`

I can now write some tests. Let's try to simply call a mocked database in a known state and return some rows for us:

```csharp
[TestFixture]
public class CallingSimpleDataDirectlyTests
{
    private XmlMockAdapter _mockAdapter;

    [TestFixtureSetUp]
    public void MyTestInitialize()
    {
        _mockAdapter = new XmlMockAdapter(
            @"<Root>
                <Users _keys=""Id"" Id=""System.Int32"" Key=""System.Guid"">
                    <User Id=""1"" Email=""marcus@marcusoft.net"" Password=""secretPassword""/>
                    <User Id=""2"" Email=""kalle@marcusoft.net"" Password=""qwerty""/>
                    <User Id=""3"" Email=""john@marcusoft.net"" Password=""1q2s3e4r""/>
                </Users>
              </Root>");

        MockHelper.UseMockAdapter(_mockAdapter);
    }

    [Test]
    public void FindByEmail_ShouldFindRecord()
    {
        // Arrange
        var db = Database.Open();

        // Act
        var user = db.Users.FindByEmail("marcus@marcusoft.net");

        // Assert
        Assert.AreEqual(1, user.Id);
        Assert.AreEqual("marcus@marcusoft.net", user.Email);
        Assert.AreEqual("secretPassword", user.Password);
    }
}
```

So here (and yes, I’ve stolen the sample from the Simple.Data repository’s test project) we create an XmlMockAdapter in the Setup. On row 9 through 16, we load it up with some XML data. This can, of course, be read from a file if you want to, but then you're pushing the envelope on what a ## unit##  test is, in my opinion.

Line 18 is important – that tells Simple.Data to use our `_mockAdapter`, so that the next time we open a database, the Xml mock adapter will be used. In a later version of the code, I’ve peeked, you can write something like this:

```csharp
Database.UseMockAdapter(_mockAdapter);
```

which, in my opinion, is much clearer. However, it works in the same way.

On line 25, our test code begins by opening the database for us, which will use the XmlMockAdapter, remember. The rest of the test is simple data access code using Simple.Data to pull back a record and validate against it. Note that we’re using “Users” which is the name of the Xml element Users as our table name.

Here are some other tests using the same setup method above, and performing inserts, updates, and deletes:

```csharp
[Test]
public void Delete_should_delete_a_user()
{
    // Act
    int numberDeleted = Database.Default.Users.Delete(Id: 2);

    // Assert
    numberDeleted.Should().Equal(1);
}

[Test]
public void Update_should_update_the_email()
{
    // Act
    const string email = "marcus@marcusoft.net";
    int updated = Database.Default.Users.UpdateById(Id: 3, Email: email);

    // Assert
    updated.Should().Equal(1);
    string updatedEmail = Database.Default.Users.FindById(3).Email;
    updatedEmail.Should().Equal(email);
}

[Test]
public void Insert_should_insert_new_entry()
{
    // Arrange
    var db = Database.Default;
    var numberOfUsersBefore = db.Users.All().Count;

    dynamic newUser = new ExpandoObject();
    newUser.Id = 40;
    newUser.Email = "newemail@marcusoft.net";
    newUser.Password = "newpassword";

    // Act
    db.Users.Insert(newUser);

    // Assert
    var numberOfUsersAfter = db.Users.All().Count;
}
```

I used the `Database.Default` property which simply gives us the default database in the .config, or in our case just the database with the mock adapter. It’s just a shorthand for:

```csharp
var db = Database.Open();
db.Users.WhatEver;
```

## Using a repository

In the start of this post, I said that the Simple.Data helps to write less code. Maybe so that we don’t need to use a separate repository. But maybe you want to use one anyway. To be able to mock out the repository when you’re testing a class using the repository, for example.

Simple.Data actually helps us to test the repository as well, using the XmlMockAdapter. Here is a short example.

First my, very simple, repository:

```csharp
public interface IUserRepository
{
    IList<object> GetUsersNamedBob();
}

public class UserRepository : IUserRepository
{
    private readonly dynamic _database;

    public UserRepository()
    {
        _database = Database.Open();
    }

    public IList<object> GetUsersNamedBob()
    {
        return _database.Users.FindAllByName("Bob").ToList();
    }
}
```

Worth noting here might be that I am not sending anything in to this repository as a dependency, typically you don’t do that to a repository. I am simply using the `Database.Open()` method to create a private field, which I’m then using in my methods.

In my test code, I will then use the `MockHelper.UseMockAdapter` to ensure that the mock adapter will be used when I call the `Database` object. Here is my test code:

```csharp
[TestFixture]
public class RepositoryTests
{
    [TestFixtureSetUp]
    public void SetUp()
    {
        // Create a mock adapter with some suitable XML
        var mockAdapter = new XmlMockAdapter(
            @"<Root>
                <Users _keys=""Id"" Id=""System.Int32"" Key=""System.Guid"">
                    <User Id=""1"" Email=""foo"" Name=""Bob"" />
                    <User Id=""2"" Email=""bar"" Name=""Bobelina""/>
                    <User Id=""3"" Email=""baz"" Name=""Bob""/>
                    <User Id=""4"" Email=""baz"" Name=""Bobelina""/>
                 </Users>
               </Root>");

        // Set up the database to use our mock adapter
        MockHelper.UseMockAdapter(mockAdapter);
    }

    [Test]
    public void using_mock_adapter_in_a_repository()
    {
        // Arrange
        var repo = new UserRepository();

        // Act
        var result = repo.GetUsersNamedBob();

        // Assert
        Assert.AreEqual(2, result.Count);
    }
}
```

As you can see, this gives me the ability to test out the code in the repository.

## The future of mocking in Simple.Data

In the GitHub repository, there is a branch ([dict-query](https://github.com/markrendle/Simple.Data/tree/dict-query)) that contains something really interesting; an in-memory adapter for Simple.Data.

The things I’ve shown so far are nice but they require you to write (boring) Xml code. It might not be too bad but if we have an in-memory adapter you can simply insert the data you need using the standard Insert-methods of Simple.Data.

A test would then look something like this (peeking the source again):

```csharp
[Test]
public void InsertAndFindWithTwoColumnsShouldWork()
{
    // Arrange
    MockHelper.UseMockAdapter(new InMemoryAdapter());
    var db = Database.Open();

    // insert some users
    db.Users.Insert(Id: 1, Name: "Albert");
    db.Users.Insert(Id: 2, Name: "Marcus");
    db.Users.Insert(Id: 3, Name: "Gustav");
    db.Users.Insert(Id: 4, Name: "Arvid");

    // Act
    var numberOfRecords = db.Users.All().Count;
    Assert.AreEqual(4, numberOfRecords);

    var albert = db.Users.FindByIdAndName(1, "Albert");
    Assert.IsNotNull(albert);
    Assert.AreEqual(1, albert.Id);
    Assert.AreEqual("Albert", albert.Name);
}
```

From the name of the branch (dict-query) you can deduce how that’s implemented. It’s a Dictionary holding the tables and its rows. I actually took a stab of implementing it myself but when I saw that Mark had it in place already I thought I help him writing some documentation instead. This blog post is a start.

## Conclusion

I am very impressed that Mark Rendle has supplied a mocking possibility with Simple.Data. It gives us a way to mock out the absolutely lowest level of database interaction, giving us the possibilities to test the full stack of the application without having to pay the network or database interaction toll.

I hope you found this helpful.