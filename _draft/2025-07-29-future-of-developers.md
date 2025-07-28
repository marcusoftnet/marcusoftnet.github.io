---
layout: post
title: "The future of developers lies in specifications"
author: "Marcus Hammarberg"
date: 2025-06-12 04:00:00
tags:
 - Programming
 - AI
 - Life of a consultant
---

Developers have always written specs.

High level programming languages that we are using today are specs for a tool, compiler, to output byte code. The byte is the JIT-translated, by a virtual machine, into binary code. This code is then executed.

Very few developers cares about the byte code, or the binary. There are those that do, but they are exceedingly rare (25+ years in the industry I've met 0 and heard about 1 in a neighboring project).

But there was a time when all developers cared about binary code. Heck - even wrote assembly code (just a notch up from 0 and 1), back in the days.

Then we got better tools, that allowed us to express our intention terser and easier. We could do away with the mundane chores of keeping track of memory addresses and instead write a specification for our idea in high level programming language; like C#.

Now, this had some problems; like not knowing exactly how the IL/assembly code looked like. We ran into memory leeks that was considerably harder to understand since the generated code was ... well generated. We couldn't really control all aspects of it.

But we were still in control of the logic flow, that the program did the right thing in a reasonably correct way. We even created other programs, called tests, that verified that the code we wrote did the right thing. We could feed it some input and verify that the result was the as we expected.

Some of us wrote these test before we wrote the code, as it made writing the test easier and the production code testable. Also that meant that we created like a specification for our code. This snippet could be read by others and we could reason about it's validity - before the code was written even.

In some extreme cases, we took the roundabout way to write this specification in a language that could be read even by non-programmers, like Gherkin. With tools like Cucumber we could then automate running this plain-text specification and verify that our application worked as expected. Not seldom did we find logical inconsistencies and edge cases just by writing the Gherkin specification.

Time passed and generative AI started to write code for us. It was bound to happen as there was so much code out in the open. A lot of people had also handcrafted a lot of blog posts with opinions, best practices and ideas that the AI could use to hone their skill.

Some tools could generate entire applications from a simple prompt like "Build me a weather service app that I can run in the browser".

The AI was now doing the heavy lifting for us, writing the C# code (that gets compiled to byte code, that then is turned into machine code JIT) for us. But we still needed to care about the generated code, because in the beginning it was crappy and filled with problems. Especially the [agents started to do things for us that was not always good](https://aicodinghorrors.com/entire-database-is-deleted-cmdawnf93000t24yqw2k7hkf6/).

The weird thing was that we threw away the specification and only checked in the generated code. It was like we wrote the C#, compiled the code to byte-code and then checked in assembly.

Soon, however, we realized what this shift had entailed. Once again, developers have risen one step (or 7...) in the value chain. We were now specification authors that should care deeply about the input to the model that generates the C# code for us.

Interestingly enough it turns out that Gherkin was a good fit for this too. First it's human readable and all the reasons above applies. But Gherkin is also perfect for AIs to parse and understand, meaning that it was easy to both let the AI read and generate Gherkin for us (for all the edge cases etc). The Gherkin specifications could the further be used to drive out the implementation details and verify that the code did what was expected.

The value of a developer had now increased, since a developer needs to understand how to best prompt the AI and tweak the specification to get the desired result.

<!-- excerpt-end -->

