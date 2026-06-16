---
title: PdfStreamWriter
description: Learn how to use the PdfStreamWriter class in RadPdfProcessing to write high-performance, low-memory PDF files directly to a stream.
page_title: PdfStreamWriter
slug: radpdfprocessing-formats-and-conversion-pdf-pdfstreamwriter-pdfstreamwriter
tags: pdfstreamwriter, pdf, stream, radpdfprocessing, performance, document, lowmemory, creation
published: True
position: 2
---

<style>
table, th, td {
	border: 1px solid;
}
table th:first-of-type {
	width: 25%;
}
table th:nth-of-type(2) {
	width: 75%;
} 
</style>

# PdfStreamWriter

The **PdfStreamWriter** class enables you to write file content directly to a stream. This is the root element of the streaming mechanism used when exporting a PDF document.

## Create a PdfStreamWriter Instance

To create a `PdfStreamWriter` instance, pass the stream of the file you want to work with as a constructor parameter.

#### **Example 1: Instantiate PdfStreamWriter**

<snippet id='pdf-stream-writer-instance'/>

`PdfStreamWriter` also exposes an additional overload that allows you to keep the stream open after disposing the writer instance. Pass **true** as the value for the second constructor parameter (`leaveStreamOpen`).

>`PdfStreamWriter` inherits from [IDisposable](https://learn.microsoft.com/en-us/dotnet/api/system.idisposable). Ensure the object is disposed when you are done with it. Otherwise, the content might not be written in the exported file. The best way to handle this is to wrap it in a `using` statement.

### Using PdfStreamWriter with MemoryStream

The constructor of `PdfStreamWriter` accepts any class inheriting from `Stream`. In many cases, you might not need to save a file but instead preserve it in memory to directly send it to a client, for example. For this scenario, use a `MemoryStream` to preserve the document data.

> Two important points when you work with `MemoryStream`:
>
> * Set the second parameter of the `PdfStreamWriter` constructor to **true** so you can use the stream after you are done with `PdfStreamWriter`.
> * All the data is flushed into the stream when disposing `PdfStreamWriter`. Dispose the object before further processing the `MemoryStream` to ensure all the required document data is saved.


#### **Example 2: Instantiate PdfStreamWriter with MemoryStream**

<snippet id='pdf-stream-writer-instance-memory'/>

## PdfStreamWriter Members

The members of the class allow you to set several properties of the document and generate and write new pages.

* `BeginPage()`: Returns an instance of the `PdfPageStreamWriter` class, which draws the content of the page. For more information, see the [PdfPageStreamWriter article]({%slug radpdfprocessing-formats-and-conversion-pdf-pdfstreamwriter-pdfpagestreamwriter%}). The overloads of `BeginPage()` allow you to pass the size and the [Rotation](https://docs.telerik.com/devtools/document-processing/api/Telerik.Windows.Documents.Fixed.Model.Data.Rotation.html) of the page.
	
	#### **Example 3: Insert a new page into a document**
	
	<snippet id='pdf-stream-writer-insert-new-page'/>

* `WritePage()`: Enables you to pass an already constructed page object. With the different overloads, you can pass an instance of [`RadFixedPage`]({%slug radpdfprocessing-model-radfixedpage%}) or [`PdfPageStreamWriter`]({%slug radpdfprocessing-formats-and-conversion-pdf-pdfstreamwriter-pdfpagestreamwriter%}).
	
	#### **Example 4: Insert an already generated page into a document**
	
	<snippet id='pdf-insert-generated-page-in-doc'/>

### Settings of PdfStreamWriter

Through the `Settings` property of `PdfStreamWriter`, you can control how the document is exported. The following table describes the available properties:

|Property|Description|
|----|----|
|`DocumentInfo`|A property of type [`RadFixedDocumentInfo`](https://docs.telerik.com/devtools/document-processing/api/Telerik.Windows.Documents.Fixed.Model.RadFixedDocumentInfo.html), intended to hold additional information about the document. The `RadFixedDocumentInfo` class allows you to set the title, author, and description of the document.|
|`ImageQuality`|Gets or sets the default image quality when exporting images to PDF. This property is of type [`ImageQuality`]({%slug radpdfprocessing-concepts-imagequality%}) and defaults to *High*. The value of this property is overridden when you specify `ImageQuality` in the `ImageSource` constructor or when you create an [`ImageSource`]({%slug radpdfprocessing-model-imagesource%}) from `EncodedImageData`. Higher quality results in a larger document size.|
|`ImageCompression`|Gets or sets the image compression type. The possible values are: <br> * **None**: No compression is applied. <br> * **Default**: The image compression is preserved as it is in the original document. <br> * **FlateDecode**: The images are encoded with a FlateDecode filter. <br> * **DCTDecode**: Compresses data using a DCT (discrete cosine transform) technique based on the JPEG standard.|
|`WriteAnnotations`|A Boolean property indicating whether the annotations are included in the exported document.|
|`StreamCompression`|Gets or sets the content stream compression type. Possible values are: <br> * **None**: The content streams are not encoded. <br> * **FlateDecode**: Compresses data using the zlib/deflate compression method.|

When merging document pages with `PdfStreamWriter`, the form fields may be duplicated. Starting with **Q2 2025**, the `PdfStreamWriterSettings` class offers the `MergedFieldNameResolving` event. This event occurs when resolving conflicts between field names while merging instances with duplicated names:

<snippet id='libraries-pdf-formats-and-conversion-pdfstreamwritersettings'/>

> The XAML SDK repository on GitHub contains examples showing the capabilities of `PdfStreamWriter`:
> 
> * The [PdfStreamWriterPerformance](https://github.com/telerik/document-processing-sdk/tree/master/PdfProcessing/PdfStreamWriterPerformance) sample shows the performance you can achieve with `PdfStreamWriter`.
> * The [Manipulate Pages](https://github.com/telerik/document-processing-sdk/tree/master/PdfProcessing/ManipulatePages) example shows different use cases of `PdfStreamWriter`.


## See Also

* [PdfStreamWriter Overview]({%slug radpdfprocessing-formats-and-conversion-pdf-pdfstreamwriter-overview%})
* [PdfPageStreamWriter]({%slug radpdfprocessing-formats-and-conversion-pdf-pdfstreamwriter-pdfpagestreamwriter%})
* [RadFixedPage]({%slug radpdfprocessing-model-radfixedpage%})
* [Merge PDF Documents]({%slug merge-pdf-documents%})