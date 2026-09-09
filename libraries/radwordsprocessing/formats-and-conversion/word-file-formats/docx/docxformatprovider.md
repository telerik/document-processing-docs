---
title: Using DocxFormatProvider
page_title: Using DocxFormatProvider
description: Learn how to import DOCX files into RadFlowDocument instances and export RadFlowDocument content to DOCX with DocxFormatProvider.
slug: radwordsprocessing-formats-and-conversion-docx-docxformatprovider
tags: format, provider, docx, flow, docx, import, export, word, document, openxml
published: True
position: 1
---

# Using DocxFormatProvider

DOCX is part of Office Open XML, a zipped, XML-based format that Microsoft uses for word-processing documents. `RadWordsProcessing` supports this format. DOCX is the default format in Microsoft Word starting with Microsoft Office 2007.

`DocxFormatProvider` follows the Office Open XML `ECMA-376` specification. Use it to import DOCX documents into `RadFlowDocument` instances and export `RadFlowDocument` instances to DOCX files. The provider preserves the document structure and formatting that both `RadWordsProcessing` and DOCX support.

To use `DocxFormatProvider`, add references to these packages:

* `Telerik.(Windows).Documents.Core`
* `Telerik.(Windows).Documents.Flow`

>note Starting with **Q2 2025**, Telerik Document Processing no longer uses the [Zip Library]({%slug radziplibrary-overview%}) as an internal dependency in PdfProcessing, WordsProcessing, SpreadProcessing, and SpreadStreamProcessing. The libraries use `System.IO.Compression` instead. Telerik Zip Library still ships as a standalone library.

## Import

To import a DOCX document, use the `Import()` method of `DocxFormatProvider`.

The following code shows how to use `DocxFormatProvider` to import a DOCX document from a file.

**Example 1: Open a Sample.docx file stream and import it into a RadFlowDocument**

<snippet id='codeblock-cr'/>

You can also import a document from a byte array that contains the DOCX file:

**Example 2: Read a Sample.docx file into a byte array and import it into a RadFlowDocument**

<snippet id='codeblock-cs'/>

The resulting `RadFlowDocument` can be modified like any document that you create in code.

## Export

To export a document to DOCX, use the `Export()` method of `DocxFormatProvider`.

The following code shows how to use `DocxFormatProvider` to export a `RadFlowDocument` to a file.

**Example 3: Export a RadFlowDocument to a Sample.docx file stream**

<snippet id='codeblock-ct'/>

You can also export the document to a byte array and store it in a database.

**Example 4: Export a RadFlowDocument directly to a DOCX byte array**

<snippet id='codeblock-cu'/>

The resulting documents can be opened in applications that support DOCX files.

## See Also

* [Review DOCX settings]({%slug radwordsprocessing-formats-and-conversion-docx-settings%})
* [Check supported DOCX features]({%slug radwordsprocessing-formats-and-conversion-docx-features%})
* [Learn about timeout handling]({%slug timeout-mechanism-in-dpl%})
* [Understand output stream clearing on export]({%slug common-export-output-stream-clearing%})
