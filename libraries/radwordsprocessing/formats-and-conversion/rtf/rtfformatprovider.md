---
title: Using RtfFormatProvider
description: Learn how to import and export RadFlowDocument to and from RTF format using the RtfFormatProvider in RadWordsProcessing.
page_title: Using RtfFormatProvider
slug: radwordsprocessing-formats-and-conversion-rtf-rtfformatprovider
tags: format, provider, rtf, word, flow, docx, import, export, document, richtext
published: True
position: 2
---

# Using RtfFormatProvider

`RtfFormatProvider` allows you to import and export a `RadFlowDocument` to/from RTF format. The provider preserves the entire document structure and formatting.

To use `RtfFormatProvider`, add references to the following packages:

* Telerik.Windows.Documents.Core
* Telerik.Windows.Documents.Flow

## Import

To import an RTF document, use the `Import()` method of `RtfFormatProvider`.

The following code shows how to use `RtfFormatProvider` to import an RTF document from a file.

**Example 1: Import document from a file**

<snippet id='codeblock-ck'/>

You can also import a document from a string containing the RTF document:

**Example 2: Import document from a string**

<snippet id='codeblock-cl'/>

The resulting `RadFlowDocument` can be used like any code-generated document.

## Export

To export a document to RTF, use the `Export()` method of `RtfFormatProvider`.

The following code shows how to use `RtfFormatProvider` to export a `RadFlowDocument` to a file.

**Example 3: Export a document to a file**

<snippet id='codeblock-cm'/>

You can also export the document to a string and preserve it in a database.

**Example 4: Export a document to a string**

<snippet id='codeblock-cn'/>

The resulting documents can be opened in any application that supports RTF documents.

## See Also

* [Plain text]({%slug radwordsprocessing-formats-and-conversion-txt%})
* [Using HtmlFormatProvider]({%slug radwordsprocessing-formats-and-conversion-html-htmlformatprovider%})
* [Using PdfFormatProvider]({%slug radwordsprocessing-formats-and-conversion-pdf-pdfformatprovider%})
* [Timeout Mechanism]({%slug timeout-mechanism-in-dpl%})
* [Automatic Output Stream Clearing on Export]({%slug common-export-output-stream-clearing%})
