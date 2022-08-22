---
layout: post
title: Snippet for creating testmethod in C#
date: 2009-02-08T21:10:00.001Z
author: Marcus Hammarberg
tags:
  - C#
  - TDD
modified_time: 2010-12-14T15:20:33.214Z
blogger_id: tag:blogger.com,1999:blog-36533086.post-8870376295653513270
blogger_orig_url: http://www.marcusoft.net/2009/02/snippet-for-creating-testmethod-in-c.html
---



Here is a short snippet that saves me a lot of time. It simply creates a
test method with the correct attributes and stuff. Simply but useful –
and now you don’t have to write it.
   <?xml version="1.0" encoding="utf-8" ?>
    <CodeSnippets  xmlns="http://schemas.microsoft.com/VisualStudio/2005/CodeSnippet">
        <CodeSnippet Format="1.0.0">
            <Header>
                <Title>TestMethod</Title>
                <Shortcut>tm</Shortcut>
                <Description>Code snippet for creating a testmethod</Description>
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
                <Code Language="csharp">
                  <![CDATA[<TestMethod()> _
                  public void should_$methodName$()
                 {
            // Arrange
           // Act
           // Assert
            Assert.Fail("Implement test");
        }]]>
                </Code>
            </Snippet>
        </CodeSnippet>
    </CodeSnippets>
