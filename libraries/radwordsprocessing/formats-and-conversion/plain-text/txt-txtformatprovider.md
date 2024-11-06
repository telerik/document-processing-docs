---
title: Using TxtFormatProvider
page_title: Using TxtFormatProvider
slug: radwordsprocessing-formats-and-conversion-txt-txtformatprovider
tags: using,txtformatprovider
published: True
position: 1
---

# Using TxtFormatProvider



__TxtFormatProvider__ makes it easy to import and export __RadFlowDocument__ to/from plain text format, preserving the document structure.
      

All you have to do in order to use __TxtFormatProvider__ is add references to the assemblies listed below:
      

* Telerik.Windows.Documents.Core.dll
* Telerik.Windows.Documents.Flow.dll
          

## Import

In order to import a plain text document, you need to use the __Import()__ method of __TxtFormatProvider__.
        

__Example 1__ shows how to use __TxtFormatProvider__ to import a document from a file.
        

#### __[C#] Example 1: Import document from a file__

{{region cs-radwordsprocessing-formats-and-conversion-txt-txtformatprovider_0}}
	TxtFormatProvider provider = new TxtFormatProvider();
	using (Stream input = File.OpenRead("Sample.txt"))
	{
	    //RadFlowDocument document = provider.Import(input); //This method is obsolete since Q4 2024.

		RadFlowDocument document = provider.Import(input, TimeSpan.FromSeconds(10));
	}
{{endregion}}



And here is how you can import a document from string:
        

#### __[C#] Example 2: Import document from a string__

{{region cs-radwordsprocessing-formats-and-conversion-txt-txtformatprovider_1}}
	TxtFormatProvider provider = new TxtFormatProvider();

	//RadFlowDocument document = provider.Import(input); //This method is obsolete since Q4 2024.

	RadFlowDocument document = provider.Import(input, TimeSpan.FromSeconds(10));
{{endregion}}



The resulting __RadFlowDocument__ can be manipulated like any code-generated document.
        

## Export

In order to export a document to plain text, you need to use the __Export()__ method of __TxtFormatProvider__.
        

__Example 3__ shows how to use __TxtFormatProvider__ to export __RadFlowDocument__ to a file.
        

#### __[C#] Example 3: Export a document to a file__

{{region cs-radwordsprocessing-formats-and-conversion-txt-txtformatprovider_2}}
	TxtFormatProvider provider = new TxtFormatProvider();
	using (Stream output = File.OpenWrite("sample.txt"))
	{
	    RadFlowDocument document = CreateRadFlowDocument();

	    //provider.Export(document, output); //This method is obsolete since Q4 2024.

		provider.Export(document, output, TimeSpan.FromSeconds(10));
	}
{{endregion}}



You can also export the document to a string and preserve it in a database.
        

#### __[C#] Example 4: Export a document to a string__

{{region cs-radwordsprocessing-formats-and-conversion-txt-txtformatprovider_3}}
	TxtFormatProvider provider = new TxtFormatProvider();
	RadFlowDocument document = CreateRadFlowDocument();
	
	//string output = provider.Export(document); //This method is obsolete since Q4 2024.

	string output = provider.Export(document, TimeSpan.FromSeconds(10));
{{endregion}}


