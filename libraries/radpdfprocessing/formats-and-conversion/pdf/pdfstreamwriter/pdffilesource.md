---
title: PdfFileSource
description: Learn how to use the PdfFileSource class in RadPdfProcessing to represent and access the content of an existing PDF file.
page_title: PdfFileSource
slug: radpdfprocessing-formats-and-conversion-pdf-pdfstreamwriter-pdffilesource
tags: pdffilesource, pdf, file, stream, radpdfprocessing, source
published: True
position: 4
---

# PdfFileSource

The `PdfFileSource` class represents the content of an existing PDF file.

## Using PdfFileSource

### Create an Instance

To create an instance of `PdfFileSource`, pass a `FileStream` object containing the PDF document to the constructor of the class.

#### **Example 1: Create a PdfFileSource**
<snippet id='pdf-create-file-source'/>

`PdfFileSource` also exposes an additional overload that allows you to keep the stream open after disposing the `PdfFileSource` instance. Pass **true** as the value for the second constructor parameter (`leaveStreamOpen`).

You can also use the overload that accepts a parameter of type [`PdfImportSettings`]({%slug radpdfprocessing-formats-and-conversion-pdf-settings%}#import-settings). This overload enables you to handle password-encrypted documents.

#### **Example 2: Open encrypted document**
<snippet id='pdf-open-encryped-doc'/>

>`PdfFileSource` inherits from [IDisposable](https://learn.microsoft.com/en-us/dotnet/api/system.idisposable). Ensure the object is disposed when you are done with it. The best way to handle this is to wrap it in a `using` statement.

### Members

`PdfFileSource` exposes the `Pages` property, which is of type [`PdfPageSource`]({%slug radpdfprocessing-formats-and-conversion-pdf-pdfstreamwriter-pdfpagesource%})[] and allows you to access the pages of the imported document.

#### **Example 3: Iterate the pages of a document**
<snippet id='pdf-iterate-pages'/>
 
>You can use the indexer of the `Pages` property to obtain a specific page of the document and split it. Then, save the separated page with [`PdfStreamWriter`]({%slug radpdfprocessing-formats-and-conversion-pdf-pdfstreamwriter-pdfstreamwriter%}).

## See Also

* [PdfStreamWriter Overview]({%slug radpdfprocessing-formats-and-conversion-pdf-pdfstreamwriter-overview%})
* [PdfPageStreamWriter]({%slug radpdfprocessing-formats-and-conversion-pdf-pdfstreamwriter-pdfpagestreamwriter%})
* [RadFixedPage]({%slug radpdfprocessing-model-radfixedpage%})
