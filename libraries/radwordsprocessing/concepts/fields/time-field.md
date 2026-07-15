---
title: Time Field
page_title: Time Field
description: The Time field inserts the current time in a RadWordsProcessing document.
slug: radwordsprocessing-concepts-time-field
tags: timefield, word, flow, docx, field, document, time, current, model, display
published: True
position: 10
---

# Time Field

[TimeField](https://docs.telerik.com/devtools/document-processing/api/telerik.windows.documents.flow.model.fields.timefield) is a [Field]({%slug radwordsprocessing-concepts-fields%}) element that inserts the current time in your document.

## Field Syntax

The following table shows the syntax of a `Time` field:

| Syntax |
| :--- |
| { **TIME** [\@ "Date-Time Picture"] } |


## Switches

Switches are a way for the code fragment to specify formatting for the result of the field. More information is available in the [Syntax and Switches](https://docs.telerik.com/devtools/document-processing/libraries/radwordsprocessing/concepts/fields/fields#syntax-and-switches) section of the _Fields_ article.

The possible switches for a `Time` field are:

| Switch | Description |
| :--- | :--- |
| \@ "Date-Time Picture" | Specifies a date format if different than the default format. |

## Inserting

You can insert a `Time` field through the [RadFlowDocumentEditor]({%slug radwordsprocessing-editing-radflowdocumenteditor%})'s `InsertField()` method. It accepts code as the first argument and result as the second argument.

**Example 1** demonstrates how you can insert a `Time` field.

**Example 1: Insert a TIME field with an hours-minutes-seconds picture switch**

```C#  
	editor.InsertField("TIME \\@ \"h:mm:ss am/pm\"", "«to be updated»");
```

After updating the field, the result is "_5:28:34 PM_" (check [Updating Fields](https://docs.telerik.com/devtools/document-processing/libraries/radwordsprocessing/concepts/fields/fields#updating-fields)).

## See Also

* [Fields]({%slug radwordsprocessing-concepts-fields%})
* [Date Field]({%slug radwordsprocessing-concepts-date-field%})
* [Custom Code Field]({%slug radwordsprocessing-concepts-customcodefield%})
* [RadFlowDocumentEditor]({%slug radwordsprocessing-editing-radflowdocumenteditor%})
