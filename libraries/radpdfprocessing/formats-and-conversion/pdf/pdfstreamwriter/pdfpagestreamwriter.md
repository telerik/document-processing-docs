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

The `PdfPageStreamWriter` class provides an API that allows you to write and position content in the current page.

## Using PdfPageStreamWriter

### Create a PdfPageStreamWriter Instance

Obtain an instance of the `PdfPageStreamWriter` class by using the `BeginPage()` method of [`PdfStreamWriter`]({%slug radpdfprocessing-formats-and-conversion-pdf-pdfstreamwriter-pdfstreamwriter%}).


**Instantiate PdfPageStreamWriter**
	
<snippet id='pdf-page-stream-writer-instance'/>


>You can find an example of how to use the `PdfPageStreamWriter` class in the [Manipulate Pages](https://github.com/telerik/document-processing-sdk/tree/master/PdfProcessing/ManipulatePages) example in the XAML SDK repository on GitHub.

`PdfStreamWriter` also exposes an additional overload that allows you to keep the stream open after disposing the writer instance. Pass **true** as the value for the second constructor parameter (`leaveStreamOpen`).

>`PdfPageStreamWriter` inherits from [IDisposable](https://learn.microsoft.com/en-us/dotnet/api/system.idisposable). Ensure the object is disposed when you are done with it. The best way to handle this is to wrap it in a `using` statement.

### PdfPageStreamWriter Members

The members of the class allow you to set several properties of the document page and write new content:

| Member | Description |
|---|---|
| `Rotation` | A read-only property of type [Rotation](https://docs.telerik.com/devtools/document-processing/api/Telerik.Windows.Documents.Fixed.Model.Data.Rotation.html). Keeps the rotation of the current page. |
| `Size` | A read-only property of type [Size](https://learn.microsoft.com/en-us/dotnet/api/system.windows.size). Keeps the size of the current page. |
| `WriteContent()` | Writes content to the current PDF page stream. Overloads accept content from [PdfPageSource]({%slug radpdfprocessing-formats-and-conversion-pdf-pdfstreamwriter-pdfpagesource%}) or [RadFixedPage]({%slug radpdfprocessing-model-radfixedpage%}). |
| `ContentPosition` | A property of type [IPosition](https://docs.telerik.com/devtools/document-processing/api/Telerik.Windows.Documents.Fixed.Model.Data.IPosition.html) that specifies the position of the next page content written with `WriteContent()`. |
| `SaveContentPosition()` | Saves the current [IPosition](https://docs.telerik.com/devtools/document-processing/api/Telerik.Windows.Documents.Fixed.Model.Data.IPosition.html) values. Returns an `IDisposable` that restores the position when disposed. |



## See Also

* [PdfStreamWriter Overview]({%slug radpdfprocessing-formats-and-conversion-pdf-pdfstreamwriter-overview%})
* [PdfStreamWriter]({%slug radpdfprocessing-formats-and-conversion-pdf-pdfstreamwriter-pdfstreamwriter%})
* [RadFixedPage]({%slug radpdfprocessing-model-radfixedpage%})
