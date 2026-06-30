---
title: Using DocFormatProvider
page_title: Using DocFormatProvider
description: Learn how to import DOC and DOT files into a RadFlowDocument using the DocFormatProvider in RadWordsProcessing.
slug: radwordsprocessing-formats-and-conversion-doc-docformatprovider
tags: format, provider, doc, word, flow, docx, import, word, legacy, document, binary
published: True
position: 1
---

# Using DocFormatProvider

DOC is the default target binary file format developed by Microsoft for representing documents in Word 97–2003. DOT is the binary file format developed by Microsoft for representing templates in Word 97–2003.

`DocFormatProvider` allows you to import a DOC or DOT file into a `RadFlowDocument`. The provider preserves the entire document structure and formatting.

To use `DocFormatProvider`, add references to the following packages:

* Telerik.Windows.Documents.Core
* Telerik.Windows.Documents.Flow
* Telerik.Windows.Documents.Flow.FormatProviders.Doc
* Telerik.Windows.Zip

## Import

To import a DOC or DOT file, use the `Import()` method of `DocFormatProvider`.

**Example 1: Import document from a file**

<snippet id='libraries-flow-formats-and-conversion-word-file-formats-doc-docformatprovider-1'/>

You can also import a document from a byte array containing the document:

**Example 2: Import document from a byte array**

<snippet id='libraries-flow-formats-and-conversion-word-file-formats-doc-docformatprovider-2'/>

The resulting `RadFlowDocument` can be manipulated like any code-generated document.

## See Also

* [Timeout Mechanism]({%slug timeout-mechanism-in-dpl%})
* [Automatic Output Stream Clearing on Export]({%slug common-export-output-stream-clearing%})
