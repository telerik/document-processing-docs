---
title: Setting Text Color Using PdfProcessing
description: Learn how to set the text color using the Telerik PdfProcessing library.
type: how-to
page_title: How to Change Text Color Using PdfProcessing
meta_title: How to Change Text Color Using PdfProcessing
slug: pdfprocessing-text-color
tags: pdf, processing, text color, cell, fill, color, graphic, properties
res_type: kb
ticketid: 1695311
---

## Environment

| Version | Product | Author | 
| ---- | ---- | ---- | 
| 2025.2.520| RadPdfProcessing |[Desislava Yordanova](https://www.telerik.com/blogs/author/desislava-yordanova)| 

## Description

I want to set the text color in a cell but cannot find an option for this in `TextProperties`. The only visible option is `HighlightColor`. 

This knowledge base article also answers the following questions:
- How to change the text color in PdfProcessing cells?
- How to use FillColor to set cell text color in Telerik Document Processing?
- What is the method to apply custom text color in RadPdfProcessing blocks?

## Solution

To set the text color in a cell, use the `FillColor` property of `GraphicProperties`. This property determines the color used for rendering content elements of a block. To apply the change only to specific text, use the `SaveGraphicProperties()` and `RestoreGraphicProperties()` methods. These methods allow you to apply a temporary change and revert to the previous settings.

Follow the steps below:

1. Create a new `RadFixedDocument` and add a page.
2. Initialize a `FixedContentEditor` for the page.
3. Create a `Block` and call `SaveGraphicProperties()` to save the current settings.
4. Assign a color to `GraphicProperties.FillColor`.
5. Insert the text that needs the custom color.
6. Call `RestoreGraphicProperties()` to revert to the previous settings.
7. Continue adding text or elements to the block.
8. Export the document using `PdfFormatProvider`.

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

- [Text and Graphic Properties in PdfProcessing](https://docs.telerik.com/devtools/document-processing/libraries/radpdfprocessing/editing/text-and-graphic-properties)
- [Block Class Documentation](https://docs.telerik.com/devtools/document-processing/libraries/radpdfprocessing/editing/block)
- [RadPdfProcessing Overview](https://docs.telerik.com/devtools/document-processing/libraries/radpdfprocessing/overview)
