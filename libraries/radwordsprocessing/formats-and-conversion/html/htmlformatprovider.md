---
title: Using HtmlFormatProvider
page_title: Using HtmlFormatProvider
slug: radwordsprocessing-formats-and-conversion-html-htmlformatprovider
tags: using,htmlformatprovider
published: True
position: 3
---

# Using HtmlFormatProvider



__HtmlFormatProvider__ makes it easy to import and export __RadFlowDocument__ to/from HTML format, preserving as much as possible of the document structure and formatting. To use __HtmlFormatProvider__, you should add references to the packages listed below:
      

* Telerik.Windows.Documents.Core
* Telerik.Windows.Documents.Flow
          

## Import

In order to import an HTML document you can use the overloads of the __HtmlFormatProvider.Import()__ method.
        

__Example 1__ shows how to use HtmlFormatProvider to import an HTML document from a file.
        

#### __[C#] Example 1: Import HTML file__

<snippet id='codeblock-bU'/>



__Example 2__ shows how you can import an HTML string.
        

#### __[C#] Example 2: Import HTML string__

<snippet id='codeblock-bV'/>



The resulting __RadFlowDocument__ can be used like any code-generated document.
        

## Export

In order to export a document to HTML you can use the overloads of the __HtmlFormatProvider.Export()__ method.
        

__Example 3__ shows how to use the HtmlFormatProvider to export an instance of RadFlowDocument to a file:
        

#### __[C#] Example 3: Export HTML to file__

<snippet id='codeblock-bW'/>



You can also export the document to a string variable like shown in __Example 4__.
        

#### __[C#] Example 4: Export HTML to string__

<snippet id='codeblock-bX'/>


## See Also

- [Resolving FileNotFoundException for System.Text.Encoding.CodePages in RadWordsProcessing]({%slug resolve-file-not-found-exception-system-text-encoding-codepages-radwordsprocessing%}) 
* [Timeout Mechanism]({%slug timeout-mechanism-in-dpl%})
* [Converting HTML to Image Using Telerik Document Processing]({%slug converting-html-to-image-using-document-processing%})