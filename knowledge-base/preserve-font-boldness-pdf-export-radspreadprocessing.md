---
title: Preserving the Font in PDF Export from Excel
description: Learn how to preserve bold text formatting when exporting Excel documents to PDF by registering custom fonts with RadSpreadProcessing.
type: how-to
page_title: How to Preserve Text Boldness in PDF Conversion with RadSpreadProcessing
slug: preserve-font-boldness-pdf-export-radspreadprocessing
tags: radspreadprocessing, pdf, font, bold, export, document, processing, excel
res_type: kb
ticketid: 1659898
---

## Environment

| Version | Product | Author | 
| --- | --- | ---- | 
| .NET Framework| RadSpreadProcessing |[Desislava Yordanova](https://www.telerik.com/blogs/author/desislava-yordanova)| 

## Description

When you convert Excel documents to PDF format in .NET Framework applications by using [RadSpreadProcessing]({%slug radspreadprocessing-overview%}), the bold text in the Excel file may not appear bold in the exported PDF. The font may also change in the exported document. This issue occurs because the PDF export process uses a different font than the one specified in the Excel document. For example, the PDF export may default to "Arial" while the original Excel document uses "Aptos Narrow".

This KB article also answers the following questions:

* How to ensure text boldness is preserved in PDF exports?
* How to register custom fonts for PDF export in RadSpreadProcessing?
* How to handle font discrepancies between Excel documents and PDF exports?

## Solution

To preserve the font and bold text when exporting an Excel document to PDF, register the font used in the Excel document if it is not part of the [standard fonts]({%slug radpdfprocessing-concepts-fonts%}) supported by the PDF export process. Follow these steps to register a custom font:

1. **Read the font** from the file system. Include both the regular and bold versions of the font if applicable.

2. **Create a `FontFamily`** instance for the custom font.

3. [Register the font]({%slug radpdfprocessing-concepts-fonts%}#registering-a-font) with the `FontsRepository`. Register both the regular and bold variations of the font to cover all text styles in the document.

```csharp
// Read the font file.
byte[] fontDataAptos = File.ReadAllBytes(@"..\..\..\fonts\Aptos-Narrow.ttf");
byte[] fontDataAptosBold = File.ReadAllBytes(@"..\..\..\fonts\Aptos-Narrow-Bold.ttf");

System.Windows.Media.FontFamily fontFamilyAptos = new System.Windows.Media.FontFamily("Aptos Narrow");

// Register the font.
Telerik.Windows.Documents.Fixed.Model.Fonts.FontsRepository.RegisterFont(fontFamilyAptos, System.Windows.FontStyles.Normal, System.Windows.FontWeights.Normal, fontDataAptos);
Telerik.Windows.Documents.Fixed.Model.Fonts.FontsRepository.RegisterFont(fontFamilyAptos, System.Windows.FontStyles.Normal, System.Windows.FontWeights.Bold, fontDataAptosBold);
```

After you complete these steps, the exported PDF document correctly displays the bold text from the original Excel document with the custom font. If the Excel document uses other fonts, register them in the same way.

## See Also

* [Fonts in RadPdfProcessing]({%slug radpdfprocessing-concepts-fonts%})
* [Registering a Font]({%slug radpdfprocessing-concepts-fonts%}#registering-a-font)
* [Using PdfFormatProvider]({%slug radspreadprocessing-formats-and-conversion-pdf-pdfformatprovider%})
