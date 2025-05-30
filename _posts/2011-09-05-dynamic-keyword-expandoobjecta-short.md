---
layout: post
title: The dynamic keyword, ExpandoObject–a short intro for me
date: 2011-09-05T13:08:00.001Z
author: Marcus Hammarberg
tags:
  - Tools
  - .NET
modified_time: 2011-09-05T13:52:44.514Z
blogger_id: tag:blogger.com,1999:blog-36533086.post-8903492296720178197
blogger_orig_url: https://www.marcusoft.net/2011/09/dynamic-keyword-expandoobjecta-short.html
---

Right away – this blog post is mostly for me. I have not been dabbling enough with the “dynamic” keyword to say that I know it. This is what and how I understand it now.

So, if you care to read this… please be gentle with your comments. I love to see them and learn that I was wrong – I’m most certainly am.

#### dynamic keyword

Since .NET 4.0 we have a new keyword – [dynamic](http://msdn.microsoft.com/en-us/library/dd264741.aspx). If you read the [MSDN](http://msdn.microsoft.com/) documentation you’ll learn that:

> The dynamic type enables the operations in which it occurs to bypass compile-time type checking. Instead, these operations are resolved at run time.

Ok, but what useful is that? I mean you _could_ write this, you probably shouldn’t but you could:

```csharp
// Any object can be typed dynamic
// The dynamic keyword just means that
// the operations will be evaluated at runtime
dynamic s = "Marcus again";
Assert.AreEqual(s.Length, 12);
```

We now have a “dynamic” string. So the “s.Length” part compiles fine, but that’s actually just because the compile time checking is disabled. If I had written “s.StringLength” instead – that would also compile, but fail in runtime – since the string-class doesn’t implement a “StringLength” property.

Eeeh – so it’s a way to bypass the compiler and mess up?

I must admit that up to recently I hadn’t tried the dynamic keyword out and hence my thinking about it was here somewhere.

#### ExpandoObject using dynamic to add stuff at runtime

The first many of us (me that is) hear about is the mystically named [ExpandoObject](http://msdn.microsoft.com/en-us/library/system.dynamic.expandoobject.aspx). You can add property or method you like to the ExpandoObject – and it just works. So, yes it’s a bit mystical. Let’s see it in action:

```csharp
dynamic de = new ExpandoObject();
de.Name = "Marcus";
de.Age = 39;
de.GetBirthCertificate =
    new Func<DateTime, string>(now =>
                     de.Name + " was born " + (now.Year - de.Age));
Assert.AreEqual("Marcus was born 1972", de.GetBirthCertificate(DateTime.Now));
```

Yes – it’s super easy to add properties for Name and Age and then use them in a dynamic function that is defined by a lambda expression and use the dynamic variables. Even though those properties doesn’t exists on the ExpandoObject it compiles (since the variable is dynamic the compiler checking is disabled, remember) and works fine when we run it.

But how on earth can that work?

#### DynamicObject

Also included in the 4.0 release were a couple of classes that take full advantage of the dynamic keyword. They inherit from [DynamicObject](http://msdn.microsoft.com/en-us/library/system.dynamic.dynamicobject.aspx) (some way or another) and it’s used as a base class for specifying dynamic behavior at runtime.

On the DynamicObject is a couple of interesting methods that you can override, for example TryGetMember, TrySetMember and TryInvokeMember. These method are run when a dynamic property is accessed and you can gracefully handle the non-existing member.

In the case of ExpandoObject it internally holds a IDictionary<string, object> that simply stores the name of the property as the key and the value as ... well … the value.

Actually it’s not too hard to implement. Here’s a rudimentary implementation for properties only:

```csharp
[TestFixture]
public class MarcusExpandoTests
{
    [Test]
    public void should_be_able_to_use_marcus_expando()
    {
        // My own Expando...
        // Oh how close I was to name it MarcusSpandex
        dynamic m = new MarcusExpando();
        m.Name = "Marcus";
        m.Age = 39;
        Assert.AreEqual("Marcus is 39 old. My God!",
            string.Format("{0} is {1} old. My God!", m.Name, m.Age));
    }
}

public class MarcusExpando : DynamicObject
{
    private readonly IDictionary<string, object> _dic =
                      new Dictionary<string, object>();

    public override bool TrySetMember(SetMemberBinder binder,
                                      object value)
    {
        if (!_dic.ContainsKey(binder.Name))
            _dic.Add(binder.Name, value);
        else
            _dic[binder.Name] = value;

        return true;
    }

    public override bool TryGetMember(GetMemberBinder binder,
                                      out object result)
    {
        result = _dic[binder.Name];
        return true;
    }
}
```

If you check row 21 you’ll see how I override the methods TrySetMember. Then I can pickup the name of the dynamic property the developer used and store it, with the value, in a dictionary.

On row 31 it’s easy to override TryGetMember and retrieve the value from the dictionary.

#### So how can this be flexed

Well, there’s a million ways to use this, but to water your appetite check out [Simple.Data](https://github.com/markrendle/Simple.Data/wiki/Finding-data). It’s a data access tool that uses dynamic to the full. Here’s an example:

```csharp
IEnumerable<User> u = Database
        .Users
        .FindByAllByName("Bob")
        .Cast<User>();
```

It looks like magic but now we can understand it. Ok – this is how I understand it without reading the source.

1. Database is the base object in Simple.Data. It inherits from DynamicObject and hence can use TryGet/SetMember and other methods for doing dynamic operations
2. When the user writes “.Users” Simple.Data stores that name to be used as the table name in the query we’re about to construct. So there is a table in the database called “Users”…
3. “.FindAllByName(“Bob”)” – this will again be picked up by TryGetMember and we can parse out the “FindAllBy” and “Name” part of the method name and the “Bob” argument.
4. Finally we cast the result to a IEnumerable of the concrete User class. So that’s simply going to a concrete implementation, filling out the User class with the columns returned by the query.

All in all we now have the parts to construct this query:

```sql
SELECT * FROM Users
WHERE Name = 'Bob'
```

Neat – right?

#### Conclusion

The right use of the dynamic keyword can significantly shorten your code. It take some time to get used to and fully understand (I’m there yet) and I think that care need to be taken on where you use it. But in the right places – and with the right introduction to the rest of the team – it’s very useful.

I hope that I wasn’t the only one that got anything from this. But if so … I’m now happy that I understand and can use the dynamic keyword.
