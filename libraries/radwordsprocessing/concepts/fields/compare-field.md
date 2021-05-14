---
title: Compare Field
page_title: Compare Field
description: Compare field is a Field element that compares two values and displays the comparison result.
slug: radwordsprocessing-concepts-compare-field
tags: compare,field
published: True
position: 1
---

# Compare Field

[CompareField](https://docs.telerik.com/devtools/document-processing/api/telerik.windows.documents.flow.model.fields.comparefield) is a [Field]({%slug radwordsprocessing-concepts-fields%}) element that compares two values. It displays the result "1" if the comparison is true or "0" (zero) if the comparison is false.

## Field Syntax

This is how the syntax of a compare field looks like:

| Syntax   											     |
| :---     											     |
| { **COMPARE** _Expression1_ _Operator_ _Expression2_ } |

### Expression1, Expression2
Values to compare.

### Operators
In the table bellow are listed all the comparison operators.

| Operator    | Description              |
| :---        | :---                     |
| =           | Equal to                 |
| <>          | Not equal to             |
| >           | Greater than             |
| <           | Less than                |
| >=          | Greater than or equal to |
| <=          | Less than or equal to    |

## Inserting

Inserting a Compare Field is easily achieved through the [RadFlowDocumentEditor]({%slug radwordsprocessing-editing-radflowdocumenteditor%})'s __InsertField()__ method. It accepts code as first argument and result as second argument.   

#### __[C#] Example 1: Insert a CompareField__

{{region cs-radwordsprocessing-concepts-compare-field_0}}
	            
	editor.InsertField("COMPARE MERGEFIELD CustomerNumber <> 1", "«to be updated»");
{{endregion}}


## See Also

 * [Fields]({%slug radwordsprocessing-concepts-fields%})
 * [Mail Merge]({%slug radwordsprocessing-editing-mail-merge%})
 * [RadFlowDocumentEditor]({%slug radwordsprocessing-editing-radflowdocumenteditor%})
