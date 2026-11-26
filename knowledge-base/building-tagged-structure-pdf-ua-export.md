---
title: Building Tagged Structure for PDF/UA Export
description: Learn how to build tagged PDF/UA structure during export and verify metadata, alternate text, reading order, and tab order in RadPdfProcessing.
type: how-to
page_title: Building Tagged Structure for PDF/UA Export | RadPdfProcessing
slug: building-tagged-structure-pdf-ua-export
tags: radpdfprocessing, pdf, ua, accessibility, tagging, export, fixed
res_type: kb
---

## Environment

| Version | Product | Author |
| --- | --- | --- |
| 2026.3.1027 | RadPdfProcessing | <a href="https://www.telerik.com/blogs/author/yoan-karamanov" target="_blank">Yoan Karamanov</a> |

## Description

`PdfExportSettings.TaggingStrategy` controls whether PDF export builds a new structure tree or reuses an existing one. For PDF/UA-1, set `ComplianceLevel` to `PdfComplianceLevel.PdfUA1`, `FontEmbeddingType` to `FontEmbeddingType.Full`, and `TaggingStrategy` to `TaggingStrategyType.Build`.

This knowledge base article also answers the following questions:

* How do I build tagged structure when exporting PDF/UA-1?
* When do I use `TaggingStrategyType.Build` instead of `TaggingStrategyType.UseExisting`?
* Does setting `PdfComplianceLevel.PdfUA1` make a PDF accessible?

## Solution

Set the compliance level, font embedding type, and tagging strategy before export. The example uses Arial, which is outside the PDF Standard 14 set.

Follow these steps:

1. Create a `RadFixedDocument` with automatic tagging enabled.
2. Set an installed font outside the PDF Standard 14 set for text. Add meaningful content, then set the document title and language.
3. Set `ComplianceLevel` to `PdfComplianceLevel.PdfUA1`, `FontEmbeddingType` to `FontEmbeddingType.Full`, and `TaggingStrategy` to `TaggingStrategyType.Build`.
4. Export the document to a PDF file.

```csharp
using System;
using System.IO;
using Telerik.Documents.Core.Fonts;
using Telerik.Documents.Fixed.FormatProviders.Pdf;
using Telerik.Documents.Fixed.FormatProviders.Pdf.Export;
using Telerik.Documents.Fixed.Model;
using Telerik.Documents.Fixed.Model.Editing;

class Program
{
    static void Main()
    {
        Telerik.Documents.Fixed.Model.RadFixedDocument document =
            new Telerik.Documents.Fixed.Model.RadFixedDocument(autoTag: true);
        document.DocumentInfo.Title = "Accessible Report";
        document.Language = "en-US";

        RadFixedPage page = document.Pages.AddPage();
        Telerik.Documents.Fixed.Model.Editing.FixedContentEditor editor =
            new Telerik.Documents.Fixed.Model.Editing.FixedContentEditor(
                page,
                autoTag: true);
        if (!editor.TextProperties.TrySetFont(new FontFamily("Arial")))
        {
            throw new InvalidOperationException("The Arial font is not available.");
        }
        editor.DrawText("Accessible report content.");

        Telerik.Documents.Fixed.FormatProviders.Pdf.PdfFormatProvider provider =
            new Telerik.Documents.Fixed.FormatProviders.Pdf.PdfFormatProvider();
        provider.ExportSettings.ComplianceLevel = PdfComplianceLevel.PdfUA1;
        provider.ExportSettings.FontEmbeddingType = FontEmbeddingType.Full;
        provider.ExportSettings.TaggingStrategy = TaggingStrategyType.Build;

        using (Stream output = File.OpenWrite("pdf-ua-output.pdf"))
        {
            provider.Export(document, output, TimeSpan.FromSeconds(10));
        }
    }
}
```

`Build` creates a new structure tree during export. The example tags text and sets document metadata, but you still need to verify the output for PDF/UA conformance.

### Key Points

Review these requirements in the exported document:

* `Build` creates a structure tree for content roots that support automatic tagging. Add structure tags manually when content needs a different semantic mapping.
* `TaggingStrategyType.UseExisting` is the default strategy. Use it when you already created a structure tree and want the exporter to reuse it.
* PDF/UA-1 requires embedded fonts so the PDF includes the font data needed to render text when the reader's system lacks that font.
* `FontEmbeddingType.Full` embeds the complete font program for embeddable fonts. PDF Standard 14 fonts are not embedded, regardless of this setting.
* PDF/UA-1 also depends on logical reading order, meaningful structure types, document title and language, alternate descriptions for informative images, and tab order.
* Run an accessibility checker and review the document with assistive technology. `PdfComplianceLevel.PdfUA1` does not confirm that the document semantics match the content.

## See Also

* [Creating Accessible PDF Documents]({%slug create-accessible-pdf-documents%})
* [Tagging PDF Content and Structure]({%slug radpdfprocessing-model-tagged-pdf%})
* [PDF/UA and PDF/A Compliance Levels]({%slug radpdfprocessing-concepts-comply-with-pdfa-standard%})
