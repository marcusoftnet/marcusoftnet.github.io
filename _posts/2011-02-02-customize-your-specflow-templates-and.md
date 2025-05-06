---
layout: post
title: Customize your SpecFlow templates and more
date: 2011-02-01T20:48:00.001Z
author: Marcus Hammarberg
tags:
  - BDD
  - .NET
  - SpecFlow
modified_time: 2011-02-01T20:48:59.755Z
blogger_id: tag:blogger.com,1999:blog-36533086.post-5960457740940799277
blogger_orig_url: https://www.marcusoft.net/2011/02/customize-your-specflow-templates-and.html
---

I got this tip from a non-developer. An intern, actually. He’s brilliant though and figured this out by himself, about 3 months after I introduced him to [SpecFlow](http://www.specflow.org). Thank you, Dejen – you’re great!

The fact that this is not documented anywhere just adds to the coolness, but also makes the solution a bit hackish. Sorry for that.

SpecFlow stores templates for the feature files in this folder:

```text
C:\Program Files (x86)\TechTalk\SpecFlow\ItemTemplates\
```

I’m using a 64-bit system, so your path may not contain the (x86) part.

Here, you’ll find several zip archives containing the templates. You can modify the EventDefinition, StepDefinition, and (maybe most commonly) the Feature template. All the structure is the same, so you can follow it in the same manner as described below.

### How to Modify the Feature Template

1. **Make a copy** of the current template (`SpecFlowFeature.zip`) to be safe.
2. **Extract** the file in `SpecFlowFeature.zip` to a new folder.
3. **Open** the `SpecFlowFeature1.feature` file in Visual Studio.
4. Now you can **edit** it as much as you want. In our case, we wrote some instructions as comments, converted the text into Swedish (our standard language in `app.config`), and wrote some common background steps.
5. **Save** the file.
6. **Create** a new zip archive with just the three files in it. Not the folder – that won’t work. Like this:
    ![zipping together your template](/img/zipping%2520together%2520your%2520template_thumb.jpg)
7. And you are done. From **Add New Item** in Visual Studio, you can now use your new template and distribute it to your team members.
8. A restart of Visual Studio might help in picking up the new template. It doesn’t hurt to restart it.

### Multiple Templates to Choose From

You can take this a step further. If the `ItemTemplates` folder contains several definitions for a certain template (EventDefinition, StepDefinition, or Feature), they will show up in your **Add New Item** dialog:

![showing 2 feature templates](/img/showing%25202%2520feature%2520templates_thumb.jpg)

The only thing is that they have the same name. But that’s what the other file in the zip archive is for. It’s called `SpecFlowFeature.vstemplate` and contains information about your template. Here, I’ve tweaked it to be my Marcus version of a SpecFlow feature:

![template for Marcus feature](/img/vstemplate%2520for%2520Marcus%2520feature_thumb.jpg)

Important elements in this file include:

- **Name** – The name that will show up in the Add New Item dialog.
- **Description** – Displayed to the right in the Add New Item dialog, providing additional information like which project this template is used in.
- **Icon** – You could change the icon for the file. For example, an Avega branded feature file.
- **ProjectItem** – This element points to the file where the template is stored, so be sure to match it with the `.feature` file in your zip archive.

With the above information in place and the correct file name of the `.feature` file in the zip archive, you get the following glorious Add New Item dialog:

![marcus version showing up in add new item](/img/marcus%2520version%2520showing%2520up%2520in%2520add%2520new%2520item_thumb.jpg)

When we add it, we see that the Marcus version held nothing much new:

![marcus feature in full swing](/img/marcus%2520feature%2520in%2520full%2520swing_thumb.jpg)

... but I’m sure you get the idea. This can be tweaked to match your project or team exactly (language, default scenarios, background steps).

### Conclusion

In this post, I showed two ways to customize the item templates for SpecFlow features. The same can be done for Step definitions and Event definitions files.

Since this is pretty much undocumented (I’ve never seen anything about this), I hope you find it useful. Thank you again, Dejen, for pointing me this way.
