---
title: PDFs Not Printing with Lexmark Printers Due to Font Embedding
description: Learn how to fix Lexmark PDF printing failures by embedding all fonts, including watermark fonts, in PDFs created with RadPdfProcessing.
type: troubleshooting
page_title: Resolving PDF Printing Issues with Lexmark Printers
meta_title: Resolving PDF Printing Issues with Lexmark Printers
slug: pdfs-not-printing-lexmark-font-embedding
tags: pdfprocessing, telerik document processing, font embedding, lexmark printers
res_type: kb
ticketid: 1715820
---

## Environment

The following table lists the product, version, and author:

| Version | Product | Author |
| --- | --- | --- |
| 2026.4.1109 | Telerik Document Processing (RadPdfProcessing) | Yoan Karamanov |

## Description

PDF exports from [RadPdfProcessing]({%slug radpdfprocessing-overview%}) can fail to print on some Lexmark printers. This can happen even when an application sets `FontEmbeddingType.Full` and registers TrueType fonts.

## Cause

Some Lexmark printers can reject PDF files that contain non-embedded fonts. RadPdfProcessing does not embed [the 14 standard PDF fonts]({%slug radpdfprocessing-concepts-fonts%}#standard-fonts), including Helvetica. If a PDF uses embedded Arial for its main content but standard Helvetica for a watermark, Lexmark printers can reject the output.

## Solution

Embed every font used in a PDF, including fonts used for watermarks:

1. Use an embedded font for every text element, including watermarks.
2. Replace standard Helvetica in each watermark with an embedded font, such as registered Arial.

Place an Arial TrueType font file named `arial.ttf` in the application's working directory. Register the font data, create a `FontBase` object, and pass it to the method that draws the watermark:

```csharp
private static void AddWatermarkToPage(
    Telerik.Documents.Fixed.Model.RadFixedPage page)
{
    byte[] fontData = System.IO.File.ReadAllBytes("arial.ttf");
    var fontFamily = new Telerik.Documents.Core.Fonts.FontFamily("Arial");
    var fontStyle = Telerik.Documents.Core.Fonts.FontStyles.Normal;
    var fontWeight = Telerik.Documents.Core.Fonts.FontWeights.Normal;

    Telerik.Documents.Fixed.Model.Fonts.FontsRepository.RegisterFont(
        fontFamily, fontStyle, fontWeight, fontData);

    Telerik.Documents.Fixed.Model.Fonts.FontBase embeddedFont;
    bool fontCreated =
        Telerik.Documents.Fixed.Model.Fonts.FontsRepository.TryCreateFont(
            fontFamily, fontStyle, fontWeight, out embeddedFont);

    if (!fontCreated)
    {
        throw new System.InvalidOperationException("Could not create the Arial font.");
    }

    AddWatermark(page, embeddedFont);
}

private static void AddWatermark(
    Telerik.Documents.Fixed.Model.RadFixedPage page,
    Telerik.Documents.Fixed.Model.Fonts.FontBase embeddedFont)
{
    Telerik.Documents.Fixed.Model.Editing.FixedContentEditor editor =
        new Telerik.Documents.Fixed.Model.Editing.FixedContentEditor(page);

    editor.TextProperties.Font = embeddedFont;
    editor.DrawText("Watermark text");
}
```

## See Also

* [RadPdfProcessing overview]({%slug radpdfprocessing-overview%})
* [Font registration and embedding in PDF documents]({%slug radpdfprocessing-concepts-fonts%})
* [PDF export settings]({%slug radpdfprocessing-formats-and-conversion-pdf-settings%})
