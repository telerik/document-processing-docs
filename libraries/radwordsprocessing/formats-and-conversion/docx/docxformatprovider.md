---
title: Using DocxFormatProvider
page_title: Using DocxFormatProvider
description: Using DocxFormatProvider
slug: radwordsprocessing-formats-and-conversion-docx-docxformatprovider
tags: using,docxformatprovider
published: True
position: 2
---

# Using DocxFormatProvider



__DocxFormatProvider__ makes it easy to import and export __RadFlowDocument__ to/from docx format, preserving the entire document structure and formatting.
      

All you have to do in order to use __DocxFormatProvider__ is add references to the assemblies listed below:
      
* Telerik.Windows.Documents.Core.dll
* Telerik.Windows.Documents.Flow.dll         
* Telerik.Windows.Zip.dll
          

## Import

In order to import a docx document, you need to use the __Import()__ method of __DocxFormatProvider__.
        

The code in __Example 1__ shows how to use __DocxFormatProvider__ to import a docx document from a file.
        

#### __[C#] Example 1: Import document from a file__

{{region cs-radwordsprocessing-formats-and-conversion-docx-docxformatprovider_0}}
	DocxFormatProvider provider = new DocxFormatProvider();
	using (Stream input = File.OpenRead("Sample.docx"))
	{
	    RadFlowDocument document = provider.Import(input);
	}
{{endregion}}



And here is how you can import a document from byte array containing the docx document:
        

#### __[C#] Example 2: Import document from a byte array__
{{region cs-radwordsprocessing-formats-and-conversion-docx-docxformatprovider_1}}
	DocxFormatProvider provider = new DocxFormatProvider();
	RadFlowDocument document = provider.Import(input);
{{endregion}}


The resulting __RadFlowDocument__ can be manipulated like any code-generated document.
        

## Export

In order to export a document to docx, you need to use the __Export()__ method of __DocxFormatProvider__.
        

__Example 3__ shows how to use __DocxFormatProvider__ to export __RadFlowDocument__ to a file.
        

#### __[C#] Example 3: Export a document to a file__
{{region cs-radwordsprocessing-formats-and-conversion-docx-docxformatprovider_2}}
	DocxFormatProvider provider = new DocxFormatProvider();
	using (Stream output = File.OpenWrite("Sample.docx"))
	{
	    RadFlowDocument document = CreateRadFlowDocument();
	    provider.Export(document, output);
	}
{{endregion}}


You can also export the document to a byte array and preserve it in a database.
        

#### __[C#] Example 4: Export a document to a byte array__
{{region cs-radwordsprocessing-formats-and-conversion-docx-docxformatprovider_3}}
	DocxFormatProvider provider = new DocxFormatProvider();
	
	RadFlowDocument document = CreateRadFlowDocument();
	byte[] output = provider.Export(document);
{{endregion}}

The resulting documents can be opened in any application that supports docx documents.
        

