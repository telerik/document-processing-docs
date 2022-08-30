---
title: NumPages Field
page_title: NumPages Field
description: NumPages field is a Field element that contains the total number of pages.
slug: radwordsprocessing-concepts-numpages-field
tags: numpages,field
published: True
position: 6
---

# NumPages Field
 
This field insers the total nuber of pages in the document.  

## Syntax

The syntax of this field looks like this: 

| SYNTAX | 
| :--- |
| { **NUMPAGES** } |

## Inserting

Inserting a this field is easily achieved through the [RadFlowDocumentEditor]({%slug radwordsprocessing-editing-radflowdocumenteditor%})'s __InsertField()__ method. It accepts code as first argument and result as second argument.

__Example 1__ demonstrates how you can insert a NumPages field.
        

#### __[C#] Example 1: Insert NumPages field__

{{region cs-radwordsprocessing-concepts-numpages-field_0}}

    editor.InsertText("Page ");
    editor.InsertField("PAGE", "");
    editor.InsertText(" of ");
    editor.InsertField("NUMPAGES", "");

{{endregion}}


After updating the field the result would be "Page 5 of 60" (check [Updating Fields](https://docs.telerik.com/devtools/document-processing/libraries/radwordsprocessing/concepts/fields/fields#updating-fields)).

## See Also

* [RadFlowDocumentEditor]({%slug radwordsprocessing-editing-radflowdocumenteditor%})