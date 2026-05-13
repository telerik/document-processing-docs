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

This article explains the PDF Stream Writer functionality - how it works and how you can use it.


## What is PdfStreamWriter?

The API of __PdfStreamWriter__ exposes a functionality that provides option for exporting PDF files with unmatched performance and minimized memory footprint. 

The key for the memory efficiency is that the writer writes the PDF content directly to a stream without creating and preserving the PDF document model in the memory. The performance efficiency is achieved by reading PDF page content from existing PDF files without decoding or parsing the existing page content. The read content is then written unmodified directly into the new file stream. Although the existing PDF page content is not modified, it may be positioned differently into the new PDF file as well as combined with some other existing or newly generated PDF page content. 

__PdfStreamWriter__ can help you achieve the following scenarios when creating the pages of the new PDF file:

- Merge pages from different PDF documents.

- Split PDF document pages.

- Add and position page content from existing PDF files.

- Add and position page content from newly generated RadFixedPage instances.

- Merge and position content from existing PDF pages and generated RadFixedPage instances onto a single page in the newly written PDF file stream.

> The XAML SDK repository on GitHub contains examples showing the capabilities of PdfStreamWriter: 
> 
> - The [PdfStreamWriterPerformance](https://github.com/telerik/document-processing-sdk/tree/master/PdfProcessing/PdfStreamWriterPerformance) sample shows the performance you can achieve using PdfStreamWriter
> - The [Manipulate Pages](https://github.com/telerik/document-processing-sdk/tree/master/PdfProcessing/ManipulatePages) example shows different use cases of PdfStreamWriter

## PdfStreamWriter Structure

There are several classes responsible for writing the different parts of a PDF file:

| Class | Description |
|---|---|
| `PdfStreamWriter` | The root class responsible for writing PDF file content to a `Stream`. The `WritePage()` methods write a PDF page directly into the stream; overloads accept `PdfPageSource` or `RadFixedPage`. |
| `PdfStreamWriterSettings` | Provides options for customizing the exported PDF file. Obtained through the `Settings` property of `PdfStreamWriter`. Exposes `DocumentInfo`, `ImageQuality`, and `WriteAnnotations`. |
| `PdfPageStreamWriter` | Responsible for writing PDF page content to the file stream. Created by calling `BeginPage()` on `PdfStreamWriter`. The `WriteContent()` methods write content to the current page; overloads accept `PdfPageSource` or `RadFixedPage`. |
| `PdfFileSource` | Represents the content of an existing PDF file. |
| `PdfPageSource` | Represents the page content of an existing PDF file. Instances are obtained from the `Pages` property of `PdfFileSource`. |


## PdfStreamWriter or PdfFormatProvider?

**RadPdfProcessing** provides two options for import and export - using **PdfStreamWriter** and through the **PdfFormatProvider** class. This section describes the benefits of the two approaches in different scenarios. 

If you need to import a PDF document in order to add content to it and save it back, you can take advantage of the **PdfStreamWriter** API. Choosing this approach, you will gain a great performance with minimal memory usage as well as support for the majority of the PDF format features. 


If the scenario requires you to read or modify the existing page content, you should use **PdfFormatProvider** to parse the required data. When working with **PdfStreamWriter**, the existing page content is preserved unmodified and you are only allowed to add elements below or above the existing content. 

## See Also

* [Features]({%slug radpdfprocessing-formats-and-conversion-pdf-pdfstreamwriter-features%})
* [PdfFormatProvider]({%slug radpdfprocessing-formats-and-conversion-pdf-pdfformatprovider%})
* [PdfStreamWriter Class]({%slug radpdfprocessing-formats-and-conversion-pdf-pdfstreamwriter-pdfstreamwriter%})
* [Splitting Big PDF Documents into Smaller Files Efficiently]({%slug split-big-pdf-documents%})
