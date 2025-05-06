---
title: Using DocxFormatProvider
page_title: Using DocxFormatProvider
description: Learn how you can import and export documents from/to DOCX using WordsProcessing.
slug: radwordsprocessing-formats-and-conversion-docx-docxformatprovider
tags: using,docxformatprovider
published: True
position: 1
---

# Docx

DOCX, a part of [Office Open XML](http://en.wikipedia.org/wiki/Office_Open_XML), is a zipped, XML-based file format developed by Microsoft for representing word processing document and is one of the supported formats by **RadWordsProcessing**. It is the default target format for Microsoft Word since Microsoft Office 2007.

**DocxFormatProvider** is compliant with the latest Office Open XML standard - [ECMA-376](http://www.ecma-international.org/publications/standards/Ecma-376.htm) 4th edition, December 2012.

# Using DocxFormatProvider

__DocxFormatProvider__ makes it easy to import and export __RadFlowDocument__ to/from DOCX format, preserving the entire document structure and formatting.
      

All you have to do in order to use __DocxFormatProvider__ is add references to the assemblies listed below:
      
* Telerik.Windows.Documents.Core.dll
* Telerik.Windows.Documents.Flow.dll         
* ~~Telerik.Windows.Zip.dll~~*
          
>note *As of **Q2 2025** the Zip Library will no longer be used as an internal dependency in the rest of the Document Processing Libraries - PdfProcessing, WordsProcessing, SpreadProcessing, SpreadStreamProcessing. It will be replaced by the System.IO.Compression. We will continue to ship the Telerik Zip Library as a standalone library so clients can still use it separately.

## Import

In order to import a DOCX document, you need to use the __Import()__ method of __DocxFormatProvider__.
        

The code in __Example 1__ shows how to use __DocxFormatProvider__ to import a DOCX document from a file.
        

#### __[C#] Example 1: Import document from a file__

{{region cs-radwordsprocessing-formats-and-conversion-docx-docxformatprovider_0}}
	Telerik.Windows.Documents.Flow.Model.RadFlowDocument document;
	
	Telerik.Windows.Documents.Flow.FormatProviders.Docx.DocxFormatProvider provider = new Telerik.Windows.Documents.Flow.FormatProviders.Docx.DocxFormatProvider();

	using (Stream input = File.OpenRead("Sample.docx"))
	{
		//document = provider.Import(input); //This method is obsolete since Q4 2024.

		document = provider.Import(input, TimeSpan.FromSeconds(10));
	}
{{endregion}}



And here is how you can import a document from byte array containing the DOCX document:
        

#### __[C#] Example 2: Import document from a byte array__
{{region cs-radwordsprocessing-formats-and-conversion-docx-docxformatprovider_1}}	            

	Telerik.Windows.Documents.Flow.FormatProviders.Docx.DocxFormatProvider provider = new Telerik.Windows.Documents.Flow.FormatProviders.Docx.DocxFormatProvider();

	//Telerik.Windows.Documents.Flow.Model.RadFlowDocument document = provider.Import(input); //This method is obsolete since Q4 2024.

	Telerik.Windows.Documents.Flow.Model.RadFlowDocument document = provider.Import(input, TimeSpan.FromSeconds(10));
{{endregion}}


The resulting __RadFlowDocument__ can be manipulated like any code-generated document.
        

## Export

In order to export a document to DOCX, you need to use the __Export()__ method of __DocxFormatProvider__.
        

__Example 3__ shows how to use __DocxFormatProvider__ to export __RadFlowDocument__ to a file.
        

#### __[C#] Example 3: Export a document to a file__
{{region cs-radwordsprocessing-formats-and-conversion-docx-docxformatprovider_2}}	
	Telerik.Windows.Documents.Flow.Model.RadFlowDocument document;

	Telerik.Windows.Documents.Flow.FormatProviders.Docx.DocxFormatProvider provider = new Telerik.Windows.Documents.Flow.FormatProviders.Docx.DocxFormatProvider();
	
	using (Stream output = File.OpenWrite("Sample.docx"))
	{
	    document = CreateRadFlowDocument(); // CreateRadFlowDocument() is a custom method that creates a simple instance of RadFlowDocument. You can replace it with the instance you would like to export.

		//provider.Export(document, output); //This method is obsolete since Q4 2024.

		provider.Export(document, output, TimeSpan.FromSeconds(10));
	}
{{endregion}}


You can also export the document to a byte array and preserve it in a database.
        

#### __[C#] Example 4: Export a document to a byte array__
{{region cs-radwordsprocessing-formats-and-conversion-docx-docxformatprovider_3}}

	Telerik.Windows.Documents.Flow.FormatProviders.Docx.DocxFormatProvider provider = new Telerik.Windows.Documents.Flow.FormatProviders.Docx.DocxFormatProvider();
	        
	Telerik.Windows.Documents.Flow.Model.RadFlowDocument document = CreateRadFlowDocument(); // CreateRadFlowDocument() is a custom method that creates a simple instance of RadFlowDocument. You can replace it with the instance you would like to export.

	//byte[] output = provider.Export(document); //This method is obsolete since Q4 2024.

	byte[] output = provider.Export(document, TimeSpan.FromSeconds(10));
{{endregion}}

The resulting documents can be opened in any application that supports DOCX documents.
        
## See Also

* [Timeout Mechanism]({%slug timeout-mechanism-in-dpl%})
