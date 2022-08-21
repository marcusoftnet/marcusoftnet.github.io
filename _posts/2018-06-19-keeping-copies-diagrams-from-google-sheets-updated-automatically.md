---
layout: post
title: "Keeping copies of charts from Google Sheets updated automatically"
author: "Marcus Hammarberg"
date: 2018-06-19 10:06:29
tags:
 - Tools
 - Life of a consultant
---

At my current gig, we are using [Google Apps](https://docs.google.com/) (Docs, Slides, Sheets etc) a lot. I'm getting quite fond of it.

My favourite part is the sharing between the apps. I create a nice diagram in Google Sheets and then I can easily copy it to Slides to present easier.

In this short post, I wanted to walk you through how I've made a very small hack to keep those slides updated automatically. This is really handy if you're doing a dashboard, or presentation that is running in a kiosk of sorts.

<!-- excerpt-end -->

### Copy the chart

The first thing to notice that there are two ways to copy/paste a chart; as a picture and as a link. For this use case, you want to use a link. Here's how:

1. Open the spreadsheet that contains the diagram you want to copy
2. Click on the diagram and then click the three dots `...` in the right corner
3. Select `Copy chart`
4. Open the document (or presentation) where you want to paste it and just `CTRL+V`
5. Now you will be presented with this dialog-box.
   <img src="/img/pasteAsLink.jpg" width="100%" />
6. Choose `Paste as link`
7. Done

### Write the code

If you ever have done the above steps you know that if the data for the diagram changes this copy of the diagram doesn't update automatically. Even though you just told it to be a link! There will be an `Update`-button there, that looks like this:

<img src="/img/updateChart.jpg" width="40%" />

At first, this might seem like a bug but it's actually awesome because it gives you the option to decide when you want it to be updated.

But we don't want that in this case. We want the diagrams to be updated automatically. Hence the title of this blog post.

To accomplish that we will write some code.

Open the Script Editor for your sheet (Tools -> Script Editor) and type in this code:

```javascript
function refreshCharts(){
    var gotSlides = SlidesApp.getActivePresentation().getSlides();

    for (var i = 0; i < gotSlides.length; i++) {
        var slide = gotSlides[i];
        var sheetsCharts = slide.getSheetsCharts();

        for (var k = 0; k < sheetsCharts.length; k++) {
            var shChart = sheetsCharts[k];
            shChart.refresh();
        }
    }
}
```

Make sure to save that file. When you do you need to give the project a name, I usually just call it the same thing as the file.

Don't close the editor just yet...

This code itself is pretty straightforward, just loop through all slides, and for each loop through all the charts and update it. The functional programmer in me is screaming in horror but it get's the job done.

### Set the trigger

However, that is just code. Someone (or thing) needs to run that code as well. Luckily for us, Google Apps has a feature for that; triggers. A trigger is something that runs code in response to an event of some sort. Let's see how we can use that for this scenario.

In the editor open the 'Current Triggers' option (found in the Edit-menu of all places...). The UI of this feature is a bit clunky, to be honest, and I expect it to change.

First you will see this box:

<img src="/img/triggersNotSet.png" width="100%" />

Click on the link to create a new row, which will change the UI into the following layout:

<img src="/img/triggersSet.png" width="100%" />

Here's what this configuration tells us:

>  Run the function `refreshCharts` every hour

Pretty cool. The UI is quite limited now (for example there are only time-driven events), but this works for us right now. Depending on how often your data is updated you could run it weekly or daily, or by the minute, instead.

By the way, that `notifications` link below the events allows you to send an email when execution fails. Also, we could add other triggers here if we wanted to.

Save it and close the editor. This is good enough.

### Permissions, permissions, permissions

At this point, I ran into some errors that eventually popped up a permissions dialog box prompting me to allow scripts to be executed here.

No biggie, but if this is not authorised then you will not be allowed to execute the script.

### Enjoy the show

Well... now for the boring part. Because now you just wait until an hour has passed and you will see the charts updated.

Psst - if you wanted to test it change the trigger to run every minute instead.

## Conclusion

In this post, I've shown you an easy way to

* Link charts pasted into a Google slide deck, to the data they are based on in a Google sheet
* How to create a function that updates the charts when the underlying data has changed
* How to run this function on an hourly timer.

I hope you found this useful.