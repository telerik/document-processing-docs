---
title: SectionPages Field
page_title: SectionPages Field
description: SectionPages field is a Field element that inserts the total number of pages in a section.
slug: radwordsprocessing-concepts-sectionpages-field
tags: sectionpages,field
published: True
position: 0
---

# SectionPages Field

This field inserts the total number of pages in a section.

## Field Syntax

This is how the syntax of a SectionPages field looks like:

| Syntax   											  |
| :---     											  |
| { **SECTIONPAGES** } |    

 
## Inserting

Inserting SectionPages field is easily achieved through the [RadFlowDocumentEditor]({%slug radwordsprocessing-editing-radflowdocumenteditor%})'s __InsertField()__ method. It accepts code as first argument and result as second argument.

__Example 1__ demonstrates how you can insert a SectionPages field.
 
#### __[C#] Example 1: Insert SectionPages field__

{{region cs-radwordsprocessing-concepts-sectionpages-field_0}}

	editor.InsertText("Page ");
    editor.InsertField("PAGE", "");
    editor.InsertText(" of ");
    editor.InsertField("SECTIONPAGES", "");

{{endregion}}


After updating the field the result would be "Page 3 of 19" (check [Updating Fields](https://docs.telerik.com/devtools/document-processing/libraries/radwordsprocessing/concepts/fields/fields#updating-fields)).

## See Also

* [Fields]({%slug radwordsprocessing-concepts-fields%})
* [Time Field]({%slug radwordsprocessing-concepts-time-field%})
* [Custom Code Field]({%slug radwordsprocessing-concepts-customcodefield%})
* [RadFlowDocumentEditor]({%slug radwordsprocessing-editing-radflowdocumenteditor%})

