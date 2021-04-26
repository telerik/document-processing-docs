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

DOC is the default target Binary file format developed by Microsoft for representing documents in Word 97 - Word 2003 and is one of the supported formats by RadWordsProcessing.

# Dot

DOT is а Word 97 - Word 2003 Binary file format, developed by Microsoft for representing document templates and is one of the supported formats by RadWordsProcessing.

# Using DocFormatProvider

**DocFormatProvider** makes it easy to import a **RadFlowDocument** from DOC and DOT format, preserving the entire document structure and formatting.

All you have to do in order to use **DocFormatProvider** is add references to the assemblies listed below:
      
* Telerik.Windows.Documents.Core.dll
* Telerik.Windows.Documents.Flow.dll         
* Telerik.Windows.Documents.Flow.FormatProvider.Doc
* Telerik.Windows.Zip.dll
          

## Import

In order to import a DOC or DOT document, you need to use the **Import()** method of **DocFormatProvider**.

The code in **Example 1** shows how to use **DocFormatProvider** to import a DOC document from a file.

#### **[C#] Example 1: Import document from a file**

{{region cs-radwordsprocessing-formats-and-conversion-doc-docformatprovider_0}}
	            
	RadFlowDocument document;
	using (Stream input = File.OpenRead("Sample.doc"))
	{
		DocFormatProvider provider = new DocFormatProvider();
		document = provider.Import(input);
	}
{{endregion}}


And here is how you can import a document from byte array containing the DOC or DOT document:

#### **[C#] Example 2: Import document from a byte array**
{{region cs-radwordsprocessing-formats-and-conversion-doc-docformatprovider_1}}
	            
	DocFormatProvider provider = new DocFormatProvider();
	RadFlowDocument document = provider.Import(input);
{{endregion}}


The resulting **RadFlowDocument** can be manipulated like any code-generated document.
