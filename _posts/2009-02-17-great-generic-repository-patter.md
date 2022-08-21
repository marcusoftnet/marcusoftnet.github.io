---
layout: post
title: Simple but useful generic repository pattern
date: '2009-02-16T22:44:00.001+01:00'
author: Marcus Hammarberg
tags: -
Tools - C# modified_time: '2010-12-14T16:22:38.205+01:00'
blogger_id: tag:blogger.com,1999:blog-36533086.post-7342434330790395493
blogger_orig_url: http://www.marcusoft.net/2009/02/great-generic-repository-patter.html
---


I have [pointed
here](http://blogs.hibernatingrhinos.com/nhibernate/archive/2008/10/08/the-repository-pattern.aspx)
several times before – but it’s so nice.

It’s an
[implementation](http://blogs.hibernatingrhinos.com/nhibernate/archive/2008/10/08/the-repository-pattern.aspx)
of the [Repository
Pattern](http://martinfowler.com/eaaCatalog/repository.html) using
generics, that will minimize your code in a very nice way. I am sure
that the FindAll can be refined into something very nice with
[LINQ](http://msdn.microsoft.com/en-us/library/bb308959.aspx), that
allows you to send a specification criteria or so.

Here is my implementation that uses a common interface (IBaseEntity) for
all my entities. It basically has an ID, so that the abstract
implementation can use it as a key:

> namespace Marcusoft.SprintPlannerHelper.Repositories
> {
>     /// \<summary\>
>     /// A generic repository interface that dictates all the methods
> that a repository should map to
>     /// \</summary\>
>     /// \<typeparam name="T"\>the type of the
> interface\</typeparam\>
>     public interface IRepository\<T\>  where T :IBaseEntity
>     {
>         T GetById(Guid id);
>         IList\<T\> FindAll();
>         void Add(T entity);
>         void Remove(T entity);
>     }
> }
>
>  

> public abstract class Repository\<T\> : IRepository\<T\> where T :
> IBaseEntity
> {
>     protected readonly Dictionary\<Guid, T\> dictionary = new
> Dictionary\<Guid, T\>();
>
>     \#region IRepository\<T\> Members 
>   
>     public T GetById(Guid id)
>     {
>         return dictionary\[id\];
>     }
>
>     public IList\<T\> FindAll()
>     {
>         return new List\<T\>(dictionary.Values);
>     }
>
>     public void Add(T entity)
>     {
>         dictionary.Add(entity.ID, entity);
>     }
>
>     public void Remove(T entity)
>     {
>         dictionary.Remove(entity.ID);
>     }
>
>     \#endregion
> }
>
>  

> public class ProductRepositoryFake: Repository\<Product\>,
> IProductRepository
> {
>     /// \<summary\>
>     /// Default constructor that fills the repository with some
> testdata
>     /// \</summary\>
>     public ProductRepositoryFake()
>     {
>         // Add the products from the testdata-class
>         foreach (var p in TestData.GetTestProductList())
>         {
>             dictionary.Add(p.ID, p);
>         }
>     }
> }

I implemented it and wrote this with Albert sleeping on my chest. Just
imagine if all programming sessions were so peaceful.
