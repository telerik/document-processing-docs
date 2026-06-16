---
title: PageRef Field
page_title: PageRef Field
description: The PageRef field inserts the page number of a bookmark for a cross-reference in a document.
slug: radwordsprocessing-concepts-pageref-field
tags: pageref, word, flow, docx, field, document, bookmark, pagenumber, model, reference
published: True
position: 0
---

# PageRef Field

The `PageRef` field inserts the page number of a bookmark for a cross-reference.

>To update the `PageRef` fields within the TOC field, you need to set the [FlowExtensibilityManager.NumberingFieldsProvider]({%slug radpdfprocessing-formats-and-conversion-pdf-numbering-fields-provider%}).

## Field Syntax

The following table shows the syntax of a `PageRef` field:

| Syntax |
| :--- |
| { **PAGEREF** Bookmark [\\* Format Switch ] } |


## Switches

Switches are a way for the code fragment to specify formatting for the result of the field. More information is available in the [Syntax and Switches](https://docs.telerik.com/devtools/document-processing/libraries/radwordsprocessing/concepts/fields/fields#syntax-and-switches) section of the _Fields_ article.

The possible switches for a `PageRef` field are:

| Switch | Description |
| :--- | :--- |
| \\h | Creates a hyperlink to the bookmarked paragraph. |
| \\p | Causes the field to display its position relative to the source bookmark. |

## Inserting

You can insert this field through the [RadFlowDocumentEditor]({%slug radwordsprocessing-editing-radflowdocumenteditor%})'s `InsertField()` method. It accepts code as the first argument and result as the second argument.

**Example 1** demonstrates how you can insert a `PageRef` field.

**Example 1: Insert PageRef field**

<snippet id='codeblock-bj'/>

After updating the field, the result is "Bookmark Page: 2" (check [Updating Fields](https://docs.telerik.com/devtools/document-processing/libraries/radwordsprocessing/concepts/fields/fields#updating-fields)).

## See Also

* [RadFlowDocumentEditor]({%slug radwordsprocessing-editing-radflowdocumenteditor%})
