---
title: PdfPageSource
page_title: PdfPageSource
description: PdfPageSource
slug: radpdfprocessing-formats-and-conversion-pdf-pdfstreamwriter-pdfpagesource
tags: pdf,stream,page,source
published: True
position: 5
---

# Overview

The **PdfPageSource** class represents the page content of an existing PDF file.

## Using PdfPageSource

### Create an Instance

An instance of the PdfPageSource class can be obtained using the **Pages** property of [PdfFileSource]({%slug radpdfprocessing-formats-and-conversion-pdf-pdfstreamwriter-pdffilesource%}).

#### **[C#] Example 1: Obtain an instance of PdfPageSource**

{{region cs-radpdfprocessing-formats-and-conversion-pdf-pdfstreamwriter-pdfpagesource_0}}
	
	using (PdfFileSource fileSource = new PdfFileSource(File.OpenRead(path)))
	{
	    foreach (PdfPageSource pageSource in fileSource.Pages)
	    {
	    	// ...                  
	    }
	}
{{endregion}}

### Members

PdfPageSource exposes the two properties to give you information about the pages - **Size** and **Orientation**. 

**Example 2** shows how you can use PdfPageSource to merge the pages of several documents into a single one.

#### **[C#] Example 2: Merge the pages of several documents**

{{region cs-radpdfprocessing-formats-and-conversion-pdf-pdfstreamwriter-pdfpagesource_2}}

	// Create a PdfStreamWriter instance, responsible to write the document into the specified file
	using (PdfStreamWriter fileWriter = new PdfStreamWriter(File.OpenWrite(resultFile)))
	{
	    // Iterate through the files you would like to merge
	    foreach(string documentName in documentsToMerge)
	    {
	        // Open each of the files
	        using (PdfFileSource fileToMerge = new PdfFileSource(File.OpenRead(documentName)))
	        {
	            // Iterate through the pages of the current document
	            foreach(PdfPageSource pageToMerge in fileToMerge.Pages)
	            {
	                // Append the current page to the fileWriter, which holds the stream of the result file
	                fileWriter.WritePage(pageToMerge);
	            }
	        }
	    }
	}

{{endregion}}

## See Also

* [Pdf Stream Writer Overview]({%slug radpdfprocessing-formats-and-conversion-pdf-pdfstreamwriter-overview%})
* [PdfStreamWriter Class]({%slug radpdfprocessing-formats-and-conversion-pdf-pdfstreamwriter-pdfstreamwriter%})
* [PdfPageStreamWriter]({%slug radpdfprocessing-formats-and-conversion-pdf-pdfstreamwriter-pdfpagestreamwriter%})
* [PdfFileSource]({%slug radpdfprocessing-formats-and-conversion-pdf-pdfstreamwriter-pdffilesource%})
