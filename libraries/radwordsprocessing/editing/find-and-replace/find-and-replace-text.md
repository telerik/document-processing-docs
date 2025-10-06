---
title: Find and Replace Text and Style
page_title: Find and Replace Text and Style
description: Learn how to find and replace text content or styling in a document using WordsProcessing.
slug: radwordsprocessing-editing-find-and-replace
tags: find,search,replace
published: True
position: 5
---

# Find and Replace Text and Style

**RadWordsProcessing** gives you the ability to search for a string in a [RadFlowDocument]({%slug radwordsprocessing-model-radflowdocument%}) instance and replace all matches. The library also allows you to replace the styling of the matches alone.

You can search and replace text or styling using [RadFlowDocumentEditor]({%slug radwordsprocessing-editing-radflowdocumenteditor%}). This article lists the available methods and describes how you can use them. This feature is available since **R2 2021** release version.


## Find Text

**RadFlowDocumentEditor** exposes the **FindAll()** method to enable you to find all instances of a string. You can choose between the following overloads:

* **FindAll(string text, bool matchCase=true, bool matchWholeWord=false):** Finds all occurrences of the specified string. The last two parameters are optional. If these parameters are not set, the default values are true for matchCase and false for matchWholeWord.

* **FindAll(Regex regex):** Finds all matches of the passed **Regex**.

Both methods return a collection of **FindResult** instances, which in turn expose the following properties:

* **Runs**: Gets a collection of [Runs]({%slug radwordsprocessing-model-run%}) that contains the searched text.

* **RelativeStartIndex**: Gets the index of the first character in the searched text inside the first Run.

* **RelativeEndIndex**: Gets the index of the last character in the searched text inside the last Run.

* **FullMatchText**: Gets the matched text.

**Example 1** shows how to create a **RadFlowDocumentEditor** instance and use it to find all matches of the word "code".

#### **[C#] Example 1: Find text**

{{region cs-radwordsprocessing-editing-find-and-replace_0}}
	RadFlowDocument flowDocument;
	DocxFormatProvider docxFormatProvider = new DocxFormatProvider();

	using (Stream input = File.OpenRead("input.docx"))
	{
    	flowDocument = docxFormatProvider.Import(input, TimeSpan.FromSeconds(10));
	}

	RadFlowDocumentEditor radFlowDocumentEditor = new RadFlowDocumentEditor(flowDocument);
	ReadOnlyCollection<Telerik.Windows.Documents.Flow.TextSearch.FindResult> findResults = radFlowDocumentEditor.FindAll("text to search", matchCase: true, matchWholeWord: true);
{{endregion}}

## Replace Text

To find all instances of a string and replace it with another one, you can use the **ReplaceText()** method of **RadFlowDocumentEditor**. The method features two overloads accepting different parameters:


* **void ReplaceText(string oldText, string newText, bool matchCase=true, bool matchWholeWord=false):** Replaces all occurrences of a string with another string. The last two parameters are optional. If these parameters are not set, the default values are true for matchCase and false for matchWholeWord.

* **void ReplaceText(Regex regex, string newText):** Replaces all matches of the specified **Regex** with the new text.


**Example 2** shows how to create a **RadFlowDocumentEditor** instance and use it to replace all matches of the word "code" with the phrase "source code".


#### **[C#] Example 2: Replace text**

{{region cs-radwordsprocessing-editing-find-and-replace_1}}
	radFlowDocumentEditor.ReplaceText("old text", "new text", matchCase: true, matchWholeWord: true);
{{endregion}}


## Replace Styling

__RadFlowDocumentEditor__ gives you the ability to format all occurrences of a string in a document. This can be achieved by using one of the overloads of the __ReplaceStyling()__ method. The overloads accept an Action delegate that allows modifying the [CharacterProperties]({%slug radwordsprocessing-concepts-style-properties%}) of the matches.


* __void ReplaceStyling(string searchedText, Action&lt;CharacterProperties&gt; replacePropertiesAction):__ Applies the character property changes from the Action delegate to all matches with the casing of the string.

* __void ReplaceStyling(string searchedText, bool matchCase, bool matchWholeWord, Action&lt;CharacterProperties&gt; replacePropertiesAction):__ Applies the character property changes from the Action delegate to all matches. Accepts Boolean parameters which specify whether the casing should be matched and only whole words should be styled.

* __void ReplaceStyling(Regex regex, Action&lt;CharacterProperties&gt; replacePropertiesAction):__ Applies the character property changes from the Action delegate to all matches of the __Regex__.


**Example 3** shows how to apply a red highlight color to all occurrences of the word "alert".


#### **[C#] Example 3: Replace character properties**

{{region cs-radwordsprocessing-editing-find-and-replace_2}}
	radFlowDocumentEditor.ReplaceStyling("text", new Action<CharacterProperties>((properties) =>
	{
	    properties.HighlightColor.LocalValue = Colors.Red;
	}));
{{endregion}}

## See Also

 * [RadFlowDocumentEditor]({%slug radwordsprocessing-editing-radflowdocumenteditor%})
 * [CharacterProperties]({%slug radwordsprocessing-concepts-style-properties%}) 
 * [RadFlowDocument]({%slug radwordsprocessing-model-radflowdocument%}) 
 * [Simulating Mail Merge with HTML content by Utilizing the Find and Replace Functionality]({%slug simulating-mail-merge-with-html-content%})
 * [WordsProcessing Replacement Demo](https://demos.telerik.com/document-processing/wordsprocessing/replace)
