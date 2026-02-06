---
layout: post
title: Next.JS - testing async React components
author: Marcus Hammarberg
date: 2022-11-17 14:50:34
tags:
  - React
  - Testing
---

I had the great joy of teaching a course on [Next JS 13](https://nextjs.org) this last week. Next has for a long time been a favorite of mine and with version 13 they have really stepped it up a notch. Or three.

But what they still are lacking, and for the life of me I cannot understand why, is a good out-of-the-box testing story.

This caused me and the group I was teaching considerable head-ache - especially when we tried to test the [server-side `async` components](https://nextjs.org/docs/advanced-features/react-18/server-components) that Next.JS is plugging hard.

therefore I have two goals with this post:

1. Help me (and you?) to easily get started with testing
2. Show a way to test `async` server components

Let's do this.

<!-- excerpt-end -->

## Setting up a Next 13 example site

Right now, Next 13 is still in some kind of beta/alpha phase. Getting it up and running is a little manual for now, but will soon change.

Run these commands to get started:

```bash
npx create-next-app@latest next-testing
cd next-testing
rm -rf pages
mkdir app
touch app/page.tsx
npx scradd . dev "next dev --turbo" -o
```

Tell the wizard that pops up from `create-next-app` that you want to use TypeScript and EsLint. It's good for you and makes it easier to follow this post.

That last command is a little tool that I wrote to add scripts - [`Scradd`](https://www.npmjs.com/package/scradd). Yes - I'm super-proud of it.

This version is just overwriting (`-o`) the `dev` script to use the new `--turbo`-flag that let's us use the [Next.JS TurboPack](https://turbo.build/pack).

Finally, right now we need to add a setting in `./next.config.js` to opt into the new 13-features. Make it look like this, by opening it your editor:

```json
/** @type {import('next').NextConfig} */
const nextConfig = {
  reactStrictMode: true,
  experimental: { appDir: true}
}

module.exports = nextConfig
```

Then start the development server with:

```bash
npm run dev
```

(A very cool Next.JS 13 is that it automatically creates a root layout for you, when you access pages missing the. Note the `./app/layout.tsx` file created)

## Writing a component worth testing

Let's write a non-trivial component that we can use for test. But we will make it work as ~~God~~Next.Js 13 intended - a server component using `async`.

Consider this component that displays some data about Star Wars characters, using the [SWAPI](https://swapi.dev/)

Put this into a file called `page.tsx` in a new directory `/app/[id]`. No - I'm not kidding. Call the directory `[id]`. This way we can use it by using the `params`-property and get the `id` from the URL segment. Try it by going to `http://localhost:3000/3` and you'll see

Next 13 directory based routing in action, baby!

```typescript
import React from "react";

type HeroComponentProps = {
  params: {
    id: number;
  };
};

type Character = {
  id: number;
  name: string;
  height: number;
  mass: number;
  hair_color: string;
  eye_color: string;
};

const getCharacter = async (id: number) => {
  const res = await fetch(`https://swapi.dev/api/people/${id}/`);
  const character: Character = await res.json();
  character.id = id;
  return character;
};

const HeroPage = async ({ params: { id } }: HeroComponentProps) => {
  const hero = await getCharacter(id);

  return (
    <div>
      <h2 data-testid="heading">Details about - {hero.name}</h2>
      <ul>
        <li>Name: {hero.name}</li>
        <li>Height: {hero.height}</li>
        <li>Mass: {hero.mass}</li>
        <li>Hair: {hero.hair_color}</li>
        <li>Eyes: {hero.eye_color}</li>
      </ul>
    </div>
  );
};

export default HeroPage;
```

There are a few things that should jump out at you if you haven't seen server components before:

- The whole component is marked `async`
- Which means that we can `await` stuff, like the call to the `getCharacter` function
- There's no `useState` or `useEffect` in the component
- The rest is just normal JSX (ah, well TSX)
- (I promise that you have missed this) - the `data-testid` attribute of the `<h1>`-tag is important for, how I like to do testing. Add it.

I also created a list of numbers on the home page (`/app/page.tsx`) like this:

```typescript
import Link from "next/link";

const HomePage = () => {
  const arrayOfTen = Array.from({ length: 10 }, (_, i) => I + 1);
  return (
    <div>
      <h1>Showing the first 10 heroes</h1>

      <ul>
        {arrayOfTen.map((i) => (
          <li key={i}>
            <Link href={`/${i}`}>Hero # {i}</Link>
          </li>
        ))}
      </ul>
    </div>
  );
};

export default HomePage;
```

## Can we finally test this?

Ok - let's now get to around to testing.

We are going to use Jest (that I personally dislike, but hey - everyone is welcome...) and [testing-library/react](https://testing-library.com/docs/react-testing-library/intro/) which is amazing and gives us a nice "close-to-how-it-will-be-used-in-reality"-feel.

But, as I wrote in the beginning, this is nothing that Next package up for us.

### Install and configuring

In order make this happen there are a few things we need to install and configure. Run these commands and I'll describe what happened below:

```bash
npm i -D @testing-library/react jest @testing-library/jest-dom ts-node jest-environment-jsdom

npx -y scradd . "test" "jest"
npx -y scradd . "test:watch" "npm t -- --watch"
```

(I LOVE `scradd`... just sayin')

We installed a few dependencies here to make `jest` work (with TypeScript, hence the `ts-node`) and also to make `testing-library/react`.

Finally we created a few scripts to run our tests and run them under watch. Hey - if you wanna be super cool add this:

```bash
npx scradd . "pretest" "npm run lint"
```

That will run linting before your tests... [`package.json` can be used as a build tool, you know](https://www.pluralsight.com/courses/npm-build-tool-introduction)

One final part left, we need to configure `jest` to use `jest-environment-jsdom` among other things.

Add a `./jest.config.ts` like this:

```typescript
import nextJest from "next/jest";
const createJestConfig = nextJest({
  dir: "./",
});
const customJestConfig = {
  moduleDirectories: ["node_modules", "<rootDir>/"],
  testEnvironment: "jest-environment-jsdom",
};
module.exports = createJestConfig(customJestConfig);
```

(If you are on a Mac you can copy that thing above and then write `pbpaste > jest.config.ts` in the terminal which will [create the file from your clipboard](https://appliedtechnology.github.io/protips/copyPasteTerminal)).

Now run the tests with `npm t` or `npm run test:watch` and see ... no tests run. We have to write them first. At least we got our code linted, since we added the `pretest`-script.

### Failing to write our first test

React Testing Library is pretty straight forward to use. We use a `render` method that renders our component for us. We can then use the `screen` object to validate that stuff has been rendered properly.

Write this test in `/app/[id]/HeroPage.test.tsx` (psst - this will fail):

```typescript
import { render, screen } from "@testing-library/react";
import "@testing-library/jest-dom";
import HeroPage from "./page";

describe("HeroPage", () => {
  it("should render the heading", () => {
    // act
    render(<HeroPage params={1} />);

    // assert
    const headingElement = screen.getAllByTestId("heading");
    expect(headingElement).toHaveTextContent("Details about - Luke Skywalker");
  });
});
```

Before we fix the failure, let's first appreciate that the Next Js directory-based routing let's us create tests next to the production files, without creating a route called `HeroPage.test` as Next 12 would have done.

Ok - but this gives you a TypeScript error when (or before if you are using [ErrorLens](https://marketplace.visualstudio.com/items?itemName=usernamehw.errorlens)) you run the test. This error says:

```bash
'HeroPage' cannot be used as a JSX component.
  Its return type 'Promise<Element>' is not a valid JSX element.
    Type 'Promise<Element>' is missing the following properties from type 'ReactElement<any, any>': type, props, key
```

## Solving the problem

Let's stop and think for awhile here. I think TypeScript is trying to communicate with us. It says that our component is not returning a `JSX Element`, but rather a `Promise<Element>` (a Promise _of_ Element).

We can actually see this by opening `/app/[id]/page.tsx` and hover over the `HeroPage` function, i.e. our component function. Here is the function definition:

```typescript
const HeroPage: ({
  params: { id },
}: HeroComponentProps) => Promise<JSX.Element>;
```

Also, going WAY back in our React training. Remember that a React (functional) component is just a function that returns JSX. It's just a function.

The problem that we're running into here is that `render` from React Testing Library can only work with `JSX.Elements` it cannot use Promises.

But we know what to do with Promises... We `await` them. And we know what to do with functions... just call'em using `()`

Update the test to this do this:

```typescript
import "@testing-library/jest-dom";
import { render, screen } from "@testing-library/react";
import HeroPage from "./page";

describe("HeroPage", () => {
  it("should render the heading", async () => {
    // act
    const jsx = await HeroPage({ params: { id: 2 } });
    render(jsx);

    // assert
    const headingElement = screen.getAllByTestId("heading");
    expect(headingElement).toHaveTextContent("Luke Skywalker");
  });
});
```

The test now runs... much better. But we run into another problem `fetch is not defined`.

Before tackling that problem - let's have a chat about why this worked.

We updated the test so that we call `HeroPage` not as a JSX element, but as an ordinary function. If you hover over the `jsx` constant you can see that is is now of type `JSX.Element`.

`JSX.Element` where have I heard that bef .... HA! That's what `render` takes as a parameter. We can now pass it to `render` and our React Testing library test works as before.

We are testing `async` server components, using React Testing library. But it is a bit clunky, to write the test like this. Let's make the test run first and then we'll make it nicer to work with.

## Fixing the `fetch is not defined`

I'm not all sure but I think that `fetch is not defined` comes from the fact that we are using the `jsdom` (installed as `jest-environment-jsdom`). That is not really a browser, but just an API that wraps around pages, so that we can program against them. This is what `screen` is wrapping for us.

One thing that _is_ missing from `jsdom`, most likely is a `fetch` implementation.

We now have two, quite similar, options. We can supply a _real_ fetch for the `jsdom` to use, inside render. Or we can fake one, using mocking. Let's do the other option first, because I don't like writing tests that depends on APIs the internet. Its too slow and flaky.

Run this:

```bash
npm i -D jest-fetch-mock
```

That is a tool that makes mocking of `fetch` easy. Update the test to this:

```typescript
import { render, screen } from "@testing-library/react";
import HeroPage, { Character } from "./page";
import "@testing-library/jest-dom";

// new stuff
import fetchMock from "jest-fetch-mock";
fetchMock.enableMocks();

describe("HeroPage", () => {
  // new stuff
  beforeEach(() => {
    fetchMock.resetMocks();
  });

  it("should render the heading", async () => {
    // arrange
    // new stuff
    const luke: Character = {
      id: 2,
      name: "Luke Skywalker",
      height: 172,
      mass: 77,
      hair_color: "blond",
      eye_color: "blue",
    };
    fetchMock.mockResponseOnce(JSON.stringify(luke));

    // act
    const jsx = await HeroPage({ params: { id: 2 } });
    render(jsx);

    // assert
    const headingElement = await screen.getByTestId("heading");
    expect(headingElement).toHaveTextContent("Details about - Luke Skywalker");
  });
});
```

Ok - lots of code here, but it's mainly just me setting up the fake data `luke` that I want returned from the mocked `fetch` we got by saying `fetchMock.enableMocks();`

Other than that - it now works and we can test our `async` server component using a fake `fetch`.

Oh - you could use a _real_ fetch too, I presume., if you wanted, by supplying your component a real implementation, like [`node-fetch`](https://www.npmjs.com/package/node-fetch) (install with `npm i -D node-fetch`).

I haven't played around with this, since I'm not a fan of having my unit and integration tests depend on APIs. That's what end-to-end tests are for. But I'm quite sure you could make this work.

## Refactoring

There's one thing left that bothers me. I feel like we could do better than having that line generating an intermediate variable `jsx` in each test.

Let's see if we can make a generic function that can render all components async.

```typescript
async function renderAsync<T>(
  asyncComponent: (props: T) => Promise<JSX.Element>,
  props: T
) {
  const jsx = await asyncComponent(props);
  render(jsx);
}
```

and then call that function in the test like this:

```typescript
// act
await renderAsync<HeroComponentProps>(HeroPage, { params: { id: 2 } });

// assert
const headingElement = screen.getByTestId("heading");
```

That is ok, but I'm still not too happy, because now we strayed away from one of the core tenants of React Testing Library - that the components should be used as they are used on the pages.

I would have been very cool if I just could have written:

```typescript
await render(<HeroComponent params={id: 2} />)
```

but I couldn't get it to work. This will have to suffice for now.

## Summary

We made it. We now written test for our `async` server components using the React testing library syntax and assertions.

I haven't mentioned this but the client side components can also be tested in the same manner. That is what React testing library was written for, and hence I haven't written much about that here. Others have done that better than me.

Hope this helped you.
