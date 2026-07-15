---
title: Break
description: Learn about the Break inline element in RadWordsProcessing that inserts line, page, or column breaks in flow documents.
page_title: Break
slug: radwordsprocessing-model-break
tags: break, word, docx, document, flow, model, inline, page, column
published: True
position: 12
---

# Break

The `Break` element is an inline-level flow content element, which specifies that a break is placed at the current location. There are three types of breaks:

* **Line Break**: The break restarts the document content on the next line in the document.
* **Page Break**: The break restarts the document content on the next page of the document.
* **Column Break**: The break restarts the document content on the next column available on the current page of the document.

## Inserting a Break

All inline-level elements in a `RadFlowDocument` must be placed within another element.

**Example 1** shows how to create a `Break` element and add it to a [Paragraph]({%slug radwordsprocessing-model-paragraph%}).

**Example 1: Create a line break and add it to a paragraph**

<snippet id='codeblock-cz'/>

The paragraph must belong to the same document that is passed to the constructor of the `Break` element. The code in **Example 1** inserts a `Break` element of the default break type—line break. You can change the type of a break through its `BreakType` property.

**Example 2** shows how to change the type of the break created in **Example 1**.

**Example 2: Change an existing break from the default line break to a page break**

<snippet id='codeblock-caca'/>

You can also insert a break in the document with the `InsertBreak()` method of the [RadFlowDocumentEditor]({%slug radwordsprocessing-editing-radflowdocumenteditor%}) class.

**Example 3** shows how to insert a break through `RadFlowDocumentEditor`.

**Example 3: Insert a page break with RadFlowDocumentEditor**

<snippet id='codeblock-cbcb'/>

## Modifying a Break

The `Break` element exposes several properties that allow you to customize it:

* `BreakType`: Specifies the type of the break.
* `TextWrappingRestartLocation`: Specifies the text wrapping restart location. This property affects the restart location only if `BreakType` is set to `LineBreak`. Otherwise, it is ignored. The possible values are:
    * `NextLine`: Specifies that the line break advances the text to the next line in the document.
    * `NextFullLine`: Specifies that the line break advances the text to the next line in the document, which is not interrupted by any floating objects.
    * `NextTextRegionUnblockedOnLeft`: Specifies that the line break advances the text to the next line in the document, which is not interrupted by any floating objects on the left.
    * `NextTextRegionUnblockedOnRight`: Specifies that the line break advances the text to the next line in the document, which is not interrupted by any floating objects on the right.

**Example 4** shows how to insert a `Break` through `RadFlowDocumentEditor` and modify it later.

**Example 4: Modify an inserted break to use line-break wrapping at the next full line**

<snippet id='codeblock-cccc'/>

## See Also

* [Model]({%slug radwordsprocessing-model%})
* [Paragraph]({%slug radwordsprocessing-model-paragraph%})
* [RadFlowDocument]({%slug radwordsprocessing-model-radflowdocument%})
