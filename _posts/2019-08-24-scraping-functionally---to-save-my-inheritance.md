---
layout: post
title: "Scraping functionally - to save my inheritance"
author: "Marcus Hammarberg"
date: 2019-08-24 12:33:13
tags:
  - Programming
  - Javascript
  - Node
---

Many years ago I wrote a little site to keep track of fun things that my (then only one) son Albert said. I called it [Abbe Says](http://abbesays.apphb.com/Quotes/) and it has been granting us and our friends great joy.

At its core, it is a very simple blog/content management system that I wrote in .NET (3.5 I think) and published on the first serverless offering I heard about - AppHarbor. I didn't even know the term back then it was more like: `HEY! Give them your codez and they'll make it run on Internet` My feeble brain exploded.

Anyhow - I cannot update it for various reasons and I need to move it to a more modern stack. Thinking of Svelte and to run it from some static served ...

I'm getting ahead of me - first we need to get the data. This post describes how I salvaged the data from the site.

<!-- excerpt-end -->

### Task, scope, and approach

I plan to get the data from the web page - a process known as [web scraping](https://en.wikipedia.org/wiki/Web_scraping).

My goal is to get all the quotes with its metadata (date, name of kid, text and the age of the kid when they said it) and save it to a single file, that will be my new database. I could then move that data to a [MongoDb](https://www.mongodb.com/) but I might also skip that and just keep it in a file.

Finally, I want to try to do this in as much functional programming style as possible. And use `async/await` as much as possible as I think it makes asynchronous programming much more readable.

### But why not just get the data from the provider?

There are many other ways of doing this, of course, and you might feel like this:

![IHaveSeveralQuestions.gif](/img/IHaveSeveralQuestions.gif)

This is will be a post on scraping a lot of web pages. So obviously you could ask why I didn't just grab the data from whatever data source I had. Well... it was a SQL Server and I don't have an easy way to peek into it.

Also, I'm a programmer at heart. I solve problems with code. For fun.

### Our tools

The problem falls into two big categories; get the page and get data out of the HTML.

- To retrieve the pages we will use [Axios](https://www.npmjs.com/package/axios), which is a new acquaintance for me. It has built-in excellent support for promises and hence is a good fit for my `async/await` approach
- To get the data out of the HTML structure (the actual scraping) we will use [Cheerio](https://www.npmjs.com/package/cheerio), which works just awesome and also have support for CSS selectors a la JQuery, so it's easy to work with.

Other than that it will be a few built-in Node things such as the file system (fs) package.

In the end, I want a script that I can run over and over that will get all the quotes of all kids into a one large JSON file. That is about 270 quotes.

### Setup

If you rather read than type along, [get the code from here](https://github.com/marcusoftnet/abbesaysscraper). Other than that - fire up your terminal in an empty directory and let's go.

The initial setup was done like this:

```bash
mkdir abbesaysscraper && cd abbesaysscraper
npm init -y
npx gitignore node
git init .
npm I axios cheerio
npm I -D standard
touch index.js
```

This will set up an initial node application with one single file (`index.js` ), init git with a suitable `.gitignore` file and install our dependencies.

Finally, I just tweaked the `package.json` to have these scripts:

```json
"scripts": {
  "prestart": "standard --fix",
  "start": "node index.js"
},
```

Which means that I will not be able to start the application without fixing the linting errors. Since I will not write tests (sue me! ) I can still get some help by doing the linting - that can catch some problems I might cause. I hope ...

### Hey Mr coder-man, get some data for me

Let's start with something very simple. Let's write a function that downloads a webpage using Axios:

```javascript
const getData = async (url) => {
  try {
    const axios = require("axios");
    const response = await axios.get(url);
    return response.data;
  } catch (error) {
    console.log(`Failed getting ${url} - ${error}`);
  }
};
```

Thanks to the awesomeness of Axios this is just. a few lines, but let's stop at a few points:

- Note the `async` before the function there, marking this function as asynchronous. This is so that we can `await` asynchronous code inside this function.
- I kept the `require` inside the function, mainly for porta and movability in my code.
- I included error handling here since I expect this particular function to fail.

Let's write an example or test that use this. Let's get all the quotes for Albert by hitting the http://abbesays.apphb.com/Quotes/Kid/Albert URL and then print the result in the console.

```javascript
getData("http://abbesays.apphb.com/Quotes/Kid/Albert").then(console.log);
```

Perfect - it prints a big long HTML page to the console. If you try a broken URL (http://abbesays.apphb.com/Quotes/Kid/Donald for example) you can see our lovely error handling working too.

Let's refactor a bit. First, we pull out the base URL out to a constant.

```javascript
const SITE = "http://abbesays.apphb.com/";

getData(`${SITE}/Quotes/Kid/Albert`).then(console.log);
```

Then, let's be even nice and make a little function that returns the URL for a particular kid since that is the part that will be substituted:

```javascript
const getKidUrl = (kid) => `${SITE}/Quotes/Kid/${kid}`;

getData(getKidUrl("Albert")).then(console.log);
```

A nice little function to encapsulate the URL construction.

Once it works I commented my test out but left it for later.

### Linking up - parsing out the links

This page that we got back, do contain the quotes but is sadly missing some other information that we need. So the only thing we can use from this first page is the links to the quotes.

The goal now is hence to get an array of links printed to the console. Let's write a function for that:

```javascript
const cheerio = require('cheerio')

const parseLinks = async html

String => {
  try {
    const $ = await cheerio.load(htmlString)
    const links = $('blockquote > a')

    const anchors = []
    links.each((i, link) => {
      const href = $(link).attr('href')
      anchors.push(`${SITE}${href}`)
    })
    return anchors
  } catch (error) {
    console.log(error)
  }
}
```

- Our function, that is `async` will receive a string html. That was that big barf of HTML we printed to the console, in the previous step
- We then use the `cheerio.load` function and await getting the result
- Once it's finished we are ready to use CSS selectors to get data out. The links are inside a `<blockquote>` and hence our selector looks like this: `blockquote > a`
- I put in some error handling, by just logging it out. Parsing is often tricky and needs some work.

Running that will give a bit of a disappointing result. Let's try it:

```javascript
getData(getKidUrl("Albert")).then(parseLinks).then(console.log);
```

That gives a **long** list of Cheerio link objects. We need to get the href value of each of them. This might be doable with a better selector but I didn't find a good way to do that. Instead, I wrote this:

```javascript
const parseLinks = async (htmlString) => {
  try {
    const $ = await cheerio.load(htmlString);
    const links = $("blockquote > a");

    const anchors = [];
    links.each((i, link) => {
      const href = $(link).attr("href");
      anchors.push(`${SITE}${href}`);
    });
    return anchors;
  } catch (error) {
    console.log(error);
  }
};
```

That is pretty good or at least simple to read; we just iterate over each of the links and pick out the `href` attribute, that we then concatenate with the SITE base URL.

Best of all - it works!

But it rubs my functional programmer the wrong way. Let's try to make it shorter and chain..ier:

```javascript
const parseLinks = async (htmlString) => {
  try {
    const $ = await cheerio.load(htmlString);

    return $("blockquote > a")
      .map((i, link) => `${SITE}${$(link).attr("href")}`)
      .toArray();
  } catch (error) {
    console.log(error);
  }
};
```

There we go! Functionally I now map over the result and then pipe the result to `.toArray()` to shape the result as I want it.

And with the following test code we can see a long list of links to the quotes of Albert:

```javascript
getData(getKidUrl("Albert")).then(parseLinks).then(console.log);
```

Nice - now we can do the next step.

### Get a quote and parse it

First, let's get one quote and parse it. That means - pass in one link (from the list above), get that HTLM and parse it.

```javascript
const getQuoteHtmlString = async (link) => getData(link);
const parseQuote = async (htmlString) => {
  const $ = await cheerio.load(htmlString);
  const quoteText = $("blockquote > p").text().trim();

  return {
    quoteText: quoteText,
  };
};
```

Getting the quote html is done by calling into our own `getData` as we wrote before. Notice that since this is the only statement we don't need a `return` and since `await` is implicitly assumed for the return value in an `async` function, `return await getData(link)` just becomes `getData(link)`. Pretty cool, huh?

The warning was `Redundant use of await on a return value.` [and you can read more here.](https://eslint.org/docs/rules/no-return-await)

The next function (`parseQuote`) takes this html string and picks it apart using cheerio. For now let's just pick out the text, with a selector of `blockquote > p` that does the job.

And let's test it too

```javascript
getQuoteHtmlString("http://abbesays.apphb.com/Quotes/77")
  .then(parseQuote)
  .then(console.table);
```

Perfect - it prints a nice table.

But we need some more parts of the page to our quote and I've created a few simple functions that does that:

```javascript
const parseQuoteDate = (kidInfoString) =>
  kidInfoString.split(";")[0].split(" ")[1];
const parseKidName = (kidInfoString) =>
  kidInfoString.split(" av ")[1].split("\n")[0];
const parseAgeAtQuote = (kidInfoString) => kidInfoString.split("\n")[1].trim();
```

These all operate on a string of the page that holds the date, name of the kid and age when they said the quote. This can be parsed out using `#contentMain > div > p:nth-child(2)`

Yeah... not the most stable selector maybe, but since my page will not change (hey - I decide!) we can safely use it.

Now we can make a final version of the `getQuote` function that looks like this:

```javascript
const parseQuote = async (htmlString) => {
  const $ = await cheerio.load(htmlString);
  const quoteText = $("blockquote > p").text().trim();
  const kidInfo = $("#contentMain > div > p:nth-child(2)").text().trim();

  return {
    quoteText: quoteText,
    quoteDate: parseQuoteDate(kidInfo),
    kidName: parseKidName(kidInfo),
    ageAtQuote: parseAgeAtQuote(kidInfo),
  };
};
```

Perfect! We now get a parsed quote object from a string.

### Putting the pieces together

I have all the links to the quotes. I can make a quote object from a link to a page. Now to put it together.

There are a few things to unpack here but here we go:

```javascript
const getQuotes = async (links) => {
  const parsedQuotesPromises = links.map(async (link) => {
    const quoteHtml = await getQuoteHtmlString(link);
    return parseQuote(quoteHtml);
  });

  return Promise.all(parsedQuotesPromises);
};
```

First I `.map` over a list of links. But I do that using `async`.

This means that I will have to wait until all of them have resolved, which can be accomplished using `Promise.all`.

Returning `Promise.all` means that I can `.then()` the entire result in my calling code. Like this:

```javascript
getData(getKidUrl("Albert")).then(parseLinks).then(getQuotes).then(console.log);
```

Boom! All quotes for Albert in one big array.

We're getting closer.

### All the kids and the flattened array

First, right now we are just getting the 'Albert' quotes, but I have three kids and three categories of quotes. I'm sure Arvid and Gustav would feel left out if we didn't store their quotes.

Let's make an array of kids and then map over that array to run our whole chain. Something like this

:

```javascript
const kids = ["Albert", "Arvid", "Gustav"];

Promise.all(
  kids.map(async (kid) =>
    getData(getKidUrl(kid)).then(parseLinks).then(getQuotes)
  )
).then(console.log);
```

That works, and it's blazingly fast too! Async is my lightsaber!

Also, I'm kind of starting to love `Promise.all`. This way I can map over asynchronous functions and await all of them before I proceed to my next `.then()`.

The only problem here is that this array is messed up. If we change the last log statement to `  .then(quotes => console.log(quotes.length))` we realize that we get an array with arrays of quotes for each kid. Like this:

```javascript
[[ArvidQuotes], [GustavQuotes], [AlbertQuotes]];
```

But I want one array with all the quotes in a long list. This processes is known as flattening an array. And luckily for us that is [built into JavaScript itself](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/flat):

```javascript
const arr = [
  [1, 2],
  [3, 4],
  [5, 6],
];
console.log(arr.flat()); // [1,2,3,4,5,6]
```

This is precisely what we want to do our next `.then` becomes pretty small. Here is my whole chain before the last step:

```javascript
Promise.all(
  kids.map(async (kid) =>
    getData(getKidUrl(kid)).then(parseLinks).then(getQuotes)
  )
)
  .then((kidQuotes) => kidQuotes.flat())
  .then(console.log);
```

If we wanted we could encapsulate that in a promisfied version, to make our code-chain even nicer to read:

```javascript
const flattenArray = async (arr) => {
  return new Promise((resolve) => resolve(arr.flat()));
};
```

Which will turn our promise chain into this:

```javascript
Promise.all(
  kids.map(async (kid) =>
    getData(getKidUrl(kid)).then(parseLinks).then(getQuotes)
  )
)
  .then(flattenArray)
  .then(console.log);
```

What you like is probably a matter of taste. I kinda like this version. I'm keeping it.

### Promise to write to a file

Now we are printing the whole thing to the console, but I wanted for storing this to a file, that will serve as my database.

Let's write a function that takes some data and store it to a set filename:

```javascript
const writeAllQuotesFile = async (data) =>
  new Promise((resolve, reject) => {
    const fs = require("fs");
    const filename = "./allQuotes.json";

    fs.writeFile(filename, JSON.stringify(data), "utf8", (err) => {
      if (err) reject(err);
      resolve(`${filename} created with ${data.length} quotes`);
    });
  });
```

The `fs.writeFile` doesn't support Promises (to my knowledge), out of the box. That's not a biggie for us; we just make promises as we want to. And we intend to keep them too!

Joking (?) aside - once you've done it a few times, writing your promise is not that hard. You can [read more here](https://saltsthlm.github.io/protips/makingPromises) but basically we use the Promise constructor and then need to call either:

- `resolve` if we want to indicate success. In our case that would be if the file was created successfully. We take that opportunity to send back a nice little message
- `reject` that we call in case of failure. In that case, we probably want to return a nice little error message too.

Testing this out can be done with the following snippet:

```javascript
writeAllQuotesFile(kids).then(console.log);
```

And we can attach it to our main program by adding to our `.then` chain like this:

```javascript
Promise.all(
  kids.map(async (kid) =>
    getData(getKidUrl(kid)).then(parseLinks).then(getQuotes)
  )
)
  .then(flattenArray)
  .then(writeAllQuotesFile)
  .then(console.log);
```

That chain almost reads like English and is pretty easy to follow and reason about. I can see how to improve this further by encapsulating some functions in higher-order functions, but this is good enough.

## Conclusion

Wow - that was fun and pretty educational for me to:

- I learned a lot about functional, stateless and immutable style. It's always good to refresh those skill
- I had great fun using `async/await` and promises to make for a very fluent and easy to understand. That last version of the program ran in 3.1 seconds, which is pretty impressive for 273 HTTP requests and some parsing.
- I learned about `Promise.all` and how to `.map` asynchronously. That was a new thing for me but it was pretty cool. And insanely useful.

I hope you found this useful. I've [put the code here](https://github.com/marcusoftnet/abbesaysscraper).
