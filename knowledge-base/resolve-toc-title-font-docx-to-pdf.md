---
title: Resolving Distorted Font of TOC (Table of Content) Title When Converting DOCX to PDF
description: Learn how to address text formatting issues and missing text when converting DocX to PDF using the Telerik WordsProcessing library.
type: how-to
page_title: Resolving Distorted Font of TOC (Table of Content) Title When Converting DOCX to PDF
meta_title: Resolving Distorted Font of TOC (Table of Content) Title When Converting DOCX to PDF
slug: resolve-toc-title-font-docx-to-pdf
tags: word,processing, telerik, document, docx, pdf, toc, font, style, text, toc, title
res_type: kb
ticketid: 1710417
---

## Environment

| Version | Product | Author | 
| ---- | ---- | ---- | 
| 2026.1.210| RadWordsProcessing |[Desislava Yordanova](https://www.telerik.com/blogs/author/desislava-yordanova)| 

## Description

When converting a DocX file to PDF using the Telerik WordsProcessing library, the text format may differ from the original file, and some text may be missing. Issues may include mismatched fonts, shifted "Table of Contents" lines, and missing reference notes represented as footnotes.

This knowledge base article also answers the following questions:
- How to fix distorted text formatting during DocX to PDF conversion?
- Why are footnotes missing in PDF generated from DocX?
- How to align "Table of Contents" entries correctly in PDF?

## Solution

### Fixing Font Differences in Table of Contents Title

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

Alternatively, adjust the imported style applied to the TOC title:

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

### Ensuring TOC Entries Align Correctly

1. Define explicit paragraph properties for TOC entries.
2. Set alignment and tab stops.

```csharp
string toc1Id = BuiltInStyleNames.GetTocStyleIdByIndex(1);
document.StyleRepository.AddBuiltInStyle(toc1Id);
var toc1 = document.StyleRepository.GetStyle(toc1Id);
if (toc1 != null)
{
    var pp = toc1.ParagraphProperties;
    pp.TextAlignment.LocalValue = Alignment.Left;
    pp.TabStops.ClearValue();
    pp.TabStops.LocalValue = new TabStopCollection().Insert(new TabStop(20, TabStopType.Left, TabStopLeader.Dot));
}
```

### Keeping TOC on a Single Line

Adjust the page margin for the document before exporting to PDF:

```csharp
foreach (var section in document.Sections)
{
    section.PageMargins = new Padding(50);
}
```

### Addressing Missing Reference Notes

Footnotes and endnotes are currently unsupported by Telerik WordsProcessing. Track progress and vote for this feature request [here](https://feedback.telerik.com/document-processing/1356023-wordsprocessing-footnotes-and-endnotes).

## See Also

- [RadWordsProcessing Styles](https://docs.telerik.com/devtools/document-processing/libraries/radwordsprocessing/concepts/styles)
- [RadWordsProcessing Document Themes](https://docs.telerik.com/devtools/document-processing/libraries/radwordsprocessing/concepts/document-themes)
- [Changing Properties When Converting Flow to PDF](https://docs.telerik.com/devtools/document-processing/knowledge-base/change-properties-when-converting-flow-to-pdf)
- [WordsProcessing: Footnotes and Endnotes Feature Request](https://feedback.telerik.com/document-processing/1356023-wordsprocessing-footnotes-and-endnotes)
