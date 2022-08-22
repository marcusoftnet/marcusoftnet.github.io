---
layout: post
title: Scraping with Google Sheets for fun and profit
author: Marcus Hammarberg
date: 2019-11-29T10:33:34.000Z
tags:
  - Tools - Life of a consultant
---

Yes, yes ... I know. I do way too much Google Sheets for my good. But that tool is SO amazing. It's becoming my first go-to-tool when it comes to small simple tasks at the office. And it allows us to be more data-driven and visual.

And it's very easy to build aggregation tools for people around the office. For example; the other day we were wondering what kind of technologies that was hot in different cities in Sweden.

From that question, until I've created a simple but powerful tool to scrape data from Indeed.com, presented it with a simple filtering function and got it in the hands of the sales team was 45 minutes.

In the process, I learned about two new friends; [IMPORTXML](https://support.google.com/docs/answer/3093342?hl=en) and the [slicer-feature of Google Sheet](https://support.google.com/docs/answer/9245556?hl=en).

Let me show you what we did.

<!-- excerpt-end -->

[Indeed](http://indeed.com) is a site that aggregates job ads. It's a good starting point for any consultant person that wants to find open positions around the globe.

But sifting through pages upon pages is both boring and labor heavy. Especially if you want to make some kind of reasoning on aggregated data. Like:

> Let's focus on only React jobs in Stockholm but Angular in Gothenburg. There's a difference in how many jobs there are there.

Or

> It is many more jobs out there for Node and C# than for Node and Java

Indeed simple cannot answer that for you unless you make the searches and compare somehow. Weekly, as the information updates frequently.

## Where's the information?

I headed out to the Indeed website and searched for React and Node jobs in Stockholm. And unsurprisingly a list of ads was displayed. Many jobs. Like 170+. I got a paginated result back with 5+ more pages. But on top was the information I was looking for:

>  Sida 1 av 183 resultat

A bit strange formatted but it says: `page 1 of 183 results`. Ok - there are 183 ads for with React as a keyword.

Then I looked at the URL to the page that looked like this:

```text
https://se.indeed.com/jobb?q=react+node&l=stockholm
```

From this, it was simple to figure out that `q=` was the search params and the `l=` contained the location. I tried

```text
https://se.indeed.com/jobb?q=react+angular&l=stockholm
https://se.indeed.com/jobb?q=react+node&l=göteborg
```

And those links worked well too.

## Creating the URL

I now created a Google Sheet with Keywords in column A and Location Column B.

| Keywords | City      |
| --------- | --------- |
| angular   | stockholm |
| vue       | stockholm |
| node php  | stockholm |
| react     | stockholm |

Then it was pretty easy to concatenate the parameters into the URLs above, using the [HYPERLINK-function](https://support.google.com/docs/answer/3093313?hl=en), which I placed in the C-column:

```text
=HYPERLINK("https://se.indeed.com/jobb?q=" & ENCODEURL(A2) & "&l=" & B2)
```

The only thing to note here is that I needed to [ENCODEURL](https://support.google.com/docs/answer/9199778?hl=en) which allows me to accept the Keywords with spaces.

## Get the data

Coolio - now we have links to click. But let's use another Google Sheet function called [IMPORTXML](https://support.google.com/docs/answer/3093342?hl=en), to get the data from the page the URL points to.

I went back to the Indeed search result, now by clicking one of my generated links, and then right-clicked the "Sida 1 av 197 resultat" text, and selected Inspect. This took me to the Google Chrome developers tools, at the location of the  in the HTML document.

In there I can just right click the  again and select Copy -> Copy XPath. In this case I got:

```text
//*[@id="searchCountPages"]
```

On my clipboard. Perfect. This kids is an ancient way to do query selectors in any kind of XML document. It means that we can now get hold of the contents of that cell.

Back to my Google Scraping automation sheet I created a new column, D and enter the following formula:

```text
=IMPORTXML(C2, "//*[@id='searchCountPages']")
```

* C2 - holds the URL for my search of, for example, angular and node ([https://se.indeed.com/jobb?q=angular%20node&l=stockholm](https://se.indeed.com/jobb?q=angular node&l=stockholm))
* The second parameter is the XPath expression we let Google Chrome generate for us

There's a little bit of string parsing to be done, to get the number from the string `Sida 1 av 357 resultat`

```text
=INDEX(SPLIT(D2, " "), 1, 4)
```

Here's the entire table

| Key words  | City      | URL                                                 | Result                 | Hits |
| ---------- | --------- | --------------------------------------------------- | ---------------------- | ---- |
| angular    | stockholm | https://se.indeed.com/jobb?q=angular&l=stockholm    | Sida 1 av 357 resultat | 357  |
| vue        | stockholm | https://se.indeed.com/jobb?q=vue&l=stockholm        | Sida 1 av 123 resultat | 123  |
| serverless | stockholm | https://se.indeed.com/jobb?q=serverless&l=stockholm | Sida 1 av 66 resultat  | 66   |

## Amazing things happen

But now something amazing starts to happen as I change value is Key words and City-columns. The Result-column quickly blinks with "Loading" and then presents the result.

What if I created 10 or 15 jobs in Stockholm and then copied it down to get Göteborg and Malmö. Sure enough ... it works beautifully.

It's pretty cool to play around with.

## Visualize, slice and dice

But not super easy to interpret - let's make a visualization.

I create a Bar chart with all the data in A, B, and D (results) and put it on a separate sheet.

<img src="/img/barchartjobs-unfiltered.png" width="100%" />

But then I remember reading about something called a [Slicer](https://support.google.com/docs/answer/9245556?hl=en). Sure enough, in the Data -> Slicer menu it can be found. The Slicer allows you to do personalized filters of data in charts.

When you create a data slicer it asks you to select a data-range, and I selected all of my data on the sheet where the scraping is being done. The next thing you need to do is to select a column to slice the data on.

Once you are done it looks something like this:

<img src="/img/googleSheetDataSlicer.png" width="100%" />

It works exactly like a filter and filters the data, but with one important difference; it's only for your individual view, and doesn't affect other users.

Also, charts that are using the data range the slicer is operating on is updated. For example; select keywords "node" and "node php" and the city of "Stockholm" will give you the following chart:

<img src="/img/barchartjobs-filtered.png" width="100%" />

## Conclusion

This was a really fun and pretty useful little hack that helped us to become more data-driven in our discussions: I think there are more Angular jobs in Stockholm than there are React jobs in Stockholm can now be answered easily, visualized and updated live.

Psst - no. There are many more React jobs in Stockholm right now.