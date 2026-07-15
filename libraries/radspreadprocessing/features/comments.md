---
title: Comments
description: Learn how to add and manage comments in spreadsheet documents using RadSpreadProcessing.
page_title: Comments 
slug: radspreadprocessing-features-comments
tags: comments, xlsx, spreadsheet, radspreadprocessing, cells, annotations, workbook, notes
published: True
position: 23
platforms: mvc, ajax, blazor, wpf, winforms, winui, core
---


# Comments

|Minimum Version|R2 2022|
|----|----|

RadSpreadProcessing supports working with comments. Comments mark information about a cell's data and can have one or multiple [Replies](#replies). All comments are stored in the `Comments` property of the worksheet, which is of type `CommentCollection`. This collection holds `SpreadsheetComment` objects that represent the comments. Each comment has the following members:

***Properties***:

* `CellIndex`: Gets or sets the cell index the comment is assigned to.
* `Text`: Gets or sets the text of the comment.
* `CreationDate`: Gets or sets the date when the comment is created. Nullable.
* `Author`: Gets or sets the author assigned to the comment.
* `Replies`: Gets the comment replies. The list is sorted by CreationDate.
* `IsResolved`: Gets or sets a value indicating whether the comment is resolved.

 >note All of the above properties push a change to the undo stack when modified. 
 
***Methods***:

* `AddReply`: Adds a `SpreadsheetCommentReply` to the `ReplySortedCollection`. The collection is re-sorted by the reply's `CreationDate` in ascending order after adding an object.
* `RemoveReply`: Removes the specified reply from the collection.

## Working with CommentCollection

### Adding Comments

To add a comment, specify the cell index to which the comment relates, the author, the text content, and the creation date. The creation date is optional and defaults to the current date and time.

**Example 1: Add a comment to cell B2**

<snippet id='codeblock-cgm'/>

The previous example adds a comment to cell B2.


### Removing Comments

To remove a comment, specify the comment instance. You can obtain this instance from the `CommentCollection`.

**Example 2: Remove a comment from the worksheet**

<snippet id='codeblock-cgn'/>


## Replies

Each comment can be replied to, forming a thread of information. All replies are stored in the `Replies` property of the comment, which is of type `ReplySortedCollection`. This collection holds `SpreadsheetCommentReply` objects that represent the replies. The `ReplySortedCollection` has the following members:

***Properties***:

* `Count`: Gets the number of elements contained in the `ReplySortedCollection`.

***Methods***:

* `Add`: Adds a `SpreadsheetCommentReply` to the `ReplySortedCollection`. The collection is re-sorted by `CreationDate` in ascending order after adding an object. Requires an object of type `SpreadsheetCommentReply` and can be used for adding existing replies. For adding a new reply, use the `SpreadsheetComment.AddReply()` method.
* `Remove`: Removes the specified `SpreadsheetCommentReply` object from the `ReplySortedCollection`.
* `RemoveAt`: Removes the element at the specified index of the `ReplySortedCollection`.
* `Clear`: Removes all elements from the `ReplySortedCollection`.
* `Contains`: Determines whether an element is in the `ReplySortedCollection`.
* `CopyTo`: Copies the entire `ReplySortedCollection` to a compatible one-dimensional array, starting at the specified index of the target array.


**Example 3: Work with replies in a comment thread**

<snippet id='codeblock-cgo'/>


### Events

Both `CommentCollection` and `ReplySortedCollection` expose the following events, which work identically for both types:

* `Changing`: Occurs prior to changing the collection.
* `Changed`: Occurs after the collection has changed.

The two events for both collections use similar enumeration types for event arguments, with two possible values:
 
* `Add`: Used when adding a comment or reply.
* `Remove`: Used when removing a comment or reply.

**Example 4: Change a comment author in the Changing event**

<snippet id='codeblock-cgp'/>

**Example 5: Change a reply author in the Changing event**

<snippet id='codeblock-cgq'/>



## See Also

* [Working with Notes]({%slug radspreadprocessing-features-notes%})
* [What is a Worksheet?]({%slug radspreadprocessing-working-with-worksheets-what-is-worksheet%})
* [Comments vs Notes in RadSpreadProcessing]({%slug comments-vs-notes-in-radspreadprocessing%})
* [SpreadProcessing Add Comments Demo](https://demos.telerik.com/document-processing/spreadprocessing/comments)
