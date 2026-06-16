---
title: Insert Field in Header
description: Learn how to insert a field in the header of a document to display page numbering or other dynamic content using the RadWordsProcessing library.
type: how-to 
page_title: Insert Field in Header 
slug: insert_field_in_header
position: 0
tags: radwordsprocessing, docx, header, field, document, processing, word, words
res_type: kb
---

## Environment

|Product Version|Product|Author|
|----|----|----|
|2020.3.1019|RadWordsProcessing|[Dimitar Karamfilov](https://www.telerik.com/blogs/author/dimitar-karamfilov)|

## Description

Add a field to the header, for example, to display page numbering. 

## Solution

Add a paragraph to the header and then move the editor position to this paragraph. After that, insert the field and move the position to another paragraph in the document. 

**Example 1: Insert Page Numbering in the Header**

```csharp

    RadFlowDocument document = new RadFlowDocument();

    var section = document.Sections.AddSection();
    var header = section.Headers.Add();

    Paragraph paragraph = header.Blocks.AddParagraph();
    paragraph.TextAlignment = Alignment.Right;

    RadFlowDocumentEditor editor = new RadFlowDocumentEditor(document);
    editor.MoveToParagraphStart(paragraph);

    editor.InsertText("Page ");
    editor.InsertField("PAGE", "3");
    editor.InsertText(" of ");
    editor.InsertField("NUMPAGES", "5");

    var paragrpah2 = section.Blocks.AddParagraph();
    editor.MoveToParagraphStart(paragrpah2);

    document.UpdateFields();
    
```

## See Also

* [Fields in RadWordsProcessing]({%slug radwordsprocessing-concepts-fields%})
* [Headers and Footers]({%slug radwordsprocessing-model-headers-footers%})