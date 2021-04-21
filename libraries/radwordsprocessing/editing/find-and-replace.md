---
title: Find and Replace Text and Style
page_title: Find and Replace Text and Style
description: Learn how to find and replace text or styling with WordsProcessing
slug: radwordsprocessing-editing-find-and-replace
tags: find,search,replace
published: True
position: 5
---

# Find and Replace Text and Style

**RadWordsProcessing** gives you the ability to search for a string in a [RadFlowDocument]({%slug radwordsprocessing-model-radflowdocument%}) instance and replace all matches. The library also allows you to replace the styling of the matches alone.

Searching and replacing can be achieved with the help of the [RadFlowDocumentEditor]({%slug radwordsprocessing-editing-radflowdocumenteditor%}) class exposed by the library which works with a specific document. 


## Find Text

Finding all instances of a string can be achieved with the **FindAll()** method of **RadFlowDocumentEditor**. The editor exposes two methods accepting different parameters.

* **FindAll(string text, bool matchCase, bool matchWholeWord):** Finds all occurrences of the passed string. Accepts two optional Boolean parameters which specify whether the casing should be matched and only whole words should be replaced. If not set the default values are respectively _true_ for matchCase and _false_ for matchWholeWord.

* **FindAll(Regex regex):** Finds all matches of the passed **Regex**.

Both methods return a collection of **FindResult** instances, which in turn expose the following properties:

* **Runs**: Gets a collection of Runs that contains the searched text.

* **RelativeStartIndex**: Gets the index of the first character in the searched text inside the first Run.

* **RelativeEndIndex**: Gets the index of the last character in the searched text inside the last Run.

* **FullMatchText**: Gets the matched text.

**Example 1** shows how to create a **RadFlowDocumentEditor** instance and use it to find all matches of the word "code".

#### **[C#] Example 1: Find text**

{{region cs-radwordsprocessing-editing-find-and-replace_0}}

	RadFlowDocumentEditor editor = new RadFlowDocumentEditor(document); // document is an instance of the RadFlowDocument class
	ReadOnlyCollection<FindResult> findResults = editor.FindAll("code", matchCase: true, matchWholeWord: true);
{{endregion}}

## Replace Text

Finding all instances of a string and replacing it with another can be achieved with the **ReplaceText()** method of **RadFlowDocumentEditor**. The editor exposes two methods accepting different parameters.


* **void ReplaceText(string oldText, string newText, bool matchCase, bool matchWholeWord):** Replaces all occurrences of a string with another string. Accepts two optional Boolean parameters which specify whether the casing should be matched and only whole words should be replaced. If not set the default values are respectively _true_ for matchCase and _false_ for matchWholeWord.

* **void ReplaceText(Regex regex, string newText):** Replaces all matches of the passed **Regex** with the new text.


**Example 2** shows how to create a **RadFlowDocumentEditor** instance and use it to replace all matches of the word "code" with the phrase "source code".


#### **[C#] Example 2: Replace text**

{{region cs-radwordsprocessing-editing-find-and-replace_1}}

	RadFlowDocumentEditor editor = new RadFlowDocumentEditor(document); // document is an instance of the RadFlowDocument class
	editor.ReplaceText("code", "source code", matchCase: true, matchWholeWord: true);
{{endregion}}


## Replace Styling

__RadFlowDocumentEditor__ gives you the ability to format all occurrences of a string in a document. This can be achieved by using one of the overloads of the __ReplaceStyling()__ method. The overloads accept an Action delegate that allows modifying the [CharacterProperties]({%slug radwordsprocessing-concepts-style-properties%}) of the matches.


* __void ReplaceStyling(string searchedText, Action&lt;CharacterProperties&gt; replacePropertiesAction):__ Applies the character property changes from the Action delegate to all matches with the casing of the string.

* __void ReplaceStyling(string searchedText, bool matchCase, bool matchWholeWord, Action&lt;CharacterProperties&gt; replacePropertiesAction):__ Applies the character property changes from the Action delegate to all matches. Accepts Boolean parameters which specify whether the casing should be matched and only whole words should be styled.

* __void ReplaceStyling(Regex regex, Action&lt;CharacterProperties&gt; replacePropertiesAction):__ Applies the character property changes from the Action delegate to all matches of the __Regex__.


**Example 3** shows how to apply a red highlight color to all occurrences of the word "alert".


#### **[C#] Example 3: Replace character properties**

{{region cs-radwordsprocessing-editing-find-and-replace_2}}
	RadFlowDocumentEditor editor = new RadFlowDocumentEditor(document);
	editor.ReplaceStyling("text", new Action<CharacterProperties>((properties) =>
	{
	    properties.HighlightColor.LocalValue = Colors.Red;
	}));
{{endregion}}



## See Also

 * [RadFlowDocumentEditor]({%slug radwordsprocessing-editing-radflowdocumenteditor%})
 * [CharacterProperties]({%slug radwordsprocessing-concepts-style-properties%}) 
 * [RadFlowDocument]({%slug radwordsprocessing-model-radflowdocument%}) 
 * [RadFlowDocumentEditor API Reference](https://docs.telerik.com/devtools/document-processing/api/Telerik.Windows.Documents.Flow.Model.Editing.RadFlowDocumentEditor.html)
