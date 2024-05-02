---
title: Using RtfFormatProvider
page_title: Using RtfFormatProvider
slug: radwordsprocessing-formats-and-conversion-rtf-rtfformatprovider
tags: using,rtfformatprovider
published: True
position: 2
---

# Using RtfFormatProvider



__RtfFormatProvider__ makes it easy to import and export __RadFlowDocument__ to/from RTF format, preserving the entire document structure and formatting.
      

All you have to do in order to use __RtfFormatProvider__ is add references to the assemblies listed below:
      

* Telerik.Windows.Documents.Core.dll
* Telerik.Windows.Documents.Flow.dll
          

## Import

In order to import an RTF document, you need to use the __Import()__ method of __RtfFormatProvider__.
        

The code from __Example 1__ shows how to use __RtfFormatProvider__ to import an RTF document from a file.
        

#### __[C#] Example 1: Import document from a file__

{{region cs-radwordsprocessing-formats-and-conversion-rtf-rtfformatprovider_0}}
	Telerik.Windows.Documents.Flow.Model.RadFlowDocument document;

	Telerik.Windows.Documents.Flow.FormatProviders.Rtf.RtfFormatProvider provider = new Telerik.Windows.Documents.Flow.FormatProviders.Rtf.RtfFormatProvider();

	using (Stream input = File.OpenRead("Sample.rtf"))
	{
	    document = provider.Import(input);
	}
{{endregion}}



And here is how you can import a document from string containing the RTF document:
        

#### __[C#] Example 2: Import document from a string__

{{region cs-radwordsprocessing-formats-and-conversion-rtf-rtfformatprovider_1}}
	Telerik.Windows.Documents.Flow.FormatProviders.Rtf.RtfFormatProvider provider = new Telerik.Windows.Documents.Flow.FormatProviders.Rtf.RtfFormatProvider();

	Telerik.Windows.Documents.Flow.Model.RadFlowDocument document = provider.Import(input);
{{endregion}}



The resulting __RadFlowDocument__ can be used like any code-generated document.
        

## Export

In order to export a document to RTF, you need to use the __Export()__ method of __RtfFormatProvider__.
        

__Example 3__ shows how to use __RtfFormatProvider__ to export __RadFlowDocument__ to a file.
        

#### __[C#] Example 3: Export a document to a file__

{{region cs-radwordsprocessing-formats-and-conversion-rtf-rtfformatprovider_2}}
	Telerik.Windows.Documents.Flow.Model.RadFlowDocument document;

	Telerik.Windows.Documents.Flow.FormatProviders.Rtf.RtfFormatProvider provider = new Telerik.Windows.Documents.Flow.FormatProviders.Rtf.RtfFormatProvider();
	
	using (Stream output = File.Create("sample.rtf"))
	{
	    document = CreateRadFlowDocument();
	    provider.Export(document, output);
	}
{{endregion}}



You can also export the document to a string and preserve it in a database.
        

#### __[C#] Example 4: Export a document to a string__

{{region cs-radwordsprocessing-formats-and-conversion-rtf-rtfformatprovider_3}}
	Telerik.Windows.Documents.Flow.FormatProviders.Rtf.RtfFormatProvider provider = new Telerik.Windows.Documents.Flow.FormatProviders.Rtf.RtfFormatProvider();

	Telerik.Windows.Documents.Flow.Model.RadFlowDocument document = CreateRadFlowDocument();
	string output = provider.Export(document);
{{endregion}}



The resulting documents can be opened in any application that supports RTF documents.


## See Also

* [Plain text]({%slug radwordsprocessing-formats-and-conversion-txt%})
* [Using HtmlFormatProvider]({%slug radwordsprocessing-formats-and-conversion-html-htmlformatprovider%})
* [Using PdfFormatProvider]({%slug radwordsprocessing-formats-and-conversion-pdf-pdfformatprovider%})
        
