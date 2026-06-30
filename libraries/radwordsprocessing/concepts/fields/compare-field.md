---
title: Compare Field
page_title: Compare Field
description: Learn how to use the CompareField element to compare two values and display the comparison result in RadWordsProcessing documents.
slug: radwordsprocessing-concepts-compare-field
tags: compare, field, word, flow, docx, fields, document, comparison, values, model, logic
published: True
position: 1
---

# Compare Field

[`CompareField`](https://docs.telerik.com/devtools/document-processing/api/telerik.windows.documents.flow.model.fields.comparefield) is a [Field]({%slug radwordsprocessing-concepts-fields%}) element that compares two values. It displays "1" if the comparison is true or "0" (zero) if the comparison is false.

## Field Syntax

The syntax of a compare field is as follows:

| Syntax   											     |
| :---     											     |
| { **COMPARE** _Expression1_ _Operator_ _Expression2_ } |

### Expression1, Expression2

Values to compare.

### Operators

The following table lists all comparison operators.

| Operator    | Description              |
| :---        | :---                     |
| =           | Equal to                 |
| <>          | Not equal to             |
| >           | Greater than             |
| <           | Less than                |
| >=          | Greater than or equal to |
| <=          | Less than or equal to    |

## Inserting

You can insert a Compare Field through the [RadFlowDocumentEditor]({%slug radwordsprocessing-editing-radflowdocumenteditor%})'s `InsertField()` method. It accepts code as the first argument and result as the second argument.

**Example 1: Insert a CompareField**

<snippet id='libraries-flow-concepts-fields-compare-field'/>


## See Also

* [Fields]({%slug radwordsprocessing-concepts-fields%})
* [Mail Merge]({%slug radwordsprocessing-editing-mail-merge%})
* [RadFlowDocumentEditor]({%slug radwordsprocessing-editing-radflowdocumenteditor%})
