---
title: Time Field
page_title: Time Field
description: Time Field
slug: radwordsprocessing-concepts-time-field
tags: time,field
published: True
position: 10
---

# Time Field

[TimeField](https://docs.telerik.com/devtools/document-processing/api/telerik.windows.documents.flow.model.fields.timefield) is a [Field]({%slug radwordsprocessing-concepts-fields%}) element that inserts the current time in your document.
      

## Field Syntax

This is how the syntax of a If field looks like:

| Syntax   						        |
| :---     						        |
| { **TIME** [\@ "Date-Time Picture"] } |


## Switches

Switches are a way for the code fragment to specify formatting for the result of the field. More information is available in the [Syntax and Switches](https://docs.telerik.com/devtools/document-processing/libraries/radwordsprocessing/concepts/fields/fields#syntax-and-switches) section of the _Fields_ article.

The possible switches for a time field are:

| Switch                 | Description                                                                             |
| :---                   | :---                                                                                    |
| \@ "Date-Time Picture" | Specifies a date format if different than the default format                            |

## Inserting

Inserting a merge field is easily achieved through the [RadFlowDocumentEditor]({%slug radwordsprocessing-editing-radflowdocumenteditor%})'s __InsertField()__ method. It accepts code as first argument and result as second argument.

__Example 1__ demonstrates how you can insert a merge field.  

#### __[C#] Example 1: Insert merge field__

{{region cs-radwordsprocessing-concepts-time-field_0}}
	            
	editor.InsertField("TIME \\@ \"h:mm:ss am/pm\"", "to be updated");
{{endregion}}


After updating the field the result would be "_5:28:34 PM_" (check [Updating Fields](https://docs.telerik.com/devtools/document-processing/libraries/radwordsprocessing/concepts/fields/fields#updating-fields)).


## See Also

* [Fields]({%slug radwordsprocessing-concepts-fields%})
* [Date Field]({%slug radwordsprocessing-concepts-date-field%})
* [Custom Code Field]({%slug radwordsprocessing-concepts-customcodefield%})
* [RadFlowDocumentEditor]({%slug radwordsprocessing-editing-radflowdocumenteditor%})
