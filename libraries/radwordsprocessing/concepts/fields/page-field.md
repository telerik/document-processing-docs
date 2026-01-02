---
title: Page Field
page_title: Page Field
description: Page field is a Field element that represents the page number.
slug: radwordsprocessing-concepts-page-field
tags: page,field
published: True
position: 0
---

# Page Field

Inserts the current page number. 

>In order to update the field within the TOC field you need to set the [FlowExtensibilityManager.NumberingFieldsProvider]({%slug radpdfprocessing-formats-and-conversion-pdf-numbering-fields-provider%}).

## Field Syntax

This is how the syntax of a Page field looks like:

| Syntax   |
| :---     	 |
| { **PAGE** [\\*_Format Switch_] } |    


## Switches

Switches are a way for the code fragment to specify formatting for the result of the field. More information is available in the [Syntax and Switches](https://docs.telerik.com/devtools/document-processing/libraries/radwordsprocessing/concepts/fields/fields#syntax-and-switches) section of the _Fields_ article.

The possible switches for a Page field are:

| Switch                 | Description                                                   |
| :---                   | :---                                                          |
| \\* Format Switch | Optional switch that specifies the format |

## Inserting

Inserting this field is easily achieved through the [RadFlowDocumentEditor]({%slug radwordsprocessing-editing-radflowdocumenteditor%})'s __InsertField()__ method. It accepts code as first argument and result as second argument.

__Example 1__ demonstrates how you can insert a date field.
        

#### __[C#] Example 1: Insert page field__

<snippet id='codeblock-bi'/>


After updating the field the result would be "Page 3 of 6" (check [Updating Fields](https://docs.telerik.com/devtools/document-processing/libraries/radwordsprocessing/concepts/fields/fields#updating-fields)).

## See Also 

* [RadFlowDocumentEditor]({%slug radwordsprocessing-editing-radflowdocumenteditor%})
* [Assigning Character Style to Fields in RadWordsProcessing]({%slug assigning-character-style-to-fields%})
