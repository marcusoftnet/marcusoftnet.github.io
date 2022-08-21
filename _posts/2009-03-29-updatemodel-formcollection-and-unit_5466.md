---
layout: post
title: UpdateModel, FormCollection and unit test
date: '2009-03-29T17:22:00.001+02:00'
author: Marcus Hammarberg
tags:
  - ASP.NET MVC - Sprint Planner Helper - TDD
modified_time: '2009-03-30T21:42:08.943+02:00'
blogger_id: tag:blogger.com,1999:blog-36533086.post-1434916614193180165
blogger_orig_url: http://www.marcusoft.net/2009/03/updatemodel-formcollection-and-unit_5466.html
---


I ran into some problems with a Action Controller method that accepted
an FormCollection. Inside the method I use UpdateModel to get the values
from the form into the model-class.

Here is a skeleton implementation of the method:

**\[UPDATED\]
**Some insightful <a
href="https://www.blogger.com/comment.g?blogID=36533086&amp;postID=1434916614193180165"
target="_blank">comments</a> by
<a href="http://openid.rowanbeach.com/steve" target="_blank">Steve</a>
made me do some changes to this code. I have now updated it. The tip had
to do with if the ValueProvider should be set on the Controller in the
test or in the actual Action-method. I finally opted for the latter and
changed it into this (significant code in **bold**).

> <div
> style="font-size: 10pt; background: white; color: black; font-family: courier new">
>
> \[<span style="color: #2b91af">AcceptVerbs</span>(<span
> style="color: #2b91af">HttpVerbs</span>.Post)\]       
>
>         <span style="color: blue">public</span> <span
> style="color: #2b91af">ActionResult</span> Create(<span
> style="color: #2b91af">FormCollection</span> form)       
>
>         {           
>
>             <span style="color: green">// Create ViewData           
> </span>
>
>             <span style="color: #2b91af">ProductForm</span> viewData =
> <span style="color: blue">new</span> <span
> style="color: #2b91af">ProductForm</span>(<span
> style="color: blue">new</span> <span
> style="color: #2b91af">Product</span>(),
> productOwnerRepository.Find().ToList());
>
>  
>
>             <span style="color: blue">try</span>           
>
>             {               
>
>                 **UpdateModel(viewData,
> form.ToValueProvider());**               
>
>  
>
>                 <span style="color: green">// Get the productowner for
> the selected product-owner id</span>
>
>                 viewData.Product.Owner =
> productOwnerRepository.GetById(viewData.SelectedOwnerID);               
>
>  
>
>                 <span style="color: green">// add new product to the
> repository                </span>
>
>                
> productRepository.Add(viewData.Product);               
>
>                 productRepository.Save();               
>
>  
>
>                 <span style="color: green">// Go back to the
> list                </span>
>
>                 <span style="color: blue">return</span>
> RedirectToAction(<span
> style="color: #a31515">"Index"</span>);           
>
>             }           
>
>             <span style="color: blue">catch</span>
>
>             {
>
>                
> ModelState.AddRuleViolations(viewData.Product.GetRuleViolations());
>
>                 <span style="color: blue">return</span>
> View(viewData);
>
>             }       
>
>         }
>
> </div>

This works great but when I call this from my unit test the the values
of my form (created in the unit test) is lost. I was very puzzled by
this until I found
<a href="http://forums.asp.net/p/1377574/2901453.aspx#2901453"
target="_blank">this post in the asp.net mvc forum</a>.

So what that means is that you’ll, in the unit test case, need set the
ValueProvider, for the controller you’re testing, to the test form
collection you’re sending to the method. Otherwise the Action Controller
method will check the Request-property and that will be empty in the
test case. Not obvious maybe but understandable when you think about it.

**\[UPDATED\]
**Just to be sure – note that the Action-method is using an overloaded
version of the UpdateModel that makes sure that the sent-in form is
used. I haven’t used the recommendation from the link above since I
think it’s less readable/understandable.
The main point are still valid though.

Here is a short sample that test the action method above.

> <div
> style="font-size: 10pt; background: white; color: black; font-family: courier new">
>
>         \[<span style="color: #2b91af">TestMethod</span>\]
>
>         <span style="color: blue">public</span> <span
> style="color: blue">void</span>
> createControllerActionCanTakeAFormCollectionWithProductDataAndAddItToTheRepository()
>
>         {
>
>             <span style="color: blue">var</span>
> numberOfProductsBefore = productRepository.Find().Count();
>
>             <span style="color: blue">var</span> form =
> CreateProductTestFormCollection();
>
>  
>
>             
>
>             <span style="color: blue">var</span> result =
> productController.Create(form);
>
>  
>
>             <span
> style="color: #2b91af">Assert</span>.IsNotNull(result);
>
>             <span
> style="color: #2b91af">Assert</span>.IsInstanceOfType(result, <span
> style="color: blue">typeof</span>(<span
> style="color: #2b91af">RedirectToRouteResult</span>));
>
>             <span style="color: blue">var</span> redirectResult =
> (<span style="color: #2b91af">RedirectToRouteResult</span>)result;
>
>             <span style="color: #2b91af">Assert</span>.AreEqual(<span
> style="color: #a31515">"Index"</span>,
> redirectResult.RouteValues\[<span
> style="color: #a31515">"action"</span>\]);
>
>  
>
>             <span
> style="color: #2b91af">Assert</span>.AreEqual(numberOfProductsBefore +
> 1, productRepository.Find().Count());
>
>         }
>
>  
>
>         <span style="color: blue">private</span> <span
> style="color: blue">static</span> <span
> style="color: #2b91af">FormCollection</span>
> CreateProductTestFormCollection()
>
>         {
>
>             <span style="color: #2b91af">FormCollection</span> form =
> <span style="color: blue">new</span> <span
> style="color: #2b91af">FormCollection</span>();
>
>             form.Add(<span
> style="color: #a31515">"Product.Name"</span>, TESTFORM_NAME);
>
>             form.Add(<span
> style="color: #a31515">"Product.Description"</span>,
> TESTFORM_DESCRIPTION);
>
>             form.Add(<span
> style="color: #a31515">"SelectedOwnerID"</span>, <span
> style="color: #2b91af">TestData</span>.TEST_PRODUCTOWNER_ID2.ToString());
>
>  
>
>             <span style="color: blue">return</span> form;
>
>         }
>
> </div>
