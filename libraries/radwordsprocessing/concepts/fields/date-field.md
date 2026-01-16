---
title: Date Field
page_title: Date Field
description: Date field is a Field element that can display a date, a time, or both.
slug: radwordsprocessing-concepts-date-field
tags: date,field
published: True
position: 3
---

# Date Field

[DateField](https://docs.telerik.com/devtools/document-processing/api/telerik.windows.documents.flow.model.fields.datefield) is a [Field]({%slug radwordsprocessing-concepts-fields%}) element that can display a date, a time, or both, depending on the format you specify in a date-time picture switch.

## Field Syntax

This is how the syntax of a Date field looks like:

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

Inserting a Date Field is easily achieved through the [RadFlowDocumentEditor]({%slug radwordsprocessing-editing-radflowdocumenteditor%})'s __InsertField()__ method. It accepts code as first argument and result as second argument.

__Example 1__ demonstrates how you can insert a date field.
        

#### __Example 1: Insert date field__

<snippet id='codeblock-nn'/>


After updating the field the result would be "_12/03/2021_" (check [Updating Fields](https://docs.telerik.com/devtools/document-processing/libraries/radwordsprocessing/concepts/fields/fields#updating-fields)).

## See Also

* [Fields]({%slug radwordsprocessing-concepts-fields%})
* [Time Field]({%slug radwordsprocessing-concepts-time-field%})
* [Custom Code Field]({%slug radwordsprocessing-concepts-customcodefield%})
* [RadFlowDocumentEditor]({%slug radwordsprocessing-editing-radflowdocumenteditor%})
