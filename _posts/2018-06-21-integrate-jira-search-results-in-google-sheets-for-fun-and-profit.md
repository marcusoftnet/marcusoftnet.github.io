---
layout: post
title: "Integrate JIRA search results in Google Sheets for fun and profit"
author: "Marcus Hammarberg"
date: 2018-06-21 13:55:11
tags:
 - Tools
 - Agile
 - Lean
 - Scrum
 - Kanban
  - Life of a consultant
---

As an agile coach working in bigger companies you are sound exposed to [JIRA](https://www.atlassian.com/software/jira). JIRA - a tool that started out as a good idea and then grew into … a not as good idea.

But hey - we got to live with it, I suppose.

`</rant>`

In this post I wanted to show you how to easily import data from a JIRA query to Google Sheets (or Excel I presume). That is, in all honesty, not that complicated so I will share a few other tips around this whole process.

In short:

> Tweaking export of JIRA data for fun and profit

<!-- excerpt-end -->

## Creating a filter

[JIRA](https://www.atlassian.com/software/jira) has a really powerful tool in searching for issues, through it's query langauge [JQL](https://www.atlassian.com/blog/jira-software/jql-the-most-flexible-way-to-search-jira-14). If you head on to the search feature (Issues -> Search for issues) we can try something out:

```
Resolution is not empty and labels in (roar-subzero-tech, wtp-unplanned)
```

This will return all tickets that is closed (has a Resolution) with the labels `roar-subzero-tech` or `wtp-unplanned`.

This is really cool, but very … volatile. Let's store this query by creating a filter. Click `Save as` and give it a name. I named my `tech-items-for-roar-subzero`.

Perfect it's is now stored and got an id so that you can get back to it via a URL, and a name. Mine go `https://{serveraddress}/issues/?filter=30966`

Another great thing is that this filter now have, what's known as a canonical name; it's like a definition if you like.

> Go here and you will get all the tech items for roar-subzero

This mean that should we change the definition we just change this filter query and everyone can keep using it.

Fun fact: I actually just change that filter to this

```
Resolution is not empty and labels in (roar-subzero-tech)
```

As I understand more about how we report issues in JIRA.

### With data from other filters

Now considering a case where you have many teams in an organsations; `roar-subzero, roar-counters, roar-reporters, roar-core`, to make a few up. What if I want to see all the resolved tech-items for all of these, but they have different definitions for what a tech item is?

Ha! This is easy: just make a filter like above and then use that in a filter of filter query like this:

```
filter in (tech-items-for-roar-subzero, tech-items-for-roar-counters, tech-items-for-roar-reporters, tech-items-for-roar-core)
```

By doing this we can easily combine filters in to build higher-order filters. The definition of what each of this mean lives in their own filter definition and can change independently for this higher order function.

I stored that as `tech-items-for-roar`

### With the data for the last couple of days

But we can do more, since that now is a lot of items (potentially) we need to filter it down a bit.

I created yet another filter that I called `tech-items-for-roar-last-month` and wrote it like this:

```
filter in (tech-items-for-roar) and resolved > -30d
```

 Which gives me all the tech items that has been resolved, within all of the roar organisation, the last 30 days.

The first filters returns all the data and this filter adds a dynamic limition on data. We could also have done that dynamically, by simply just running the JQL-query above in the search-box.

### With the right columns

Now, the default columns are great for reading this long list of items, but I want to do some stats of this and basically just need the key of the issue, the creation date and the resolution date, in order to calculate what I need.

If you check to the right of the search there's a link for columns. Unfold that and click the  `Filter`-button.

<img src="/img/columns.png" width="100%" />

The UI is very tricky discover here I think, but now we have an option to select the columns we want to store for this filter. There's a `My defaults` option too, which represents the columns you will get for a normal search or a new filter.

From above you can see that I've selected just the bare minimum I want to use for this filter when doing stats.

The cool part is that I can flip between this by clickning the button. If someone open this filter and have a hardtime understanding that data is (as it only contains keys now), they can flip over to their defaults and see the full description. Or rather with the columns that makes sense to them.

Ok - but we want to store these column with the filter. Select the columns you are interested in and it will be save automatically.

### With the right permissions

Just a heads up; I **always** forget to set the right permissions for the filter before I share it. Be sure to click the `Details -> Edit permissions` link next to the filter name and set the permissions to something useful.

I always select `Any logged in user` unless it's really sensetive.

## Get the data into Google Sheets

Fine! We have a lovely filter that you can go to and look at all the issues. JIRA is really good at listing a long list of issues, you know. Sadly the useful use cases for long list of issues is very limited. We need to crunch this data somehow.

This can be done by exporting the data to a suitable format and then doing the data crunching in another tool. We are going to do that with Google Sheet.

### Exporting the data to CSV

Exporting the list of issue is super-simple; click the `Export`-button and select `CSV (Current fields)` to get the fields currently displayed. Ensure that you have the fields of the filter selected.

<img src="/img/exportcsv.png" width="100%" />

Now this is cool, but requires us to go to this page and click these buttons everytime. That's cumbersome and tedious so let's do a bit better.

Do that again, but this time **right-click** `CSV (Current fields)` and copy the link address. You should have something like this on you clipboard:

```
https://{serveraddress}/sr/jira.issueviews:searchrequest-csv-current-fields/30966/SearchRequest-30966.csv
```

Open a new tab in your browser and paste that link in the address bar. Hit enter. See? That file got downloaded. This is great.

## Get the data to Google Sheets

Because now we can just create a nice little link in [Google Sheets](http://sheets.google.com/) to download the data.

Let's create a new sheet ([you can copy mine](https://docs.google.com/spreadsheets/d/138TWhYwnrK47OKUIrE-q7eknLYoDBZyhVieFFCWYSfA/edit?usp=sharing)) and test it out. We're going to make a chart showing the lead time for each issue.

###Documentation driven development

On the first sheet let's write the instructions.

1. Make a list of numbers (1-3) in column A
2. In Cell B1 enter this: `=HYPERLINK("https://{serveraddress}/sr/jira.issueviews:searchrequest-csv-current-fields/30966/SearchRequest-30966.csv","Get data here")`
3. In B2 write: "Open Jira Raw-tab and select A1"
4. In B3 write: "Import data and select Replace at current cell"

These simple instructions is all we need to do in order to produce some nice diagrams on both throughput and lead time.

Try it out now. When you click the link in B1 you will not be surprised to see that the file is downloaded for you. Just as we practices

Then select the A1 cell of the "JIRA Raw data"-sheet and open File -> Import … and upload that file. In the following dialog box ensure that you replace the data at the location you are at.

Leave the rest of the values as is and you will notice that Google Sheets places everything nicely in columns.

### Crunching the data

Now we have the same list of issues in Google Sheets, which is not particular helpful so let's start crunching it. I have prepare one before and [you can take a look here](https://docs.google.com/spreadsheets/d/138TWhYwnrK47OKUIrE-q7eknLYoDBZyhVieFFCWYSfA/edit#gid=70371573) to see what I'm doing below.

I usually colors calculated cells in another color to indicate that it's not to be touched

My sheet has 10 calculated columns. First 4 calculations  per row:

* **Link**  (`=HYPERLINK("https://{serveraddress}/browse/"&A2,A2)`) - I've found it very useful to have a link back to the issue if you want more details. It's easy to create from the key, found in column A
* **Leadtime in days** (`=DATEDIF(C2,D2,"D")`) - this is a simple way to calculate the lead time, by just subtracting the Created date from the Resolved date. The `"D"` parameter means that it's dates. Just subtracting the dates will give you fractional days
* **Week completed** (`=WEEKNUM(D2)`) - this formula get the week for the Resolved date. it can be used to see how many items we finished each week, as we will see later. This is throughput / week
* **Month completed** (`=Month(D2)`) - unsurprisingly this just calculated the month for the Resolved date. Throuput / month in other words

I've then aggregated the weeks and months in the following columns like this:

* **Weeks** (`=SORT(UNIQUE(G2:G))`) - this lists all the unique weeks found in the raw data. I then sort the data to get them in descending order
* **Completed** (`=CountIf(G:G, J2)`) - here I just count the number of items with the week in `J2`, meaning that I get a count per week as it rolls down.
* **Target** - this is just a static number to draw a straight line. How many thing are we aiming to achieve per week? Measuring things without a target is very boring and people lose interest quickly.

Then I've done the same thing, but for months, in the last three calculated columns.

### Drawing the diagrams

Cooler again - but still no cigar. Let's make a [few visualizations of it too](https://docs.google.com/spreadsheets/d/138TWhYwnrK47OKUIrE-q7eknLYoDBZyhVieFFCWYSfA/edit#gid=1369250284).

#### Throughput per month

- Select the column N-P, all rows.
- Go Insert -> Chart (or use the button for Chart)
  - The data range should be `N1:N1000,O1:P1000`
- Move the Months an X-axis series
  - Remove it from the Y-axis series
  - Add it (click the grid-icon) as an X-axis series
- Select the diagram type to be Smooth line chart
- I made some additional formatting in my diagram
  - Adding data labels to see the value better
  - Added more help gridlines for X and Y axis
  - Made the target dashed
  - Gave it a title
  - etc
- Finally I copied the diagram over to the Diagram sheet.
  - Make sure to use the Copy function on the diagram when doing this.
  - And to remove the diagram from the JIRA Raw data sheet, so it doesn't clutter it

#### Througput per week

Seriously … exactly the same as above. Only use the data from `J1:L1000`. You'll be fine.

#### Leadtime per issue

Ok as the final diagram let's plot the leadtime, how long each item takes to complete (in days, mind you)

* Select Column D (Resolved) and F (Leadtime in days)
* Go Insert -> Chart (or use the button for Chart)
  - The data range should be `D1:D1000,F1:F1000`
* Select a Scatter chart (it's way down in the list of diagrams)
* Make sure you add a Polynominal trend line for the Leadtime in days series.
* I did a few other adjustments too that you can [see in the sheet](https://docs.google.com/spreadsheets/d/138TWhYwnrK47OKUIrE-q7eknLYoDBZyhVieFFCWYSfA/edit#gid=1369250284)

## Conclusion

Here's the diagrams we created

<img src="/img/diagrams.png" width="100%" />

Now that is, in itself, not particulary impressive. But consider how easy this is made up to date.

This is litterally what I do, once a week:

* Open the Google spreadsheet for our stats
* Click the link in B1 on the Instruction sheet
  * That downloads a file with the raw data, based of a filter that is kept in JIRA
* Import the downloaded file to the JIRA raw data sheet
* Done

It takes me about 10 seconds. And I'm pretty sure it can be totally automated - but I'll leave that for another post.

I hope you found this useful.