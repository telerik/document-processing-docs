---
title: Working with Content Controls
page_title: Working with Content Controls
description: Learn how to access, insert, modify, and remove content controls programmatically in RadWordsProcessing documents.
slug: wordsprocessing-model-working-with-content-controls
tags: content, controls, word, flow, document, docx, editing, sdt, access, api
published: True
---

# Working with Content Controls

This article shows examples of how to insert content controls, access existing ones, and modify their properties in code.

## Manipulating Existing Content Controls

### Getting the Content Controls

You can retrieve the content controls by using the `EnumerateChildrenOfType()` method of any document element.

**Example 1: Get All Content Controls**

<snippet id='codeblock-dndn'/>

### Setting Content Controls Properties

This example shows how to iterate the items and add an item to an existing `ComboBox` content control.

**Example 2: Adding Items to a ComboBox or a DropDownList**

<snippet id='codeblock-dodo'/>

## Inserting or Removing Content Controls

You can insert new content controls through the `InsertStructuredDocumentTag` method of [RadFlowDocumentEditor]({%slug radwordsprocessing-editing-radflowdocumenteditor%}). The method has several overloads that allow you to insert the content control by passing its type, properties, and relative document elements.

>note If you add content controls with the `InsertStructuredDocumentTag(SdtType)` method without specifying the content, the resulting document only has the annotation range start and end of the control. Add the desired content manually afterwards.

**Example 3: Inserting a Content Control Using Content Control Type**

<snippet id='codeblock-dpdp'/>

**Example 4: Inserting a Rich Text Content Control Using Content Control Properties**

<snippet id='codeblock-dqdq'/>

**Example 5: Inserting a CheckBox Content Control Using Content Control Properties**

<snippet id='codeblock-drdr'/>

**Example 6: Remove a Content Control**

<snippet id='codeblock-dsds'/>

**Example 7: Insert a Content Control to a Specific Position**

>note When using the `InsertStructuredDocumentTag()` method and passing start and end elements, ensure that the elements are not already part of a content control. An exception to the rule are the rich text and repeating section content controls, which can fully contain other controls, with the restriction that they cannot intersect their ranges.

>caption Figure 1: Examples of correct and incorrect adding of content controls

![working-with-content-controls001](images/working-with-content-controls001.png)

<snippet id='codeblock-dtdt'/>

## See Also

* [Content Controls Overview]({%slug wordsprocessing-model-content-controls%})
