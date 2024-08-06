---
title: Preserving the Font in PDF Export from Excel
description: Learn how to preserve the bold text when converting Excel documents to PDF using RadSpreadProcessing.
type: how-to
page_title: How to Keep Text Boldness in PDF Conversion with RadSpreadProcessing
slug: preserve-font-boldness-pdf-export-radspreadprocessing
tags: spreadprocessing, document, processing, pdf export, font, registration, bold, text
res_type: kb
ticketid: 1659898
---

## Environment

| Version | Product | Author | 
| --- | --- | ---- | 
| .NET Framework| RadSpreadProcessing |[Desislava Yordanova](https://www.telerik.com/blogs/author/desislava-yordanova)| 

## Description

When converting Excel documents in .NET Framework applications to PDF using RadSpreadProcessing, the bold text in the Excel file might not appear bold in the exported PDF.  The font also may be changed in the exported PDF. This issue often arises due to the PDF export process using a different font than the one specified in the Excel document. For instance, the PDF export might default to using "Arial" font, while the original Excel document uses "Aptos Narrow".

This KB article also answers the following questions:
- How to ensure text boldness is preserved in PDF exports?
- How to register custom fonts for PDF export in RadSpreadProcessing?
- How to handle font discrepancies between Excel documents and PDF exports?

## Solution

To preserve the font and the bold text when exporting an Excel document to PDF, it is necessary to register the font used in the Excel document if it is not part of the [standard fonts]({%slug radpdfprocessing-concepts-fonts%}) supported by the PDF export process. Follow these steps to register a custom font:

1. **Read the font** from the file system. Ensure you include both the regular and bold versions of the font if applicable.

2. **Create a `FontFamily`** instance for the custom font.

3. **Register the font** with the `FontsRepository`. Ensure to register both the regular and bold variations of the font to cover all text styles in the document.

```csharp
            // Read the font file 
            byte[] fontDataAptos = File.ReadAllBytes(@"..\..\..\fonts\Aptos-Narrow.ttf");
            byte[] fontDataAptosBold = File.ReadAllBytes(@"..\..\..\fonts\Aptos-Narrow-Bold.ttf");

            System.Windows.Media.FontFamily fontFamilyAptos = new System.Windows.Media.FontFamily("Aptos Narrow");

            // Register the font 
            Telerik.Windows.Documents.Fixed.Model.Fonts.FontsRepository.RegisterFont(fontFamilyAptos, System.Windows.FontStyles.Normal, System.Windows.FontWeights.Normal, fontDataAptos);
            Telerik.Windows.Documents.Fixed.Model.Fonts.FontsRepository.RegisterFont(fontFamilyAptos, System.Windows.FontStyles.Normal, System.Windows.FontWeights.Bold, fontDataAptosBold);
```

By following these steps, the exported PDF document will correctly display text in bold that was bold in the original Excel document, using the custom font. If other fonts are used in the Excel document, they also should be registered in a similar way.

## See Also

- [Fonts in RadPdfProcessing]({%slug radpdfprocessing-concepts-fonts%})
- [Registering a Font](https://docs.telerik.com/devtools/document-processing/libraries/radpdfprocessing/concepts/fonts#registering-a-font)
