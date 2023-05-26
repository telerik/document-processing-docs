---
title: PdfStreamWriter
page_title: PdfStreamWriter
slug: radpdfprocessing-formats-and-conversion-pdf-pdfstreamwriter-pdfstreamwriter
tags: pdf,stream,writer
published: True
position: 2
---

# Overview

The **PdfStreamWriter** class enables you to write file content directly to a Stream. This is the root element of the streaming mechanism used when exporting a PDF document.

## Create a PdfStreamWriter Instance

To create an object of type PdfSteamWriter, you should pass it the Stream of the file, which you would like to work with, as a constructor parameter.

#### **[C#] Example 1: Instantiate PdfStreamWriter**

{{region cs-radpdfprocessing-formats-and-conversion-pdf-pdfstreamwriter-pdfstreamwriter_0}}

	using (PdfStreamWriter writer = new PdfStreamWriter(File.OpenWrite(resultDocument)))
	{
		// ...
	}
{{endregion}}

**PdfStreamWriter** exposes also an additional overload, which allows you to keep the stream you are working with open after disposing the writer instance by passing **true** as a value for the second constructor parameter (leaveStreamOpen).

>PdfStreamWriter inherits from [IDisposable](https://msdn.microsoft.com/en-us/library/system.idisposable(v=vs.110).aspx). Make sure the object is disposed when you are done with it. Otherwise, the content might not be written in the exported file. The best way to ensure this is handled properly is to wrap it in a using statement. 

### Using PdfStreamWriter with MemoryStream

The constructor of **PdfStreamWriter** enables you to use any class inheriting from **Stream**. In many cases, you might not need to save a file but instead preserve it in the memory, to directly send it to a client, for example. For this scenario, it would be most suitable to use a **MemoryStream** to preserve the document data inside.

> Two important key-points when working with MemoryStream:
>
>- Make sure to use the second parameter of PdfStreamWriter's constructor that enables you to leave the stream open. This parameter should be set to true so that you can use the stream after you are done with PdfStreamWriter;
>- All the data is flushed into the stream when disposing PdfStreamWriter. It is important to dispose the object prior to further processing the MemoryStream so you can ensure that all the required document data is saved inside;


#### **[C#] Example 2: Instantiate PdfStreamWriter with MemoryStream**

{{region cs-radpdfprocessing-formats-and-conversion-pdf-pdfstreamwriter-pdfstreamwriter_3}}

    MemoryStream stream = new MemoryStream();
	using (PdfStreamWriter writer = new PdfStreamWriter(stream, true))
	{
		// ...
	}
{{endregion}}

## PdfStreamWriter Members

The members of the class allow you to set several properties of the document you are working with as well as generate and write new pages.

* **BeginPage()**: The BeginPage() method returns an instance of the **PdfPageStreamWriter** class, which is responsible to draw the content of the page. More information about this class is available in the [PdfPageStreamWriter article](). The overloads of BeginPage() allow you to pass the size and the [Rotation](https://docs.telerik.com/devtools/document-processing/api/Telerik.Windows.Documents.Fixed.Model.Data.Rotation.html) of the page.
	
	#### **[C#] Example 3: Insert a new page into a document**
	
	{{region cs-radpdfprocessing-formats-and-conversion-pdf-pdfstreamwriter-pdfstreamwriter_1}}
	
		using (PdfStreamWriter writer = new PdfStreamWriter(File.OpenWrite(resultDocument)))
		{
			Size size = new Size(700,1200);
			Rotation rotation = Rotation.Rotate270;
	
			using (PdfPageStreamWriter pageWriter = writer.BeginPage(size, rotation))
	        {
				// Use the pageWriter object to fill the content of the page.
			}
		}
	{{endregion}}

* **WritePage()**: The WritePage() methods enable you to pass an already constructed page object. With the different overloads, you can pass an instance of [**RadFixedPage**]() and [**PdfPageStreamWriter**]().
	
	#### **[C#] Example 4: Insert an already generated page into a document**
	
	{{region cs-radpdfprocessing-formats-and-conversion-pdf-pdfstreamwriter-pdfstreamwriter_2}}
	
		using (PdfStreamWriter writer = new PdfStreamWriter(File.OpenWrite(resultDocument)))
		{
			RadFixedPage page = this.GeneratePage();
			writer.WritePage(page);
		}
	{{endregion}}

### Settings of PdfStreamWriter

Through the **Settings property** of PdfStreamWriter you can control the way the document is exported. The following list describes the available properties:

* **DocumentInfo**: A property of type [RadFixedDocumentInfo](https://docs.telerik.com/devtools/document-processing/api/Telerik.Windows.Documents.Fixed.Model.RadFixedDocumentInfo.html), intended to hold additional information about the document. The RadFixedDocumentInfo class allows you to set the title, author and description of the document.

* **ImageQuality**: This property is of type [ImageQuality]({%slug radpdfprocessing-concepts-imagequality%}) and gets or sets the default image quality when exporting images to PDF. The default value is *High*. The value of this property is overridden when specifying the ImageQuality in ImageSource constructor or when creating [ImageSource]({%slug radpdfprocessing-model-imagesource%}) from EncodedImageData. The quality of the images reflects the size of the PDF file. The higher the quality, the bigger the document size is.

* **WriteAnnotations**: A boolean property indicating whether the annotations should be included in the exported document.

* **StreamCompression**: Gets or sets the content stream compression type. Possible Values are: 
   - **None**: The content streams won't be encoded.
   - **FlateDecode**:  Compresses data using the zlib/deflate compression method.

> The XAML SDK repository on GitHub contains examples showing the capabilities of PdfStreamWriter: 
> 
> - The [PdfStreamWriterPerformance](https://github.com/telerik/document-processing-sdk/tree/master/PdfProcessing/PdfStreamWriterPerformance) sample shows the performance you can achieve using PdfStreamWriter
> - The [Manipulate Pages](https://github.com/telerik/document-processing-sdk/tree/master/PdfProcessing/ManipulatePages) example shows different use cases of PdfStreamWriter


## See Also

* [Pdf Stream Writer Overview]({%slug radpdfprocessing-formats-and-conversion-pdf-pdfstreamwriter-overview%})
* [PdfPageStreamWriter]({%slug radpdfprocessing-formats-and-conversion-pdf-pdfstreamwriter-pdfpagestreamwriter%})
* [RadFixedPage]({%slug radpdfprocessing-model-radfixedpage%})