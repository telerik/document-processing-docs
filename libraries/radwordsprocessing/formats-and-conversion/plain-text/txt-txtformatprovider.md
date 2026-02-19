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
      

All you have to do in order to use __TxtFormatProvider__ is add references to the packages listed below:
      

* Telerik.Windows.Documents.Core
* Telerik.Windows.Documents.Flow
          

## Import

In order to import a plain text document, you need to use the __Import()__ method of __TxtFormatProvider__.
        

__Example 1__ shows how to use __TxtFormatProvider__ to import a document from a file.
        

#### __Example 1: Import document from a file__

<snippet id='codeblock-cg'/>



And here is how you can import a document from string:
        

#### __Example 2: Import document from a string__

<snippet id='codeblock-ch'/>



The resulting __RadFlowDocument__ can be manipulated like any code-generated document.
        

## Export

In order to export a document to plain text, you need to use the __Export()__ method of __TxtFormatProvider__.
        

__Example 3__ shows how to use __TxtFormatProvider__ to export __RadFlowDocument__ to a file.
        

#### __Example 3: Export a document to a file__

<snippet id='codeblock-ci'/>



You can also export the document to a string and preserve it in a database.
        

#### __Example 4: Export a document to a string__

<snippet id='codeblock-cj'/>

## See Also

* [Timeout Mechanism]({%slug timeout-mechanism-in-dpl%})
