---
layout: post
title: Moving items in a CheckedListBox
date: 2008-02-20T15:37:00.013+01:00
author: Marcus Hammarberg
tags:
  - VB.NET
  - Visual Studio
modified_time: 2010-12-14T16:19:05.491+01:00
blogger_id: tag:blogger.com,1999:blog-36533086.post-5888117216102285736
blogger_orig_url: http://www.marcusoft.net/2008/02/moving-items-in-checkedlistbox.html ---
This is a very common requirement in applications and one that i always
need to think a few extra minutes (hours, if you want) before i get
it.

The GUI contains a CheckedListBox (or any other list) and the user want
to be able to move the items up and down in the list. Yes i know - it
seems trivial at first...

Here is one solution that uses a single method that is called with a
parameter to indicate if the item is to be moved up or down.

   '''
    ''' Moves an item in the listbox
    '''
    Private Sub MoveItemInListbox(ByVal up As Boolean)
    ' Check that something is selected
    If chklst.SelectedItem Is Nothing Then
    MessageBox.Show("Nothing selected")
    Exit Sub
    End If
   ' No flicker - on

    ' Remember the selected stuff, index, the item itself and if the item is
    ' checked or not
    Dim selectedIndex As Integer = chklst.SelectedIndex
    Dim selectedItem As Object = chklst.SelectedItem
    Dim checked As Boolean = chklst.GetItemChecked(selectedIndex)
   ' Remove the item

    ' Calculate the new index
    Dim newIndex As Integer = selectedIndex
    If up Then
    newIndex = newIndex - 1
    Else
    newIndex = newIndex + 1
    End If
   ' Check that the index is within our bounds
    If nyttIndex > chklstStycken.Items.Count - 1 Or nyttIndex < 0 Then
                        Exit Sub
                    End If
   ' Put the item back in the list and check it if needed
    chklst.Items.Insert(newIndex , selectedItem)
    chklst.SetItemChecked(newIndex , checked)
   ' Set focus on the moved item
    chklstStycken.SelectedIndex = newIndex
    chklstStycken.EndUpdate()
    end sub

Yeah - i've ripped the solution from
<http://www.msnewsgroups.net/group/microsoft.public.dotnet.languages.csharp/topic21474.aspx>,
if you don't trust me.
