---
title: Replace Text with Document Elements
page_title: Replace Text with Document Elements
description: Learn how to find and replace text with various elements in a document using WordsProcessing.
slug: radwordsprocessing-editing-replace-document-elements
tags: find,search,replace
published: True
position: 6
---

# Replace Text with Document Elements

**RadWordsProcessing** gives you the ability to search for a string in a [RadFlowDocument]({%slug radwordsprocessing-model-radflowdocument%}) instance and replace all matches with specified blocks or inlines. 

You can search and replace text  using [RadFlowDocumentEditor]({%slug radwordsprocessing-editing-radflowdocumenteditor%}). This article lists the available methods and describes how you can use them.

**RadFlowDocumentEditor** exposes the **ReplaceText()** method to enable you to find and replace all instances of a specified string. You can choose between several overloads that allow you to replace the matched text with one or more [blocks]({%slug radwordsprocessing-model%}) (tables or paragraphs) or [inlines]({%slug radwordsprocessing-model%}) (runs, images, annotation marker). 

> This functionality is available with R3 2021.


## Replace Text with One or more Inlines

* __ReplaceText(string oldText, InlineBase inline, bool matchCase = true, bool matchWholeWord = false):__ Replaces all occurrences of the specified string with a single inline. The last two parameters are optional. If these parameters are not set, the default values are true for matchCase and false for matchWholeWord.
* __ReplaceText(string oldText, IEnumerable\<InlineBase\> inlines, bool matchCase = true, bool matchWholeWord = false):__ Replaces all occurrences of the specified string with a list of inlines. The last two parameters are optional. If these parameters are not set, the default values are true for matchCase and false for matchWholeWord.
* __ReplaceText(Regex regex, InlineBase inline):__ Replaces all matches of the passed **Regex** with a single inline. 
* __ReplaceText(Regex regex, IEnumerable\<InlineBase\> inlines):__ Replaces all matches of the passed **Regex** with multiple inlines. 

#### __[C#] Example 1: Replace text with a single inline__

<snippet id='codeblock-bP'/>

#### __[C#] Example 2: Replace text with multiple inlines__

<snippet id='codeblock-bQ'/>

## Replace Text with One or more Blocks 

* __ReplaceText(string oldText, BlockBase block, bool matchCase = true, bool matchWholeWord = false):__ Replaces all occurrences of the specified string with a single block. The last two parameters are optional. If these parameters are not set, the default values are true for matchCase and false for matchWholeWord.
* __ReplaceText(string oldText, IEnumerable\<BlockBase \> blocks, bool matchCase = true, bool matchWholeWord = false):__ Replaces all occurrences of the specified string with a list of blocks. The last two parameters are optional. If these parameters are not set, the default values are true for matchCase and false for matchWholeWord.
* __ReplaceText(Regex regex, BlockBase block):__ Replaces all matches of the passed **Regex** with a single block. 
* __ReplaceText(Regex regex, IEnumerable\<BlockBase\> blocks):__ Replaces all matches of the passed **Regex** with multiple blocks. 

#### __[C#] Example 3: Replace text with a single block__

<snippet id='codeblock-bR'/>

#### **[C#] Example 4: Replace text with multiple blocks**

<snippet id='codeblock-bS'/>

