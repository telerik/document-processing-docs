---
title: Using FixedContentEditor's DrawText method to Write Extended Latin Characters in PDF Document
description: Learn how to resolve the issue when the FixedContentEditor's DrawText methodin the PdfProcessing library does not display extended Latin characters like Polish letters correctly.
type: how-to
page_title: Displaying Extended Latin Characters with the FixedContentEditor's DrawText in PDF
meta_title: Displaying Extended Latin Characters with FixedContentEditor's DrawText in PDF
slug: fixedcontenteditor-drawtext-extended-latin-characters-pdf
tags: pdf,processing,fixedcontenteditor,draw,text,unicode,extended,latin,font, polish
res_type: kb
ticketid: 1699876
---

## Environment

| Version | Product | Author | 
| ---- | ---- | ---- | 
| 2025.3.806| RadPdfProcessing |[Desislava Yordanova](https://www.telerik.com/blogs/author/desislava-yordanova)| 

## Description

When using the [FixedContentEditor]({%slug radpdfprocessing-editing-fixedcontenteditor%}) **DrawText** method in the Telerik PdfProcessing library to generate PDF documents, extended Latin characters (e.g., Polish letters like "ż", "ł", "ć", "ę", "ś", "ą") may not display correctly. Instead, characters are replaced or omitted, leading to incomplete text in the PDF. This happens because standard PDF fonts like TimesRoman do not support extended Latin characters. This knowledge base article shows how to handle this situation.

## Solution

To correctly display extended Latin characters, use a Unicode-compliant TrueType font and [register]({%slug radpdfprocessing-concepts-fonts%}#registering-a-font) it with the Telerik Document Processing library. Follow these steps:

1. Add the desired TrueType font file (e.g., Segoe UI) to your project.
2. Write the following code to load, register, and use the font for drawing text:

```csharp
RadFixedDocument document = new RadFixedDocument();
RadFixedPage page = document.Pages.AddPage();
page.Size = new Size(595, 842); // A4

FixedContentEditor editor = new FixedContentEditor(page);

// Load the TTF font that supports Polish characters (e.g., Segoe UI)
byte[] fontData = File.ReadAllBytes(@"..\..\..\fonts\segoeui.ttf");

// Register the font with the FontsRepository
var fontFamily = new Telerik.Documents.Core.Fonts.FontFamily("Segoe UI");
var fontStyle = Telerik.Documents.Core.Fonts.FontStyles.Normal;
var fontWeight = Telerik.Documents.Core.Fonts.FontWeights.Normal;
FontsRepository.RegisterFont(fontFamily, fontStyle, fontWeight, fontData);

// Create the font
FontBase font;
bool success = FontsRepository.TryCreateFont(fontFamily, fontStyle, fontWeight, out font);

// Set font properties
editor.TextProperties.FontSize = 12;
editor.TextProperties.Font = font;

// Define the text and position
editor.Position.Translate(10, 10);
string text = "Zażółć gęślą jaźń";

// Draw the text
editor.DrawText(text);

// Export the document
string outputFilePath = "Output.pdf";
File.Delete(outputFilePath);

PdfFormatProvider provider = new PdfFormatProvider();
provider.ExportSettings.FontEmbeddingType = FontEmbeddingType.Full;
using (Stream output = File.OpenWrite(outputFilePath))
{
    provider.Export(document, output, TimeSpan.FromSeconds(10));
}
Process.Start(new ProcessStartInfo() { FileName = outputFilePath, UseShellExecute = true });
```

### Notes:
- In ASP.NET Core, system fonts are not directly accessible. Include the font file in your project.
- Ensure the font file is part of the deployment package for your application.

## See Also

- [FixedContentEditor]({%slug radpdfprocessing-editing-fixedcontenteditor%})
- [Fonts in PdfProcessing]({%slug radpdfprocessing-concepts-fonts%})
- [Cross-Platform Support]({%slug radpdfprocessing-cross-platform-fonts%})
