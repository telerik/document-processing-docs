---
title: Notes
description: Learn how to add, remove, and manage notes and annotations in spreadsheet documents using the RadSpreadProcessing library.
page_title: Notes 
slug: radspreadprocessing-features-notes
tags: notes, xlsx, spreadsheet, radspreadprocessing, cells, annotations, worksheet, comments, spread, xlsx
published: True
position: 23
platforms: mvc, ajax, blazor, wpf, winforms, winui, core
---


# Notes

|Minimum Version|R1 2022|
|----|----|

RadSpreadProcessing supports working with notes. Notes are used for making annotations about the data. All notes are available in the `NoteCollection` of the worksheet. This collection holds `SpreadsheetNote` objects which represent the notes. Each note has the following properties:

* `CellIndex`: Gets or sets the cell index where the top left corner of the shape is positioned.
* `RelatedCellIndex`: Gets or sets the cell index assigned to the note.
* `AlternateText`: Gets or sets the alternate text.
* `IsVisible`: Gets or sets a value indicating whether this `SpreadsheetNote` is visible.
* `OffsetX`: Gets or sets the left offset of the top left corner of the shape relative to the top left corner of the cell index.
* `OffsetY`: Gets or sets the top offset of the top left corner of the shape relative to the top left corner of the cell index.
* `Width`: Gets or sets the width of the shape.
* `Height`: Gets or sets the height of the shape.
* `MoveWithCells`: Gets or sets a value indicating whether this `SpreadsheetNote` moves with its underlying cells.
* `SizeWithCells`: Gets or sets a value indicating whether this `SpreadsheetNote` resizes with its underlying cells.
* `Author`: Gets or sets the author assigned to the note.
* `Text`: Gets or sets the text.
* `Id`: Gets the id of the shape, which is unique for the worksheet it belongs to.
* `Name`: Gets or sets the name of the shape.
* `LockAspectRatio`: Gets or sets the value indicating whether the aspect ratio between the width and height remains constant.

>note All of the listed properties push a change to the undo stack when modified.

## Working with the NoteCollection

### Adding Notes

To add a note, specify the cell index to which the note relates, the position where the note appears, the author, and the text content. The position is optional. By default, the note is placed next to the related cell.

**Example 1: Add Note**

<snippet id='codeblock-cjv'/>

The previous snippet adds a note in cell B2 with a position on cell F6.

### Removing Notes

**Example 2: Remove Note**

<snippet id='codeblock-cjw'/>


### Hide and Show Notes

You can use one of the following methods to show or hide single or all notes:

* `ShowAll`: Shows all notes in the collection.
* `HideAll`: Hides all notes in the collection.
* `Hide(SpreadsheetNote note)`: Hides the specified note from the collection.
* `Show(SpreadsheetNote note)`: Shows the specified note from the collection.

**Example 3: Hide Note**

<snippet id='codeblock-cjx'/>

### Events

The notes collection exposes the following events:

* `Changing`: Occurs when the collection is changing.
* `Changed`: Occurs when the collection has changed.
* `NotesVisibilityChanged`: Occurs when the visibility of all notes changes at the same time.

## See Also

* [Comments vs Notes in RadSpreadProcessing]({%slug comments-vs-notes-in-radspreadprocessing%})
* [SpreadProcessing Add Notes Demo](https://demos.telerik.com/document-processing/spreadprocessing/notes)

