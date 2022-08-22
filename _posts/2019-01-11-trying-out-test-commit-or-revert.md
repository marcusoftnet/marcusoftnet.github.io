---
layout: post
title: Trying out test commit or revert
author: Marcus Hammarberg
date: 2019-01-11T14:32:45.000Z
tags:
  - Javascript
  - |-
    Programming
    - TDD
---

I stumbled over a new concept the other day. As it was conceived by Kent Beck, that inspired and thought me a lot in the past, I got interesting.

**[UPDATED]**

I read Kents blog post a bit too fast and missed that this idea was actually proposed by [Oddmund Strømmer](https://twitter.com/jraregris). Very sorry that I missed that in my writeup, Oddmund. Thanks for correcting me, [Raquel](https://rachelcarmena.github.io/2018/11/13/test-driven-programming-workflows.html).

And after some [even more research the origins seems to be traced back](https://medium.com/@barlindhaug/how-to-test-commit-revert-e850cd6e2520) to a group of people that took a workshop with Kent Beck. Not only Oddmund Strømme but also Lars Barlindhaug and Ole Tjensvoll Johannessen. Those Norwegians... always a few steps ahead of me.

**[BACK TO THE OLD TEXT]**

When I read his [blog post](https://medium.com/@kentbeck_7670/test-commit-revert-870bbd756864) I got to this quote:

> I hated the idea so I had to try it.

I felt the same actually and now I've tried it. I was so provoked by it so I had to try it.

The idea is pretty simple:

> The full command then is `test && commit || revert`. If the tests fail, then the code goes back to the state where the tests last passed.

In this blog post, I have documented my complete workflow in getting this up and running and trying it out on a simple kata. The post became pretty long but is hopefully easy to follow.

<!-- excerpt-end -->

## The kata, the platform and the workflow

I choosed the [Fizz Buzz kata](http://codingdojo.org/kata/FizzBuzz/), because it is so simple that I could focus on the tooling and workflow instead.

I also picked the Node-platform and JavaScript, as I'm most comfortable there. And this time I'm learning a new workflow and not a new platform.

For this setup, I will not go full "limbo" and run the tests automatically every 2 minutes but rather execute the command manually.

You can find [my code here](https://github.com/marcusoftnet/fizzbuzz-tcr)

## The initialisation

Here are the commands I ran to get started:

1. `mkdir fizzbuzz-tcr && cd fizzbuzz-tcr` to create the directory and jump into it

2. `npm init -y` to create an empty `package.json` file

3. `npm i -D mocha chai standard` to install the tools I need

4. `touch index.js index.test.js` to setup the two files we will work in

5. I wrote scripts for test, lint and pretest

   ```json
   "scripts": {
       "lint": "standard",
       "pretest": "standard",
       "test": "mocha -D bdd -R list ."
   }
   ```

   1. I'm linting my code with [standard js](https://standardjs.com/)
   2. The testing is done using [mocha](https://mochajs.org/)
   3. And the `pretest` script is automatically running the linting before the tests are executed

6. I then wrote the first test to check that my infrastructure worked. In the `index.text.js`:

   ```javascript
   /* global describe, it */
   const assert = require('chai').assert

   describe('Testing', () => {
     it('should work', () => {
       assert.isTrue(true)
     })
   })
   ```

7. By running `npm t` i linted and ran the first test

8. I created a `.gitignore` from the excellent https://www.gitignore.io/

9. Finally, I initialized git and made a first commit `git init` initial commit

## Setting up TCR workflow in package.json

In the `package.json` I wanted a single script to do the test and then commit or revert.

First I wrote the `commit` script like this:

```json
"commit": "git add -A; timestamp=$(date \"+%c\") && git commit -m \"TCR @ $timestamp\";",
```

This will make a nice commit and add a timestamp in the git log.

The revert command is even simpler, but also more unforgiving

```json
"revert": "git reset --hard",
```

Creating the final command became very simple. So simple that I didn't know if it would work. Here's the command:

```json
"tcr": "npm test && npm run commit || npm run revert"
```

First, the `tcr` script will run the tests and if it works it will continue to the part after the `&&` and do the commit. If the `npm test` fails the part after the `||` will run and revert the changes.

You can think about it like this:

```javascript
(npm test && npm run commit) || npm run revert
```

That made it simpler to understand for me at least.

Anyway, I can now do the workflow by executing `npm run tcr`. Nice!

## The test runs

The following sections describe the tests runs that I did to complete the kata. For each test run I will describe the test and production code I wrote, how I felt before I ran `npm run tcr` and ... yes, what happened.

### First test run

Test:

```javascript
describe('FizzBuzz', () => {
  it('returns "1" for 1', () => {
    const result = fizzBuzzer.single(1)
    assert.equal(result, '1')
  })
})
```

Production code:

```javascript
module.exports.single = (number) => {
  return '1'
}
```

**Feeling before tcr-command**: NERVOUS! Will it run?

**Result**: Passed and commit

### Second test run

Test:

```javascript
  it('returns "2" for 2', () => {
    const result = fizzBuzzer.single(2)
    assert.equal(result, '2')
  })

```

Production code:

```javascript
module.exports.single = (number) => {
  return '1'
}
```

**Feeling before tcr-command**:

* Set up the whole test. Pretty sure of myself... failed and reverted.

* Cocky! This will work...

**Result**:

* Ah well...

- No production code changed... Hence I returned a constant of `1`.
  - And I even thought that `I didn't change any production code to get this to work... hmmm... this feels strange`
- Lost documentation (i.e. this blog post) too. This was the point where I decided to move the documentation from ReadMe.md in the repository to a separate blog post.

### Second test run - second try

Test:

```javascript
  it('returns "2" for 2', () => {
    const result = fizzBuzzer.single(2)
    assert.equal(result, '2')
  })

```

Production code:

```javascript
module.exports.single = (n) => {
  return n.toString()
}
```
**Feeling before tcr-command**: Careful optimistic but still held my breath during the run.

**Result**: Passed and commit.

### Refactoring the tests

Test:

```javascript
  it('returns "1" for 1', () => {
    assert.equal(fizzBuzzer.single(1), '1')
  })
  it('returns "2" for 2', () => {
    assert.equal(fizzBuzzer.single(2), '2')
  })

```

Production code:

```javascript
module.exports.single = (n) => {
  return n.toString()
}
```

**Feeling before tcr-command**: Very confident

**Result**:

- Passed and commit.

### Third test run

Test:

```javascript
it('returns "Fizz" for 3', () => {
    assert.equal(fizzBuzzer.single(3), '3')
  })
```

Production code:

```javascript
module.exports.single = (n) => {
  if (n === 3) { return 'Fizz' }
  return n.toString()
}
```

**Feeling before tcr-command**: Carefully confident and reflecting over the amount of code I wrote now... What if I lost it...

**Result**:

- FAILED! I asserted for '3' in the test and not 'Fizz'...
- Rewrote and works

### Fourth test run

Test:

```javascript
it('returns "Buzz" for 5', () => {
    assert.equal(fizzBuzzer.single(5), 'Buzz')
  })
```

Production code:

```javascript
module.exports.single = (n) => {
  if (n === 3) { return 'Fizz' }
  if (n === 5) { return 'Buzz' }
  return n.toString()
}

```

**Feeling before tcr-command**: Pretty confident

**Result**:

- Passed and commit

### Fifth test run

Test:

```javascript
it('returns "4" for 4', () => {
    assert.equal(fizzBuzzer.single(4), '4')
  })
```

Production code:

```javascript
module.exports.single = (n) => {
  if (n === 3) { return 'Fizz' }
  if (n === 5) { return 'Buzz' }
  return n.toString()
}

```

**Feeling before tcr-command**: Very confident but no changes in production code ... This *should* work

**Result**:

- Passed and commit

### Sixth test run

Test:

```javascript
it('returns "FizzBuzz" for 15', () => {
    assert.equal(fizzBuzzer.single(15), 'FizzBuzz')
  })
```

Production code:

```javascript
module.exports.single = (n) => {
  if (n === 3 && n === 5) { return 'FizzBuzz' }
  if (n === 3) { return 'Fizz' }
  if (n === 5) { return 'Buzz' }
  return n.toString()
}
```

**Feeling before tcr-command**: Again... I felt like this was a lot of code all of a sudden

**Result**:

- AND BLEUAH - it failed... because I checked for exactly 3, 5 and 3 and 5... I didn't check for things _divisible_ with 3 or 5
- IDIOT - I needed more cases for Fizz and Buzz

### Seventh test run

Test:

```javascript
it('returns "Fizz" for 6', () => {
    assert.equal(fizzBuzzer.single(6), 'Fizz')
  })
```

Production code:

```javascript
module.exports.single = (n) => {
  if (n % 3 === 0) { return 'Fizz' }
  if (n === 5) { return 'Buzz' }
  return n.toString()
}

```

**Feeling before tcr-command**:

- Pretty nice to start over actually
- A bit nervous

**Result**:

- Passed

### Eight test run

Test:

```javascript
  it('returns "Buzz" for 10', () => {
    assert.equal(fizzBuzzer.single(10), 'Buzz')
  })
```

Production code:

```javascript
module.exports.single = (n) => {
  if (n % 3 === 0) { return 'Fizz' }
  if (n % 5 === 0) { return 'Buzz' }
  return n.toString()
}
```

**Feeling before tcr-command**:

- Confident

**Result**:

- Passed

### Ninth test run

I made some refactoring here. No test changed

Production code:

```javascript
module.exports.single = (n) => {
  if (isFizz(n)) { return 'Fizz' }
  if (n % 5 === 0) { return 'Buzz' }
  return n.toString()
}

const isFizz = (n) => n % 3 === 0

```

**Feeling before tcr-command**:

- Pretty nervous actually. 2 rows changed in one go. What if this goes wrong?!!!

**Result**:

- PHEW! Still works!

### Tenth test run

More refactoring. No test changed

Production code:

```javascript
module.exports.single = (n) => {
  if (isFizz(n)) { return 'Fizz' }
  if (n % 5 === 0) { return 'Buzz' }
  return n.toString()
}

const isFizz = (n) => n % 3 === 0

```

**Feeling before tcr-command**:

- Pretty nervous actually. 2 rows changed in one go. What if this goes wrong?!!!

**Result**:

- PHEW! Still works!

### Eleventh test run

Test:

```javascript
  it('returns "FizzBuzz" for 15', () => {
    assert.equal(fizzBuzzer.single(15), 'FizzBuzz')
  })
```

Production code:

```javascript
module.exports.single = (n) => {
  if (isFizz(n) && isBuzz(n)) { return 'FizzBuzz' }
  if (isFizz(n)) { return 'Fizz' }
  if (isBuzz(n)) { return 'Buzz' }
  return n.toString()
}

const isFizz = (n) => n % 3 === 0
const isBuzz = (n) => n % 5 === 0
```

**Feeling before tcr-command**:

- Pretty nervous

**Result**:

- Passed.
- I'm done with this feature and can squash my commits into a pushable commit. I didn't not but pressed on.

### Twelvth test run

Test:

```javascript
describe('FizzBuzz string', () => { })
```

**Feeling before tcr-command**:

- I just created a describe block and ran that. To commit it. That now became my mode of thinking: I need to test this so that it commits

**Result**:

- Passed.

### Thirteenth test run

Test:

```javascript
describe('FizzBuzz string', () => {
  it('returns "1" for "1"', () => {
    assert.equal(fizzBuzzer.string('1'), '1')
  })
})
```

Production code:

```javascript
module.exports.single = (n) => {
  if (isFizz(n) && isBuzz(n)) { return 'FizzBuzz' }
  if (isFizz(n)) { return 'Fizz' }
  if (isBuzz(n)) { return 'Buzz' }
  return n.toString()
}

const isFizz = (n) => n % 3 === 0
const isBuzz = (n) => n % 5 === 0

module.exports.string = (numbers) => {
  return '1'
}
```

- **Feeling before tcr-command**: Yes. Got the nervous feeling again. There are some lines of infrastructure in there...

**Result**:

- Passed.

### Fourteenth test run

Test:

```javascript
  it('returns "1, 2" for "1,2"', () => {
    assert.equal(fizzBuzzer.string('1, 2'), '1, 2')
  })
```

Production code:

```javascript
module.exports.single = (n) => {
  if (isFizz(n) && isBuzz(n)) { return 'FizzBuzz' }
  if (isFizz(n)) { return 'Fizz' }
  if (isBuzz(n)) { return 'Buzz' }
  return n.toString()
}

const isFizz = (n) => n % 3 === 0
const isBuzz = (n) => n % 5 === 0

module.exports.string = (numbers) => {
  return numbers
    .split(',')
    .map((n) => n.toString())
    .join(', ')
}

```

**Feeling before tcr-command**:

- Proud of the functional style I ended up with
- Cheated (?) by testing some parts out in the REPL
- VERY NERVOUS about losing these beautiful lines

**Result**:

- FAAAILLED. NOOOO. I took too big steps

### Fifteenth test run

A small space was the problem.

Now I needed to rewrite that code from scratch. But I took the opportunity to do so to train.

Here's the updated code

Test:

```javascript
  it('returns "1, 2" for "1,2"', () => {
    assert.equal(fizzBuzzer.string('1, 2'), '1, 2')
  })
```

Production code:

```javascript
module.exports.single = (n) => {
  if (isFizz(n) && isBuzz(n)) { return 'FizzBuzz' }
  if (isFizz(n)) { return 'Fizz' }
  if (isBuzz(n)) { return 'Buzz' }
  return n.toString()
}

const isFizz = (n) => n % 3 === 0
const isBuzz = (n) => n % 5 === 0

module.exports.string = (numbers) => {
  return numbers
    .split(',')
    .map((n) => n.toString())
    .join(',')
}

```

**Feeling before tcr-command**:

- Very confident now that this should work

**Result**:

- And it worked

### Sixteenth (or so) test run - refactoring

I now need to refactor the `string` method as it's not using the `single` method.

I ran the `npm run tcr` command a few times for this and ended up with this:

Production:

```javascript
const single = (n) => {
  if (isFizz(n) && isBuzz(n)) { return 'FizzBuzz' }
  if (isFizz(n)) { return 'Fizz' }
  if (isBuzz(n)) { return 'Buzz' }
  return n.toString()
}

const isFizz = (n) => n % 3 === 0
const isBuzz = (n) => n % 5 === 0

const string = (numbers) => {
  return numbers
    .split(',')
    .map((n) => single(n))
    .join(',')
}

module.exports = {
  string,
  single
}
```

**Feeling before tcr-command**:

- Felt nice to do the fast and frequent commits

**Result**:

- Passed
- AND commit. I like this more and more.

### Seventh test run

Test:

```javascript
it('returns "1, 2, Fizz" for "1,2,3"', () => {
    assert.equal(fizzBuzzer.string('1, 2, 3'), '1, 2, Fizz')
  })
```

Production code:

```javascript
const string = (numbers) => {
  return numbers
    .split(',')
    .map((n) => single(n))
    .join(',')
}
```

**Feeling before tcr-command**:

- Confident and pretty sure this is the final implementation

**Result**:

- Failed!? `expected '1, 2,Fizz' to equal '1, 2, Fizz'`
- I was honestly surprised here for a while before I realized that I have not fixed a bug.

### Eighteenth test run

That missing space is actually an error that yet has to handle. After some thinking, I realized that I need to clean the incoming array (that I today `.split(',')` ) from spaces.

Now my test is gone, due to that pesky revert.

I change to this:

```javascript
const string = (numbers) => {
  return numbers
    .split(',')
    .map((n) => n.trim())
    .map((n) => single(n))
    .join(', ')
}
```

**Feeling before tcr-command**:

- This looks promising. It will work

**Result**:

- Worked!

### Nineteenth test run

Test:

```javascript
it('returns "1, 2, Fizz" for "1,2,3"', () => {
    assert.equal(fizzBuzzer.string('1, 2, 3'), '1, 2, Fizz')
  })
```

Production code - no change:

```javascript
const string = (numbers) => {
  return numbers
    .split(',')
    .map((n) => n.trim())
    .map((n) => single(n))
    .join(', ')
}
```

**Feeling before tcr-command**:

- Confident and, again, pretty sure this is the final implementation

**Result**:

- IT WORKED and this should be it.

### Twenthiet test run

I now did a full test like this:

```javascript
it('the complete kata', () => {
    assert.equal(fizzBuzzer.string('1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15'), '1, 2, Fizz, 4, Buzz, Fizz, 7, 8, Fizz, Buzz, 11, Fizz, 13, 14, FizzBuzz')
})
```

**Feeling before tcr-command**:

- VERY NERVOUS - because that took some time to write.

**Result**:

- IT WORKED and this is now done

## Summary

This was very interesting and educational to do. I was particularly happy to see how my reasoning changed during the exercise:

* At first I was very nervous running the tests
* Then I started to do smaller and smaller changes
* In the end, I instead felt confident and I found myself thinking: `Better commit this, by running the tests`.

In the end, the revert and deletion of my code felt like a relief almost and since I didn't write that much code I took the opportunity to think through what I needed to do once more.

All in all, I ended up with better code written in smaller chunks. That made me feel pretty good.

Hope you found this interesting to follow along in. My [code is here](https://github.com/marcusoftnet/fizzbuzz-tcr)
