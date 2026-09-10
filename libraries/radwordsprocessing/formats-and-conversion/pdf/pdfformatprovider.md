---
title: Using PdfFormatProvider
description: Learn how to export RadFlowDocument instances to PDF by using the PdfFormatProvider class in RadWordsProcessing, including key package requirements.
page_title: Using PdfFormatProvider
slug: radwordsprocessing-formats-and-conversion-pdf-pdfformatprovider
tags: format, provider, pdf, word, flow, docx, export, document, conversion, rendering
published: True
position: 2
---

# Using PdfFormatProvider

Telerik Document Processing includes the `PdfFormatProvider` class in `RadWordsProcessing` for exporting `RadFlowDocument` instances to PDF.

To use `PdfFormatProvider`, reference the following packages:

* `Telerik.Documents.Core`
* `Telerik.Documents.Flow`
* `Telerik.Documents.Flow.FormatProviders.Pdf`
* `Telerik.Documents.Fixed`

If your project uses the Windows-only package family, use the corresponding `Telerik.Windows.Documents.*` package names instead.

>note Starting with **Q2 2025**, the [ZipLibrary]({%slug radziplibrary-overview%}) is no longer used as an internal dependency in the rest of the Document Processing Libraries—PdfProcessing, WordsProcessing, SpreadProcessing, SpreadStreamProcessing. It is replaced by System.IO.Compression. The Telerik Zip Library continues to ship as a standalone library so you can still use it separately.

## Export

To export a document to PDF, use the `Export()` method of `PdfFormatProvider`. The provider is in the `Telerik.Documents.Flow.FormatProviders.Pdf` namespace and exposes a `PdfExportSettings` instance through its `ExportSettings` property.

>note In .NET Standard,  `PdfFormatProvider` needs access to font data before it can embed fonts in the PDF file. Provide an implementation of the `FontsProviderBase` abstract class and assign it to the `FontsProvider` property of `FixedExtensibilityManager`. Also set the `JpegImageConverter` property of `FixedExtensibilityManager` when you export images other than JPEG and JPEG 2000, or when `ImageQuality` is not `High`. For more information, see [how cross-platform support works in RadPdfProcessing]({%slug radpdfprocessing-cross-platform%}).

The code snippet in **Example 1** shows how to create a `PdfFormatProvider` instance and use it to export a `RadFlowDocument` to a file.

**Example 1: Create a PdfFormatProvider and export a RadFlowDocument to a sample.pdf file stream**

<snippet id='codeblock-cc'/>

The method produces a PDF document that you can open in any PDF viewer.

**Example 2** shows how to export a `RadFlowDocument` directly to a `RadFixedDocument` through the `ExportToFixedDocument()` method.

**Example 2: Export a RadFlowDocument directly to a RadFixedDocument instance**

<snippet id='codeblock-cd'/>

>tip `RadFixedDocument` is the main document model in `RadPdfProcessing`. For more information, see [the RadPdfProcessing overview]({%slug radpdfprocessing-overview%}).

## See Also

* [Timeout Mechanism]({%slug timeout-mechanism-in-dpl%})
* [WordsProcessing PDF Export Demo](https://demos.telerik.com/document-processing/wordsprocessing/pdf_export)
* [Automatic Output Stream Clearing on Export]({%slug common-export-output-stream-clearing%})
