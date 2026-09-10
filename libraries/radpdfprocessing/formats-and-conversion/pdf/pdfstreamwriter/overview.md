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

Use `PdfStreamWriter` to create or compose PDF files with high performance and minimal memory use.

## What Is PdfStreamWriter

The **PdfStreamWriter** API exports PDF files with high performance and a minimized memory footprint.

The writer achieves memory efficiency by writing PDF content directly to a stream without creating or preserving the PDF document model in memory. Performance efficiency comes from reading PDF page content from existing PDF files without decoding or parsing the page content. The read content is then written unmodified directly into the new file stream. Although the existing PDF page content is not modified, you can position it differently in the new PDF file and combine it with other existing or newly generated PDF page content.

`PdfStreamWriter` supports these scenarios when you create pages in a new PDF file:

* Merge pages from different PDF documents.
* Split PDF document pages.
* Add and position page content from existing PDF files.
* Add and position page content from newly generated `RadFixedPage` instances.
* Merge and position content from existing PDF pages and generated `RadFixedPage` instances onto a single page in the new PDF file stream.

You can review these SDK examples:

* The [PdfStreamWriterPerformance](https://github.com/telerik/document-processing-sdk/tree/master/PdfProcessing/PdfStreamWriterPerformance) example shows the performance that `PdfStreamWriter` can achieve.
* The [Manipulate Pages sample](https://github.com/telerik/document-processing-sdk/tree/master/PdfProcessing/ManipulatePages) example shows several `PdfStreamWriter` scenarios.

## PdfStreamWriter Structure

There are several classes responsible for writing the different parts of a PDF file:

| Class | Description |
|---|---|
| `PdfStreamWriter` | The root class responsible for writing PDF file content to a `Stream`. The `WritePage()` methods write a PDF page directly into the stream; overloads accept `PdfPageSource` or `RadFixedPage`. |
| `PdfStreamWriterSettings` | Provides options for customizing the exported PDF file. Access it through the `Settings` property of `PdfStreamWriter`. Exposes `DocumentInfo`, `ImageQuality`, `StreamCompression`, `ImageCompression`, `WriteAnnotations`, and the `MergedFieldNameResolving` event. |
| `PdfPageStreamWriter` | Responsible for writing PDF page content to the file stream. Created by calling `BeginPage()` on `PdfStreamWriter`. The `WriteContent()` methods write content to the current page; overloads accept `PdfPageSource` or `RadFixedPage`. |
| `PdfFileSource` | Represents the content of an existing PDF file. Dispose it before you dispose `PdfStreamWriter`. |
| `PdfPageSource` | Represents the page content of an existing PDF file. Get instances from the `Pages` property of `PdfFileSource`. |

Wrap each `PdfFileSource` in a `using` statement or dispose it explicitly before you dispose `PdfStreamWriter`. This order prevents empty pages and other unexpected results.

## PdfStreamWriter or PdfFormatProvider

**RadPdfProcessing** provides two options for import and export: **PdfStreamWriter** and the **PdfFormatProvider** class.

Use the **PdfStreamWriter** API when you want to compose a new PDF from existing PDF pages, generated `RadFixedPage` instances, or both. This approach delivers high performance and minimal memory use because it streams content directly to the output.

Use **PdfFormatProvider** when your scenario requires full document import, inspection, or modification of existing page content. When you work with **PdfStreamWriter**, existing PDF page content stays unmodified and you can only place new content below or above it.

## See Also

* [PDF Stream Writer Features]({%slug radpdfprocessing-formats-and-conversion-pdf-pdfstreamwriter-features%})
* [PdfFormatProvider]({%slug radpdfprocessing-formats-and-conversion-pdf-pdfformatprovider%})
* [PdfStreamWriter Class]({%slug radpdfprocessing-formats-and-conversion-pdf-pdfstreamwriter-pdfstreamwriter%})
* [Splitting Big PDF Documents into Smaller Files Efficiently]({%slug split-big-pdf-documents%})
