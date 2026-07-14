---
title: Using PdfFormatProvider
description: Learn how to export RadFlowDocument to PDF using the PdfFormatProvider in RadWordsProcessing.
page_title: Using PdfFormatProvider
slug: radwordsprocessing-formats-and-conversion-pdf-pdfformatprovider
tags: format, provider, pdf, word, flow, docx, export, document, conversion, rendering
published: True
position: 2
---

# Using PdfFormatProvider

RadWordsProcessing provides a `PdfFormatProvider` class that allows you to export a `RadFlowDocument` to PDF.

To use `PdfFormatProvider`, add references to the following packages:

* Telerik.Windows.Documents.Core
* Telerik.Windows.Documents.Flow
* Telerik.Windows.Documents.Flow.FormatProviders.Pdf
* Telerik.Windows.Documents.Fixed

>note Starting with **Q2 2025**, the Zip Library is no longer used as an internal dependency in the rest of the Document Processing Libraries—PdfProcessing, WordsProcessing, SpreadProcessing, SpreadStreamProcessing. It is replaced by System.IO.Compression. The Telerik Zip Library continues to ship as a standalone library so you can still use it separately.

## Export

To export a document to PDF, use the `Export()` method of `PdfFormatProvider`.

>note The **.NET Standard** specification does not define APIs for getting specific fonts. `PdfFormatProvider` needs access to the font data so that it can read it and add it to the PDF file. That is why you need to provide an implementation of the `FontsProviderBase` abstract class and set this implementation to the `FontsProvider` property of `FixedExtensibilityManager`. For detailed information, check the [Cross-Platform Support]({%slug radpdfprocessing-cross-platform%}) article.

>note **.NET Standard**: To export images different than **Jpeg** and **Jpeg2000** or `ImageQuality` different than High, set the `JpegImageConverter` property inside the `FixedExtensibilityManager`. For more information, check the FixedExtensibilityManager in the [PdfProcessing Cross-Platform Support]({%slug radpdfprocessing-cross-platform%}) article.

The code snippet in **Example 1** shows how to create a `PdfFormatProvider` instance and use it to export a `RadFlowDocument` to a file.

>The `PdfFormatProvider` class of RadWordsProcessing is located in the `Telerik.Windows.Documents.Flow.FormatProviders.Pdf` namespace.

**Example 1: Create a PdfFormatProvider and export a RadFlowDocument to a sample.pdf file stream**

<snippet id='codeblock-cc'/>

The result from the method is a document that you can open in any application that supports PDF documents.

**Example 2** demonstrates how to export the contents of a `RadFlowDocument` to a `RadFixedDocument`.

**Example 2: Export a RadFlowDocument directly to a RadFixedDocument instance**

<snippet id='codeblock-cd'/>

>tip `RadFixedDocument` is the base class of the RadPdfProcessing library. Additional information on the library and its functionality is available in the [RadPdfProcessing Overview]({%slug radpdfprocessing-overview%}).


## See Also

* [Timeout Mechanism]({%slug timeout-mechanism-in-dpl%})
* [WordsProcessing PDF Export Demo](https://demos.telerik.com/document-processing/wordsprocessing/pdf_export)
* [Automatic Output Stream Clearing on Export]({%slug common-export-output-stream-clearing%})
