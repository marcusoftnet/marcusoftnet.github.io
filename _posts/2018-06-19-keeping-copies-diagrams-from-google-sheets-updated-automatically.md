---
layout: post
title: "Keeping Copies of Charts from Google Sheets Updated Automatically"
author: "Marcus Hammarberg"
date: 2018-06-19 10:06:29
tags:
  - Tools
  - Life of a consultant
---

At my current job, we heavily rely on Google Apps (Docs, Slides, Sheets, etc.). I've grown quite fond of them, especially the seamless integration between different apps. One of my favorite features is the ability to create a chart in Google Sheets and easily copy it to Google Slides for presentations.

Today, I want to share a small hack I've implemented to keep those slides updated automatically. This is particularly useful for dashboards or presentations displayed in a kiosk-like setup.

## Copying the Chart

When copying a chart from Google Sheets to Google Slides, there are two options: as a picture or as a link. For our purpose, we want to use the link option:

1. Open the spreadsheet containing the chart you want to copy.
2. Click on the chart and then click the three dots (...) in the top-right corner.
3. Select "Copy chart."
4. Open the document or presentation where you want to paste the chart and press Ctrl+V.
5. When prompted, choose "Paste as link."

## Writing the Code

After pasting the chart as a link, you'll notice that it doesn't update automatically when the data changes. To achieve automatic updates, we need to write some code.

Open the Script Editor for your Google Sheet (Tools -> Script Editor) and paste the following code:

```javascript
function refreshCharts() {
  var slides = SlidesApp.getActivePresentation().getSlides();

  for (var I = 0; I < slides.length; i++) {
    var slide = slides[i];
    var charts = slide.getSheetsCharts();

    for (var j = 0; j < charts.length; j++) {
      var chart = charts[j];
      chart.refresh();
    }
  }
}
```

Save the script. Remember to give the project a name when prompted.

## Setting the Trigger

Now that we have the code, we need to set up a trigger to run it at regular intervals. Google Apps provides a feature called triggers for this purpose.

In the Script Editor, open the "Current Triggers" option from the Edit menu. Click on the link to create a new trigger. Configure the trigger to run the `refreshCharts` function every hour.

## Permissions

You may encounter errors related to permissions. If prompted, grant the necessary permissions for the script to run.

## Enjoy the Show

Sit back and relax! Your charts will now update automatically every hour, ensuring your presentations are always up-to-date with the latest data.

## Conclusion

In this post, I've demonstrated how to link charts in Google Slides to the underlying data in Google Sheets and keep them updated automatically. By creating a simple function and setting up a trigger, you can ensure your presentations reflect real-time information without manual intervention. I hope you find this tip useful!
