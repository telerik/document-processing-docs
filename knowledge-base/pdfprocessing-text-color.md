---
title: Setting Text Color Using PdfProcessing
description: Learn how to set the text color using the Telerik PdfProcessing library.
type: how-to
page_title: How to Change Text Color Using PdfProcessing
meta_title: How to Change Text Color Using PdfProcessing
slug: pdfprocessing-text-color
tags: pdf, processing, text, color, block, color, graphic
res_type: kb
ticketid: 1695311
---

## Environment

| Version | Product | Author | 
| ---- | ---- | ---- | 
| 2025.2.520| RadPdfProcessing |[Desislava Yordanova](https://www.telerik.com/blogs/author/desislava-yordanova)| 

## Description

Learn how to change the forecolor (e.g. red color) for a text block.   

![Change Text Block's ForeColor ><](images/pdfprocessing-text-color.png)     

## Solution

To set the fore color in a text block, use the `FillColor` property of `GraphicProperties`. This property determines the color used for rendering content elements of a block. To apply the change only to specific text, use the `SaveGraphicProperties()` and `RestoreGraphicProperties()` methods. These methods allow you to apply a temporary change and revert to the previous settings.

### Example Code

```csharp
RadFixedDocument document = new RadFixedDocument();
RadFixedPage page = document.Pages.AddPage();
FixedContentEditor editor = new FixedContentEditor(page);

// Create a block to add styled content
Block infoBlock = new Block();

// Save current graphic properties
infoBlock.SaveGraphicProperties();

// Set the FillColor for the text
infoBlock.GraphicProperties.FillColor = new RgbColor(255, 10, 10);
infoBlock.InsertText("Telerik Document Processing: ");

// Restore previous graphic properties
infoBlock.RestoreGraphicProperties();
infoBlock.InsertLineBreak();
infoBlock.InsertText("RadPdfProcessing");
infoBlock.InsertLineBreak();

// Position and draw the block
editor.Position.Translate(100, 100);
editor.DrawBlock(infoBlock);

// Export the document
string fileName = $"{Guid.NewGuid()}.pdf";
File.Delete(fileName);
PdfFormatProvider provider = new PdfFormatProvider();
using Stream stream = File.OpenWrite(fileName);
provider.Export(document, stream, TimeSpan.FromSeconds(10));

Process.Start(new ProcessStartInfo() { UseShellExecute = true, FileName = fileName });
```

## See Also

- [Text and Graphic Properties in PdfProcessing]({%slug radpdfprocessing-editing-text-and-graphic-properties%})  
