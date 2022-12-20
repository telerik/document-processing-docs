---
title: Sequence Field
page_title: Sequence Field
description: MergeField field is a Field element that contains a reference to a data field by its name.
slug: radwordsprocessing-concepts-sequence-field
tags: sequence,field
published: True
position: 8
---

# Sequence Field



SequenceField is a [Field]({%slug radwordsprocessing-concepts-fields%}) element that sequally numbers chapters, tables, figures, and other items in the document. 
If you add, delete, or move an item and its respective Sequence field, you can update remaining Seq fields in the document to reflect the new sequence.

## Field Syntax
This is how the syntax of a Sequence field looks like: 

| Syntax   				                 |
| :---     				                 |
| { **SEQ Identifier** [Bookmark] [Switches]} |

### Seq identifier
The name you assign to a series of items to number. The name must start with a letter and is limited to a 40 characters(letters, numbers, and underscores).

### Bookmarks
Include a bookmark name to refer to an item elsewhere in the document.

### Switches
Switches are a way for the code fragment to specify formatting for the result of the field. More information is available in the [Syntax and Switches](https://docs.telerik.com/devtools/document-processing/libraries/radwordsprocessing/concepts/fields/fields#syntax-and-switches) section of the _Fields_ article.

The possible switches for a Sequence field are:

| Switch                 | Description                                                                                   |
| :---                   | :---                                                                                          |
| \c                     | Repeats the closest preceding sequence number.                                                |
| \h                     | Hides the field result.                                                                       |
| \n                     | Inserts the  next sequence number for the specified number.                                   |
| \r n                   | Resets the sequence number to the specified number.                                           |
| \s                     | Resets the sequence number at the heading level following the "s".                            |


## Inserting 

Inserting a SEQ fields can be easily achieved when inserting to number tables, figures, and other items in a document.

#### __[C#] Example 1: Insert Sequence field__ using InsertField() method__

The suggested approach for inserting code fields is by using [RadFlowDocumentEditor]({%slug radwordsprocessing-editing-radflowdocumenteditor%}). The InsertField() method accepts code as a first argument and the result as a second argument.

{{region cs-radwordsprocessing-concepts-sequence-field_0}}

editor.InsertText("Figure ");

editor.InsertField("SEQ Image" , "Update Figure Number");

{{endregion}}


## See Also

 * [Fields]({%slug radwordsprocessing-concepts-fields%})
 * [RadFlowDocumentEditor]({%slug radwordsprocessing-editing-radflowdocumenteditor%})