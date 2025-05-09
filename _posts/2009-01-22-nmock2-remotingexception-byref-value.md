---
layout: post
title: NMock2 RemotingException ByRef value type parameter cannot be null
date: 2009-01-22T07:56:00.001Z
author: Marcus Hammarberg
tags:
  - .NET
  - Agile
  - TDD
modified_time: 2012-08-12T07:30:52.050Z
blogger_id: tag:blogger.com,1999:blog-36533086.post-5118053612590653411
blogger_orig_url: https://www.marcusoft.net/2009/01/nmock2-remotingexception-byref-value.html
---

OK this might be the most misleading error message I've seen. I cannot decide on how to describe it... What this means... or what this try to ... Actually this happens when one of your mocked objects is mocking a method that returns something and your mocking doesn't return anything. Eeeh - that was quite tricky.

Got it? Here is an example:

When I mock this method:

```vb
Public Class FacadeObject 
     Function CreateSomeThing(ByVal aName As String) As Long
     End Function
End Class
```

by using the following code to do the mock

```vb
Expect.Once.On(m_mockadFacadeObject).Method("CreateSomeThing")
```

an exception of RemotingException (ByRef value type parameter cannot be null) will be thrown. Here is <a href="http://rhysc.blogspot.com/2008/04/nmock2-remotingexception.html" target="_blank">another description</a> that you might find easier to understand
