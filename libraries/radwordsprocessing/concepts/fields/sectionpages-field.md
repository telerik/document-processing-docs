---
title: SectionPages Field
page_title: SectionPages Field
description: The SectionPages field inserts the total number of pages in a section of a document.
slug: radwordsprocessing-concepts-sectionpages-field
tags: sectionpages, word, flow, docx, fields, document, section, pages, model, total
published: True
position: 0
---

# SectionPages Field

The `SectionPages` field inserts the total number of pages in a section.

## Field Syntax

The following table shows the syntax of a `SectionPages` field:

| Syntax |
| :--- |
| { **SECTIONPAGES** } |


## Inserting

You can insert a `SectionPages` field through the [RadFlowDocumentEditor]({%slug radwordsprocessing-editing-radflowdocumenteditor%})'s `InsertField()` method. It accepts code as the first argument and result as the second argument.

**Example 1** demonstrates how you can insert a `SectionPages` field.

**Example 1: Insert PAGE and SECTIONPAGES fields to display the current page within the current section total**

<snippet id='codeblock-bl'/>

After updating the field, the result is "Page 3 of 19" (check [Updating Fields](https://docs.telerik.com/devtools/document-processing/libraries/radwordsprocessing/concepts/fields/fields#updating-fields)).

## See Also

* [Fields]({%slug radwordsprocessing-concepts-fields%})
* [Time Field]({%slug radwordsprocessing-concepts-time-field%})
* [Custom Code Field]({%slug radwordsprocessing-concepts-customcodefield%})
* [RadFlowDocumentEditor]({%slug radwordsprocessing-editing-radflowdocumenteditor%})
