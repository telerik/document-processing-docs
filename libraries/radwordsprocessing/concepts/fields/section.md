---
title: Section Field
page_title: Section Field
description: Section field is a Field element that inserts the number of the current section.
slug: radwordsprocessing-concepts-section-field
tags: section,field
published: True
position: 0
---

# Section Field

This field inserts the number of the current section.

## Field Syntax

This is how the syntax of a section field looks like:

| Syntax   											  |
| :---     											  |
| { **SECTION** } |    


## Inserting

Inserting a Section field is easily achieved through the [RadFlowDocumentEditor]({%slug radwordsprocessing-editing-radflowdocumenteditor%})'s __InsertField()__ method. It accepts code as first argument and result as second argument.

__Example 1__ demonstrates how you can insert a section field.
         
#### __[C#] Example 1: Insert section field__

{{region cs-radwordsprocessing-concepts-section-field_0}}
	            
	editor.InsertText("Page ");
	editor.InsertField("PAGE", "");
	editor.InsertText(" of Section ");
	editor.InsertField("SECTION", "");

{{endregion}}


After updating the field the result would be such as "Page 4 of Section 2" (check [Updating Fields](https://docs.telerik.com/devtools/document-processing/libraries/radwordsprocessing/concepts/fields/fields#updating-fields)).

## See Also

* [Fields]({%slug radwordsprocessing-concepts-fields%}) 
