---
layout: post
title: UpdateModel, FormCollection and Unit Test
date: 2009-03-29T15:22:00.001Z
author: Marcus Hammarberg
tags:
  - ASP.NET MVC - Sprint Planner Helper
  - TDD
modified_time: 2009-03-30T19:42:08.943Z
blogger_id: tag:blogger.com,1999:blog-36533086.post-1434916614193180165
blogger_orig_url: http://www.marcusoft.net/2009/03/updatemodel-formcollection-and-unit_5466.html
---

I ran into some problems with an Action Controller method that accepted a `FormCollection`. Inside the method, I use `UpdateModel` to get the values from the form into the model class.

Here is a skeleton implementation of the method:

**UPDATED**
Some insightful [comments](https://www.blogger.com/comment.g?blogID=36533086&postID=1434916614193180165) by [Steve](http://openid.rowanbeach.com/steve) made me do some changes to this code. I have now updated it. The tip had to do with if the ValueProvider should be set on the Controller in the test or in the actual Action method. I finally opted for the latter and changed it into this (significant code in **bold**).

```csharp
[AcceptVerbs(HttpVerbs.Post)]
public ActionResult Create(FormCollection form)
{
    // Create ViewData
    ProductForm viewData = new ProductForm(new Product(), productOwnerRepository.Find().ToList());

    try
    {
        **UpdateModel(viewData, form.ToValueProvider());**

        // Get the product owner for the selected product-owner id
        viewData.Product.Owner = productOwnerRepository.GetById(viewData.SelectedOwnerID);

        // Add new product to the repository
        productRepository.Add(viewData.Product);
        productRepository.Save();

        // Go back to the list
        return RedirectToAction("Index");
    }
    catch
    {
        ModelState.AddRuleViolations(viewData.Product.GetRuleViolations());
        return View(viewData);
    }
}
```

This works great, but when I call this from my unit test, the values of my form (created in the unit test) are lost. I was very puzzled by this until I found [this post in the ASP.NET MVC forum](http://forums.asp.net/p/1377574/2901453.aspx#2901453).

So what that means is that, in the unit test case, you need to set the `ValueProvider` for the controller you’re testing to the test form collection you’re sending to the method. Otherwise, the Action Controller method will check the `Request` property, which will be empty in the test case. Not obvious maybe, but understandable when you think about it.

**UPDATED**
Just to be sure – note that the Action method is using an overloaded version of `UpdateModel` that makes sure that the sent-in form is used. I haven’t used the recommendation from the link above since I think it’s less readable/understandable. The main point is still valid though.

Here is a short sample that tests the action method above:

```csharp
[TestMethod]
public void CreateControllerActionCanTakeAFormCollectionWithProductDataAndAddItToTheRepository()
{
    var numberOfProductsBefore = productRepository.Find().Count();
    var form = CreateProductTestFormCollection();
    
    var result = productController.Create(form);
    
    Assert.IsNotNull(result);
    Assert.IsInstanceOfType(result, typeof(RedirectToRouteResult));
    var redirectResult = (RedirectToRouteResult)result;
    Assert.AreEqual("Index", redirectResult.RouteValues["action"]);
    Assert.AreEqual(numberOfProductsBefore + 1, productRepository.Find().Count());
}

private static FormCollection CreateProductTestFormCollection()
{
    FormCollection form = new FormCollection();
    form.Add("Product.Name", TESTFORM_NAME);
    form.Add("Product.Description", TESTFORM_DESCRIPTION);
    form.Add("SelectedOwnerID", TestData.TEST_PRODUCTOWNER_ID2.ToString());

    return form;
}
```
