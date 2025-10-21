---
title: Positioning Centered and Right-Aligned Text on the Same Line in PDF
description: Learn how to position centered text and right-aligned text on the same line in a PDF using Telerik Document Processing (RadPdfProcessing).
type: how-to
page_title: Aligning Centered and Right-Margin Text in PDF Using Telerik Document Processing
meta_title: Aligning Centered and Right-Margin Text in PDF Using Telerik Document Processing
slug: aligning-centered-right-margin-text-pdf-telerik-document-processing
tags: pdf, processing,document, position, text, center, right, align, block, measure
res_type: kb
ticketid: 1701532
---

## Environment

| Version | Product | Author | 
| ---- | ---- | ---- | 
| 2025.3.806| RadPdfProcessing |[Desislava Yordanova](https://www.telerik.com/blogs/author/desislava-yordanova)| 

## Description

I want to display centered text and right-aligned text on the same line in a PDF. The centered text varies in length, as does the text in the margin. The goal is to manually position each text block as there is no built-in feature for this layout.

This knowledge base article also answers the following questions:
- How can I align text to the center and right margin on the same line in a PDF?
- How do I calculate positions for text blocks in Telerik Document Processing?
- How can I measure text width and adjust its position in the PDF?

## Solution

To position centered and right-aligned text on the same line, follow these steps:

1. Measure Text Widths: Use the `Block.Measure()` method to determine the width of both the centered text and the right-margin text. Refer to [Measuring Block Size](https://docs.telerik.com/devtools/document-processing/libraries/radpdfprocessing/editing/block#measuring-block-size) for details.

2. Calculate Positions:
   - For centered text, calculate the X position by subtracting the text width from the page width and dividing by two.
   - For right-margin text, set the X position close to the right edge by subtracting the text width and any desired margin.

3. Draw Blocks Separately:
   - Use `FixedContentEditor.Position.Translate(x, y)` to move to the calculated positions.
   - Draw each block using individual `Block` objects.

Here is an example:

```csharp
RadFixedDocument document = new RadFixedDocument();
RadFixedPage page = document.Pages.AddPage();
FixedContentEditor editor = new FixedContentEditor(page);

string centeredText = "This is Centered text";
string rightMarginText = "Right";

Block centerBlock = new Block();
centerBlock.InsertText(centeredText);
Telerik.Documents.Primitives.Size centerSize = centerBlock.Measure();

Block rightBlock = new Block();
rightBlock.InsertText(rightMarginText);
Telerik.Documents.Primitives.Size rightSize = rightBlock.Measure();

double pageWidth = page.Size.Width;
double yPosition = 100; // Example Y position

// Centered text
double centerX = (pageWidth - centerSize.Width) / 2;
editor.Position.Translate(centerX, yPosition);
editor.DrawBlock(centerBlock);

// Right margin text
double rightX = pageWidth - rightSize.Width - 20; // 20 for right margin
editor.Position.Translate(rightX, yPosition);
editor.DrawBlock(rightBlock);

// Save the document
var pdfFormatProvider = new PdfFormatProvider();
string outputFilePath = "StyledDocument.pdf";
using (var output = File.Create(outputFilePath))
{
    pdfFormatProvider.Export(document, output, TimeSpan.FromHours(10));
}
Process.Start(new ProcessStartInfo() { FileName = outputFilePath, UseShellExecute = true });
```

## See Also

- [FixedContentEditor](https://docs.telerik.com/devtools/document-processing/libraries/radpdfprocessing/editing/fixedcontenteditor)
- [Measuring Block Size](https://docs.telerik.com/devtools/document-processing/libraries/radpdfprocessing/editing/block#measuring-block-size)
- [Block Class](https://docs.telerik.com/devtools/document-processing/api/telerik.windows.documents.fixed.model.editing.block)
