---
title: NumPages Field
page_title: NumPages Field
description: Learn how to use the NumPages field element in RadWordsProcessing to insert the total number of pages in a document.
slug: radwordsprocessing-concepts-numpages-field
tags: numpages, word, flow, docx, fields, document, pages, total, model, numbering
published: True
position: 6
---

# NumPages Field

This field inserts the total number of pages in the document.

## Syntax

The following table shows the syntax of this field:

| SYNTAX |
| :--- |
| { **NUMPAGES** } |

## Inserting

You can insert this field through the `InsertField()` method of [RadFlowDocumentEditor]({%slug radwordsprocessing-editing-radflowdocumenteditor%}). The method accepts code as the first argument and result as the second argument.

**Example 1** demonstrates how to insert a NumPages field.

**Example 1: Insert PAGE and NUMPAGES fields to show the current page and total page count**

<snippet id='codeblock-bh'/>

After updating the field, the result is "Page 5 of 60" (see [Updating Fields](https://docs.telerik.com/devtools/document-processing/libraries/radwordsprocessing/concepts/fields/fields#updating-fields)).

## See Also

* [RadFlowDocumentEditor]({%slug radwordsprocessing-editing-radflowdocumenteditor%})
