---
title: PdfFileSource
page_title: PdfFileSource
description: PdfFileSource
slug: radpdfprocessing-formats-and-conversion-pdf-pdf-stream-processing-pdffilesource
tags: pdf,stream,file,source
published: True
position: 2
---

# Overview

The PdfFileSource class represents the content of an existing PDF file.

## Using PdfFileSource

### Create an Instance

To create an instance of PdfFileSource, you should pass a FileStream object, containing the PDF document, to the constructor of the class.

#### **Example 1: Create a PdfFileSource**
{{region}}
	using (PdfFileSource fileSource = new PdfFileSource(File.OpenRead(path)))
	{
		// ...
	}
{{endregion}}

PdfFileSource exposes also an additional overload, which allows you to keep the stream you are working with open after disposing the PdfFileSource instance by passing **true** as a value for the second constructor parameter (leaveStreamOpen).

>PdfFileSource inherits from [IDisposable](https://msdn.microsoft.com/en-us/library/system.idisposable(v=vs.110).aspx). Make sure the object is disposed when you are done with it.

### Members

PdfFileSource exposes the Pages property, which is of type [PdfPageSource]({%slug radpdfprocessing-formats-and-conversion-pdf-pdf-stream-processing-pdfpagesource%})[] and allows you access the pages of the imported document.

#### **Example 2: Iterate the pages of a document**
{{region}}
	
	using (PdfFileSource fileSource = new PdfFileSource(File.OpenRead(path)))
	{
	    foreach (PdfPageSource pageSource in fileSource.Pages)
	    {
	    	// ...                  
	    }
	}
{{endregion}}


## See Also

* Pdf Stream Processing Overview
* PdfPageStreamWriter
* RadFixedPage