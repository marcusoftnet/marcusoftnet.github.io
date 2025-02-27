---
layout: post
title: "Conways Game of life using HATEOAS and HTMX"
author: "Marcus Hammarberg"
date: 2025-02-27 04:00:00
tags:
 - Express
 - HTMX
---

I've been playing around more with HTMX and one of the really cool features that I think we need to talk more about is the ability to trigger client side events from the server. This is accomplished by using the `hx-trigger` header and elements on the page can listen for events using `hx-trigger: myEvent from body`.

This means that it's easy to inform the client that something has happened and then let the client take appropriate actions. For example, imagine that we put an item in the shopping cart. The server responds with the event `SHOPPING_CART_UPDATED`. A lot of elements on the page can now update based on this event; counter in the shopping cart, list of "other people also bought", a banner with discounts etc.

Event driven client side architecture. Just imagine what this could do for micro frontend, where each component might be built by different teams. The business events is published and the components can take appropriate actions.

To demo this I was thinking that Conway Game of Life could be a fun example. It's a zero player game, i.e. a simulation that just keeps running after you have started it. Each step is generated as a consequence of the previous change and hence perfect for this kind of event driven architecture.

<!-- excerpt-end -->

You can find [all of the code here](https://github.com/marcusoftnet/htmx-game-of-life), but we are going to build it up step by step in the article.

## Disclaimer

What we are about to build will be VERY network intensive. I would not recommend building a real application like this, but it serves well to explain the concepts of HATEOAS, and HTMX events.

Don't try this at home, in other words.

## Conway Game of Life

[Conway Game of Life](https://en.wikipedia.org/wiki/Conway%27s_Game_of_Life) is a zero player game that is played on a grid of cells. Each cell can be either alive or dead. The game is played as follows:

Any live cell with fewer than two live neighbors dies, as if by under-population.
Any live cell with two or three live neighbors lives on to the next generation.
Any live cell with more than three live neighbors dies, as if by overpopulation.
Any dead cell with exactly three live neighbors becomes a live cell, as if by reproduction.

The rules are applied to each cell in the grid and the grid is updated as a consequence of the previous state.

In other words, you need to know about your neighbors to calculate the next state. I have implemented a function to do that here - for one cell:

```javascript
const computeNextState = (state, neighbors) => {
  const aliveNeighbors = neighbors.reduce((sum, n) => sum + parseInt(n), 0);
  if (state === "1")
    return aliveNeighbors === 2 || aliveNeighbors === 3 ? "1" : "0";
  return aliveNeighbors === 3 ? "1" : "0";
};

module.exports = { computeNextState };
```

And [here are some tests that shows how this function works](https://github.com/marcusoftnet/htmx-game-of-life/blob/main/tests/computeNextState.test.js). I will not use the tests in the walkthrough, but they are part of the repo.

Game of Life is often used as a kata (coding exercise) as it has simple rules, but can be a bit tricky to implement.

## The plan and HATEOAS

Just about all implementations of Conways Game of Life is works with the whole grid, looping through the rows and cells, but I wanted to try to drive the game from changes that happens to each cell. Cell by cell instead.

Which led to to think about HATEOAS (I have no idea how to pronounce that...), which Dr Roy Fielding, talked about in his PhD thesis on REST and among other places. HATEOAS stands for Hypermedia as the Engine of Application State and can easily be understood as the hypermedia describes the current state of an application. Not only the state, by the way, but also links to the next actions you can take etc.

Imagine creating a new blog post using a HTTP call to POST /blog. The response is an HTML representation of the blog post. The response includes links to the next actions you can take, e.g. `edit` and `delete`.

In my case, I will generate a grid of cells, randomizing the alive/dead state of each cell. Then I will update this grid to have it listen to event from all its neighbors. When any of the neighbors change, the cell should also calculate its new state.

Told you - there will be A LOT of network calls. But it will be a very declarative and clear approach.

## Starting point - creating the grid

I'm going to use Express, HTMX and Handlebars to build this, let's set it up like this:

```bash
mkdir htmx-game-of-life
cd htmx-game-of-life

touch server.js

npm init -y
npm pkg set scripts.start="node server.js"
npm pkg set scripts.dev="node --watch server.js"
npm pkg delete scripts.test

mkdir public views views/partials
touch public/styles.css
touch views/board.hbs
touch views/partials/cell.hbs
touch views/partials/controls.hbs

npx -y gitignore node

npm i express express-handlebars

code .
```

I'm not going to talk about styling - get the [CSS here](https://github.com/marcusoftnet/htmx-game-of-life/blob/main/public/styles.css)

The initial `server.js` looks like this, and generates the initial board:

```javascript
const express = require("express");
const path = require("path");
const configureHandlebars = require("./config/handlebars");

const app = express();
const PORT = 3000;
const GRID_SIZE = 20;

app.use(express.static("public"));
app.use(express.urlencoded({ extended: true }));

// Setup Handlebars
configureHandlebars(app);

app.get("/", (req, res) => {
  res.render("board", { GRID_SIZE });
});

app.listen(PORT, () =>
  console.log(`Server running on http://localhost:${PORT}`)
);
```

There are, for reasons that will soon become clear, quite a lot of Handlebars configuration. I've broken it out to a `config/handlebars.js` file. You can get it here: [https://github.com/marcusoftnet/htmx-game-of-life/blob/main/config/handlebars.js](https://github.com/marcusoftnet/htmx-game-of-life/blob/main/config/handlebars.js). It is basically telling handlebars that the views are in the `views` folder, with the `.hbs` extension and then create a few helper functions that will be used in the views.

Let's now fill out the views. First the `views/board.hbs`, which also is the main page:

```html
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>HTMX Conway's Game of Life</title>
  <script src="https://unpkg.com/htmx.org"></script>
  <link rel="stylesheet" href="/styles.css">
</head>

<body>

  <h1>HTMX Conway's Game of Life</h1>

  <table>
    {{#each (range GRID_SIZE) as |row|}}
    <tr>
      {{#each (range ../GRID_SIZE) as |col|}}
      <td>
        {{> cell x=col y=row}}
      </td>
      {{/each}}
    </tr>
    {{/each}}
  </table>

</body>

</html>
```

I'm including HTMX on the page, and then use the Handlebars `#each` loop to create a grid of cells. Each cell is rendered using the `views/partials/cell.hbs` partial, and get the `x` and `y` coordinates as parameters.

```html
<div
  id="cell-{{x}}-{{y}}"
  {{#if (randomAlive)}}
    data-state="1"
    class="alive"
  {{else}}
    data-state="0"
    class="dead"
  {{/if}}
>
</div>
```

`data-state` is the value of the cell. It's set to `1` if the cell is alive, `0` if it's dead. `class` is used to style the cell.

`randomAlive` is a helper function that returns a random boolean to set the cell to dead (`0`) or alive (`1`). This is one of the functions in the `config/handlebars.js` file.

If you run that (`npm run dev`) you will see a grid of cells, some alive, some dead. Reloading the page it should look different.

## Setting up event listening

Great start - the state is represented as HTML and shown on the page. But our state is actually a bit more advanced. Remember that HATEOAS also gives the user actions on what can be done next.

When someone clicks our cell, we want to calculate the next state for that cell. BUT we also want to re-calculate our state every time one of our neighbors updates it state.

We will use server-side events for this, and declaratively tell our cell what to listen for.

When Game of Life is used as a kata this is one of the crux, we need to figure out how to calculate the neighbors. Using our grid coordinates, we can express our neighbors like this:

| | | |
|:---:|:---:|:---:|
| `(X-1), (Y-1)` | `(X-1), Y` | `(X-1), (Y+1)` |
| `(X), (Y-1)` | **OUR CELL** | `(X), (Y+1)` |
| `(X+1), (Y-1)` | `(X+1), Y` | `(X+1), (Y+1)` |

For example, if our cell is at `(4, 4)` then the neighbors are:

| | | |
|:---:|:---:|:---:|
| `3, 3` | `3, Y` | `3, 5` |
| `4, 3` | **4, 4** | `4, 5` |
| `5, 3` | `5, 4` | `5, 5` |

Meaning that our cell wants to be informed about updates on all of these neighbors.

Let's set this up using `hx-trigger` and `hx-vals`. `hx-trigger` is the event (like `click`) when we want to do something. `hx-vals` is a way for us to pass data with the request that we make.

This will look messy, but bear with me.

```html
<div
  id="cell-{{x}}-{{y}}"
  {{#if (randomAlive)}}
    data-state="1"
    class="alive"
  {{else}}
    data-state="0"
    class="dead"
  {{/if}}
  hx-post="/cell/{{x}}/{{y}}"
  hx-target="this"
  hx-trigger="click,
      update-cell-{{sub x 1}}-{{sub y 1}} from:body,
      update-cell-{{sub x 1}}-{{y}} from:body,
      update-cell-{{sub x 1}}-{{add y 1}} from:body,
      update-cell-{{x}}-{{sub y 1}} from:body,
      update-cell-{{x}}-{{add y 1}} from:body,
      update-cell-{{add x 1}}-{{sub y 1}} from:body,
      update-cell-{{add x 1}}-{{y}} from:body,
      update-cell-{{add x 1}}-{{add y 1}} from:body"
    hx-vals='js:{
       "state": document.querySelector("#cell-{{x}}-{{y}}").getAttribute("data-state"),
       "neighbors": [
         document.querySelector("#cell-{{sub x 1}}-{{sub y 1}}")?.getAttribute("data-state") ?? null,
         document.querySelector("#cell-{{sub x 1}}-{{y}}")?.getAttribute("data-state") ?? null,
         document.querySelector("#cell-{{sub x 1}}-{{add y 1}}")?.getAttribute("data-state") ?? null,
         document.querySelector("#cell-{{x}}-{{sub y 1}}")?.getAttribute("data-state") ?? null,
         document.querySelector("#cell-{{x}}-{{add y 1}}")?.getAttribute("data-state") ?? null,
         document.querySelector("#cell-{{add x 1}}-{{sub y 1}}")?.getAttribute("data-state") ?? null,
         document.querySelector("#cell-{{add x 1}}-{{y}}")?.getAttribute("data-state") ?? null,
         document.querySelector("#cell-{{add x 1}}-{{add y 1}}")?.getAttribute("data-state") ?? null
       ]
     }'>
</div>
```

### Listening for `click`

The `hx-trigger` first listen to `click`, which is actually how the simulation starts; the user clicks any cell. Using `hx-post` this event will HTTP POST to `/cell/{{x}}/{{y}}`. The response will be an updated cell and the `hx-target` is `this`. In other words the response will replace this current cell. `hx-target="this` is actually the default behavior but I left it in here for clarity.

### Listening for updates on neighbors

The rest of the `hx-trigger` declaration sets up this cell to listen for events about neighbors having been updated. It uses some of the other helper functions in the `config/handlebars.js` file (No - it's so weird, but you cannot use `+` and `-` in Handlebars code, so we have to use `add` and `sub`).

Imagine that our cell is at `(4, 4)`. Then the rendered list of triggers would be this:

```html
hx-trigger="click,
  update-cell-3-3 from:body,
  update-cell-3-4 from:body,
  update-cell-3-5 from:body,
  update-cell-4-3 from:body,
  update-cell-4-5 from:body,
  update-cell-5-3 from:body,
  update-cell-5-4 from:body,
  update-cell-5-5 from:body"
```

(Compare with the table above)

All the `update-cell` events from our neighbors, in other words.

The `from:body` tells HTMX to listen for events that are triggered from the body, rather from another element. This is where server side events are triggered from, so that is great!

### Passing data with the request

Great - our cell knows when it is supposed to update. But this is not enough, sadly. In order for the Cell resource to know HOW to update we need to pass it the current state of the cell and the neighbors.

Ordinary we would have kept this state on the server, but we are not doing that here. We are using HTML as the state of the application, remember. Hence each request (`hx-post`) need to pass the state that the resource need to calculate its new state.

This can be done, in HTMX parlor, using [`hx-vals`](https://htmx.org/attributes/hx-vals/) which "allows you to add to the parameters that will be submitted with an AJAX request."

We create a JSON object to post in using `js:` and the fetch the current value from each cell, including ourselves

Sadly this is also a little bit messy to look at since it also is the same list of neighbors.

But again, imagine that our cell is at `(4, 4)`. Then the rendered list of triggers would be this:

```html
hx-vals='js:{
  "state": document.querySelector("#cell-4-4").getAttribute("data-state"),
  "neighbors": [
    document.querySelector("#cell-3-3")?.getAttribute("data-state") ?? null,
    document.querySelector("#cell-3-4")?.getAttribute("data-state") ?? null,
    document.querySelector("#cell-3-5")?.getAttribute("data-state") ?? null,
    document.querySelector("#cell-4-3")?.getAttribute("data-state") ?? null,
    document.querySelector("#cell-4-5")?.getAttribute("data-state") ?? null,
    document.querySelector("#cell-5-3")?.getAttribute("data-state") ?? null,
    document.querySelector("#cell-5-4")?.getAttribute("data-state") ?? null,
    document.querySelector("#cell-5-5")?.getAttribute("data-state") ?? null
  ]
}'
```

`document.querySelector("#cell-3-3")?.getAttribute("data-state")` will get the value of the `data-state` attribute of the `div` with `id="cell-3-3"`, when the `hx-trigger` fires.

The `?? null` at the end guarantees that we don't try to get values of cells outside the grids boundaries. Poor mans guard clause, I guess.

## Calculate new state for a cell

Very cool! Our cell is not ready to listen to `click` an updates to it's neighbors. But the end-point it's posting to `hx-post="/cell/{{x}}/{{y}}` is not implemented yet.

Let's do that now. (Yes I'm using HTTP POST - was thinking about PATCH  or PUT since this is an update but ... hey - it's a demo)

First, let's add the business logic (our [`computeNextState` function from above](#calculate-new-state-for-a-cell)) and put it in a `lib/conway.js` file.

```javascript
const { computeNextState } = require("./lib/conway");

let SIMULATION_SPEED = 1000;
const sleep = (ms) => new Promise((resolve) => setTimeout(resolve, ms));

// Process cell update
app.post("/cell/:x/:y", async (req, res) => {
  await sleep(SIMULATION_SPEED); // Yes, we want to slow it down, I promise

  const x = parseInt(req.params.x);
  const y = parseInt(req.params.y);

  const { state, neighbors } = req.body;

  console.log("########################");
  console.log("Current cell state:", state);
  console.log("Neighbor states:", neighbors);
  console.log("########################");

  const newState = computeNextState(state, neighbors.filter(Boolean));

  res.set("HX-Trigger", `update-cell-${x}-${y}`);
  res.render("partials/cell", {
    layout: false,
    x: x,
    y: y,
    alive: newState === "1",
  });
});
```

Let's walk through it bit by bit.

First **`await sleep(SIMULATION_SPEED);`** is needed, or our server will die of events that happen too fast. We have created a DDOS attack client on our own server, in a way. (I had `delay: 200 ms` on the `hx-trigger` first but that just meant that the events came in bursts, now we are at least slowing it down a bit.)

**`const { state, neighbors } = req.body;`** gets the state and neighbors from the request body, that is; `hx-vals`. I've printed it for my debugging convenience, and they look like this:

```text
########################
Current cell state: 0
Neighbor states: [
  '0', '0', '0',
  '0', '0', '1',
  '0', '1'
]
########################
```

Herein lies a secret of the Game of Life kata; the neighbors can just be a list, the location of them are not important, once you have found them. We just want to know how MANY of them that are alive.

**`const newState = computeNextState(state, neighbors.filter(Boolean));`** calculates the new state for our cell. Notice the `.filter(Boolean)` that filters out _falsy_ values, i.e. `null` that our `?? null` guard clause created. Outside the board should not be counted.

**`res.set("HX-Trigger",`update-cell-${x}-${y}`);`** is how we publish a server-side event to the client. We are now informing anyone that is listening that cell `x,y` has been updated. For the cell `4, 4` the response will now trigger the `update-cell-4-4` event.

**`res.render("partials/cell"**, finally, renders the new state of the cell, using the same partial view as for the initial rendering, but with the new state.

That's it for the endpoint. It was pretty simple since we only had to care about the current cell and not loop over the entire grid.

## Running the simulation

Try it out by starting the server (`npm run dev`), go to <http://localhost:3000> and clicking somewhere in the grid to update that cell.

Open the developer tools in your browser and you will see the events being triggered in the network tab. They come in bursts, due to the delay, the interesting part is the content of each request:

* Notice the request body that contains the `hx-vals`
* Notice the header `hx-trigger: update-cell-19-13` that tells neighbors to update their state
* Notice the response body that is the `cell.hbs` partial with the new state.

Reloading the page will stop the simulation run.

## Extras - Change speed of the simulation

In the end product result in my [repository](https://github.com/marcusoftnet/htmx-game-of-life), I had a little bit of fun and created a slider to change the speed of the simulation. You can see this code in the `views/partials/controls.hbs` partial.

## Conclusion

I found this utterly fascinating to work with. Notice, when we are setting up the events to listen to, for example, that we are expressing part of the algorithm declaratively; these are the events to listen for. This is the power of using Hypermedia as state.

In this case, these events are always the same, but you can easily imagine that we could generate a different list of events based of the state of the Cell resource.

The actual business logic for the Cell update was pretty simple and setting up the state was where the tricky part was.

I learned a lot about HTMX and in particular the `hx-trigger` and `hx-vals` attributes and how to use them in cooperation to get the appropriate data passed to the endpoint.

I hope you found this interesting. Again the code is in my [repository here](https://github.com/marcusoftnet/htmx-game-of-life).