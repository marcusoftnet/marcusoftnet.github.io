---
layout: post
title: "Trying out TCR (test commit or revert) - updated"
author: "Marcus Hammarberg"
date: 2025-10-29 04:00:00
tags:
  - Javascript
  - Typescript
  - Programming
  - TDD
---

A long time ago I wrote a [blog post on TCR](https://www.marcusoft.net/2019/01/trying-out-test-commit-or-revert.html), just now it came up again. I showed them the old blog post but realized that it was very outdated and wanted to update it to a modern stack.

Read the [original post](https://www.marcusoft.net/2019/01/trying-out-test-commit-or-revert.html) to understand what this about. You can find [my code here](https://github.com/marcusoftnet/fizzbuzz-tcr-ts)
<!-- excerpt-end -->

## The initialization

Here are the commands I ran to get started:

1. `mkdir fizzbuzz-tcr-ts && cd fizzbuzz-tcr-ts` to create the directory and jump into it
1. `npm init -y` to create an empty `package.json` file
1. `npm i -D typescript vitest` to install the tools I need
1. `touch index.ts index.test.ts` to setup the two files we will work in
1. `npx scradd test "vitest run"` to add a test script
1. I then wrote the first test to check that my infrastructure worked. In the `index.text.ts`:

    ```typescript
    import { describe, it, expect } from "vitest";
    describe("Testing", () => {
      it("should work", () => {
        expect(true).toBe(true)
      });
    });
    ```

1. `npm t` - I ran the first test
1. `npx gitignore node` - I created a `.gitignore` from the excellent <https://www.gitignore.io/>
1. `git init . && git add . && git commit -m "Initial commit"` Finally, I initialized git and made a first commit initial commit

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

```bash
(npm test && npm run commit) || npm run revert
```

That made it simpler to understand for me at least.

Anyway, I can now do the workflow by executing `npm run tcr`. Nice!

## The test runs

The following sections describe the tests runs that I did to complete the kata. For each test run I will describe the test and production code I wrote, how I felt before I ran `npm run tcr` and ... yes, what happened.

I did not enable auto-run of this command on every save. This is of course possible, but I think it take some of the thoughtfulness out of the process and just make it stressful. TCR is about, and forces you to, thinking carefully about the next step - not going fast.

### First test run

Test:

```typescript
import { describe, it, expect } from "vitest";
import { single } from ".";

describe("FizzBuzz single number", () => {
  it('returns "1" for 1', () => {
    const result = single(1);
    expect(result).toBe("1");
  });
});
```

Production code:

```typescript
export const single = (n: number): string => {
  return "1";
};
```

**Feeling before tcr-command**: NERVOUS! Will it run?

**Result**: Passed and commit

### Second test run

Test:

```typescript
it('returns "2" for 2', () => {
  const result = fizzBuzzer.single(2);
  assert.equal(result, "2");
});
```

Production code:

```typescript
export const single = (n: number): string => {
  return "1";
};
```

**Feeling before tcr-command**:

- Set up the whole test. Pretty sure of myself... failed and reverted.

- Cocky! This will work...

**Result**:

- Ah well...It failed and my changes was gone.

- No production code changed... Hence I returned a constant of `1`.
  - And I even thought that `I didn't change any production code to get this to work... hmmm... this feels strange`
- Lost documentation (i.e. this blog post) too. This was the point where I decided to move the documentation from ReadMe.md in the repository to a separate blog post.

### Second test run - second try

Test:

```typescript
it('returns "2" for 2', () => {
  const result = fizzBuzzer.single(2);
  assert.equal(result, "2");
});
```

Production code:

```typescript
export const single = (n: number): string => {
  return n.toString();
};
```

**Feeling before tcr-command**: Careful optimistic but still held my breath during the run.

**Result**: Passed and commit.

### Refactoring the tests

Test:

```typescript
const assertSingle = (input: number, expected: string) => {
  expect(single(input)).toBe(expected);
};

it('returns "1" for 1', () => assertSingle(1, "1"));
it('returns "2" for 2', () => assertSingle(2, "2"));
```

Production code:

```typescript
module.exports.single = (n) => {
  return n.toString();
};
```

**Feeling before tcr-command**: Very confident

**Result**:

- Passed and commit.

### Third test run

Test:

```typescript
it('returns "Fizz" for 3', () => assertSingle(3, "3"));
```

Production code:

```typescript
export const single = (n: number): string => {
  if(n === 3) return "Fizz";
  return n.toString();
};
```

**Feeling before tcr-command**: Carefully confident and reflecting over the amount of code I wrote now... What if I lost it...

**Result**:

- FAILED! I asserted for '3' in the test and not 'Fizz'...
- Rewrote and works

### Fourth test run

Test:

```typescript
it('returns "Fizz" for 3', () => assertSingle(3, "Fizz"));
```

Production code:

```typescript
export const single = (n: number): string => {
  if(n === 3) return "Fizz";
  return n.toString();
};
```

**Feeling before tcr-command**: Pretty confident

**Result**:

- Passed and commit

### Fifth test run

Test:

```typescript
it('returns "Buzz" for 5', () => assertSingle(5, "Buzz"));
```

Production code:

```typescript
export const single = (n: number): string => {
  if(n === 5) return "Buzz";
  if(n === 3) return "Fizz";
  return n.toString();
};
```

**Feeling before tcr-command**: Very confident but no changes in production code ... This _should_ work

**Result**:

- Passed and commit

### Sixth test run

Test:

```typescript
it('returns "FizzBuzz" for 15', () => assertSingle(15, "FizzBuzz"));
```

Production code:

```typescript
export const single = (n: number): string => {
  if (n === 3 && n === 5) return "FizzBuzz";
  if (n === 5) return "Buzz";
  if (n === 3) return "Fizz";
  return n.toString();
};

```

**Feeling before tcr-command**: Again... I felt like this was a lot of code all of a sudden

**Result**:

- AND BLUÄRK - it failed... because I checked for exactly 3, 5 and 3 and 5... I didn't check for things _divisible_ with 3 or 5. In fact, under TypeScript this doesn't even compile.
- IDIOT - I needed more cases for Fizz and Buzz

### Seventh test run

Test:

```typescript
it('returns "Fizz" for 6', () => assertSingle(6, "Fizz"));
```

Production code:

```typescript
export const single = (n: number): string => {
  if (n === 5) return "Buzz";
  if (n % 3 === 0) return "Fizz";
  return n.toString();
};

```

**Feeling before tcr-command**:

- Pretty nice to start over actually
- A bit nervous

**Result**:

- Passed

### Eight test run

Test:

```typescript
it('returns "Buzz" for 10', () => assertSingle(10, "Buzz"));
```

Production code:

```typescript
export const single = (n: number): string => {
  if (n % 5 === 0) return "Buzz";
  if (n % 3 === 0) return "Fizz";
  return n.toString();
};
```

**Feeling before tcr-command**:

- Confident

**Result**:

- Passed

### Ninth test run

I made some refactoring here. No test changed

Production code:

```typescript
export const single = (n: number): string => {
  if (n % 5 === 0) return "Buzz";
  if (isFizz(n)) return "Fizz";
  return n.toString();
};

const isFizz = (n: number): boolean => n % 3 === 0;

```

**Feeling before tcr-command**:

- Pretty nervous actually. 2 rows changed in one go. What if this goes wrong?!!!

**Result**:

- PHEW! Still works!

### Tenth test run

More refactoring. No test changed

Production code:

```typescript
export const single = (n: number): string => {
  if (n % 3 === 0 && n % 5 === 0) return "FizzBuzz";
  if (isBuzz(n)) return "Buzz";
  if (isFizz(n)) return "Fizz";
  return n.toString();
};

const isFizz = (n: number): boolean => n % 3 === 0;
const isBuzz = (n: number): boolean => n % 5 === 0;
```

**Feeling before tcr-command**:

- Pretty nervous actually. 2 rows changed in one go. What if this goes wrong?!!!

**Result**:

- PHEW! Still works!

### Eleventh test run

Test:

```typescript
it('returns "FizzBuzz" for 15', () => assertSingle(15, "FizzBuzz"));
```

Production code:

```typescript
export const single = (n: number): string => {
  if (n % 3 === 0 && n % 5 === 0) return "FizzBuzz";
  if (isBuzz(n)) return "Buzz";
  if (isFizz(n)) return "Fizz";
  return n.toString();
};

const isFizz = (n: number): boolean => n % 3 === 0;
const isBuzz = (n: number): boolean => n % 5 === 0;
```

**Feeling before tcr-command**:

- Pretty nervous

**Result**:

- Passed.
- I'm done with this feature and can squash my commits into a push-able commit. I didn't not but pressed on.

### Twelfth test run

Test:

```typescript
describe("FizzBuzz string", () => {});
```

**Feeling before tcr-command**:

- I just created a describe block and ran that. To commit it. That now became my mode of thinking: I need to test this so that it commits

**Result**:

- Passed.

### Thirteenth test run

Let's write something that can take a start and stop and returns a full string.

Test:

```typescript
import { describe, it, expect } from "vitest";
import { single, sequence } from ".";

describe("FizzBuzz string", () => {
  it('returns "1" for 1 to 1', () => {
    const result = sequence(1, 1);
    expect(result).toBe("1");
  });
});
```

Production code, in the same file as before:

```typescript
export const sequence = (start: number, end: number): string => "1";
```

- **Feeling before tcr-command**: Yes. Got the nervous feeling again. There are some lines of infrastructure in there...

**Result**:

- Passed.

### Fourteenth test run

Test:

```typescript
it('returns "1, 2, Fizz" for 1 to 3', () => {
  const result = sequence(1, 3);
  expect(result).toBe("1, 2, Fizz");
});
```

Production code:

```typescript
export const single = (n: number): string => {
  if (n % 3 === 0 && n % 5 === 0) return "FizzBuzz";
  if (isBuzz(n)) return "Buzz";
  if (isFizz(n)) return "Fizz";
  return n.toString();
};

const isFizz = (n: number): boolean => n % 3 === 0;
const isBuzz = (n: number): boolean => n % 5 === 0;

const range = (start: number, end: number): number[] =>
  Array.from({ length: end - start + 1 }, (_, i) => start + i)

export const sequence = (start: number, end: number): string => {
  const arr = range(start, end);
  return arr.map(single).join(",");
};

```

**Feeling before tcr-command**:

- Proud of the functional style I ended up with. Yes I had to write my own `range`-function... Should really be included
- Cheated (?) by testing some parts out in the REPL
- VERY NERVOUS about losing these beautiful lines

**Result**:

- FAAAILLED. NOOOO. I took too big steps

### Fifteenth test run

A small space was the problem.

Now I needed to rewrite that code from scratch. But I took the opportunity to do so to train.

Here's the updated code

Test:

```typescript
it('returns "1, 2" for "1,2"', () => {
  assert.equal(fizzBuzzer.string("1, 2"), "1, 2");
});
```

Production code:

```typescript
export const single = (n: number): string => {
  if (n % 3 === 0 && n % 5 === 0) return "FizzBuzz";
  if (isBuzz(n)) return "Buzz";
  if (isFizz(n)) return "Fizz";
  return n.toString();
};

const isFizz = (n: number): boolean => n % 3 === 0;
const isBuzz = (n: number): boolean => n % 5 === 0;

const range = (start: number, end: number): number[] =>
  Array.from({ length: end - start + 1 }, (_, i) => start + i)

export const sequence = (start: number, end: number): string => {
  const arr = range(start, end);
  return arr.map(single).join(", ");
};
```

**Feeling before tcr-command**:

- Very confident now that this should work

**Result**:

- And it worked

### Sixteenth (or so) test run - refactoring

I've changed paths here from my original post. I'm using the `single` method, and then I refactored the tests a bit.

Test:

```typescript
describe("FizzBuzz string", () => {
  const assertSequence = (start: number, end: number, expected: string) => {
    expect(sequence(start, end)).toBe(expected);
  };

  it('returns "1" for 1 to 1', () => {
    assertSequence(1, 1, "1");
  });

  it('returns "1, 2, Fizz" for 1 to 3', () => {
    assertSequence(1, 3, "1, 2, Fizz");
  });
});
```

Production:

```typescript
export const single = (n: number): string => {
  if (n % 3 === 0 && n % 5 === 0) return "FizzBuzz";
  if (isBuzz(n)) return "Buzz";
  if (isFizz(n)) return "Fizz";
  return n.toString();
};

const isFizz = (n: number): boolean => n % 3 === 0;
const isBuzz = (n: number): boolean => n % 5 === 0;

const range = (start: number, end: number): number[] =>
  Array.from({ length: end - start + 1 }, (_, i) => start + i)

export const sequence = (start: number, end: number): string => {
  const arr = range(start, end);
  return arr.map(single).join(", ");
};
```

**Feeling before tcr-command**:

- Felt nice to do the fast and frequent commits

**Result**:

- Passed
- AND commit. I like this more and more.

### Seventh test run

Let's do the full 1 to 15 and call it a day.

Test:

```typescript
it('returns the correct string for 1 to 15', () => {
  assertSequence(1, 15, "1, 2, Fizz, 4, Buzz, Fizz, 7, 8, Fizz, Buzz, 11, Fizz, 13, 14, FizzBuzz");
});
```

Production code is the same:

```typescript
export const single = (n: number): string => {
  if (n % 3 === 0 && n % 5 === 0) return "FizzBuzz";
  if (isBuzz(n)) return "Buzz";
  if (isFizz(n)) return "Fizz";
  return n.toString();
};

const isFizz = (n: number): boolean => n % 3 === 0;
const isBuzz = (n: number): boolean => n % 5 === 0;

const range = (start: number, end: number): number[] =>
  Array.from({ length: end - start + 1 }, (_, i) => start + i)

export const sequence = (start: number, end: number): string => {
  const arr = range(start, end);
  return arr.map(single).join(", ");
};
```

**Feeling before tcr-command**:

- Confident and pretty sure this is the final implementation

**Result**:

- It worked

## Summary

I'm still in awe how this exercise is teaching me to take smaller steps. Every smaller. My [code is here](https://github.com/marcusoftnet/fizzbuzz-tcr-ts)... That [took a lot of commits](https://github.com/marcusoftnet/fizzbuzz-tcr-ts/commits/main/)
