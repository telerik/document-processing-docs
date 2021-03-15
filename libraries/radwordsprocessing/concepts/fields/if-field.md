---
title: If Field
page_title: If Field
description: If Field
slug: radwordsprocessing-concepts-if-field
tags: if,field
published: True
position: 7
---

# If Field

[IfField](https://docs.telerik.com/devtools/document-processing/api/telerik.windows.documents.flow.model.fields.iffield) is a [Field]({%slug radwordsprocessing-concepts-fields%}) element compares two values and inserts the text appropriate to the result of the comparison.

## Field Syntax

This is how the syntax of a If field looks like:

| Syntax   											                   |
| :---     											                   |
| { **IF** _Expression1_ _Operator_ _Expression2_ TrueText FalseText } |

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

### Expression1, Expression2
Values to compare.

### TrueText, FalseText
Text that results when the comparison is true (TrueText) or false (FalseText). If FalseText isn't specified and the comparison is false, the IF field has no result. Each string containing multiple words must be enclosed in quotation marks.

## Inserting

Inserting an If field is easily achieved through the [RadFlowDocumentEditor]({%slug radwordsprocessing-editing-radflowdocumenteditor%})'s __InsertField()__ method. It accepts code as first argument and result as second argument. 

#### __[C#] Example 1: Insert If field__

{{region cs-radwordsprocessing-concepts-if-field_0}}
	            
	RadFlowDocumentEditor editor = new RadFlowDocumentEditor(new RadFlowDocument());
	editor.InsertText("Wallet: ");
	editor.InsertInline(new Run(document));
	Run wallet = editor.InsertText("99");
	editor.InsertBookmark("Money", wallet, wallet);
	editor.InsertBreak(BreakType.LineBreak);

	editor.InsertField("IF Money >= 100 \"Buy\" \"The minimum required amount is 100\"", "T-shirt");
{{endregion}}

The result of the above snippet is illustrated in **Figure 1**.

#### Figure 1: If field in a document
  ![RadWordsProcessing Concepts Fields If Field 01](images/RadWordsProcessing_Concepts_Fields_If_Field_01.png)

## See Also

 * [Fields]({%slug radwordsprocessing-concepts-fields%})
 * [Custom Code Field]({%slug radwordsprocessing-concepts-customcodefield%})
 * [RadFlowDocumentEditor]({%slug radwordsprocessing-editing-radflowdocumenteditor%})
