---
title: Sequence Field
page_title: Sequence Field
description: The Sequence field sequentially numbers chapters, tables, figures, and other items in a document.
slug: radwordsprocessing-concepts-sequence-field
tags: sequencefield, word, flow, docx, fields, document, sequence, numbering, model, series
published: True
position: 8
---

# Sequence Field

`SeqField` is a [Field]({%slug radwordsprocessing-concepts-fields%}) element that sequentially numbers chapters, tables, figures, and other items in the document. If you add, delete, or move an item and its respective `Sequence` field, you can update the remaining `Seq` fields in the document to reflect the new sequence.

## Field Syntax

The following table shows the syntax of a `Sequence` field:

| Syntax |
| :--- |
| { **SEQ Identifier** [Bookmark] [Switches]} |

### Seq Identifier

Every SEQ code needs an identifier to tag each sequence or list. Identifiers must start with a letter and are limited to 40 characters (letters, numbers, and underscores).

### Bookmarks

Include a bookmark name to refer to an item elsewhere in the document.

### Switches

Switches are a way for the code fragment to specify formatting for the result of the field. More information is available in the [Syntax and Switches](https://docs.telerik.com/devtools/document-processing/libraries/radwordsprocessing/concepts/fields/fields#syntax-and-switches) section of the _Fields_ article.

The possible switches for a `Sequence` field are:

| Switch | Description |
| :--- | :--- |
| \c | Repeats the closest preceding sequence number. |
| \h | Hides the field result. |
| \n | Inserts the next sequence number for the specified number. |
| \r n | Resets the sequence number to the specified number. |
| \s | Resets the sequence number at the heading level following the "s". |


## Inserting

You can insert SEQ fields when adding numbers to tables, figures, and other items in a document.

**Example 1: Insert Sequence Field**

The suggested approach for inserting code fields is to use [RadFlowDocumentEditor]({%slug radwordsprocessing-editing-radflowdocumenteditor%}). The `InsertField()` method accepts code as the first argument and the result as the second argument.

<snippet id='codeblock-bm'/>

## See Also

* [Fields]({%slug radwordsprocessing-concepts-fields%})
* [RadFlowDocumentEditor]({%slug radwordsprocessing-editing-radflowdocumenteditor%})