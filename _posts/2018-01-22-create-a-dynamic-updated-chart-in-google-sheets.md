---
layout: post
title: "Create a dynamically updated chart in Google Sheets"
author: "Marcus Hammarberg"
date: 2018-01-22 13:47:04
tags:
 - Tools
  - Life of a consultant
---

When I started my blog, almost 12 years ago, I often wrote posts of things that I would need to look up again. Sure enough, I sometimes stumble into my own posts when searching for solutions to problems I have.

This post is one of those posts. I was asked to conduct a survey throughout our department and needed to do some slicing and dicing of the stats. I used [Google Forms](http://forms.google.com/) to collect the data and then did the analysis in [Google Sheets](http://sheets.google.com/).

It all came out pretty nice and allowed people throughout the department to drill down into the data in a quick and simple way.

<!-- excerpt-end -->

I will not talk about the form since that was very easy to set up. Only know that [Google Forms](http://forms.google.com/) store its data in [Google Sheets](http://sheets.google.com/). This means that it's pretty simple for us to continue to process the data.

Also, there's a nice basic summary of the responses, that for the most part is enough. But I wanted another dimension that was dependent on the answer to one of the questions.

The data that I collected looks like this:

| Team   | Question 1 | Question 2 | Question 3 |
| ------ | ---------- | ---------- | ---------- |
| Team 1 | 1          | 6          | 1          |
| Team 2 | 3          | 3          | 3          |
| Team 1 | 2          | 4          | 4          |
| Team 3 | 4          | 2          | 6          |
| Team 1 | 6          | 3          | 6          |

Meaning; there are a couple of scale-questions (1-6) and one question for which team you are in. The obvious question for this data is of course:

> Can I get the result per team?

And me myself I wanted to see the result grouped in thirds (how many vote 1-2, how many 3-4 and how many vote 5-6).

This is not too hard to do and even get some nice graphs to show the result in. [Here's a Google Sheet](https://docs.google.com/spreadsheets/d/1aSel__vOK1u3Njsl9_SMKLlIRETY1RXo5V1vtYf_KJ4/) where I'm playing around with this.

## Step 1 - Create sheet for the stats

All the data from a survey ends up in a Google Sheet called ["Form Responses"](https://docs.google.com/spreadsheets/d/1aSel__vOK1u3Njsl9_SMKLlIRETY1RXo5V1vtYf_KJ4/edit#gid=0) or something like that. I have created a heet like that, but there's no connection to a form now. Doesn't matter for our purpose. This sheet is now our raw-data and we will not touch it, as it gets the data from the Form.

After that I just added a new ["Stats"-sheet](https://docs.google.com/spreadsheets/d/1aSel__vOK1u3Njsl9_SMKLlIRETY1RXo5V1vtYf_KJ4/edit#gid=51274800) where we will make our calculation. To start with I made something really simple; just the average for each question. That is two columns that looks like this:

| Value                | Average                        |
| -------------------- | ------------------------------ |
| ='Form Responses'!C1 | =Average('Form Responses'!C:C) |
| ='Form Responses'!D1 | =Average('Form Responses'!D:D) |
| ='Form Responses'!E1 | =Average('Form Responses'!E:E) |
| Totals               | =AVERAGE(B3:B5)                |

Nothing fancy at all here. Just getting started.

* In Column A we are copying the question titles
* Column B contains the average. Note that it contains all the values from `Form Responses'!C:C`, including the question title. But the `Average`-function is of course smart enough to ignore the not numeric values

## Step 2 - Some grouping

All though the Responses feature of Google Forms has a nice auto-summary, I wanted to make some other, arbitrary, grouping of the results. Here's my thinking:

* 1-2 - detractors. They didn't really like whatever this question was about
* 3-4 - the Meh's. These respondents are a little bit either or…
* 5-6 - the attractors. These people really liked whatever we asked about.

In order to do this we need to use another function; `CountIf`, that counts the number of rows that matches a criteria. Here's an example row to get these values:

| Value      | 1-2                                  | 3-4                                    | 5-6                                 | Total     |
| ---------- | ------------------------------------ | -------------------------------------- | ----------------------------------- | --------- |
| Question 1 | =CountIf('Form Responses'!C:C,"<=2") | =CountIf('Form Responses'!C:C,">2")-G3 | =CountIf('Form Responses'!C:C,">4") | =C3+E3+G3 |

* 1-2 - I just count the rows that have a value less or equal to 2 (`<=2`)
* 5-6 - I just count the rows that have a value higher than 4 (`>4`)
* 3-4 - I count the rows that have a value above two (`>2`) and then subtract the number of 5-6.
* I then added a total for the total number of answers for this question

Nothing strange there and I even added a column with percentages for each group, that ended up not using. It was as easy as just diving the number of responses with the total (`=G3/I3`, for example).

## Step 3 - Visualising totals

Let's make a diagram out of that to show our result.

* Select the data you want to include by holding down CTRL/CMD and selecting the data. This way you can select data that is not next to each other. For my sheet, I selected `A1:A5,C1:C5,E1:E5,G1:G5`
* Click the button for Insert Chart (or in the menu Insert => Chart)
* Do some formatting of the labels, legend etc.
  * I removed the Horizontal axis title
  * Put the Legend on the bottom
  * And updated the Title of the Chart to `Spread of values - all teams`

This gave me a nice graph that looks like this and is a good start.

<iframe width="488.5" height="302.05583333333334" seamless frameborder="0" scrolling="no" src="https://docs.google.com/spreadsheets/d/e/2PACX-1vRmafos4hXNR2xJxecFkqa2HHUOftLjx5uysbk8Idxx3TF8tLtwG5ngE8B1DGyYUwEaVhhhnwn0zQ_M/pubchart?oid=1615789057&amp;format=interactive"></iframe>

This is all too simple. Let's be a little bit more daring

## Step 4 - Slice it per team

Now, the whole idea was that we could slice this per team. In order to do this, I copied the cells `A2:I2` down a new area where we can do this slicing. Mine ended up in `A17:I21`

### Create drop down

I then added a new cell with a drop-down-box for the teams. This is easily done with a feature called data validation:

* Click the cell you want the data in, in my case `J18`
  * I added a heading at `J17` : "Team"
* Click the menu Data and then Data validation
  * Select Criteria "List from a range"
  * Enter the column with the Teams, in my case `'Form Responses'!B:B`
  * Click OK to create a drop-down list of the team names

A nice little trick here is to ensure that you start from the second row in the range because the first row probably contains the title of the question (`Team`) in this case. You can easily do that by giving the range `'Form Responses'!B2:B`.

Pretty nifty; start on B2 and use the entire column.

### Average per team

Ok that was nice but let's use the value that the user selected in a formula. Let's start with the average. Now we are going to do average only for the rows that match the selection in `J18`. For this, there's a handy function called `AverageIf` which runs average on the rows that match a criteria.

Here's an example row:

| Value                | Average                                  |
| -------------------- | ---------------------------------------- |
| ='Form Responses'!C1 | =AverageIf('Form Responses'!B:B, $J$18,'Form Responses'!C:C) |

Let's dissect the `AverageIf` formula a bit:

* The first part (`'Form Responses'!B:B`) is the range we are going to evaluate our criteria again. "If *these* rows matches"
* The second part (`$J$18`) is the criteria itself. In this case just: "Same value that is in J18"
  * The $-signs is just a way to make sure that it's always `J18` even when you copy the formula to another cell
* The final part (`'Form Responses'!C:C`) is the values to run average on.

The whole thing could be read like:

> Get all rows whose B-value matches J18 and give me the Average of the values in the C-column

### Counts per team

Now let's do the same thing to count the 1-2, 3-4 and 5-6 values. This is not as easy it turns out. Because, if you remember we used `CountIf` to count the values. We need a way to evaluate more than one criteria.

Enter `CountIfs` that does precisely that. Here's an example formula, to count 1-2 for a certain team:

```
=CountIfs('Form Responses'!C:C,"<=2", 'Form Responses'!B:B, $J$18)
```

Let's dissect that too - it is not that complicated:

* The first part (`'Form Responses'!C:C,"<=2"`) is the same as we did in the total section. Count all the values in `'Form Responses'!C:C` that is less or equal to 2
* The second part (`'Form Responses'!B:B, $J$18`) is just another criteria of the same kind; count all the values in `'Form Responses'!B:B` that is equal to `$J$18`, the dropdown-box with a team name

The trick is that these two criteria are connected with an AND;

> Count all the items that have C values less or equal to 2 AND that has B-values equal to J18

Do the same for the other formulas (3-4 and 5-6), before continuing:

* `=CountIfs('Form Responses'!C:C,">2", 'Form Responses'!B:B, $J$18)-G18`
* `=COUNTIFS('Form Responses'!C:C,">4", 'Form Responses'!B:B, $J$18)`

Nice!

You can now try it out by select different teams in J18, which should update the values for the formula.

### Watch out

I noticed that in order to do this *change* people need to be able to *change* the Google Sheet if you share it with others. That is pretty obvious when you think about it, but I forgot to set that when I sent it out.

## Step 5 - Charts, charts, charts

Let's, **finally**, use all of this for something useful. Let's create a graph similar to the one above, but only for the team that the user has selected.

* As before, this requires some tricky selection using the CTRL/CMD key and selecting the `A16:A20,C16:C20,E16:E20,G16:G20` values.
* The rest is the same as before:
  * Click the button for Insert Chart (or in the menu Insert => Chart)
  * Do some formatting of the labels, legend etc.
    - I removed the Horizontal axis title
    - Put the Legend on the bottom
    - And updated the Title of the Chart to `Spread of values - selected team`

Now the user can change team in the `J18`-dropdown box and see the graph update itself. Like a nice little reporting tool. Here's how the graph looks for me:

<iframe width="600" height="371" seamless frameborder="0" scrolling="no" src="https://docs.google.com/spreadsheets/d/e/2PACX-1vRmafos4hXNR2xJxecFkqa2HHUOftLjx5uysbk8Idxx3TF8tLtwG5ngE8B1DGyYUwEaVhhhnwn0zQ_M/pubchart?oid=505773454&amp;format=interactive"></iframe>

# Summary

I learned a lot about Google Sheets and the formulas I used by trying to figure this out. I hope you did too.

[My sheet is found here](https://docs.google.com/spreadsheets/d/1aSel__vOK1u3Njsl9_SMKLlIRETY1RXo5V1vtYf_KJ4/edit?usp=sharing). If you want to play around you can duplicate it and play around with it.