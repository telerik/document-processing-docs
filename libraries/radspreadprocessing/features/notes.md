---
title: Notes
page_title: Notes 
slug: radspreadprocessing-features-notes
tags: notes, xlsx
published: True
position: 23
---


# Notes

Since R1 2022 the SpreadProcessing library supports working with notes. The Notes are used for making notes or annotations about the data. All notes can be found in the __NoteCollection__ of the worksheet. Each note has the following properties:

* __CellIndex:__  Gets or sets the cell index where the top left corner of the shape is positioned.
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
* __RelatedCellIndex:__ Gets or sets the cell index assigned to the note.
* __Id:__  Gets the id of the shape, which is unique for the worksheet it belongs to.
* __Name:__ Gets or sets the name of the shape.
* __LockAspectRatio:__ Gets or sets the value indicating whether the aspect ratio between the width and height should remain constant.

>note All of the above properties will push a change to the undo stack when modified. 

# Working with the NoteCollection

### Adding notes

To add a note you need to specify the related cell, the position which is a cell index, the content, and the author. Specifying the position is optional and by default the note is placed next to related cell. 

__[C#] Example 1: Add note__

{{region cs-radspreadprocessing-features-notes_0}}
	
     worksheet.Notes.Add(new CellIndex(1, 1), new CellIndex(5, 5), "John Doe", "Comment Content");

{{endregion}}

The above snipped will add a note in cell B2 with position on cell F6.

### Removing Notes

__[C#] Example 2: Remove note__

{{region cs-radspreadprocessing-features-notes_1}}
	
    var note = worksheet.Notes[0];
    worksheet.Notes.Remove(note);

{{endregion}}


### Hide/Show notes

You can use on of the following methods to show/hide single or all comments:

* __ShowAll:__ Shows all notes in the collection.
* __HideAll:__ Hides all notes in the collection.
* __Hide(SpreadsheetNote note):__ Hide the specified note from the collection.
* __Show(SpreadsheetNote note):__ Show the specified note from the collection.

__[C#] Example 3:Hide note__

{{region cs-radspreadprocessing-features-notes_1}}
	
    var note = worksheet.Notes[0];
    worksheet.Notes.Hide(note);

{{endregion}}
