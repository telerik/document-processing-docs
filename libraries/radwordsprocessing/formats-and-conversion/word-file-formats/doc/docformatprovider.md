---
title: Using DocFormatProvider
page_title: Using DocFormatProvider
description: Import from Word 97 - Word 2003 Binary file format Using DocFormatProvider
slug: radwordsprocessing-formats-and-conversion-doc-docformatprovider
tags: using,docformatprovider
published: True
position: 1
---

# Doc

DOC is the default target Binary file format developed by Microsoft for representing documents in Word 97 - 2003.

# Dot

DOT is the Binary file format developed by Microsoft for representing templates in Word 97 - 2003.


# Using DocFormatProvider

**DocFormatProvider** makes it easy to import a DOC or DOT file into a **RadFlowDocument**, preserving the entire document structure and formatting.

To use **DocFormatProvider**, you should add references to the packages listed below:
      
* Telerik.Windows.Documents.Core
* Telerik.Windows.Documents.Flow     
* Telerik.Windows.Documents.Flow.FormatProviders.Doc
* Telerik.Windows.Zip
          

## Import

To import a DOC or DOT file, you should use the **Import()** method of **DocFormatProvider**.

#### **Example 1: Import document from a file**

<snippet id='codeblock-cp'/>


And here is how you can import a document from a byte array containing the document:

#### **Example 2: Import document from a byte array**
<snippet id='codeblock-cq'/>


The resulting **RadFlowDocument** can be manipulated like any code-generated document.

## See Also

* [Timeout Mechanism]({%slug timeout-mechanism-in-dpl%})
