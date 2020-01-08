---
title: Overview
page_title: Pdf Stream Writer - Overview
description: Pdf Stream Writer - Overview
slug: radpdfprocessing-formats-and-conversion-pdf-pdfstreamwriter-overview
tags: pdf,stream,writer
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

There are several classes responsible for writing the different parts of a PDF file.

* **PdfStreamWriter**: The root class, responsible to write the PDF file content to a Stream.

	* **WritePage() methods**: The WritePage() methods of PdfStreamWriter write a PDF page directly into the PDF file Stream. There are two overloads allowing you to write either PdfPageSource or RadFixedPage.
	
* **PdfStreamWriterSettings**: Provides options for customizing the exported PDF file. An instance of this class can be obtained through the Settings property of **PdfStreamWriter**. The provided customization properties are **DocumentInfo**, **ImageQuality** and **WriteAnnotations**.


* **PdfPageStreamWriter**: This class is responsible for writing the PDF page content to the PDF file stream. An instance of this class can be created by calling the **BeginPage()** method of **PdfStreamWriter**.

	* **WriteContent() methods**: The WriteContent() methods of PdfPageStreamWriter allow you to write content to the current PDF page Stream. There are two overloads allowing to add content either from PdfPageSource or RadFixedPage.

* **PdfFileSource**: Represents the content of an existing PDF file.

* **PdfPageSource**: A class representing the page content of an existing PDF file. Instances of this class can be obtained using the **Pages** property of **PdfFileSource**.


## PdfStreamWriter or PdfFormatProvider?

**RadPdfProcessing** provides two options for import and export - using **PdfStreamWriter** and through the **PdfFormatProvider** class. This section describes the benefits of the two approaches in different scenarios. 

If you need to import a PDF document in order to add content to it and save it back, you can take advantage of the **PdfStreamWriter** API. Choosing this approach, you will gain a great performance with minimal memory usage as well as support for the majority of the PDF format features. 


If the scenario requires you to read or modify the existing page content, you should use **PdfFormatProvider** to parse the required data. When working with **PdfStreamWriter**, the existing page content is preserved unmodified and you are only allowed to add elements below or above the existing content. 

## See Also

* [Features]({%slug radpdfprocessing-formats-and-conversion-pdf-pdfstreamwriter-features%})
* [PdfFormatProvider]({%slug radpdfprocessing-formats-and-conversion-pdf-pdfformatprovider%})
* [PdfStreamWriter Class]({%slug radpdfprocessing-formats-and-conversion-pdf-pdfstreamwriter-pdfstreamwriter%})
