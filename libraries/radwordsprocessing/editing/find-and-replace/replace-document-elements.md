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

{{region cs-radwordsprocessing-editing-replace-document-elements_0}}

	// Prepare Document 
	RadFlowDocument document = new RadFlowDocument();
	RadFlowDocumentEditor editor = new RadFlowDocumentEditor(document);
	editor.InsertText("Content Before");
	editor.InsertParagraph();
	editor.InsertText("Replace");
	editor.InsertParagraph();
	editor.InsertText("Content After");
	
	Run run = new Run(document);
	run.Text = "New Content";
	
	// Replace 
	editor.ReplaceText("Replace", run, true, true);

{{endregion}}

#### __[C#] Example 2: Replace text with multiple inlines__

{{region cs-radwordsprocessing-editing-replace-document-elements_1}}

	// Prepare Document
	RadFlowDocument document = new RadFlowDocument();
	RadFlowDocumentEditor editor = new RadFlowDocumentEditor(document);
	editor.InsertText("Content Before Replace Content After");
	
	List<InlineBase> newContent = new List<InlineBase>();
	
	Run run = new Run(document);
	run.Text = "New Content";
	
	ImageInline image = new ImageInline(document);
	image.Image.Size = new System.Windows.Size(100, 100);
	
	newContent.Add(run);
	newContent.Add(image);
	
	// Replace
	editor.ReplaceText("Replace", newContent, true, true);

{{endregion}}

## Replace Text with One or more Blocks 

* __ReplaceText(string oldText, BlockBase block, bool matchCase = true, bool matchWholeWord = false):__ Replaces all occurrences of the specified string with a single block. The last two parameters are optional. If these parameters are not set, the default values are true for matchCase and false for matchWholeWord.
* __ReplaceText(string oldText, IEnumerable\<BlockBase \> blocks, bool matchCase = true, bool matchWholeWord = false):__ Replaces all occurrences of the specified string with a list of blocks. The last two parameters are optional. If these parameters are not set, the default values are true for matchCase and false for matchWholeWord.
* __ReplaceText(Regex regex, BlockBase block):__ Replaces all matches of the passed **Regex** with a single block. 
* __ReplaceText(Regex regex, IEnumerable\<BlockBase\> blocks):__ Replaces all matches of the passed **Regex** with multiple blocks. 

#### __[C#] Example 3: Replace text with a single block__

{{region cs-radwordsprocessing-editing-replace-document-elements_2}}

    // Prepare Document
    RadFlowDocument document = new RadFlowDocument();
    RadFlowDocumentEditor editor = new RadFlowDocumentEditor(document);
    editor.InsertText("Content Before");
    editor.InsertParagraph();
    editor.InsertText("Replace");
    editor.InsertParagraph();
    editor.InsertText("Content After");
    
    Table table =  this.GetSampleTable(document);
    
    // Replace
    editor.ReplaceText("Replace", table, true, true);

{{endregion}}

#### **[C#] Example 4: Replace text with multiple blocks**

{{region cs-radwordsprocessing-editing-replace-document-elements_3}}

    // Prepare Document
    RadFlowDocument document = new RadFlowDocument();
    RadFlowDocumentEditor editor = new RadFlowDocumentEditor(document);
    editor.InsertText("Content Before");
    editor.InsertParagraph();
    editor.InsertText("Replace");
    editor.InsertParagraph();
    editor.InsertText("Content After");
    
    List<BlockBase> newContent = new List<BlockBase>();
    Table table =  this.GetSampleTable(document);
    newContent.Add(table);
    newContent.Add(new Paragraph(document));
    
    Table table2 = this.GetSampleTable(document);
    newContent.Add(table);
    newContent.Add(new Paragraph(document));
     
    // Replace
    editor.ReplaceText("Replace", newContent, true, true);
{{endregion}}

