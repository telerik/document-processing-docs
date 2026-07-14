---
title: Date Field
page_title: Date Field
description: Learn how to use the DateField element to display a date, a time, or both in RadWordsProcessing documents.
slug: radwordsprocessing-concepts-date-field
tags: datefield, word, flow, docx, fields, document, date, time, model, display
published: True
position: 3
---

# Date Field

[`DateField`](https://docs.telerik.com/devtools/document-processing/api/telerik.windows.documents.flow.model.fields.datefield) is a [Field]({%slug radwordsprocessing-concepts-fields%}) element that can display a date, a time, or both, depending on the format you specify in a date-time picture switch.

## Field Syntax

The syntax of a Date field is as follows:

| Syntax   											  |
| :---     											  |
| { **DATE** [ \@ "Date-Time Picture"] [_Switches_] } |


## Switches

Switches are a way for the code fragment to specify formatting for the result of the field. More information is available in the [Syntax and Switches](https://docs.telerik.com/devtools/document-processing/libraries/radwordsprocessing/concepts/fields/fields#syntax-and-switches) section of the _Fields_ article.

The possible switches for a Date field are:

| Switch                 | Description                                                   |
| :---                   | :---                                                          |
| \@ "Date-Time Picture" | Specifies a date format if different than the default format. |

## Inserting

You can insert a Date Field through the [RadFlowDocumentEditor]({%slug radwordsprocessing-editing-radflowdocumenteditor%})'s `InsertField()` method. It accepts code as the first argument and result as the second argument.

**Example 1** demonstrates how to insert a date field.

**Example 1: Insert a DATE field with a day-month-year picture switch**

<snippet id='codeblock-nn'/>


After updating the field, the result is "_12/03/2021_" (check [Updating Fields](https://docs.telerik.com/devtools/document-processing/libraries/radwordsprocessing/concepts/fields/fields#updating-fields)).

## See Also

* [Fields]({%slug radwordsprocessing-concepts-fields%})
* [Time Field]({%slug radwordsprocessing-concepts-time-field%})
* [Custom Code Field]({%slug radwordsprocessing-concepts-customcodefield%})
* [RadFlowDocumentEditor]({%slug radwordsprocessing-editing-radflowdocumenteditor%})
