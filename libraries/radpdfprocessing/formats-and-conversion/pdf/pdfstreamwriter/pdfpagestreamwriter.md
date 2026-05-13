---
title: PdfPageStreamWriter 
description: Learn how to use the PdfPageStreamWriter class in RadPdfProcessing to write and position content on a page within a new PDF file.
page_title: PdfPageStreamWriter 
slug: radpdfprocessing-formats-and-conversion-pdf-pdfstreamwriter-pdfpagestreamwriter
tags: pdfpagestreamwriter, pdf, page, stream, radpdfprocessing, content, writing, position
published: True
position: 3
---

# PdfPageStreamWriter

The **PdfPageStreamWriter** class provides API allowing you to write and position content in the currently written page.

## Using PdfPageStreamWriter

### Create a PdfPageStreamWriter  Instance

An instance of the PdfPageStreamWriter class can be obtained using the **BeginPage()** method of [PdfSteamWriter]({%slug radpdfprocessing-formats-and-conversion-pdf-pdfstreamwriter-pdfstreamwriter%}).


#### **Example 1: Instantiate PdfPageStreamWriter**
	
<snippet id='pdf-page-stream-writer-instance'/>


>You can find an example on how to use the PdfPageStreamWriter class in the [Manipulate Pages](https://github.com/telerik/document-processing-sdk/tree/master/PdfProcessing/ManipulatePages) example in the XAML SDK repository on GitHub.

PdfStreamWriter exposes also an additional overload, which allows you to keep the stream you are working with open after disposing the writer instance by passing **true** as a value for the second constructor parameter (leaveStreamOpen).

>PdfPageStreamWriter inherits from [IDisposable](https://msdn.microsoft.com/en-us/library/system.idisposable(v=vs.110).aspx). Make sure the object is disposed when you are done with it. The best way to ensure this is handled properly is to wrap it in a *using* statement. 

### PdfPageStreamWriter Members

The members of the class allow you to set several properties of the document page you are working with as well as write new content:

| Member | Description |
|---|---|
| `Rotation` | A read-only property of type [Rotation](https://docs.telerik.com/devtools/document-processing/api/Telerik.Windows.Documents.Fixed.Model.Data.Rotation.html). Keeps the rotation of the currently generated page. |
| `Size` | A read-only property of type [Size](https://msdn.microsoft.com/en-us/library/system.windows.size(v=vs.110).aspx). Keeps the size of the currently generated page. |
| `WriteContent()` | Writes content to the currently written PDF page stream. Overloads accept content from [PdfPageSource]({%slug radpdfprocessing-formats-and-conversion-pdf-pdfstreamwriter-pdfpagesource%}) or [RadFixedPage]({%slug radpdfprocessing-model-radfixedpage%}). |
| `ContentPosition` | A property of type [IPosition](https://docs.telerik.com/devtools/document-processing/api/Telerik.Windows.Documents.Fixed.Model.Data.IPosition.html) that specifies the position of the next page content written with `WriteContent()`. |
| `SaveContentPosition()` | Saves the current [IPosition](https://docs.telerik.com/devtools/document-processing/api/Telerik.Windows.Documents.Fixed.Model.Data.IPosition.html) values. Returns an `IDisposable` that restores the position when disposed. |



## See Also

* [Pdf Stream Writer Overview]({%slug radpdfprocessing-formats-and-conversion-pdf-pdfstreamwriter-overview%})
* [PdfStreamWriter]({%slug radpdfprocessing-formats-and-conversion-pdf-pdfstreamwriter-pdfstreamwriter%})
* [RadFixedPage]({%slug radpdfprocessing-model-radfixedpage%})
