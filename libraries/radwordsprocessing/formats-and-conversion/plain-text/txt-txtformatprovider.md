---
title: Using TxtFormatProvider
page_title: Using TxtFormatProvider
description: Using TxtFormatProvider
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
        

#### __[C#] Example 1: Import Document From a File__

{{region radwordsprocessing-formats-and-conversion-txt-txtformatprovider_0}}
    TxtFormatProvider provider = new TxtFormatProvider();
    using (Stream input = File.OpenRead("Sample.txt"))
    {
        RadFlowDocument document = provider.Import(input);
    }
{{endregion}}



And here is how you can import a document from string:
        

#### __[C#] Example 2: Import Document From a String__

{{region radwordsprocessing-formats-and-conversion-txt-txtformatprovider_1}}
    TxtFormatProvider provider = new TxtFormatProvider();
    RadFlowDocument document = provider.Import(input);
{{endregion}}



The resulting __RadFlowDocument__ can be manipulated like any code-generated document.
        

## Export

In order to export a document to plain text, you need to use the __Export()__ method of __TxtFormatProvider__.
        

__Example 3__ shows how to use __TxtFormatProvider__ to export __RadFlowDocument__ to a file.
        

#### __[C#] Example 3: Export a Document to a File__

{{region radwordsprocessing-formats-and-conversion-txt-txtformatprovider_2}}
    TxtFormatProvider provider = new TxtFormatProvider();
    using (Stream output = File.OpenWrite("sample.txt"))
    {
        RadFlowDocument document = CreateRadFlowDocument();
        provider.Export(document, output);
    }
{{endregion}}



You can also export the document to a string and preserve it in a database.
        

#### __[C#] Example 4: Export a Document to a String__

{{region radwordsprocessing-formats-and-conversion-txt-txtformatprovider_3}}
    TxtFormatProvider provider = new TxtFormatProvider();
    RadFlowDocument document = CreateRadFlowDocument();
    string output = provider.Export(document);
{{endregion}}


