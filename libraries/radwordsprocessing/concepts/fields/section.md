---
title: Section Field
page_title: Section Field
description: The Section field inserts the number of the current section in a RadWordsProcessing document.
slug: radwordsprocessing-concepts-section-field
tags: sectionfield, word, flow, docx, fields, document, section, number, model, numbering
published: True
position: 0
---

# Section Field

The `Section` field inserts the number of the current section.

## Field Syntax

The following table shows the syntax of a `Section` field:

| Syntax |
| :--- |
| { **SECTION** } |


## Inserting

You can insert a `Section` field through the [RadFlowDocumentEditor]({%slug radwordsprocessing-editing-radflowdocumenteditor%})'s `InsertField()` method. It accepts code as the first argument and result as the second argument.

**Example 1** demonstrates how you can insert a `Section` field.

**Example 1: Insert PAGE and SECTION fields to display the current page and section number together**

<snippet id='codeblock-bkm'/>

After updating the field, the result is "Page 4 of Section 2" (check [Updating Fields](https://docs.telerik.com/devtools/document-processing/libraries/radwordsprocessing/concepts/fields/fields#updating-fields)).

## See Also

* [Fields]({%slug radwordsprocessing-concepts-fields%})
