---
layout: post
title: Snippet for creating test method in VB.NET
date: 2010-09-07T10:53:00.000Z
author: Marcus Hammarberg
tags:
  - VB.NET
  - TDD
modified_time: 2010-09-07T10:56:47.429Z
blogger_id: tag:blogger.com,1999:blog-36533086.post-8686879862246797209
blogger_orig_url: https://www.marcusoft.net/2010/09/snippet-for-creating-testmethod-in.html
---

I've already posted this [snippet in C#](https://www.marcusoft.net/2009/02/snippet-for-creating-testmethod-in-c.html), but as I from time to time need it in VB.NET I'll post that too. Here you go:

```xml
<?xml version="1.0" encoding="utf-8" ?>
<CodeSnippets xmlns="<http://schemas.microsoft.com/VisualStudio/2005/CodeSnippet">
    <CodeSnippet Format="1.0.0">
        <Header>
            <Title>TestMethod</Title>
            <Shortcut>tm</Shortcut>
            <Description>Code snippet for creating a test method</Description>
            <Author>Marcusoft (www.marcusoft.net)</Author>
            <SnippetTypes>
                <SnippetType>Expansion</SnippetType>
                <SnippetType>SurroundsWith</SnippetType>
            </SnippetTypes>
        </Header>
        <Snippet>
            <Declarations>
                <Literal>
                    <ID>methodName</ID>
                    <ToolTip>The name of the test</ToolTip>
                    <Default>methodName</Default>
                </Literal>
            </Declarations>
            <Code Language="VB">
              <![CDATA[<TestMethod()> _
              Public Sub should\_$methodName$()
        ' Arrange

        ' Act

        ' Assert
        Assert.Fail("Implement test!")
    End Sub]]>
            </Code>
        </Snippet>
    </CodeSnippet>
</CodeSnippets>
```
