---
title: Insert Field in Header
description: Insert Field in Header
type: how-to 
page_title: Insert Field in Header 
slug: insert_field_in_header
position: 0
tags: header, field 
res_type: kb
---

|Product Version|Product|Author|
|----|----|----|
|2020.3.1019|RadWordsProcessing|[Dimitar Karamfilov](https://www.telerik.com/blogs/author/dimitar-karamfilov)|

## Description

You need to add a field in the header for example to display page numbering. 

## Solution

This can be achieved by adding a paragraph to the header and then moving the editor position to this paragraph. Once this is done you can insert the field and move the position to another paragraph in the document. 

#### __C# Insert page numbering in he header__

{{region insert_field_in_header}}

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
    
{{endregion}}