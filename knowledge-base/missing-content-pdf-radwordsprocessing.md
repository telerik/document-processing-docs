---
title: Resolving missing content after HTML/DOCX to PDF conversion with WordsProcessing in .NET Standard
description: Learn how to handle missing content in PDF files generated using RadWordsProcessing for Document Processing due to fonts' specifics.
type: how-to
page_title: Fixing Missing Content in PDFs Generated with RadWordsProcessing
slug: missing-content-word-to-pdf-radwordsprocessing
tags: words, processing, document, pdf, font, custom, fixedextensibilitymanager, fontsprovider, netstandard
res_type: kb
ticketid: 1690314
---

## Environment

| Version | Product | Author | 
| ---- | ---- | ---- | 
| 2025.2.520| Telerik Document Processing|[Desislava Yordanova](https://www.telerik.com/blogs/author/desislava-yordanova)| 

## Description

When generating PDF files using [RadWordsProcessing]({%slug radwordsprocessing-overview%}) from HTML or DOCX templates, specific content may be **missing** in the output due to the fonts used in the document. This occurs because the .NET Standard version of [RadPdfProcessing]({%slug radpdfprocessing-overview%}) does not have a default mechanism to read fonts. To resolve this issue, the font data must be provided explicitly using the **FixedExtensibilityManager** and a custom implementation of the [FontsProviderBase]({%slug pdfprocessing-implement-fontsprovider%}) class.

This knowledge base article also answers the following questions:
- Why is some text missing in RadWordsProcessing-generated PDFs?
- How do I add support for custom fonts in RadPdfProcessing?
- How can I fix missing content in exported PDF files?

## Solution

To ensure that custom fonts are correctly embedded in the PDF files:

1. **Implement a FontsProvider**:
   Create a custom class that inherits from `FontsProviderBase` and override the `GetFontData` method to provide the font data for the required fonts.

   Example implementation:
   ```csharp
   internal class FontsProvider : Telerik.Windows.Documents.Extensibility.FontsProviderBase
   {
       private string fontFolder = Environment.GetFolderPath(Environment.SpecialFolder.Fonts);

       public override byte[] GetFontData(Telerik.Windows.Documents.Core.Fonts.FontProperties fontProperties)
       {
           string fontFamilyName = fontProperties.FontFamilyName;
           bool isBold = fontProperties.FontWeight == Telerik.Documents.Core.Fonts.FontWeights.Bold;
           if (fontFamilyName == "David")
           {
               fontFolder = @"..\..\..\";
               var fontData = this.GetFontDataFromFontFolder("David.ttf");
               fontFolder = Environment.GetFolderPath(Environment.SpecialFolder.Fonts);
               return fontData;
           }

           Debug.WriteLine($"Font not found: {fontFamilyName} (Bold: {isBold})");
           return null;
       }

       private byte[] GetFontDataFromFontFolder(string fontFileName)
       {
           using (FileStream fileStream = File.OpenRead(this.fontFolder + "\\" + fontFileName))
           {
               using (MemoryStream memoryStream = new MemoryStream())
               {
                   fileStream.CopyTo(memoryStream);
                   return memoryStream.ToArray();
               }
           }
       }
   }
   ```

2. **Set the FontsProvider in FixedExtensibilityManager**:
   Assign the custom FontsProvider implementation to the `FontsProvider` property of `FixedExtensibilityManager`.

   ```csharp
   Telerik.Windows.Documents.Extensibility.FontsProviderBase fontsProvider = new FontsProvider();
   Telerik.Windows.Documents.Extensibility.FixedExtensibilityManager.FontsProvider = fontsProvider;
   ```

3. **Ensure Font Availability**:
   Download and include all necessary font files (e.g., `David.ttf`) used in your document. Place them in an accessible location relative to your application.

4. **Rebuild and Run**:
   Integrate the FontsProvider implementation into your application, rebuild, and test the PDF generation process. The previously missing content should now appear in the exported PDF files.

## See Also

- [Implementing FontsProvider]({%slug pdfprocessing-implement-fontsprovider%})
- [Standard Fonts]({%slug radpdfprocessing-concepts-fonts%})
