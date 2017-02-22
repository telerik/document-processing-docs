---
title: PdfPageStreamWriter 
page_title: PdfPageStreamWriter 
description: PdfPageStreamWriter 
slug: radpdfprocessing-formats-and-conversion-pdf-pdfstreamwriter-pdfpagestreamwriter
tags: pdf,page,stream,writer
published: True
position: 3
---

# Overview

The **PdfPageStreamWriter** class provides API allowing you to write and position content in the currently written page.

## Using PdfPageStreamWriter

### Create a PdfPageStreamWriter  Instance

An instance of the PdfPageStreamWriter class can be obtained using the **BeginPage()** method of [PdfSteamWriter]({%slug radpdfprocessing-formats-and-conversion-pdf-pdfstreamwriter-pdfstreamwriter%}).


#### **[C#] Example 1: Instantiate PdfPageStreamWriter**
	
{{region cs-radpdfprocessing-formats-and-conversion-pdf-pdfstreamwriter-pdfpagestreamwriter_0}}

	using (PdfStreamWriter writer = new PdfStreamWriter(File.OpenWrite(resultDocument)))
	{
		Size size = new Size(700,1200);
		Rotation rotation = Rotation.Rotate270;

		using (PdfPageStreamWriter pageWriter = fileWriter.BeginPage(size, rotation))
        {
			// Use the pageWriter object to fill the content of the page.
		}
	}
{{endregion}}

>You can find an example on how to use the PdfPageStreamWriter class in the [Manipulate Pages](https://github.com/telerik/xaml-sdk/tree/master/PdfProcessing/ManipulatePages) example in the XAML SDK repository on GitHub.

PdfStreamWriter exposes also an additional overload, which allows you to keep the stream you are working with open after disposing the writer instance by passing **true** as a value for the second constructor parameter (leaveStreamOpen).

>PdfPageStreamWriter inherits from [IDisposable](https://msdn.microsoft.com/en-us/library/system.idisposable(v=vs.110).aspx). Make sure the object is disposed when you are done with it. The best way to ensure this is handled properly is to wrap it in a *using* statement. 

### PdfPageStreamWriter Members

The members of the class allow you to set several properties of the document page you are working with as well as write new content.

* **Rotation**: A read-only property of type [Rotation](http://docs.telerik.com/devtools/document-processing/api/html/T_Telerik_Windows_Documents_Fixed_Model_Data_Rotation.htm). Keeps the information about the rotation of the currently generated page. 

* **Size**: A read-only property of type [Size](https://msdn.microsoft.com/en-us/library/system.windows.size(v=vs.110).aspx). Keeps the information about the size of the currently generated page. 

* **WriteContent()**: This method enables you to write content to the currently written PDF page Stream. There are two overloads allowing to add content either from [PdfPageSource]({%slug radpdfprocessing-formats-and-conversion-pdf-pdfstreamwriter-pdfpagesource%}) or [RadFixedPage]({%slug radpdfprocessing-model-radfixedpage%}).

* **ContentPosition**: A property of type [IPosition](http://docs.telerik.com/devtools/document-processing/api/html/T_Telerik_Windows_Documents_Fixed_Model_Data_IPosition.htm#!) allowing you to specify the position of the next page content written with WriteContent() method.

* **SaveContentPosition()**: With this method you can save current [IPosition](http://docs.telerik.com/devtools/document-processing/api/html/T_Telerik_Windows_Documents_Fixed_Model_Data_IPosition.htm#!) values. The method returns IDisposable object that restores the current position when disposed.



## See Also

* [Pdf Stream Writer Overview]({%slug radpdfprocessing-formats-and-conversion-pdf-pdfstreamwriter-overview%})
* [PdfStreamWriter]({%slug radpdfprocessing-formats-and-conversion-pdf-pdfstreamwriter-pdfstreamwriter%})
* [RadFixedPage]({%slug radpdfprocessing-model-radfixedpage%})