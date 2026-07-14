---
title: Find and Replace Text and Style
page_title: Find and Replace Text and Style
description: Learn how to find and replace text content or styling in a document using WordsProcessing.
slug: radwordsprocessing-editing-find-and-replace
tags: find, replace, word, flow, docx, editing, document, text, search, style
published: True
position: 5
---

# Find and Replace Text and Style

**RadWordsProcessing** lets you search for a string in a [RadFlowDocument]({%slug radwordsprocessing-model-radflowdocument%}) instance and replace all matches. The library also allows you to replace the styling of the matches alone.

You can search and replace text or styling through [RadFlowDocumentEditor]({%slug radwordsprocessing-editing-radflowdocumenteditor%}). This article lists the available methods and describes how to use them. This feature is available starting with the **R2 2021** release.


## Find Text

`RadFlowDocumentEditor` exposes the `FindAll()` method to enable you to find all instances of a string. You can choose between the following overloads:

| Method | Description |
|---|---|
| `FindAll(string text, bool matchCase=true, bool matchWholeWord=false)` | Finds all occurrences of the specified string. Default values: `matchCase = true`, `matchWholeWord = false`. |
| `FindAll(Regex regex)` | Finds all matches of the passed `Regex`. |

Both methods return a collection of `FindResult` instances, which in turn expose the following properties:

| Property | Description |
|---|---|
| `Runs` | Gets a collection of [Runs]({%slug radwordsprocessing-model-run%}) that contains the searched text. |
| `RelativeStartIndex` | Gets the index of the first character in the searched text inside the first `Run`. |
| `RelativeEndIndex` | Gets the index of the last character in the searched text inside the last `Run`. |
| `FullMatchText` | Gets the matched text. |

**Example 1** shows how to create a `RadFlowDocumentEditor` instance and use it to find all matches of the word "code".

**Example 1: Find all whole-word, case-sensitive matches for the target text in an imported DOCX document**

<snippet id='codeblock-bmbm'/>

## Replace Text

To find all instances of a string and replace it with another one, you can use the `ReplaceText()` method of `RadFlowDocumentEditor`. The method features the following overloads:

| Method | Description |
|---|---|
| `ReplaceText(string oldText, string newText, bool matchCase=true, bool matchWholeWord=false)` | Replaces all occurrences of a string with another string. Default values: `matchCase = true`, `matchWholeWord = false`. |
| `ReplaceText(Regex regex, string newText)` | Replaces all matches of the specified `Regex` with the new text. |


**Example 2** shows how to create a `RadFlowDocumentEditor` instance and use it to replace all matches of the word "code" with the phrase "source code".


**Example 2: Replace all whole-word, case-sensitive matches of old text with new text**

<snippet id='codeblock-bnbn'/>


## Replace Styling

`RadFlowDocumentEditor` gives you the ability to format all occurrences of a string in a document. Use one of the overloads of the `ReplaceStyling()` method:

| Method | Description |
|---|---|
| `ReplaceStyling(string searchedText, Action<CharacterProperties> replacePropertiesAction)` | Applies character property changes to all matches with the casing of the string. |
| `ReplaceStyling(string searchedText, bool matchCase, bool matchWholeWord, Action<CharacterProperties> replacePropertiesAction)` | Applies character property changes to all matches. Accepts Boolean parameters to control case matching and whole-word matching. |
| `ReplaceStyling(Regex regex, Action<CharacterProperties> replacePropertiesAction)` | Applies character property changes to all matches of the `Regex`. |


**Example 3** shows how to apply a red highlight color to all occurrences of the word "alert".


**Example 3: Highlight all matches of the word text with a red highlight color**

<snippet id='codeblock-bobo'/>

## See Also

* [RadFlowDocumentEditor]({%slug radwordsprocessing-editing-radflowdocumenteditor%})
* [CharacterProperties]({%slug radwordsprocessing-concepts-style-properties%})
* [RadFlowDocument]({%slug radwordsprocessing-model-radflowdocument%})
* [Simulating Mail Merge with HTML content by Utilizing the Find and Replace Functionality]({%slug simulating-mail-merge-with-html-content%})
* [WordsProcessing Replacement Demo](https://demos.telerik.com/document-processing/wordsprocessing/replace)
* [Mail Merge with HTML Formatted Strings in RadWordsProcessing]({%slug mail-merge-html-formatted-strings-radwordsprocessing%})
