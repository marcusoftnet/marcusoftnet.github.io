---
layout: post
title: Creating a dynamical AutoComplete textbox
date: 2007-11-14T12:20:00.001Z
author: Marcus Hammarberg
tags:
  - VB.NET
  - .NET
  - Visual Studio
modified_time: 2010-12-14T15:19:05.508Z
blogger_id: tag:blogger.com,1999:blog-36533086.post-4324360961164731150
blogger_orig_url: https://www.marcusoft.net/2007/11/creating-dynamical-autocomplete-textbox.html
---

In my recent project we have had to implement a own textbox to be able to set a few properties that force the user to follow certain formats etc. A few days ago I saw this as an opportunity to do something cool as an additional feature.

I wanted to implement a AutoComplete feature but with the values that the user has typed in this field before. It turns out that this is fairly easy to do, since [AutoComplete](http://msdn2.microsoft.com/en-us/library/system.windows.forms.autocompletemode.aspx) is a property on the TextBox control in the .NET Framework. Here is a [nice video that introduce the concepts surrounding AutoCompletion](http://download.microsoft.com/download/3/a/a/3aaf9e08-9d28-4e75-9da0-6ba3f65efb6e/7usingautocomplete.wmv)

So how did I do it then? First I added a handling of the Resize-event that sets the autoComplete-properties.

```vb
Me.AutoCompleteMode = Windows.Forms.AutoCompleteMode.Suggest
Me.AutoCompleteSource = Windows.Forms.AutoCompleteSource.CustomSource
Me.AutoCompleteCustomSource = State.HamtaAutoCompleteLista(Me.Name)
```

State.HamtaAutoCompleteLista is a function that returns the AutoCompleteStringCollection that should be used for the control.

As you might notice I am using the name as key, to which you might have objections. Of course it would have been better to be using a more meaningful name that can be shared among several controls. If I want the same auto completion list to be shown for two text boxes they need to have the same name. For my purposes this is ok.

Then I did an override on the OnLostFocus-event to add new items into the AutoCompleteCollection.

```vb
Protected Overrides Sub OnLostFocus(ByVal e As System.EventArgs)
  ' Don't add blank
  If Not String.IsNullOrEmpty(Me.Text) Then
    Dim autoCompleteLista As AutoCompleteStringCollection = State.HamtaAutoCompleteLista(Me.Name)
    ' Check if the text exists already - then don't add it
    If Not autoCompleteLista.Contains(Me.Text) Then
      autoCompleteLista.Add(Me.Text)
    End If
  End If
  MyBase.OnLostFocus(e)
End Sub
```

So as you can see it wasn't that much code to accomplish a dynamical AutoComplete-function in a textbox.

I had some trouble to save it to User Settings... but that will be described in another post, maybe.
