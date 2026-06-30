---
title: Page Field
page_title: Page Field
description: Learn how to use the Page field element in RadWordsProcessing to insert the current page number in flow documents.
slug: radwordsprocessing-concepts-page-field
tags: page, word, flow, docx, field, document, pagenumber, model, numbering, display
published: True
position: 0
---

# Page Field

The Page field inserts the current page number.

> To update the field within the TOC field, set the [FlowExtensibilityManager.NumberingFieldsProvider]({%slug radpdfprocessing-formats-and-conversion-pdf-numbering-fields-provider%}).

## Field Syntax

The following table shows the syntax of a Page field:

| Syntax |
| :--- |
| { **PAGE** [\\*_Format Switch_] } |

## Switches

Switches allow the code fragment to specify formatting for the result of the field. More information is available in the [Syntax and Switches](https://docs.telerik.com/devtools/document-processing/libraries/radwordsprocessing/concepts/fields/fields#syntax-and-switches) section of the *Fields* article.

The possible switches for a Page field are:

| Switch                 | Description                                                   |
| :---                   | :---                                                          |
| \\* Format Switch | Optional switch that specifies the format. |

## Inserting

You can insert this field through the `InsertField()` method of [RadFlowDocumentEditor]({%slug radwordsprocessing-editing-radflowdocumenteditor%}). The method accepts code as the first argument and result as the second argument.

**Example 1** demonstrates how to insert a Page field.

**Example 1: Insert a Page field**

<snippet id='libraries-flow-concepts-fields-page-field'/>

After updating the field, the result is "Page 3 of 6" (see [Updating Fields](https://docs.telerik.com/devtools/document-processing/libraries/radwordsprocessing/concepts/fields/fields#updating-fields)).

## See Also

* [RadFlowDocumentEditor]({%slug radwordsprocessing-editing-radflowdocumenteditor%})
* [Assigning Character Style to Fields in RadWordsProcessing]({%slug assigning-character-style-to-fields%})

