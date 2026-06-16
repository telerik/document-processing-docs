---
title: Replace Existing Text with Inline Element
description: Learn how to replace text with another inline element in a document using WordsProcessing.
type: how-to
page_title: Replace Existing Text with Inline Element
slug: replace-text-with-inline-element
position: 0
tags: radwordsprocessing, docx, text, inline, element, replace, document, processing
res_type: kb
---

## Environment

| Version | Product | Author | 
| --- | --- | ---- | 
| 2020.1.310 | RadWordsProcessing |[Martin Velikov](https://www.telerik.com/blogs/author/martin-velikov)| 

## Description

This article describes how to replace text with other document elements.

## Solution

To achieve this, iterate the document elements of type [Run]({%slug radwordsprocessing-model-run%}) and compare their text with the desired string. If there is a match, store the `Run` index and insert the desired element (in this example a [Break]({%slug radwordsprocessing-model-break%})) at that specific index in the `Inlines` collection. Finally, remove the `Run`.

```csharp

	RadFlowDocumentEditor editor = new RadFlowDocumentEditor(document);
	editor.InsertText("First line");
	editor.InsertText("NewLine");
	editor.InsertText("Second line");

	foreach (Run run in document.EnumerateChildrenOfType<Run>().ToList())
	{
		if (run.Text == "NewLine")
		{
			Paragraph paragraph = run.Paragraph;
			int childIndex = paragraph.Inlines.IndexOf(run);

			Break br = new Break(document);
			br.BreakType = BreakType.LineBreak;
			paragraph.Inlines.Insert(childIndex, br);
			paragraph.Inlines.Remove(run);
		}
	}

```

## See Also

* [Run]({%slug radwordsprocessing-model-run%})
* [Break]({%slug radwordsprocessing-model-break%})
