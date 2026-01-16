---
title: Change Bookmark Content While Preserving Formatting using WordsProcessing
description: Change the content of a bookmark while preserving its original formatting and properties using the WordsProcessing library.
type: how-to 
page_title: Change Bookmark Content While Preserving Formatting
slug: radwordsprocessing-change-bookmark-content-preserve-formatting
position: 0
tags: bookmarks, formatting, words, processing, content, replace, change, flow, docx
res_type: kb
---

|Product Version|Product|Author|
|----|----|----|
|2025.4.1104|RadWordsProcessing|[Yoan Karamanov](https://www.telerik.com/blogs/author/yoan-karamanov)|

## Description

This article shows how to change the content of an existing [Bookmark]({%slug radwordsprocessing-model-bookmark%}) in a DOCX document while preserving the original text formatting and character properties using the [WordsProcessing]({%slug radwordsprocessing-overview%}) library.

## Solution

* **Import DOCX**: Use [DocxFormatProvider]({%slug radwordsprocessing-formats-and-conversion-docx-docxformatprovider%}) to read the input DOCX and obtain a [RadFlowDocument]({%slug radwordsprocessing-model-radflowdocument%}).
* **Initialize editor**: Create a [RadFlowDocumentEditor]({%slug radwordsprocessing-editing-radflowdocumenteditor%}) for cursor movement and editing.
* **Find bookmark**: Enumerate [BookmarkRangeStart]({%slug radwordsprocessing-model-bookmark%}) elements and select the bookmark by **Name**.
* **Capture formatting**: Get the first [Run]({%slug radwordsprocessing-model-run%}) within the bookmark and copy its **CharacterFormatting** properties.
* **Delete original bookmark content**: Delete only the content between the start and end markers while keeping the bookmark structure intact.
* **Position cursor**: Move the editor back to the start of the bookmark to insert new text in place.
* **Copy formatting**: Apply the formatting of the original bookmark content to the editor properties.
* **Insert text**: Add the replacement content.
* **Export DOCX**: Write the updated document using [DocxFormatProvider]({%slug radwordsprocessing-formats-and-conversion-docx-docxformatprovider%}).

#### Replace bookmark content but keep formatting

```csharp
RadFlowDocument document;
DocxFormatProvider docxFormatProvider = new DocxFormatProvider();

using (Stream input = File.OpenRead("input.docx"))
{
    document = docxFormatProvider.Import(input);
    RadFlowDocumentEditor editor = new RadFlowDocumentEditor(document);

    var documentBookmarks = document.EnumerateChildrenOfType<BookmarkRangeStart>().Select(b => b.Bookmark).ToList();

    // Obtain bookmark by name
    var specificBookmarkByName = documentBookmarks.FirstOrDefault(b => b.Name == "bookmark1");
    // Obtain the first Run element inside the bookmark to copy its formatting
    Run oldBookmarkText = (Run)specificBookmarkByName.BookmarkRangeStart.Paragraph.Inlines.FirstOrDefault(i => i is Run);

    // Keep the bookmark and just change the content
    editor.DeleteContent(specificBookmarkByName.BookmarkRangeStart, specificBookmarkByName.BookmarkRangeEnd, false);
    editor.MoveToInlineEnd(specificBookmarkByName.BookmarkRangeStart);

    // Apply the old formatting to the editor Method 1

    editor.CharacterFormatting.CopyPropertiesFrom(oldBookmarkText.Properties);

    // Apply the old formatting to the editor Method 2

    editor.CharacterFormatting.FontSize.LocalValue = oldBookmarkText.FontSize;
    editor.CharacterFormatting.FontFamily.LocalValue = oldBookmarkText.FontFamily;
    editor.CharacterFormatting.FontStyle.LocalValue = oldBookmarkText.FontStyle;
    editor.CharacterFormatting.FontWeight.LocalValue = oldBookmarkText.FontWeight;
    editor.CharacterFormatting.Strikethrough.LocalValue = oldBookmarkText.Strikethrough;
    editor.CharacterFormatting.FlowDirection.LocalValue = oldBookmarkText.FlowDirection;
    editor.CharacterFormatting.BaselineAlignment.LocalValue = oldBookmarkText.BaselineAlignment;
    editor.CharacterFormatting.ForegroundColor.LocalValue = oldBookmarkText.ForegroundColor;
    editor.CharacterFormatting.HighlightColor.LocalValue = oldBookmarkText.HighlightColor;
    editor.CharacterFormatting.UnderlineColor.LocalValue = oldBookmarkText.Underline.Color;
    editor.CharacterFormatting.UnderlinePattern.LocalValue = oldBookmarkText.Underline.Pattern;

    editor.InsertText("NEW CONTENT");

    using (Stream output = File.OpenWrite("output.docx"))
    {
        docxFormatProvider.Export(document, output);
    }
}
```
![WordsProcessing Change Bookmark Content](images/words-processing-change-bookmark-content.png)

## See Also
* [Bookmark]({%slug radwordsprocessing-model-bookmark%})
