---
title: PdfFileSource
page_title: PdfFileSource
description: PdfFileSource
slug: radpdfprocessing-formats-and-conversion-pdf-pdfstreamwriter-pdffilesource
tags: pdf,stream,file,source
published: True
position: 4
---

# Overview

The **PdfFileSource** class represents the content of an existing PDF file.

## Using PdfFileSource

### Create an Instance

To create an instance of PdfFileSource, you should pass a **FileStream** object, containing the PDF document, to the constructor of the class.

#### **[C#] Example 1: Create a PdfFileSource**
{{region cs-radpdfprocessing-formats-and-conversion-pdf-pdfstreamwriter-pdffilesource_0}}
	using (PdfFileSource fileSource = new PdfFileSource(File.OpenRead(path)))
	{
		// ...
	}
{{endregion}}

PdfFileSource exposes also an additional overload, which allows you to keep the stream you are working with open after disposing the PdfFileSource instance by passing **true** as a value for the second constructor parameter (leaveStreamOpen).

>PdfFileSource inherits from [IDisposable](https://msdn.microsoft.com/en-us/library/system.idisposable(v=vs.110).aspx). Make sure the object is disposed when you are done with it.

### Members

PdfFileSource exposes the **Pages** property, which is of type [PdfPageSource]({%slug radpdfprocessing-formats-and-conversion-pdf-pdfstreamwriter-pdfpagesource%})[] and allows you access the pages of the imported document.

#### **[C#] Example 2: Iterate the pages of a document**
{{region cs-radpdfprocessing-formats-and-conversion-pdf-pdfstreamwriter-pdffilesource_1}}
	
	using (PdfFileSource fileSource = new PdfFileSource(File.OpenRead(path)))
	{
	    foreach (PdfPageSource pageSource in fileSource.Pages)
	    {
	    	// ...                  
	    }
	}
{{endregion}}
 
>You can use the indexer of the Pages property to obtain a specific page of the document and, using [PdfStreamWriter]({%slug radpdfprocessing-formats-and-conversion-pdf-pdfstreamwriter-pdfstreamwriter%}), split it in a separate file.

## See Also

* [Pdf Stream Writer Overview]({%slug radpdfprocessing-formats-and-conversion-pdf-pdfstreamwriter-overview%})
* [PdfPageStreamWriter]({%slug radpdfprocessing-formats-and-conversion-pdf-pdfstreamwriter-pdfpagestreamwriter%})
* [RadFixedPage]({%slug radpdfprocessing-model-radfixedpage%})