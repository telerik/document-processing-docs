---
title: Registering Custom Font Variants (Regular, Bold, Italic) for Conversion in Telerik Document Processing
description: Learn how to register custom font variants (Regular, Bold, Italic) in Telerik Document Processing for accurate rendering during DOCX to PDF conversion.
type: how-to
page_title: Proper Font Registration for Custom Font Variants (Regular, Bold, Italic) in DOCX to PDF Conversion
meta_title: Proper Font Registration for Custom Font Variants (Regular, Bold, Italic) in DOCX to PDF Conversion
slug: registering-custom-font-pdf-processing
tags: radpdfprocessing, pdf, font, bold, italic, register, document, processing
res_type: kb
ticketid: 1704494
---

## Environment
| Version | Product | Author | 
| ---- | ---- | ---- | 
| 2025.4.1104| RadPdfProcessing/RadWordsProcessing |[Desislava Yordanova](https://www.telerik.com/blogs/author/desislava-yordanova)| 

## Description

When converting DOCX files to PDF with [PdfProcessing]({%slug radpdfprocessing-concepts-fonts%}), missing or incorrectly registered font variants may cause fallback fonts to appear in the output PDF. This article shows how to register custom font variants (Regular, Bold, Italic) for the Barlow font family (or any other) and perform the conversion with consistent output.

## Solution

To ensure proper rendering of the custom (for example, Barlow) font family in converted PDFs, register each font variant and style individually before conversion. Follow these steps:

1. Register the Regular variant of the Barlow font:
   ```csharp
   byte[] barlowRegular = File.ReadAllBytes(@"..\..\Barlow\Barlow-Regular.ttf");
   var barlowFamily = new FontFamily("Barlow");
   FontsRepository.RegisterFont(barlowFamily, FontStyles.Normal, FontWeights.Normal, barlowRegular);
   ```

2. Register the Regular variant of the Barlow Condensed font:
   ```csharp
   byte[] barlowCondensed = File.ReadAllBytes(@"..\..\Barlow\BarlowCondensed-Regular.ttf");
   var barlowCondensedFamily = new FontFamily("Barlow Condensed");
   FontsRepository.RegisterFont(barlowCondensedFamily, FontStyles.Normal, FontWeights.Normal, barlowCondensed);
   ```

3. Register the Bold variant of the Barlow Condensed font:
   ```csharp
   byte[] barlowCondensedBold = File.ReadAllBytes(@"..\..\Barlow\BarlowCondensed-Bold.ttf");
   var barlowCondensedFamilyBold = new FontFamily("Barlow Condensed");
   FontsRepository.RegisterFont(barlowCondensedFamilyBold, FontStyles.Normal, FontWeights.Bold, barlowCondensedBold);
   ```

4. Register the Regular variant of the Barlow Semi Condensed font:
   ```csharp
   byte[] barlowSemiCondensed = File.ReadAllBytes(@"..\..\Barlow\BarlowSemiCondensed-Regular.ttf");
   var barlowSemiCondensedFamily = new FontFamily("Barlow Semi Condensed");
   FontsRepository.RegisterFont(barlowSemiCondensedFamily, FontStyles.Normal, FontWeights.Normal, barlowSemiCondensed);
   ```

5. Register the Bold variant of the Barlow Semi Condensed font:
   ```csharp
   byte[] barlowSemiCondensedBold = File.ReadAllBytes(@"..\..\Barlow\BarlowSemiCondensed-Bold.ttf");
   var barlowSemiCondensedFamilyBold = new FontFamily("Barlow Semi Condensed SemiBold");
   FontsRepository.RegisterFont(barlowSemiCondensedFamilyBold, FontStyles.Normal, FontWeights.Bold, barlowSemiCondensedBold);
   ```

6. Convert the DOCX file to PDF using the registered fonts:
   ```csharp
   string inputFilePath = @"path-to-docx-file.docx";
   string outputFilePath = @"output-path.pdf";
   DocxFormatProvider docxProvider = new DocxFormatProvider();
   PdfFormatProvider pdfProvider = new PdfFormatProvider();
   RadFlowDocument document;

   using (FileStream inputStream = new FileStream(inputFilePath, FileMode.Open))
   {
       document = docxProvider.Import(inputStream, TimeSpan.FromSeconds(10));
   }

   using (FileStream outputStream = new FileStream(outputFilePath, FileMode.Create))
   {
       pdfProvider.Export(document, outputStream, TimeSpan.FromSeconds(10));
   }
   ```
Verify that the font name matches exactly in the DOCX and in the system font list. If the DOCX uses "Barlow Semi Condensed SemiBold", but the registered font is "Barlow Semi Condensed Bold", fallback occurs. 

## See Also

* [PdfProcessing Overview]({%slug radpdfprocessing-overview%})
* [Registering Fonts]({%slug radpdfprocessing-concepts-fonts%}#registering-a-font)

