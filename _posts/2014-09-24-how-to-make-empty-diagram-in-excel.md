---
layout: post
title: "How to Make an Empty Diagram in Excel"
date: 2014-09-24
author: Marcus Hammarberg
tags:
  - Tools
  - Life of a consultant
  - Kanban
  - Agile
modified_time: 2014-09-25
thumbnail: /img/board.jpg
blogger_id: tag:blogger.com,1999:blog-36533086.post-2332663668202321971
blogger_orig_url: https://www.marcusoft.net/2014/09/how-to-make-empty-diagram-in-excel.html
---

![Empty Diagram](/img/board.jpg)

If I don't write this down, I will forget it before the end of the day. That right there was the reason I started my blog, ca 900 posts ago.

A couple of days ago, I was, again, creating a [big diagram on a whiteboard](https://www.marcusoft.net/2014/09/ifyoubuildit.html). This particular one was pretty high and a lot of data points had to go into it. It turned out to be hard and messy to both update and read. I have done this so many times that I've lost count. I never found a great solution. I don't want to use a small A3 report because I want everyone to see it. And I don't want to print a big A1 sheet every day because it's too expensive. And I don't want to use a projector because this needs to be physical and tangible. And in front of everyone every day.

Someone suggested to print an empty diagram in a big size and then laminate it with plastic to be able to enter the data on top of the basic diagram.

>"Brilliant idea - let's try it. I'll create an empty diagram in Excel and then we print it!"

I heard myself say. And after ca 2 hours I felt the need to write this blog post. The crux of the matter is that Excel adjusts the diagram to your data... And I wanted to create an empty diagram. Which looked a bit strange. But there's a little trick that makes this very easy.

Let's create a diagram like the one above; to track the number of customers per day and with two horizontal lines showing two important thresholds.

DISCLAIMER: I'm no Excel-guru. This was a pretty fast way, once I found it, to get this done. There's probably more correct ways of doing this.

1. Open Excel and create a new workbook
2. Add data like this:

   | Date | Number of Customers | Threshold 1 | Threshold 2 |
   |------|---------------------|-------------|-------------|
   | 1    | 45                  | 100         | 200         |
   | 2    | 145                 | 100         | 200         |
   | 3    | 80                  | 100         | 200         |

   Keep doing the "dates" until date 31. The data in the columns will determine the height of the Y-axis. The 200 in Threshold 2 will make sure the Y-axis goes to 200.

3. Select all data in the 3 last columns and then click `Diagram -> Line -> Line diagram` which produces an ugly diagram.
4. Now... that requires some formatting:

   - Add some extra helper lines that will prove useful when this is a big, on the wall diagram. Select the "Diagram layout" tab and then Support lines and add the ones you need. I added support lines for sub-scale for both X and Y axis.
   - Add nice text for the axis. Again select the "Diagram layout" tab and choose Axis headings. Now you can add labels for the axis.
   - Add a Diagram heading (Diagram layout tab, then Diagram heading).

5. Once that is done, you might have something that looks like this:

   ![Formatted Diagram](/img/pasien_chart_2.png)

6. Now, let's make this an empty diagram by not removing but hiding the "Number of customers" line. If you remove the line, the diagram collapses or expands depending on where your thresholds are set. But you can hide the line. Here's how:

   - Right click on the line and select "Format data series..."
   - Select "Line" and then "Color"
   - Now in the drop down for color, select No line, which hides it. This leaves you with the line (that is now hidden) selected which might look a bit strange. But just click the diagram and you'll see the whole line go away.

7. Finally, we now have a nice empty diagram that looks like this:

   ![Empty Diagram](/img/empty_chart_1.png)

   What we did with this was to print it in 70x100 cm and laminate it in plastic. Now we can plot in the monthly stats and then erase it for each new month. We also thought about putting it behind glass but decided against it because that would make it much more bulky.

**UPDATED:**
I got a question about the actual printing. I would advise against printing this on several sheets of paper and taping or gluing them together. It will not be straight and probably will mess up your drawing a bit, in my experience. Instead, go to a copy shop and ask them to do this for you. Probably sets you back $4 or so. Well worth it I think. If you're in Sweden go to [Arkitektkopia](http://www.arkitektkopia.se/) - they are great. And if you're in Södertälje, [go to this office](http://www.arkitektkopia.se/kontor/tryckeri-sodertalje/) and you'll get awesome treatment too. Mention my name for a cup of coffee. I'm good for it (my first job!)

I know that I will find this useful later. I hope that you will too.

Oh yeah, [here's my workbook](https://dl.dropboxusercontent.com/u/2408484/emptydiagram.xlsx) so you don't have to start from scratch.
