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

To use **DocFormatProvider**, you should add references to the assemblies listed below:
      
* Telerik.Windows.Documents.Core.dll
* Telerik.Windows.Documents.Flow.dll         
* Telerik.Windows.Documents.Flow.FormatProviders.Doc.dll
* Telerik.Windows.Zip.dll
          

## Import

To import a DOC or DOT file, you should use the **Import()** method of **DocFormatProvider**.

#### **[C#] Example 1: Import document from a file**

{{region cs-radwordsprocessing-formats-and-conversion-doc-docformatprovider_0}}

	Telerik.Windows.Documents.Flow.Model.RadFlowDocument document;

	Telerik.Windows.Documents.Flow.FormatProviders.Doc.DocFormatProvider provider = new Telerik.Windows.Documents.Flow.FormatProviders.Doc.DocFormatProvider();
	
	using (Stream input = File.OpenRead("Sample.doc"))
	{				
		document = provider.Import(input);
	}
{{endregion}}


And here is how you can import a document from a byte array containing the document:

#### **[C#] Example 2: Import document from a byte array**
{{region cs-radwordsprocessing-formats-and-conversion-doc-docformatprovider_1}}

	Telerik.Windows.Documents.Flow.FormatProviders.Doc.DocFormatProvider provider = new Telerik.Windows.Documents.Flow.FormatProviders.Doc.DocFormatProvider();

	Telerik.Windows.Documents.Flow.Model.RadFlowDocument document = provider.Import(input);
{{endregion}}


The resulting **RadFlowDocument** can be manipulated like any code-generated document.
