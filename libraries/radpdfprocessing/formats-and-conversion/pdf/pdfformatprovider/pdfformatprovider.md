---
title: Using PdfFormatProvider
page_title: Using PdfFormatProvider
slug: radpdfprocessing-formats-and-conversion-pdf-pdfformatprovider
tags: using,pdfformatprovider
published: True
position: 1
---

# Using PdfFormatProvider



__PdfFormatProvider__ makes it easy to import and export a RadFixedDocument from/to PDF format, preserving the entire document structure and formatting.
      

In order to use the format provider, you need to add references to the following assemblies:

* Telerik.Windows.Documents.Core.dll
* Telerik.Windows.Documents.Fixed.dll
* ~~Telerik.Windows.Zip.dll~~*
          
>note *As of **Q2 2025** the Zip Library will no longer be used as an internal dependency in the rest of the Document Processing Libraries - PdfProcessing, WordsProcessing, SpreadProcessing, SpreadStreamProcessing. It will be replaced by the System.IO.Compression. We will continue to ship the Telerik Zip Library as a standalone library so clients can still use it separately.
	  
The PdfFormatProvider class of RadPdfProcessing is located in the **Telerik.Windows.Documents.Fixed.FormatProviders.Pdf** namespace.

## Import

To import a PDF document you need to use the __Import()__ method of __PdfFormatProvider__.
        

__Example 1__ shows how to use PdfFormatProvider to import a PDF document from a file.

>PDF files can be opened as long as you can obtain a stream with their content that supports Read and Seek operations. If the stream supports only Read, its content should be copied to a MemoryStream, which will enable the Seek operation as well.
        
>Since Q2 2015 the __RadPdfProcessing__ library exposes [new API]({%slug radpdfprocessing-model-imagesource%}#methods), which needs to use the stream while working with images in a __RadFixedDocument__. This requires to keep the stream open and not dispose it.



#### __[C#] Example 1: Import PDF file__

{{region cs-radpdfprocessing-formats-and-conversion-pdf-pdfformatprovider_0}}
	PdfFormatProvider provider = new PdfFormatProvider();
	RadFixedDocument document;
	using (Stream stream = File.OpenRead("sample.pdf"))
	{
		//document = provider.Import(stream); //This method is obsolete since Q4 2024.
		
		document = provider.Import(stream, TimeSpan.FromSeconds(10)); 
	
	    // Do your work with the document inside the using statement.
	}
{{endregion}}



The result from the import method is a [__RadFixedDocument__]({%slug radpdfprocessing-model-radfixeddocument%}), which can be used like any code-generated document.
        

>Import support is limited to the features that are supported by the export so it is possible that you cannot import all of your custom PDF documents.
          
	 
>note Complete examples showing importing and exporting a document are available in the [SDK repository on GitHub](https://github.com/telerik/document-processing-sdk/tree/master/PdfProcessing).

## Export

__Example 2__ shows how to use the __Export()__ method of __PdfFormatProvider__ to export __RadFixedDocument__ to a file.
        

#### __[C#] Example 2: Export PDF file__

{{region cs-radpdfprocessing-formats-and-conversion-pdf-pdfformatprovider_1}}
	PdfFormatProvider provider = new PdfFormatProvider();
	using (Stream output = File.OpenWrite("sample.pdf"))
	{
		//provider.Export(document, output); //This method is obsolete since Q4 2024.

		provider.Export(document, output, TimeSpan.FromSeconds(10)); 
	}
{{endregion}}

>important When exporting a digitally signed document a stream that allows both reading and writing should be passed otherwise an exception is thrown: NotSupportedException: 'Stream does not support reading.' For example creаte the output stream like this: 'new FileStream("signed.pdf", FileMode.OpenOrCreate, FileAccess.ReadWrite)'.


The resulting document can be opened in any application which supports PDF documents.
        
## See Also

* [PdfFormatProvider API Reference](https://docs.telerik.com/devtools/document-processing/api/Telerik.Windows.Documents.Fixed.FormatProviders.Pdf.PdfFormatProvider.html)
* [Settings]({%slug radpdfprocessing-formats-and-conversion-pdf-settings%})
* [Timeout Mechanism]({%slug timeout-mechanism-in-dpl%})
