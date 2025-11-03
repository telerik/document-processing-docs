---
title: Preserving Original Bold, Italic and Regular Fonts When Exporting PDF Documents Using PdfProcessing  in .NET Standard
description: Learn how to ensure the original bold, italic and regular fonts in a PDF remain unchanged while embedding specific fonts using PdfProcessing in .NET Standard.
type: how-to
page_title: Preserving Original Bold, Italic and Regular Fonts When Exporting PDF Documents Using PdfProcessing in .NET Standard
meta_title: Prevent Font Conversion While Embedding Fonts Using PdfProcessing
slug: pdfprocessing-prevent-font-conversion-embedding-fonts
tags: pdf, processing, telerik, document, embed, font,provider, net, standard, bold, italic, normal, style
res_type: kb
ticketid: 1701737
---

## Environment

| Version | Product | Author | 
| ---- | ---- | ---- | 
| 2025.3.806| RadPdfProcessing |[Desislava Yordanova](https://www.telerik.com/blogs/author/desislava-yordanova)| 

## Description

When using the [PdfProcessing]({%slug radpdfprocessing-overview%}) library in .NET Standard to embed fonts into a PDF, the behavior can lead to unintended font substitution for text content and fields that are already using a different font. This happens because the .NET Standard environment requires the font data to be explicitly provided for embedding, unlike the .NET Framework which can access system fonts directly. Without providing the required font files, the library substitutes missing fonts, potentially altering the PDF's appearance. This unexpected result commonly arises when the font chosen for embedding replaces existing fonts in the document, such as converting Arial text to Courier New, resulting in illegible text in certain languages.

This article provides steps to prevent such undesired font conversion when embedding fonts in a PDF using PdfProcessing.

This knowledge base article also answers the following questions:
- How can I prevent font substitution in PdfProcessing while embedding fonts?
- How do I embed fonts without altering the text appearance in PdfProcessing?
- How to manage fonts dynamically when embedding them in PdfProcessing?

## Solution

To prevent font substitution for text content and fields that should retain their original fonts and style during the embedding process, implement a custom **FontsProvider**. This provider dynamically supplies font data based on the font name and properties found in your PDF.

Follow these steps:

1. Create a custom [FontsProvider]({%slug radpdfprocessing-cross-platform-fonts%}) by inheriting from **FontsProviderBase**.
2. Implement the **GetFontData** method to dynamically return font data based on the font properties.
3. Optionally, maintain a repository of commonly used fonts to automate font discovery.

Example implementation of a dynamic **FontsProvider**:

```csharp
public class FontsProvider : Telerik.Windows.Documents.Extensibility.FontsProviderBase
{
    public override byte[] GetFontData(Telerik.Windows.Documents.Core.Fonts.FontProperties fontProperties)
    {
        string fontFolder = Environment.GetFolderPath(Environment.SpecialFolder.Fonts);
        string fontFileName = GetFontFileName(fontProperties);

        string fontPath = Path.Combine(fontFolder, fontFileName);
        if (File.Exists(fontPath))
        {
            return File.ReadAllBytes(fontPath);
        }

        return null;
    }

    private string GetFontFileName(Telerik.Windows.Documents.Core.Fonts.FontProperties fontProperties)
    {
        string family = fontProperties.FontFamilyName.ToLowerInvariant();
        bool isBold = fontProperties.FontWeight == FontWeights.Bold;
        bool isItalic = fontProperties.FontStyle == FontStyles.Italic;

        // Mapping for known fonts
        if (family == "courier new")
        {
            if (isBold && isItalic) return "courbi.ttf";
            if (isBold) return "courbd.ttf";
            if (isItalic) return "couri.ttf";
            return "cour.ttf";
        }

        // Generic fallback: try to construct filename from family and style
        string suffix = "";
        if (isBold && isItalic) suffix = "bi";
        else if (isBold) suffix = "bd";
        else if (isItalic) suffix = "i";

        return $"{family}{suffix}.ttf";
    }
}
```

#### Applying the Fonts Provider

```csharp
Telerik.Windows.Documents.Extensibility.FontsProviderBase fontsProvider = new FontsProvider();
Telerik.Windows.Documents.Extensibility.FixedExtensibilityManager.FontsProvider = fontsProvider;
```

### Notes:
- Ensure the required font files are installed on your machine or stored locally in a specified directory.
- For automation, maintain a repository of commonly used fonts and expand it as new fonts are encountered.
- This implementation handles font data dynamically based on the document's font properties, avoiding hardcoding specific font names wherever possible.

## See Also

- [Implementing a FontsProvider]({%slug radpdfprocessing-concepts-fonts%})
