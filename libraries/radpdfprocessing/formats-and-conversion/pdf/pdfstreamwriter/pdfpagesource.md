---
title: PdfPageSource
page_title: PdfPageSource
description: PdfPageSource
slug: radpdfprocessing-formats-and-conversion-pdf-pdf-stream-processing-pdfpagesource
tags: pdf,stream,page,source
published: True
position: 2
---

# Overview

The PdfPageSource class represents the page content of an existing PDF file.

## Using PdfPageSource

### Create an Instance

An instance of the PdfPageSource class can be obtained using the Pages property of PdfFileSource.

#### **Example 1: Obtain an instance of PdfPageSource**

{{region}}
	
	using (PdfFileSource fileSource = new PdfFileSource(File.OpenRead(path)))
	{
	    foreach (PdfPageSource pageSource in fileSource.Pages)
	    {
	    	// ...                  
	    }
	}
{{endregion}}

PdfPageSource exposes also an additional overload, which allows you to keep the stream you are working with open after disposing the PdfPageSource instance by passing **true** as a value for the second constructor parameter (leaveStreamOpen).

### Members

PdfPageSource exposes the two properties to give you information about the pages - Size and Orientation. 


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