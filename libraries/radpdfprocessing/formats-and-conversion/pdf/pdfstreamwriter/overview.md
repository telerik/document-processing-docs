---
title: Overview
description: Learn about PdfStreamWriter in RadPdfProcessing, a high-performance API for creating PDF files with minimal memory footprint by writing directly to a stream.
page_title: Pdf Stream Writer - Overview
slug: radpdfprocessing-formats-and-conversion-pdf-pdfstreamwriter-overview
tags: pdfstreamwriter, pdf, stream, radpdfprocessing, performance, overview, lowmemory, writing
published: True
position: 0
---

# Overview

The PDF Stream Writer functionality enables high-performance PDF file creation with minimal memory usage.


## What Is PdfStreamWriter

The **PdfStreamWriter** API exports PDF files with high performance and a minimized memory footprint.

The writer achieves memory efficiency by writing PDF content directly to a stream without creating or preserving the PDF document model in memory. Performance efficiency comes from reading PDF page content from existing PDF files without decoding or parsing the page content. The read content is then written unmodified directly into the new file stream. Although the existing PDF page content is not modified, you can position it differently in the new PDF file and combine it with other existing or newly generated PDF page content.

**PdfStreamWriter** supports the following scenarios when creating pages of the new PDF file:

* Merge pages from different PDF documents.
* Split PDF document pages.
* Add and position page content from existing PDF files.
* Add and position page content from newly generated `RadFixedPage` instances.
* Merge and position content from existing PDF pages and generated `RadFixedPage` instances onto a single page in the new PDF file stream.

> The XAML SDK repository on GitHub contains examples showing the capabilities of `PdfStreamWriter`:
> 
> * The [PdfStreamWriterPerformance](https://github.com/telerik/document-processing-sdk/tree/master/PdfProcessing/PdfStreamWriterPerformance) sample shows the performance you can achieve with `PdfStreamWriter`.
> * The [Manipulate Pages](https://github.com/telerik/document-processing-sdk/tree/master/PdfProcessing/ManipulatePages) example shows different use cases of `PdfStreamWriter`.

## PdfStreamWriter Structure

There are several classes responsible for writing the different parts of a PDF file:

| Class | Description |
|---|---|
| `PdfStreamWriter` | The root class responsible for writing PDF file content to a `Stream`. The `WritePage()` methods write a PDF page directly into the stream; overloads accept `PdfPageSource` or `RadFixedPage`. |
| `PdfStreamWriterSettings` | Provides options for customizing the exported PDF file. Obtained through the `Settings` property of `PdfStreamWriter`. Exposes `DocumentInfo`, `ImageQuality`, and `WriteAnnotations`. |
| `PdfPageStreamWriter` | Responsible for writing PDF page content to the file stream. Created by calling `BeginPage()` on `PdfStreamWriter`. The `WriteContent()` methods write content to the current page; overloads accept `PdfPageSource` or `RadFixedPage`. |
| `PdfFileSource` | Represents the content of an existing PDF file. |
| `PdfPageSource` | Represents the page content of an existing PDF file. Instances are obtained from the `Pages` property of `PdfFileSource`. |


## PdfStreamWriter or PdfFormatProvider

**RadPdfProcessing** provides two options for import and export—**PdfStreamWriter** and the **PdfFormatProvider** class.

Use the **PdfStreamWriter** API when you need to import a PDF document, add content to it, and save it back. This approach delivers high performance with minimal memory usage and supports the majority of PDF format features.

Use **PdfFormatProvider** when your scenario requires reading or modifying existing page content. When you work with **PdfStreamWriter**, the existing page content is preserved unmodified and you can only add elements below or above the existing content.


## See Also

* [Features]({%slug radpdfprocessing-formats-and-conversion-pdf-pdfstreamwriter-features%})
* [PdfFormatProvider]({%slug radpdfprocessing-formats-and-conversion-pdf-pdfformatprovider%})
* [PdfStreamWriter Class]({%slug radpdfprocessing-formats-and-conversion-pdf-pdfstreamwriter-pdfstreamwriter%})
* [Splitting Big PDF Documents into Smaller Files Efficiently]({%slug split-big-pdf-documents%})
