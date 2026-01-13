---
title: Notes
page_title: Notes 
slug: radspreadprocessing-features-notes
tags: notes, xlsx
published: True
position: 23
platforms: mvc, ajax, blazor, wpf, winforms, xamarin, winui, core
---


# Notes

Since R1 2022 the SpreadProcessing library supports working with notes. The Notes are used for making notes or annotations about the data. All notes can be found in the __NoteCollection__ of the worksheet. This collection holds __SpreadsheetNote__ objects which represent the notes. Each note has the following properties:

* __CellIndex:__  Gets or sets the cell index where the top left corner of the shape is positioned.
* __RelatedCellIndex:__ Gets or sets the cell index assigned to the note.
* __AlternateText:__ Gets or sets the alternate text. 
* __IsVisible:__ Gets or sets a value indicating whether this SpreadsheetNote is visible.
* __OffsetX:__ Gets or sets the left offset of the top left corner of the shape relative to the top left corner of the cell index.
* __OffsetY:__ Gets or sets the top offset of the top left corner of the shape relative to the top left corner of the cell index.
* __Width:__  Gets or sets the width of the shape.
* __Height:__ Gets or sets the height of the shape.
* __MoveWithCells:__ Gets or sets a value indicating whether this SpreadsheetNote moves with its underlying cells.
* __SizeWithCells:__ Gets or sets a value indicating whether this SpreadsheetNote resizes with its underlying cells.
* __Author:__ Gets or sets the author assigned to the note.  
* __Text:__ Gets or sets the text. 
* __Id:__  Gets the id of the shape, which is unique for the worksheet it belongs to.
* __Name:__ Gets or sets the name of the shape.
* __LockAspectRatio:__ Gets or sets the value indicating whether the aspect ratio between the width and height should remain constant.

>note All of the above properties will push a change to the undo stack when modified. 

# Working with the NoteCollection

### Adding notes

To add a note you need to specify the cell index to which the note will be related, the position where the note should be placed, the author, and the text content. Specifying the position is optional and by default, the note is placed next to the related cell.

#### __Example 1: Add note__

```csharp
	
    CellIndex relatedCellIndex = new CellIndex(1, 1);
    CellIndex cellIndex = new CellIndex(5, 5);
    string author = "John Doe";
    string text = "Comment Content";
    
    worksheet.Notes.Add(relatedCellIndex, cellIndex, author, text);
    

```

The above snippet will add a note in cell B2 with a position on cell F6.

### Removing Notes

#### __Example 2: Remove note__

```csharp
	
    var note = worksheet.Notes[0];
    worksheet.Notes.Remove(note);

```


### Hide/Show notes

You can use one of the following methods to show/hide single or all notes:

* __ShowAll:__ Shows all notes in the collection.
* __HideAll:__ Hides all notes in the collection.
* __Hide(SpreadsheetNote note):__ Hide the specified note from the collection.
* __Show(SpreadsheetNote note):__ Show the specified note from the collection.

#### __Example 3:Hide note__

```csharp
	
    var note = worksheet.Notes[0];
    worksheet.Notes.Hide(note);

```

### Events

The notes collection exposes the following events:
* __Changing:__ Occurs when the collection is being changed.
* __Changed:__ Occurs when the collection has changed.
* __NotesVisiblilityChanged:__ Occurs when the visibility of all notes has been changed at the same time.

## See Also

 * [Comments vs Notes in RadSpreadProcessing]({%slug comments-vs-notes-in-radspreadprocessing%})
 * [SpreadProcessing Add Notes Demo](https://demos.telerik.com/document-processing/spreadprocessing/notes)

