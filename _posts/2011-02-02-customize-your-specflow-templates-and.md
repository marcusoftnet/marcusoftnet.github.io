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
thumbnail: http://lh4.ggpht.com/\_TI0jeIedRFk/TUhxpwIsRBI/AAAAAAAAAzw/W00MMhuyCiI/s72-c/wlEmoticon-winkingsmile%5B2%5D.png?imgmax=800
blogger_id: tag:blogger.com,1999:blog-36533086.post-5960457740940799277
blogger_orig_url: http://www.marcusoft.net/2011/02/customize-your-specflow-templates-and.html
---


I got this tip from a non-developer. An intern actually. He’s brilliant
though and figured this out by himself, about 3 months after I
introduced him to
<a href="http://www.specflow.org" target="_blank">SpecFlow</a>. Thank
you Dejen – you’re great!

The fact that this is not documented anywhere just adds to the coolness,
but also make the solution a bit hackish. Sorry for that.

As it seems – SpecFlow is storing templates for the feature-files in
this folder:

> C:\Program Files (x86)\TechTalk\\ SpecFlow\ItemTemplates\\

I’m using a 64-bit system so your path may not contain the (x86)-part.

Here you’ll find a number of zip-archives that contains the templates.
You can modify the EventDefinition-
([Hooks](http://www.marcusoft.net/2010/12/using-tags-in-specflow-features.html))
and the StepDefinition-templates and (maybe most common) the
Feature-template. All the structure is the same so you can follow it in
the same manner as below.

### How to modify the Feature template

1. Make a Copy of the current template (SpecFlowFeature.zip) just to be
    sure
2. Extract the file in SpecFlowFeature.zip a new folder
3. Open the SpecFlowFeature1.feature file in Visual Studio
4. Now you can edit the crap out of that thing <img
    src="http://lh4.ggpht.com/_TI0jeIedRFk/TUhxpwIsRBI/AAAAAAAAAzw/W00MMhuyCiI/wlEmoticon-winkingsmile%5B2%5D.png?imgmax=800"
    class="wlEmoticon wlEmoticon-winkingsmile"
    style="border-bottom-style: none; border-right-style: none; border-top-style: none; border-left-style: none"
    alt="Winking smile" />. In our case we wrote some instructions as
    comment, converted the thing into Swedish (our standard language in
    app.config) and wrote some common background steps
5. Save the file
6. Now (and here’s the trick) create a new zip-archive with just the 3
    files in it. Not the folder – that won’t work. Like this:
    [<img
    src="http://lh6.ggpht.com/_TI0jeIedRFk/TUhxq4Pe-GI/AAAAAAAAAz4/rL3RhKU6fl4/zipping%20together%20your%20template_thumb.jpg?imgmax=800"
    title="zipping together your template"
    style="background-image: none; border-bottom: 0px; border-left: 0px; margin: 0px auto; padding-left: 0px; padding-right: 0px; display: block; float: none; border-top: 0px; border-right: 0px; padding-top: 0px"
    data-border="0" width="404" height="305"
    alt="zipping together your template" />](http://lh4.ggpht.com/_TI0jeIedRFk/TUhxqYe6gNI/AAAAAAAAAz0/M8TP3kzZKXk/s1600-h/zipping%20together%20your%20template%5B2%5D.jpg)
7. And you are done. From Add new item in Visual Studio you can now use
    your new template. And distribute it to your team-members to use.
8. I’m not sure – but a restart of Visual Studio will not hurt you. The
    new template is picked up but sometimes... Restart it now. No
    questions asked.

###

### Multiple templates to chose from

Actually we can take this a step further. If the ItemTemplates-folder
contains several definitions for a certain template (EventDefiniton,
StepDefintion or Feature) they will show up in you Add new item dialog.
Like this:

[<img
src="http://lh4.ggpht.com/_TI0jeIedRFk/TUhxsFA_KfI/AAAAAAAAA0A/kODlnn3FMPI/showing%202%20feature%20templates_thumb.jpg?imgmax=800"
title="showing 2 feature templates"
style="background-image: none; border-bottom: 0px; border-left: 0px; margin: 0px auto; padding-left: 0px; padding-right: 0px; display: block; float: none; border-top: 0px; border-right: 0px; padding-top: 0px"
data-border="0" width="420" height="155"
alt="showing 2 feature templates" />](http://lh5.ggpht.com/_TI0jeIedRFk/TUhxrVvTPfI/AAAAAAAAAz8/d5xaUY2UGnU/s1600-h/showing%202%20feature%20templates%5B2%5D.jpg)

The only thing is that they have the same name. But that what that other
file in the zip-archive is for. It’s called “SpecFlowFeature.vstemplate”
and contains information about your template. Here I’ve tweaked it to be
the my Marcus version of a SpecFlow feature:

[<img
src="http://lh3.ggpht.com/_TI0jeIedRFk/TUhxs_hPQ6I/AAAAAAAAA0I/GpeZenKCMLA/vstemplate%20for%20Marcus%20feature_thumb.jpg?imgmax=800"
title="vstemplate for Marcus feature"
style="background-image: none; border-bottom: 0px; border-left: 0px; margin: 0px auto; padding-left: 0px; padding-right: 0px; display: block; float: none; border-top: 0px; border-right: 0px; padding-top: 0px"
data-border="0" width="420" height="221"
alt="vstemplate for Marcus feature" />](http://lh5.ggpht.com/_TI0jeIedRFk/TUhxsW3HH3I/AAAAAAAAA0E/RI6iUjIEbLI/s1600-h/vstemplate%20for%20Marcus%20feature%5B2%5D.jpg)

The important stuff in this file is the following:

- Name – the name that will show up in the Add New Item dialog
- Description – showed to the right in the Add New item dialog.
    Additional information in other words. Maybe which project that this
    template is used in etc.
- Icon – yes you could potentially change the icon for the file. An
    <a href="http://www.avegagroup.se" target="_blank">Avega</a> branded
    feature file for example
- ProjectItem – this element points to the file where the template is
    stored, so be sure to match it with the .feature file in your
    zip-archive.

With the above information in place, and the (%&%”#!!!) right file name
of the .feature-file in the zip-archive you get the following glorious
Add new item dialog:

[<img
src="http://lh5.ggpht.com/_TI0jeIedRFk/TUhxt2_9Y9I/AAAAAAAAA0Q/w2PhA_SoLTI/marcus%20version%20showing%20up%20in%20add%20new%20item_thumb.jpg?imgmax=800"
title="marcus version showing up in add new item"
style="background-image: none; border-bottom: 0px; border-left: 0px; margin: 0px auto; padding-left: 0px; padding-right: 0px; display: block; float: none; border-top: 0px; border-right: 0px; padding-top: 0px"
data-border="0" width="420" height="201"
alt="marcus version showing up in add new item" />](http://lh6.ggpht.com/_TI0jeIedRFk/TUhxteRIsPI/AAAAAAAAA0M/7mwW2FQc3MU/s1600-h/marcus%20version%20showing%20up%20in%20add%20new%20item%5B2%5D.jpg)

And when we add it – we see that the Marcus version held nothing much
new...

[<img
src="http://lh3.ggpht.com/_TI0jeIedRFk/TUhxupRY_JI/AAAAAAAAA0Y/tVUbgTmAb3A/marcus%20feature%20in%20full%20swing_thumb.jpg?imgmax=800"
title="marcus feature in full swing"
style="background-image: none; border-bottom: 0px; border-left: 0px; margin: 0px auto; padding-left: 0px; padding-right: 0px; display: block; float: none; border-top: 0px; border-right: 0px; padding-top: 0px"
data-border="0" width="420" height="237"
alt="marcus feature in full swing" />](http://lh4.ggpht.com/_TI0jeIedRFk/TUhxucEyYtI/AAAAAAAAA0U/1d99xtDet8c/s1600-h/marcus%20feature%20in%20full%20swing%5B2%5D.jpg)

... but I’m sure you get the idea. This could be tweaked into something
that match your project or team exactly (language, default scenarios,
background steps).

### Conclusion

In this post I showed two ways to use the possibility to tweak and
change the item templates for SpecFlow features. The same can be done
for Step definitions and Event definitions files.

Since this is pretty much undocumented (I’ve never seen anything about
this) I hope you (as I did) find this useful. Thank you again Dejen for
pointing me this way.
