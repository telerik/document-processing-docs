---
title: TC Field
page_title: TC Field
description: The TC field defines the text and page numbers for entries in a table of contents in a document.
slug: radwordsprocessing-concepts-tc-field
tags: tcfield, word, flow, docx, fields, toc, contents, document, model, entry
published: True
position: 0
---

# TC (Table of Contents Entry) Field

The TC (Table of Contents Entry) field defines the text and page numbers for entries in a table of contents and in lists of tables, figures, and similar contents. Insert this field before the text that you want to include in the contents.

>To update the field, you need to set the [FlowExtensibilityManager.NumberingFieldsProvider]({%slug radpdfprocessing-formats-and-conversion-pdf-numbering-fields-provider%}).

## Syntax

| Syntax |
| :--- |
| { **TC** *"Text"* [Switches ] } |


## Switches

Switches are a way for the code fragment to specify formatting for the result of the field. More information is available in the [Syntax and Switches](https://docs.telerik.com/devtools/document-processing/libraries/radwordsprocessing/concepts/fields/fields#syntax-and-switches) section of the _Fields_ article.

| Switch | Description |
| :--- | :--- |
| \\f Type | The item types used in a particular contents list. Use a unique Type identifier (typically a letter from A-Z) for each type of list. |
| \\l Level | The level of the TC entry. |
| \\n | Omits the page number for the entry. |

## Inserting

You can insert this field through the [RadFlowDocumentEditor]({%slug radwordsprocessing-editing-radflowdocumenteditor%})'s `InsertField()` method. It accepts code as an argument.

**Example 1** demonstrates how you can insert a TC field.

**Example 1: Insert a TC field entry for Item1 with type and level switches**

```C#
    editor.InsertText("Text before ");
    editor.InsertBreak(BreakType.LineBreak);

    editor.InsertField("TC Item1 \\f a \\l 1");

    editor.InsertBreak(BreakType.LineBreak);
    editor.InsertText("Text after");
```

This type of field does not have a result and does not need to be updated.

## See Also

* [RadFlowDocumentEditor]({%slug radwordsprocessing-editing-radflowdocumenteditor%})
* [TOC Field]({%slug radwordsprocessing-concepts-toc-field%})