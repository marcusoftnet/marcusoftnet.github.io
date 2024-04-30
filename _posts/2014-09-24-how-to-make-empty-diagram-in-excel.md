---
layout: post
title: How to make a empty diagram in Excel
date: 2014-09-24T12:18:00.002Z
author: Marcus Hammarberg
tags:
  - Tools
  - Life of a consultant
  - Kanban
  - Agile
modified_time: 2014-09-25T01:33:48.926Z
thumbnail: http://2.bp.blogspot.com/-kixtMADNPsg/VCJKEqjpWxI/AAAAAAAAHig/De1YqMiIcYc/s72-c/board.jpg
blogger_id: tag:blogger.com,1999:blog-36533086.post-2332663668202321971
blogger_orig_url: http://www.marcusoft.net/2014/09/how-to-make-empty-diagram-in-excel.html
---






If I don't write this down I will forget it before the end of the day.
That right there was the reason I started my blog, ca 900 posts ago.

<div class="separator" style="clear: both; text-align: center;">

<a
href="http://2.bp.blogspot.com/-kixtMADNPsg/VCJKEqjpWxI/AAAAAAAAHig/De1YqMiIcYc/s1600/board.jpg"
data-imageanchor="1"
style="clear: left; float: left; margin-bottom: 1em; margin-right: 1em;"><img
src="http://2.bp.blogspot.com/-kixtMADNPsg/VCJKEqjpWxI/AAAAAAAAHig/De1YqMiIcYc/s1600/board.jpg"
data-border="0" width="120" height="200" /></a>

A couple of days ago I was, again, creating a
<a href="http://www.marcusoft.net/2014/09/ifyoubuildit.html"
target="_blank">big diagram on a whiteboard</a>. This particular one was
pretty high and a lot of data points had to go into it. It turned out to
be hard and messy to both update and read.
I have done this so many times that I've lost count. I never found a
great solution.
I don't want to use a small A3 report because I want everyone to see it.
And I don't want to print a big A1 sheet every day, because it's to
expensive.
And I don't want to use a projector because this needs to be physical
and tangible. And in front of everyone everyday.

Someone suggested to print an empty diagram in a big size and then
laminate it with plastic to be able to enter the data on top of the
basic diagram.

> "Brilliant idea - let's try it. I'll create an empty diagram in Excel
> and then we print it!"

I heard myself say. And after ca 2 hours I felt the need to write this
blog post
The crux of the matter is that Excel adjust the
diagram to your data... And I wanted to create an empty diagram. Which
looked a bit strange. But there's a little trick that makes this very
easy.

Let's create an diagram like the one above; to track the number of
customers per day and with two horizontal lines showing two important
thresholds.

DISCLAIMER: I'm no Excel-guru. This was a pretty fast way, once I found
it, to get this done. There's probably more correct ways of doing
this.

Open Excel (I'm using 2010 for Mac, in Swedish for some bisarr reason.
Pardon my translations below) and create a new workbook

Add data like this:

|      |                    |             |             |
|------|--------------------|-------------|-------------|
| Date | Number of Customer | Threshold 1 | Threshold 2 |
| 1    | 45                 | 100         | 200         |
| 2    | 145                | 100         | 200         |
| 3    | 80                 | 100         | 200         |

Keep doing the "dates" until date 31

The data in the columns will determine the height of the Y-axis. The 200
in Threshold 2 will make sure the Y-axis goes to 200. I know that you
can adjust this afterwards if you needed, but this is the quickest way.

 Select all data in the 3 last columns and then click Diagram-\>Line -\>
Line diagram which produce this ugly diagram:

<div class="separator" style="clear: both; text-align: center;">

<a
href="http://1.bp.blogspot.com/-Bge3Yy5MrN8/VCKTBJGeQuI/AAAAAAAAHjQ/yV-dsPr9ztk/s1600/Screen%2BShot%2B2014-09-24%2Bat%2B16.46.30%2B.png"
data-imageanchor="1" style="margin-left: 1em; margin-right: 1em;"><img
src="http://1.bp.blogspot.com/-Bge3Yy5MrN8/VCKTBJGeQuI/AAAAAAAAHjQ/yV-dsPr9ztk/s1600/Screen%2BShot%2B2014-09-24%2Bat%2B16.46.30%2B.png"
data-border="0" width="400" height="182" /></a>

<div class="separator" style="clear: both; text-align: center;">

<div class="separator" style="clear: both; text-align: left;">

Now... that require some formatting:

First let's add some extra helper lines that will prove useful when this
is a big, on the wall diagram.

- Select the "Diagram layout"-tab and then Support lines and adds the
    ones you need.
- I added support lines for sub-scale for both X and Y axis

Secondly let's add some nice text for the axis

- Again select the "Diagram layout"-tab and choose Axis headings.
- Now you can add labels for the axis

While we're at it, let's add a Diagram heading (Diagram layout-tab, then
Diagram heading)

Once that is done you might have something that looks like this:

<div class="separator" style="clear: both; text-align: center;">

<a
href="http://2.bp.blogspot.com/-W3KaKa2-G2s/VCK1SMOIhVI/AAAAAAAAHkI/nihwPdcp3xc/s1600/Screen%2BShot%2B2014-09-24%2Bat%2B19.12.42%2B.png"
data-imageanchor="1" style="margin-left: 1em; margin-right: 1em;"><img
src="http://2.bp.blogspot.com/-W3KaKa2-G2s/VCK1SMOIhVI/AAAAAAAAHkI/nihwPdcp3xc/s1600/Screen%2BShot%2B2014-09-24%2Bat%2B19.12.42%2B.png"
data-border="0" width="320" height="235" /></a>

Now, let's make this an empty diagram, by not removing but hiding the
"Number of customers" line. If you remove the line... the diagram
collapses or expands depending on where you thresholds are set.

But you can hide the line. Here's how:

- Right click on the line and select "Format data series..."
- Select "Line" and then "Color"
- Now in the drop down for color you can select No line, which hides
    it
- This leaves you with the line (that is now hidden) selected which
    might look a bit strange. But just click the diagram and you'll see
    the whole line go away.

Finally we now have a nice empty diagram that looks like this:

<div class="separator" style="clear: both; text-align: center;">

<a
href="http://3.bp.blogspot.com/-iEemWzBhMPs/VCK2LDLgYfI/AAAAAAAAHkQ/Wg11WG6ulxs/s1600/Screen%2BShot%2B2014-09-24%2Bat%2B19.16.30%2B.png"
data-imageanchor="1" style="margin-left: 1em; margin-right: 1em;"><img
src="http://3.bp.blogspot.com/-iEemWzBhMPs/VCK2LDLgYfI/AAAAAAAAHkQ/Wg11WG6ulxs/s1600/Screen%2BShot%2B2014-09-24%2Bat%2B19.16.30%2B.png"
data-border="0" width="640" height="392" /></a>

What we did with this was to print it in 70x100 cm and laminated it in
plastic. Now we can plot in the monthly stats and then erase it for each
new month. We also thought about putting it behind glass but decided
against it because that would make it much more bulky.

**UPDATED:**
I got a question about the actual printing. I would advise against
printing this on several sheets of paper and taping or gluing them
together. It will not be straight and probably will mess up your drawing
a bit, in my experience.
Instead, go to a copy shop and ask them to do this for you. Probably
sets you back $4 or so. Well worth it I think. If you're Sweden go to
<a href="http://www.arkitektkopia.se/" target="_blank">Arkitektkopia</a> -
they are great. And if you in Södertälje
<a href="http://www.arkitektkopia.se/kontor/tryckeri-sodertalje/"
target="_blank">go to this office</a> and you'll get awesome treatment
too. Mention my name for a cup of coffee. I'm good for it (my first
job!)

I know that I will find this useful later. I hope that you will too.

Oh yeah,
<a href="https://dl.dropboxusercontent.com/u/2408484/emptydiagram.xlsx"
target="_blank">here's my workbook</a> so you don't have to start from
scratch.
