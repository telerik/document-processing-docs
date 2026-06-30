---
title: Replace Text with Document Elements
page_title: Replace Text with Document Elements
description: Learn how to find and replace text with various elements in a document using WordsProcessing.
slug: radwordsprocessing-editing-replace-document-elements
tags: replace, word, flow, docx, editing, document, elements, text, search
published: True
position: 6
---

# Replace Text with Document Elements

**RadWordsProcessing** lets you search for a string in a [RadFlowDocument]({%slug radwordsprocessing-model-radflowdocument%}) instance and replace all matches with specified blocks or inlines.

You can search and replace text using [RadFlowDocumentEditor]({%slug radwordsprocessing-editing-radflowdocumenteditor%}). This article lists the available methods and describes how you can use them.

`RadFlowDocumentEditor` exposes the `ReplaceText()` method to enable you to find and replace all instances of a specified string. You can choose between several overloads that allow you to replace the matched text with one or more [blocks]({%slug radwordsprocessing-model%}) (tables or paragraphs) or [inlines]({%slug radwordsprocessing-model%}) (runs, images, annotation marker).

> This functionality is available starting with R3 2021.


## Replace Text with One or More Inlines

* `ReplaceText(string oldText, InlineBase inline, bool matchCase = true, bool matchWholeWord = false)`: Replaces all occurrences of the specified string with a single inline. The last two parameters are optional. If these parameters are not set, the default values are `true` for `matchCase` and `false` for `matchWholeWord`.
* `ReplaceText(string oldText, IEnumerable<InlineBase> inlines, bool matchCase = true, bool matchWholeWord = false)`: Replaces all occurrences of the specified string with a list of inlines. The last two parameters are optional. If these parameters are not set, the default values are `true` for `matchCase` and `false` for `matchWholeWord`.
* `ReplaceText(Regex regex, InlineBase inline)`: Replaces all matches of the passed `Regex` with a single inline.
* `ReplaceText(Regex regex, IEnumerable<InlineBase> inlines)`: Replaces all matches of the passed `Regex` with multiple inlines.

**Example 1: Replace Text with a Single Inline**

<snippet id='libraries-flow-editing-find-and-replace-replace-document-elements-1'/>

**Example 2: Replace Text with Multiple Inlines**

<snippet id='libraries-flow-editing-find-and-replace-replace-document-elements-2'/>

## Replace Text with One or More Blocks

* `ReplaceText(string oldText, BlockBase block, bool matchCase = true, bool matchWholeWord = false)`: Replaces all occurrences of the specified string with a single block. The last two parameters are optional. If these parameters are not set, the default values are `true` for `matchCase` and `false` for `matchWholeWord`.
* `ReplaceText(string oldText, IEnumerable<BlockBase> blocks, bool matchCase = true, bool matchWholeWord = false)`: Replaces all occurrences of the specified string with a list of blocks. The last two parameters are optional. If these parameters are not set, the default values are `true` for `matchCase` and `false` for `matchWholeWord`.
* `ReplaceText(Regex regex, BlockBase block)`: Replaces all matches of the passed `Regex` with a single block.
* `ReplaceText(Regex regex, IEnumerable<BlockBase> blocks)`: Replaces all matches of the passed `Regex` with multiple blocks.

**Example 3: Replace Text with a Single Block**

<snippet id='libraries-flow-editing-find-and-replace-replace-document-elements-3'/>

**Example 4: Replace Text with Multiple Blocks**

<snippet id='libraries-flow-editing-find-and-replace-replace-document-elements-4'/>

## See Also

* [Find and Replace Text and Style]({%slug radwordsprocessing-editing-find-and-replace%})
* [RadFlowDocumentEditor]({%slug radwordsprocessing-editing-radflowdocumenteditor%})
* [RadFlowDocument]({%slug radwordsprocessing-model-radflowdocument%})
