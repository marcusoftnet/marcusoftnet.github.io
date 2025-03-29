---
layout: post
title: "Next.JS Error: No router instance found"
author: "Marcus Hammarberg"
date: 2021-05-29 22:43:03
tags:
 - Javascript
 - Programming
---

I ran into a stupid problem I created for myself. And then I solved and that made me realize a thing about [Next.JS](https://nextjs.org/) and the server side rendering features of this framework.

I wanted to share my failures and solution to the problems I created here.

<!-- excerpt-end -->

I have a page that is server-side rendered, since I'm the `getServerSideProps`.

One of the components on the page, reach out and grabs the router:

```javascript
import { useRouter } from 'next/router';

const Header = () => {
  const router = useRouter();
}
```

And I then added a click-handler like this:

```javascript
<div onClick={router.push('/')}>
  ...stuff
</div>
```

And it blew up, with a very nice, but ultimately not helpful error message:

### Error: No router instance found. you should only use "next/router" inside the client side of your app.

So this [error even has an page](https://nextjs.org/docs/messages/no-router-instance) on the Next.JS site and it's helpfully trying to tell me that I'm using the `router` on the server-side. It also sent me down the wrong route (hehe sorry) to try to create the routing in the `useEffect` hook.

When in fact the solution was much easier

### The solution - declare the function. Don't call it

As I've written the function now, the `router.push('/')`will be called on server-side rendering, since I'm invoking the `router.push` But that's not what I want. I want it to be called when the user clicks. This should be done like this:

```javascript
<div onClick={() => router.push('/')}>
 ... stuff
</div>
```

And I had one of those .... BUT OF COURSE.

But then I realized how much sense it made - the server side rendered version should just render the function to be executed when the user clicks the div. Not execute the function. A bit like the difference of declaring a callback and actually calling it.

A simple slip-up but the reflection made me think about what server side rendering is and I learned some more. WIN.

I hope you found this useful.