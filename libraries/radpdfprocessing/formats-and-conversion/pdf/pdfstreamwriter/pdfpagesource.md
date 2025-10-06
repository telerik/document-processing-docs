---
title: PdfPageSource
page_title: PdfPageSource
slug: radpdfprocessing-formats-and-conversion-pdf-pdfstreamwriter-pdfpagesource
tags: pdf,stream,page,source
published: True
position: 5
---

# PdfPageSource

The **PdfPageSource** class represents the page content of an existing PDF file.

## Using PdfPageSource

### Create an Instance

An instance of the PdfPageSource class can be obtained using the **Pages** property of [PdfFileSource]({%slug radpdfprocessing-formats-and-conversion-pdf-pdfstreamwriter-pdffilesource%}).

#### **[C#] Example 1: Obtain an instance of PdfPageSource**

<snippet id='pdf-obtain-page-source'/>

### Members

PdfPageSource exposes the following properties to give you information about the pages:

* **MediaBox**: Defines the boundaries of the physical medium on which the page will be printed. Any content falling outside this boundary is discarded without affecting the meaning of the PDF file. 
* **CropBox**: Defines the region to which the contents of the page are clipped (cropped) when displayed or printed. This boundary determines the visible page content. The default value is the page’s media box. 
* **Size**: Property of type Size representing the size of the page. Its value is determined by the width and height of the **MediaBox**.
* **Rotation**: Property of type [Rotation](https://docs.telerik.com/devtools/document-processing/api/Telerik.Windows.Documents.Fixed.Model.Data.Rotation.html) representing the page rotation. 

**Example 2** shows how you can use PdfPageSource to merge the pages of several documents into a single one.

#### **[C#] Example 2: Merge the pages of several documents**

<snippet id='pdf-merge-documents-with-page-source'/>

## See Also

* [Pdf Stream Writer Overview]({%slug radpdfprocessing-formats-and-conversion-pdf-pdfstreamwriter-overview%})
* [PdfStreamWriter Class]({%slug radpdfprocessing-formats-and-conversion-pdf-pdfstreamwriter-pdfstreamwriter%})
* [PdfPageStreamWriter]({%slug radpdfprocessing-formats-and-conversion-pdf-pdfstreamwriter-pdfpagestreamwriter%})
* [PdfFileSource]({%slug radpdfprocessing-formats-and-conversion-pdf-pdfstreamwriter-pdffilesource%})
* [Creating a Cropped PDF from an Existing PDF Page Using RadPdfProcessing]({%slug create-cropped-pdf-radpdfprocessing%})