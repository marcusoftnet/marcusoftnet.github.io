---
layout: post
title: "Making boring fun - bash and Node to the rescue"
author: "Marcus Hammarberg"
date: 2021-08-26 19:54:53
tags:
 - JavaScript
 - Bash
---

I rarely get paid to write code these days... or that is people rarely ask me to write code. But since I'm a programmer at heart it is one of the tools in my toolbelt, regardless of what kind of tasks I'm given.

Today I got asked:

> Could you please list all Open Source Licenses we are using, and all the dependencies all our code is using.

Considering we have 130+ repositories I was what the scientist refer to as a `boring` task.

Let's make it more fun with code.

<!-- excerpt-end -->

I'm gonna wield my bash- and Node-swords to solve this sucker. And I was looking to do some functional programming exercises too - let's see if we can squeeze all of that in there.

## Getting the licenses out of the repos

Each repository has a `package.json` file that contains a `license` field. After `npm install` we will get a lot of `package.json`s in the `node_module` folder for each repository.

My idea is to write a bash script that runs `npm install` in each of the repository folders and then `grep` the `license` field out of the `package.json` files somehow.

I already had a script that clones all our repositories, so that part was easy.

Next up I needed to loop through all the local repository folders and execute a command (`npm i`) in each. Luckily I had already done something similar so I could write it pretty easy. Like this:

```bash
find . -maxdepth 1 -type d \( ! -name . \) -exec bash -c "cd '{}' && npm i --silent" \;

```

This will `find` each directory (`-d` flag) and then execute ( `-exec`-flag) command for each. The command for me is ` cd '{}' && npm i --silent ` , that is executed as bash command (`bash -c`).

Nice - that took ... a very long time. 5Gb worth of NPM packages downloaded, thank you very much.

Ok - now I have the raw data on my disk. The next part was tricky for me since I needed to find all the `package.json` files and then pull out the `license` field of each.

Turns out that bash thinks it's easy:

```bash
find ./ -type f -name "package.json" -print0 | xargs -0 grep -i '"license"' > ~/temp/allLicenses.txt
```

Bom - easy! Eeeh or not. Again we `find` all files `-f` with the name `-name` "package.json". We then use the mighty `xargs` (that I don't really grasp yet) and pass the first parameter `-0` to `grep`. This would be the filename from the `find` command.

`grep -i '"license"'` pulls the license field and value out of each `package.json`.

Finally, I send the output to a file, rather than barfing it out in the console (`> ~/temp/allLicenses.txt`)

Putting all of that together in a single [script looks like this](https://gist.github.com/marcusoftnet/39c0e9a3076765fd0da4b572f91e7e75)



Ok - we now have a lot of lines like this:

```text
.//jsfs-lab-reactTictactoe/node_modules/indexes-of/package.json:  "license": "MIT",
.//jsfs-lab-reactTictactoe/node_modules/pako/package.json:  "license": "(MIT AND Zlib)",
.//jsfs-lab-reactTictactoe/node_modules/postcss-attribute-case-insensitive/package.json:  "license": "MIT",
```



Like a lot. ≈33000. That is fun and all but even Google Sheet couldn't swallow all of that. Let's crunch it with code!

## Counting with Node

My next task was twofold - I wanted to count the number of times a certain license was used and then count the number of times a certain package was used.

Sound functional and math-y to me...

I decided to ditch bash now, and used JavaScript and Node instead, since I know it better and can make some more advanced things with it.

I created a `licenseCounter.mjs` file and went to work. `.mjs` means that I'm not using CommonJs and can use stuff like `import` and`  async/await` in my code. I like that.

The initial version is pretty boring and just reads all of those lines into a constant

```javascript
import fs from "fs";
import util from "util";

const readFile = util.promisify(fs.readFile);

const file = await readFile("./allLicenses.txt");
const lines = file.toString().split(`\n`);
console.log(lines.length)
```

Yes. I get a glorious `32153` printed. We're off to a good start.

I then decided to mold the lines into some nice objects in a long array. For this, I will `.map` over the lines. In true functional style, I created a few lower-order functions (? is that even a word). I mean some helpers that make my `.map` look nice.

```javascript
const getRepoName = (line) => {
  return line.split("/")[0];
};

const getDependencyName = (line) => {
  if (!line.indexOf("/node_modules/")) {
    return "";
  }

  const nodeModules = line.split("/node_modules/")[1];
  if (!nodeModules) {
    return "";
  }

  return nodeModules.split("/package.json")[0];
};

const getLicense = (line) => {
  const license = line.split('"license": "')[1];
  if (!license) {
    return "";
  }
  return license.split('"')[0];
};

const dependencyLicenses = lines.map((line) => {
  return {
    repo: getRepoName(line),
    dependency: getDependencyName(line),
    license: getLicense(line),
  };
});
```

Nothing strange here really, other than I have to trust the data to be structured in a certain way. I do since I trust `grep`to be consistent. Otherwise, I will soon know it.

(I actually did a search and replace here to get rid of the ``.//` at the beginning of each line. Call me lazy - it was easier)

Ok - great now we have objects that look like

```json
{
  repo: 'jsfs-lab-reactTictactoe',
  dependency: '@types/json-schema',
  license: 'MIT'
}
```

Nice - now for the counting.

Doing aggregations of any sort in a functional way means turning to the dreaded and powerful `.reduce`. Reduce takes an array and reduces it like a sauce boiling for hours down to one value.

That value, in my case, needs to be two type of object that looks like this:

```json
{ license: 'MIT', quantity: 14 }
{ dependency: '@types/json-schema', quantity: 123 }
```

The code, that took me some iterations to write, ended up like this:

```javascript
const makeKeyable = (val) => val.replace(/\s/g, "").toLowerCase();

const licenseCounts = [];
dependencyLicenses.reduce((res, value) => {
  const key = makeKeyable(value.license);
  if (!res[key]) {
    res[key] = { license: value.license, quantity: 0 };
    licenseCounts.push(res[key]);
  }
  res[key].quantity += 1;
  return res;
}, {});
```

* The `makeKeyable` is a way for me to ensure that the license name can be a key of a JavaScript object. The license string contains spaces so I remove them. With RegEx mind you - I feel like a kid with a chainsaw
* `.reduce` take, as the first parameter, a callback with two values
  * `res` is the result variable, and is also initialized as the second parameter to `.reduce` to an empty object `{}`
  * `value` is the current value that we are looping through. One value out of the `dependencyLicenses` array, in other words
* After making a `key` I check if this key exists before.
  * If not I initialize a new object with the `license` name and a `quantity set to `0`
  * I also add it to a `licenseCounts` array so that I can loop over all counts later.
* Once I know that the `res[key]` is properly initialized I can safely increment the `quantity` with 1 for each value
* Finally, and the part that I always forget, I return the `res` object so that it can be accumulated to the loop.

Nice! Doing the same for the dependecies counting turns out to be *very* similar:

```javascript
const dependencyCounts = [];
dependencyLicenses.reduce((res, value) => {
  const key = makeKeyable(value.dependency);
  if (!res[key]) {
    res[key] = { dependency: value.dependency, quantity: 0 };
    dependencyCounts.push(res[key]);
  }
  res[key].quantity += 1;
  return res;
}, {});
```

Perfect - I now have two arrays of these counts and can just print the to the console, but let's show off and sort them in descending order first. Ah heck - let's do it just before we print it to the console:

```javascript
console.log("# Licenses");
licenseCounts
  .sort((a, b) => b.quantity - a.quantity)
  .map((item) => console.log(`${item.license}, ${item.quantity}`));
console.log("#####################################");

console.log("# Dependencies");
dependencyCounts
  .sort((a, b) => b.quantity - a.quantity)
  .map((item) =>
    console.log(
      `https://www.npmjs.com/package/${item.dependency}, ${item.quantity}`
    )
  );
```

Finally, I run this script like this, to get the output into a file rather than out in the console:

```bash
node licenseLister.mjs > ~/temp/licensesAggregations.txt
```

## Summary

Ha! In your face, stupid boring task. I solved it and had fun doing it!

As always, I didn't write this from start to finish like this and I stole just about all the parts from different articles and blog posts. But I do understand it and I did learn a lot, and I can explain it. Win, win, win!