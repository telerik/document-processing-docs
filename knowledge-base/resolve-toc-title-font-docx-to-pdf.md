---
title: Resolving Distorted Font of TOC (Table of Contents) Title When Converting DOCX to PDF
description: Learn how to address font issues with the TOC title when converting DOCX to PDF using the Telerik WordsProcessing library.
type: how-to
page_title: Resolving Distorted Font of TOC (Table of Contents) Title When Converting DOCX to PDF
meta_title: Resolving Distorted Font of TOC (Table of Contents) Title When Converting DOCX to PDF
slug: resolve-toc-title-font-docx-to-pdf
tags: word,processing, telerik, document, docx, pdf, toc, font, style, text, toc, title
res_type: kb
ticketid: 1710417
---

## Environment

| Version | Product | Author | 
| ---- | ---- | ---- | 
| 2026.1.210| RadWordsProcessing |[Desislava Yordanova](https://www.telerik.com/blogs/author/desislava-yordanova)| 
|4.8.1|.NET Framework||

## Description

When converting a DOCX file to PDF format using the [WordsProcessing]({%slug radwordsprocessing-overview%}) library, the text's font may differ from the original file for the TOC (`Table of contents`) title. This article explains why this is observed and how to handle this behavior.  

## Solution

The [TOC title]({%slug radwordsprocessing-concepts-toc-field%}) uses the **TOC Heading** style.
In Word (and in RadWordsProcessing), the text `Table of Contents` is formatted by the built‑in [style]({%slug radwordsprocessing-concepts-styles%}) **TOC Heading**. If that style isn’t explicitly set (or you set it before the TOC updates), the export may fall back to defaults and you’ll see a different font in the PDF. 

Once the DOCX file is imported in a [RadFlowDocument]({%slug radwordsprocessing-model-radflowdocument%}) using the [DocxFormatProvider]({%slug radwordsprocessing-formats-and-conversion-docx-docxformatprovider%}), there are two possible approaches to specify the font for the TOC title:

### Applying a Custom Style 

1. Define a custom style for the "Table of Contents" title.
2. Apply the custom style to the corresponding paragraph in the document.

```csharp
var style = new Telerik.Windows.Documents.Flow.Model.Styles.Style(BuiltInStyleNames.TocHeadingStyleId, StyleType.Character);
style.CharacterProperties.FontFamily.LocalValue = new ThemableFontFamily("Times New Roman");
style.CharacterProperties.FontSize.LocalValue = 14;
document.StyleRepository.Add(style);

var tocTitle = document
    .EnumerateChildrenOfType<Paragraph>()
    .FirstOrDefault(p =>
        p.Inlines.OfType<Run>().Any(r =>
            (r.Text ?? string.Empty).Trim().Equals("Table of Contents", StringComparison.OrdinalIgnoreCase) ||
            (r.Text ?? string.Empty).Trim().Equals("Contents", StringComparison.OrdinalIgnoreCase)));

if (tocTitle != null)
{
    tocTitle.StyleId = BuiltInStyleNames.TocHeadingStyleId;
}
```

### Modifying the Applied Style

1. Get the style that is already applied to the TOC title.

2. Adjust the imported style and apply the desired font:

```csharp
var tocTitle = document
    .EnumerateChildrenOfType<Paragraph>()
    .FirstOrDefault(p =>
        p.Inlines.OfType<Run>().Any(r =>
            (r.Text ?? string.Empty).Trim().Equals("Table of Contents", StringComparison.OrdinalIgnoreCase) ||
            (r.Text ?? string.Empty).Trim().Equals("Contents", StringComparison.OrdinalIgnoreCase)));

if (tocTitle != null)
{
    var tocHeadingStyle = document.StyleRepository.GetStyle(tocTitle.StyleId);

    if (tocHeadingStyle != null)
    {
        tocHeadingStyle.CharacterProperties.FontFamily.LocalValue = new ThemableFontFamily("Times New Roman");
        tocHeadingStyle.CharacterProperties.FontWeight.LocalValue = FontWeights.Bold;
    }
}
```
## See Also

- [Styles]({%slug radwordsprocessing-concepts-styles%})
- [TOC field]({%slug radwordsprocessing-concepts-toc-field%}) 
