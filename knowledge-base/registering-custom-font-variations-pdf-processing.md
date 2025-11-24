---
title: Registering Custom Font Variants (Regular, Bold, Italic) for Conversion in Telerik Document Processing
description: Learn how to register custom font variants in Telerik Document Processing to ensure proper rendering during DOCX to PDF conversion.
type: how-to
page_title: Proper Font Registration for Custom Font Variants (Regular, Bold, Italic) in DOCX to PDF Conversion
meta_title: Proper Font Registration for Custom Font Variants (Regular, Bold, Italic) in DOCX to PDF Conversion
slug: registering-barlow-font-pdf-processing
tags: pdf,processing,telerik, document ,font,register,bold, italic, regular
res_type: kb
ticketid: 1704494
---

## Environment
| Version | Product | Author | 
| ---- | ---- | ---- | 
| 2025.4.1104| RadPdfProcessing/RadWordsProcessing |[Desislava Yordanova](https://www.telerik.com/blogs/author/desislava-yordanova)| 

## Description

When converting DOCX files to PDF using [PdfProcessing](https://docs.telerik.com/devtools/document-processing/libraries/radpdfprocessing/concepts/fonts) for Telerik Document Processing, missing or incorrectly registered font variants may result in fallback fonts being applied in the output PDF. This article addresses how to register different styles and weights of the Barlow font family, including Barlow Condensed and Barlow Semi Condensed, to ensure proper rendering during conversion.

This knowledge base article also answers the following questions:
- How to register custom fonts for Telerik Document Processing?
- Why are Barlow fonts not appearing correctly in the PDF output?
- How to ensure proper font rendering in DOCX to PDF conversion?

## Solution

To ensure proper rendering of the Barlow font family in converted PDFs, register each font variant and style individually before conversion. Follow the steps below:

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
   var barlowSemiCondensedFamilyBold = new FontFamily("Barlow Semi Condensed");
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

Ensure you have correctly installed the fonts on your server and have the corresponding `.ttf` files available.

## See Also

- [PdfProcessing Overview](https://docs.telerik.com/devtools/document-processing/libraries/radpdfprocessing/overview)  
- [Registering Fonts](https://docs.telerik.com/devtools/document-processing/libraries/radpdfprocessing/concepts/fonts)  
- [DOCX to PDF Conversion with Telerik Document Processing](https://docs.telerik.com/devtools/document-processing/libraries/radpdfprocessing/formats/pdf)  

