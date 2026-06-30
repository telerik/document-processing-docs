---
title: Using PdfFormatProvider
description: Learn how to import and export PDF documents with PdfFormatProvider, including package setup, stream requirements, and document handling guidance.
page_title: Using PdfFormatProvider in RadPdfProcessing
slug: radpdfprocessing-formats-and-conversion-pdf-pdfformatprovider
tags: pdfformatprovider, pdf, import, export, radpdfprocessing, stream, document, serialization
published: True
position: 1
---

# Using PdfFormatProvider in RadPdfProcessing

Use `PdfFormatProvider` to import a PDF file into a `RadFixedDocument` or export a `RadFixedDocument` to PDF. This article explains the required packages, the stream requirements for import and export, and the common points to verify before you integrate the provider into your application.

`PdfFormatProvider` preserves the document structure and formatting that RadPdfProcessing supports. After import, you work with the resulting [RadFixedDocument]({%slug radpdfprocessing-model-radfixeddocument%}) in the same way as a code-generated document.

To use the format provider, add references to these packages:

* `Telerik.Windows.Documents.Core`
* `Telerik.Windows.Documents.Fixed`

The `PdfFormatProvider` class is in the `Telerik.Windows.Documents.Fixed.FormatProviders.Pdf` namespace.

Use this article when you need to:

* Open an existing PDF file as a `RadFixedDocument`.
* Save a `RadFixedDocument` to a PDF stream or file.
* Understand which stream capabilities the import and export APIs require.
* Avoid common issues such as disposing a stream too early.

>note
>
> Starting with **Q2 2025**, the Document Processing libraries use `System.IO.Compression` instead of the Telerik Zip Library as an internal dependency. The Telerik Zip Library continues to ship as a standalone library for separate use.

## Import

Use the `Import()` method of `PdfFormatProvider` to load a PDF document.

Example 1 shows how to import a PDF document from a file.

Before you call `Import()`, verify these requirements:

* The input stream supports both read and seek operations.
* If the original stream supports only read operations, copy it to a `MemoryStream` first.
* If the document contains images, keep the stream open for as long as the `RadFixedDocument` needs access to those image resources.

>important
>
> When the imported document contains images, keep the stream open instead of disposing it immediately. The [ImageSource API]({%slug radpdfprocessing-model-imagesource%}#methods) can continue to use the stream while the `RadFixedDocument` works with those images.

### Example 1: Import a PDF File

<snippet id='libraries-pdf-formats-and-conversion-pdf-pdfformatprovider-import-file'/>

The result of `Import()` is a [RadFixedDocument]({%slug radpdfprocessing-model-radfixeddocument%}) that you can inspect, modify, render, or export again.

Import support is limited to the PDF features that RadPdfProcessing can export, so some custom PDF constructs might not be imported exactly as they appear in the original file.

>note
>
> Complete import and export examples are available in the [Document Processing SDK repository on GitHub](https://github.com/telerik/document-processing-sdk/tree/master/PdfProcessing).

## Export

Use the `Export()` method to serialize a `RadFixedDocument` to PDF.

Example 2 shows how to export a `RadFixedDocument` to a file.

Before you call `Export()`, verify these points:

* The output stream is writable.
* The destination file path exists or can be created by your application.
* If the document is digitally signed, the stream supports both reading and writing.

### Example 2: Export a PDF File

<snippet id='libraries-pdf-formats-and-conversion-pdf-pdfformatprovider-export-file'/>

>important
>
> When you export a digitally signed document, pass a stream that supports both reading and writing. Otherwise, the export throws `NotSupportedException` with the message `Stream does not support reading.` For example, create the output stream with `new FileStream("signed.pdf", FileMode.OpenOrCreate, FileAccess.ReadWrite)`.

After export, you can open the resulting document in any application that supports PDF files.

In most applications, the PdfFormatProvider workflow looks like this:

1. Create a `PdfFormatProvider` instance.
2. Open a readable and seekable stream to import a PDF file, or prepare a writable stream to export one.
3. Import the PDF to a `RadFixedDocument`, or export an existing `RadFixedDocument` to PDF.
4. Keep the stream open when the imported document still depends on image resources from that stream.
5. Validate the result by opening the exported PDF in a PDF viewer or by inspecting the imported document in code.

## Troubleshooting

Check these common issues if import or export does not behave as expected:

* Import fails on stream access: Confirm that the input stream supports read and seek operations.
* Imported images are missing later: Make sure that you do not dispose the underlying stream too early.
* Export of signed PDFs fails: Use a stream with both read and write access.
* Imported content differs from the original file: Confirm whether the source PDF uses features outside the supported RadPdfProcessing export surface.

## See Also

* [Settings]({%slug radpdfprocessing-formats-and-conversion-pdf-settings%})
* [Timeout Mechanism]({%slug timeout-mechanism-in-dpl%})
* [Automatic Output Stream Clearing on Export]({%slug common-export-output-stream-clearing%})
