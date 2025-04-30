---
layout: post
title: "TDD for 9 year olds - an experiment in teaching my sons class"
author: "Marcus Hammarberg"
date: 2017-12-18 20:26:19
tags:
 - Agile
 - TDD
 - Programming
 - Marcus private
---

I had the opportunity to test my teaching skills to the max, as I got the question if I could come to my son Albert's class, to teach "some programming". I have taught TDD to kids before, [see this long video](https://www.youtube.com/watch?v=Ont8keNr08Y&t=1679s) for the result. But those kids were 3-4 years old.

Adding to the challenge was that this was my own sons class and I felt that I had to make him proud as well as fight a bit for being heard.

I took on the challenge and it went well, but I thought I'd share some of my preparation and experiences. A few people have asked me privately and I realize that this is a request that many of us in the IT business might get. If you read this you can avoid my problems at least.

<!-- excerpt-end -->

I've always thought that [Test Driven Development](https://en.wikipedia.org/wiki/Test-driven_development) suits young, experimental mind and their mindset particularly good and decided to have that as my topic for the class. By doing this we could also do a kata and hence have a little game with ourselves and the computer.

One of the simplest katas to get started and get is the [Fizz Buzz Kata](http://codingdojo.org/kata/FizzBuzz/) so I decided that it would be the scope of the day.

Finally, I decided to use JavaScript for several reasons: I know it, it's the worlds most spread language (which will impress the class, I hope) and it's a *real* language, as compared to Scratch, which is awesome but not used in the real world.

I then used my advantage of having an inside person, my son, readily available. Hence I tried stuff out on him. Which was lucky because I realize a few things:

* They've just started to do division, which is an integral part of the Fizz Buzz kata. For example, they just started to talk about division that leaves a rest. Got lucky on that part.
* Secondly I realize that typing is a real pain for kids. It took Albert ca 10 seconds to find certain keys, every time. Not surprisingly but that would not fly in the class as I had only 1 hour to spare
* Thirdly - I lost Albert about 10 minutes in as I hadn't installed the right tools ([Mocha](https://mochajs.org/) for example), created files and was fiddling around trying to get the tool up.

Therefore I spent about 2 hours setting my project up in a state that was a good starting point:

* Had all necessary files created (the test file and the production code)
* Had a command for continuously running tests, in the `package.json`-file `mocha *.js --watch -R list`)
* Had the editor open with
  * Test file to the left
  * Production code to the right
  * Results from tests showing in the integrated terminal
* Plenty of space in the file, to make all the noise (`import`-statements etc.) go away
* Had a good first failing test so that it was not something that didn't compile. In our case, the test was "1 should be 1", but returned an empty string. Pretty easy to fix.

[My code](https://github.com/marcusoftnet/abbe-skola) and the [starting point is found here](https://github.com/marcusoftnet/abbe-skola/tree/babbfb615f573d1778af40f162f46d8a4ad3cfd8). I wrote the test descriptions and some of the code in Swedish so that they easier could follow along. Sorry English speaking people.

I started the class by running the FizzBuzz game on the whiteboard. This showed the class how the game worked, got the involved and served as a nice specification for our code. They were rightly impressed when I ended the game by saying: "Let's teach my computer to do that".

I very quickly showed them the different parts (test, production code and the running of the tests) and when straight to the first failing test:`1 ska bli 1 expected 1, got ''`

I then asked the left half of the class if they could come up with how that could be fixed. They pretty fast got it and suggested that we change the empty string to 1.

Parenthesis here: I nearly got into trouble trying to explain the difference of the number 1 and the string with 1 in it… Beware! I got away by simply not saying much about it, but rather just move along to the next step.

I rewarded that part of the room by asking them for a suggestion of the next test. Lo and behold; they peeked at the specification on the whiteboard and suggested 2. So I just copied the first test and made the changes, the test runner ran and we got an error.

Now I turned to the other part of the class and asked them on suggestion on how to fix this test. That was a bit hard as we now really needed to understand the string/number difference. They first suggested to return "2", but when we did they saw that the first test failed and was bitterly disappointed. I nudged them to `.toString()` and off we went.

My idea was that we should be going back and forth but it failed after two rounds as they got very excited and shouted the results and guesses out. I rode the excitement wave instead of following my plan - I'm agile you know...

We got all the way up to 15 for individual numbers and then I was almost out of time. So I showed them the result test and production for counting between two numbers; 1 to 15 being the ultimate test.

But I found one final impresser that I kept to the finale. There's a nice little [npm package called say](http://npmjs.org/package/say), that speaks the string you sent it, using the computer built in speak capabilities. So I wrote the following line, sending the final FizzBuzz 1-15 string to the speak command:

```javascript
const say = require('say')
say.speak(fizzBuzz.mellanTal(1, 1))
```

How they laughed! Especially when we turned the speed up a bit and then sent it the result for 1-1000.

```javascript
say.speak(fizzBuzz.mellanTal(1, 10000), 'Samantha', 4)
```

## Summary

That was great fun and in the end, I think I reached my goal:

* getting them to think about programming
* showing them how test-driven development would work in practice
* showing a *real* programming language in action

I learned that:

* the starting point needs to be well prepared and rehearsed
* you need plenty of time if the kids are going to type, at least 2 hours for the exercise I had planned
* test driving the class on one or two kids before you go is really good to find the quirks
* this classroom did not have internet access. No installing stuff on the fly - everything needs to be in there at the start.

If you get this opportunity - go for it! It's great fun! I hope you find my experiences useful in that case.
