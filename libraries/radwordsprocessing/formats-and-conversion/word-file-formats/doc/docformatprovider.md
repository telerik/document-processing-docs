---
title: Using DocFormatProvider
page_title: Using DocFormatProvider
description: Import from Word 97 - Word 2003 Binary file format Using DocFormatProvider
slug: radwordsprocessing-formats-and-conversion-doc-docformatprovider
tags: using,docformatprovider
published: True
position: 2
---

# Using DocFormatProvider

**DocFormatProvider** makes it easy to import a **RadFlowDocument** from DOC format, preserving the entire document structure and formatting.

All you have to do in order to use **DocFormatProvider** is add references to the assemblies listed below:
      
* Telerik.Windows.Documents.Core.dll
* Telerik.Windows.Documents.Flow.dll         
* Telerik.Windows.Documents.Flow.FormatProvider.Doc
* Telerik.Windows.Zip.dll
          

## Import

In order to import a doc document, you need to use the **Import()** method of **DocFormatProvider**.

The code in **Example 1** shows how to use **DocFormatProvider** to import a doc document from a file.

#### **[C#] Example 1: Import document from a file**

{{region cs-radwordsprocessing-formats-and-conversion-doc-docformatprovider_0}}
	            
	RadFlowDocument document;
	using (Stream input = File.OpenRead("Sample.doc"))
	{
		DocFormatProvider provider = new DocFormatProvider();
		document = provider.Import(input);
	}
{{endregion}}


And here is how you can import a document from byte array containing the doc document:

#### **[C#] Example 2: Import document from a byte array**
{{region cs-radwordsprocessing-formats-and-conversion-doc-docformatprovider_1}}
	            
	DocFormatProvider provider = new DocFormatProvider();
	RadFlowDocument document = provider.Import(input);
{{endregion}}


The resulting **RadFlowDocument** can be manipulated like any code-generated document.
