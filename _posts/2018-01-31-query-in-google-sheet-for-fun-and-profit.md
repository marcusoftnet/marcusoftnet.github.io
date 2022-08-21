---
layout: post
title: "Summarizing and filtering data with QUERY and a Google Sheet drop-down"
author: "Marcus Hammarberg"
date: 2018-01-31 13:11:41
tags:
 - Tools
 - Life of a consultant
---

I had another opportunity to learn a thing or two about Google Sheets and it's internal functions. Again. [On a similar topic as last time](http://www.marcusoft.net/2018/01/create-a-dynamic-updated-chart-in-google-sheets.html).

This time around I had to summarise the data from 4 different sheets and then let the user filter the data dynamically.

To do this, I had to look up a lot of things, learn a little bit about the [QUERY-function](https://support.google.com/docs/answer/3093343?hl=en) and then jump through some hoops. I write this down here so that I don't have to learn this again. You can read it if you want to.

<!-- excerpt-end -->

I've created a [sheet with some example data](https://docs.google.com/spreadsheets/d/1h3_WRE2cgLy-8X4gm_DGE6NvYLfl7fbaip_SGVFMv3k/edit?usp=sharing), similar but not the same as the data we had. This was also, as [last time](http://www.marcusoft.net/2018/01/create-a-dynamic-updated-chart-in-google-sheets.html), a survey about the state of our office that we needed to summarise for a meeting.

We had asked for input and asked people to classify the data in 4 areas; "Urgent", "Great stuff", "Could be improved" and "General questions". Each of these was listed on a tab each.

As often, when you ask - you get answers. A lot of answers. So we went through the list of comments and added Category to each. For example, if it was about the fridge we added "Kitchen". Comments about the dustbins were tagged with "Cleaning" etc.

That was great, but now we created another problem. Because all of a sudden a need to see all the comments about the kitchen, regardless of area, arose. That was a bit tricky to do now as each Area had its own sheet.

What I wanted to do was to create a possibility for a user to select a category and see all the comments, urgent things, questions etc. for that category.

Here's what we going to do:

* Make a drop-down list with the categories - containing all the unique categories that the users have entered
* When the user selects a category, get all the rows from all the sheets and display them

## Making a drop-down list of categories

Making a drop-down list is not that hard, as you basically can just make a data validation of a cell that only allows the user to select the correct values. For example:

* Click the cell where the drop-down box should be displayed. I have it in `C2`
* Go Data => Data validation … to open the dialog box to create the data validation
* Select the range where the data for the drop-down box is located and enter it in Criteria …

However, there's a problem here because you cannot enter a formula into the Criteria-text box. Nor can you (easily) enter multiple ranges. Remember that we want all the unique values from all the sheets in our workbook.

But you can hack this. I created a new list in Column A of the [summary sheet](https://docs.google.com/spreadsheets/d/1h3_WRE2cgLy-8X4gm_DGE6NvYLfl7fbaip_SGVFMv3k/edit#gid=1544983361), containing all the unique values for Category. This can be accomplished by the following formula:

```
=UNIQUE({'Urgent Disaster'!B2:B;'Great things'!B2:B;'Could be improved'!B2:B;'General questions'!B2:B})
```

There are a few moving parts here.

* First. `UNIQUE` is, of course, a formula that picks out the unique values of a range. Nothing strange.
* The next part is a bit funky, but using curly brackets like that. But that's just how you can concatenate many ranges together. They have to be structured the same way for Google Sheet to make any sense of it, but that is most likely what you need too.

Fine - now we have the unique values listed in Column A of the [Summary-sheet](https://docs.google.com/spreadsheets/d/1h3_WRE2cgLy-8X4gm_DGE6NvYLfl7fbaip_SGVFMv3k/edit#gid=1544983361). Now it's easy to set up a drop-down list. Let's do that again:

- Click the cell where the drop-down box should be displayed. I have it in `C2`

- Go Data => Data validation … to open the dialog box to create the data validation

- Select the range (`A2:A`) where the data for the drop-down box is located and enter it in Criteria

- Click Save

We now have a drop-down list with the unique categories, based on the data the users entered. Next!

## Summarise the data based on the selection in the category drop-down

In order to get this to work, we are going to use the [`QUERY`-formula](https://support.google.com/docs/answer/3093343?hl=en). This is a super powerful formula that allows us to pose complex queries over ranges. It can be quite daunting but don't worry, I'll be here to hold your hand. We'll make it together!

The moving parts of `QUERY` are pretty simple, it just needs two things:

* A range, where the raw data is located. This is all the data in all sheets for us
* A query to structure, filter and order the data. This is much like SQL if you ever used this. There's a [great description of the query language here.](https://developers.google.com/chart/interactive/docs/querylanguage)

### Make one big range!

The first part needs a trick, that we already used. We will concatenate all the data using the array concatenation syntax we used before `{Range1;Range2}`. Here's the query that I have:

```
{'Urgent Disaster'!A:D; 'Great things'!A:D;'Could be improved'!A:D;'General questions'!A:D}
```

Quite simple, make one big range out of `A:D` (all rows) in those four sheets.

### Make a query

Great - now we're going to write the query itself.

Normally we would use the column names in our query. Like this, for example;

````sql
SELECT A WHERE B > 14
````

(Get all the values from the A column where B is above 14).

Since we have concatenated a few sheets, the concept of column names will not be stable. In one sheet the data we are interested might be located in other columns, right? In our, well-structured workbook it is not, but imagine that the range we made looked like this:

```
{'Urgent Disaster'!A:D; 'Great things'!B:E;'Could be improved'!C:F;'General questions'!D:G}
```

The format of the dataset will be something like

| Col1                                     | Col2                                     | Col3                                     | Col4                                     |
| :--------------------------------------- | :--------------------------------------- | :--------------------------------------- | :--------------------------------------- |
| `'Urgent Disaster'!A`s +  `'Great things'!B`s +  `'Could be improved'!C`s +  `'General questions'!D`s | `'Urgent Disaster'!B`s +  `'Great things'!C`s +  `'Could be improved'!D`s +  `'General questions'!E`s | `'Urgent Disaster'!C`s +  `'Great things'!D`s +  `'Could be improved'!E`s +  `'General questions'!F`s | `'Urgent Disaster'!D`s +  `'Great things'!E`s +  `'Could be improved'!F`s +  `'General questions'!G`s |

Selecting column `A` now would be strange at. We want to select the first column in the data set we have constructed with this concatenation. We can use this knowledge to shape differently shaped data into one common structure.

Luckily there's a well-hidden, way to change our query to refer to the order of the columns in the data our range has.

Let's write a query, that will help us to get the right columns and do the filtering:

```sql
SELECT Col4, Col2,Col1,Col3 WHERE Col2='Kitchen'
```

Note here:

* I can refer to the columns with `Col` and then the number in the dataset. Hence the funky naming I used in the table above
* I can order or shape the format of the returned data by just indicate the order of the columns in my `SELECT`. See how I used `Col4` first. That column has the `Area` data which is best to start with I think.
* In the `WHERE`-clause I still refer to the columns by number. `Col2` is the category column in this example. I've hardcoded this to be 'Kitchen'

### Use the data the user selected

This is cool but there's a part left. We want to use the value the user selected in the drop-down box. Remember? The one in `C2`. Let's update the query to use that data, instead of our hardcoded `Col2='Kitchen'`.

```sql
SELECT Col4, Col2,Col1,Col3 WHERE Col2='"&C2&"'
```

We basically just create a string with the value in `C2` the `&`-sign

### Put it in your pipe and smoke it!

Finally - put it all together in one big `QUERY`- formula. You can do it! Like this:

```
=QUERY({'Urgent Disaster'!A:D; 'Great things'!A:D;'Could be improved'!A:D;'General questions'!A:D}, "SELECT Col4, Col2,Col1,Col3 WHERE Col2='"&C2&"'")
```

Hit Enter and you should see the data being displayed.

Select another value in `C2` and the data should be updated.

## Conclusion

Pretty cool - this is like a little data warehouse application in Google Sheets.

I know I will go back here. I hope you found it useful.

My [Google Sheet is found here](https://docs.google.com/spreadsheets/d/1h3_WRE2cgLy-8X4gm_DGE6NvYLfl7fbaip_SGVFMv3k)