---
title: Customizing the Font of Numbered Lists with RadPdfProcessing
description: Learn how to change the font style of numbered lists in PDF documents using RadPdfProcessing.
type: how-to
page_title: How to Change the Font Style of Numbered Lists in PDFs Using RadPdfProcessing
slug: customize-font-numbered-lists-radpdfprocessing
tags: radpdfprocessing, document processing, fonts, lists, pdf, customization
res_type: kb
ticketid: 1655319
---

## Environment

| Version | Product | Author | 
| --- | --- | ---- | 
| 2024.2.426| RadPdfProcessing |[Desislava Yordanova](https://www.telerik.com/blogs/author/desislava-yordanova)| 

## Description

When creating a PDF and adding a numbered list to a set of blocks, the font of the numbers does not change according to the block's font and remains as Helvetica. This KB article shows how to customize the font of a numbered list in a PDF document.

## Solution

To customize the font of the list numbers to match the font of the block, specify the font by using the `Levels` collection and the `CharacterProperties` property of the respective level in the list. Below is an example demonstrating how to achieve this:

1. Implement a custom `FontsProvider` class to supply the desired fonts in [Cross-platform scenarios]({%slug radpdfprocessing-cross-platform-fonts%}). This class should override the `GetFontData` method to return the font data for the specified `FontProperties`.

```csharp
public class FontsProvider : Telerik.Windows.Documents.Extensibility.FontsProviderBase
{
    public override byte[] GetFontData(Telerik.Windows.Documents.Core.Fonts.FontProperties fontProperties)
    {
        // Implementation of the GetFontData method
        // Example code not reproduced here for brevity
    }
}
```

2. Before creating the PDF document, set the custom `FontsProvider` as the fonts provider.

```csharp
Telerik.Windows.Documents.Extensibility.FontsProviderBase fontsProvider = new FontsProvider();
Telerik.Windows.Documents.Extensibility.FixedExtensibilityManager.FontsProvider = fontsProvider;
```

3. Create the font instance for the list numbers using the `FontsRepository.TryCreateFont` method.

```csharp
FontBase font;
bool success = FontsRepository.TryCreateFont(new FontFamily("Verdana"), FontStyles.Italic, FontWeights.Normal, out font);
```

4. Create a new `List` instance with `ListTemplateType.NumberedDefault` and set the font and size for the list's first level.

```csharp
List list = new(ListTemplateType.NumberedDefault);
list.Levels[0].CharacterProperties.Font = font;
list.Levels[0].CharacterProperties.FontSize = 20;
```

5. Add blocks to the document and set their bullet to the customized list.

```csharp
Block block = new Block();
block.TextProperties.TrySetFont(new Telerik.Documents.Core.Fonts.FontFamily("Calibri"));
block.TextProperties.FontSize = 14;
block.SetBullet(list, 0);
block.InsertText("Custom text block.");
```

6. Export the document to a PDF file.

```csharp
string outputFilePath = "sample.pdf";
PdfFormatProvider provider = new PdfFormatProvider();
using (Stream output = File.OpenWrite(outputFilePath))
{
    provider.Export(document, output);
}
```

![List Number's Font](images/pdf-list-number-font.png)

This approach allows you to customize the font and font size of the numbers in a numbered list, ensuring they match the rest of the text in the PDF document.

## See Also

- [RadPdfProcessing - Using Lists with Block Class]({%slug radpdfprocessing-editing-list%})
- [Cross-platform scenarios]({%slug radpdfprocessing-cross-platform-fonts%})
- [How to Implement FontsProvider]({%slug pdfprocessing-implement-fontsprovider%})
