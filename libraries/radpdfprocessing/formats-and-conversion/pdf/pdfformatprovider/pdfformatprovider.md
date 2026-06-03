---
title: Using PdfFormatProvider
description: Learn how to import and export PDF documents using the PdfFormatProvider in RadPdfProcessing.
page_title: Using PdfFormatProvider
slug: radpdfprocessing-formats-and-conversion-pdf-pdfformatprovider
tags: pdfformatprovider, pdf, import, export, radpdfprocessing, stream, document, serialization
published: True
position: 1
---

# Using PdfFormatProvider

The `PdfFormatProvider` class makes it easy to import and export a `RadFixedDocument` from/to PDF format, preserving the entire document structure and formatting.

To use the format provider, add references to the following packages:

* `Telerik.Windows.Documents.Core`
* `Telerik.Windows.Documents.Fixed`
          
>note Starting with **Q2 2025**, the Zip Library is no longer used as an internal dependency in the rest of the Document Processing Libraries (PdfProcessing, WordsProcessing, SpreadProcessing, SpreadStreamProcessing). It is replaced by `System.IO.Compression`. The Telerik Zip Library continues to ship as a standalone library so you can still use it separately.
	  
The `PdfFormatProvider` class of RadPdfProcessing is located in the `Telerik.Windows.Documents.Fixed.FormatProviders.Pdf` namespace.

## Import

To import a PDF document, use the `Import()` method of `PdfFormatProvider`.

**Example 1** shows how to use `PdfFormatProvider` to import a PDF document from a file.

>PDF files can be opened as long as you can obtain a stream with their content that supports Read and Seek operations. If the stream supports only Read, copy its content to a `MemoryStream`, which enables the Seek operation as well.
        
>Starting with Q2 2015, the `RadPdfProcessing` library exposes [an API for working with image sources]({%slug radpdfprocessing-model-imagesource%}#methods), which needs to use the stream while working with images in a `RadFixedDocument`. This requires keeping the stream open and not disposing it.

#### __Example 1: Import PDF file__

<snippet id='pdf-import-file'/>

The result from the import method is a [`RadFixedDocument`]({%slug radpdfprocessing-model-radfixeddocument%}), which can be used like any code-generated document.

>Import support is limited to the features that are supported by the export. You may not be able to import all custom PDF documents.
          	 
>note Complete examples showing importing and exporting a document are available in the [SDK repository on GitHub](https://github.com/telerik/document-processing-sdk/tree/master/PdfProcessing).

## Export

**Example 2** shows how to use the `Export()` method of `PdfFormatProvider` to export a `RadFixedDocument` to a file.

#### __Example 2: Export PDF file__

<snippet id='pdf-export-file'/>

>important When exporting a digitally signed document, pass a stream that allows both reading and writing. Otherwise, an exception is thrown: `NotSupportedException: 'Stream does not support reading.'` For example, create the output stream as follows: `new FileStream("signed.pdf", FileMode.OpenOrCreate, FileAccess.ReadWrite)`.

The resulting document can be opened in any application that supports PDF documents.

## See Also

* [PdfFormatProvider API Reference](https://docs.telerik.com/devtools/document-processing/api/Telerik.Windows.Documents.Fixed.FormatProviders.Pdf.PdfFormatProvider.html)
* [Settings]({%slug radpdfprocessing-formats-and-conversion-pdf-settings%})
* [Timeout Mechanism]({%slug timeout-mechanism-in-dpl%})
* [Automatic Output Stream Clearing on Export]({%slug common-export-output-stream-clearing%})
