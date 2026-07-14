---
title: Settings
description: Learn about the export settings available for the PdfFormatProvider in RadWordsProcessing to customize PDF output.
page_title: Settings
slug: radwordsprocessing-formats-and-conversion-pdf-settings
tags: format, provider, settings, pdf, word, flow, docx, export, document, configuration
published: True
position: 3
---

# Settings

`PdfFormatProvider` allows you to export a `RadFlowDocument` to PDF. The provider's `ExportSettings` property controls the export output.

## Export Settings

The `PdfExportSettings` class derives from the `Telerik.Windows.Documents.Fixed.FormatProviders.Pdf.Export.PdfExportSettings` class related to the [RadPdfProcessing]({%slug radpdfprocessing-overview%}) library. The export allows you to control the image quality, encryption, compliance level, and other PDF-related properties. For more information, refer to the [export settings article for RadPdfProcessing]({%slug radpdfprocessing-formats-and-conversion-pdf-settings%}).

**Example 1** demonstrates how to export a `RadFlowDocument` instance to PDF and specify that it must be PDF/A compliant.

>tip To specify export settings to the `PdfFormatProvider`, you need to add both the `Telerik.Windows.Documents.Fixed.FormatProviders.Pdf.Export` and `Telerik.Windows.Documents.Flow.FormatProviders.Pdf.Export` namespaces. In **Example 1** the *Fixed* alias corresponds to the `Telerik.Windows.Documents.Fixed.FormatProviders.Pdf.Export` namespace.

**Example 1: Apply PdfExportSettings with PdfA2B compliance before exporting the document to PDF**

<snippet id='codeblock-ce'/>

>The PDF/A standard requires documents to contain all fonts used in them within the document. RadPdfProcessing does not support embedding of the standard 14 fonts used in PDF documents listed [here]({%slug radpdfprocessing-concepts-fonts%}). Using these fonts prevents the document from complying with the standard.

## Extensibility Manager

The `ExtensibilityManager` property of the `PdfExportSettings` class allows you to extend the currently supported functionality of the `RadFlowDocument` export to PDF.

`ExtensibilityManager` provides an option to control how lists with different `NumberingStyle` options are exported to PDF. You can achieve this by registering a custom implementation of the `INumberingStyleConverter` interface for a concrete `NumberingStyle` enumeration value.

**Example 2** shows how to register a custom `ChineseCountingConverter` class instance that converts a number with `NumberingStyle.ChineseCounting`.

**Example 2: Register a custom ChineseCounting numbering-style converter through the export extensibility manager**

<snippet id='codeblock-cf'/>

## See Also

* [PdfProcessing Export Settings]({%slug radpdfprocessing-formats-and-conversion-pdf-settings%})
* [PdfProcessing PDF/A Compliancy]({%slug radpdfprocessing-concepts-comply-with-pdfa-standard%})
