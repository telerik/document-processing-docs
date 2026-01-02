---
title: PageRef Field
page_title: PageRef Field
description: PageRef field is a Field element that inserts the page number of a bookmark.
slug: radwordsprocessing-concepts-pageref-field
tags: pageref,field
published: True
position: 0
---

# PageRef Field

The PageRef field inserts the page number of a bookmark for a cross-reference.

>In order to update the **PageRef** fields within the TOC field you need to set the [FlowExtensibilityManager.NumberingFieldsProvider]({%slug radpdfprocessing-formats-and-conversion-pdf-numbering-fields-provider%})

## Field Syntax

This is how the syntax of a PageRef field looks like:

| Syntax   											  |
| :---     											  |
| { **PAGEREF** Bookmark   [\\* Format Switch ] } |    


## Switches

Switches are a way for the code fragment to specify formatting for the result of the field. More information is available in the [Syntax and Switches](https://docs.telerik.com/devtools/document-processing/libraries/radwordsprocessing/concepts/fields/fields#syntax-and-switches) section of the _Fields_ article.

The possible switches for a Date field are:

| Switches                 | Description                                                   |
| :---                   | :---                                                          |
| \\h | Creates a hyperlink to the bookmarked paragraph. |
| \\p | Causes the field to display its position relative to the source bookmark. |

## Inserting

Inserting this field is easily achieved through the [RadFlowDocumentEditor]({%slug radwordsprocessing-editing-radflowdocumenteditor%})'s __InsertField()__ method. It accepts code as first argument and result as second argument.

__Example 1__ demonstrates how you can insert a PageRef field.
 
#### __[C#] Example 1: Insert PageRef field__

<snippet id='codeblock-bj'/>


After updating the field the result would be "Bookmark Page: 2" (check [Updating Fields](https://docs.telerik.com/devtools/document-processing/libraries/radwordsprocessing/concepts/fields/fields#updating-fields)).

## See Also

* [RadFlowDocumentEditor]({%slug radwordsprocessing-editing-radflowdocumenteditor%})
