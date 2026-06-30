---
title: Using DocxFormatProvider
page_title: Using DocxFormatProvider
description: Learn how to import and export RadFlowDocument to and from DOCX format using the DocxFormatProvider in RadWordsProcessing.
slug: radwordsprocessing-formats-and-conversion-docx-docxformatprovider
tags: format, provider, docx, flow, docx, import, export, word, document, openxml
published: True
position: 1
---

# Using DocxFormatProvider

DOCX, a part of [Office Open XML](https://en.wikipedia.org/wiki/Office_Open_XML), is a zipped, XML-based file format developed by Microsoft for representing word processing documents. `RadWordsProcessing` supports this format. DOCX is the default target format for Microsoft Word starting with Microsoft Office 2007.

`DocxFormatProvider` is compliant with the latest Office Open XML standard—[ECMA-376](https://www.ecma-international.org/publications/standards/Ecma-376.htm) 4th edition, December 2012.

`DocxFormatProvider` allows you to import and export a `RadFlowDocument` to/from DOCX format. The provider preserves the entire document structure and formatting.

To use `DocxFormatProvider`, add references to the following packages:

* Telerik.Windows.Documents.Core
* Telerik.Windows.Documents.Flow

>note Starting with **Q2 2025** the Zip Library is no longer used as an internal dependency in the rest of the Document Processing Libraries—PdfProcessing, WordsProcessing, SpreadProcessing, SpreadStreamProcessing. It is replaced by System.IO.Compression. The Telerik Zip Library continues to ship as a standalone library so you can still use it separately.

## Import

To import a DOCX document, use the `Import()` method of `DocxFormatProvider`.

The following code shows how to use `DocxFormatProvider` to import a DOCX document from a file.

**Example 1: Import document from a file**

<snippet id='libraries-flow-formats-and-conversion-word-file-formats-docx-docxformatprovider-1'/>

You can also import a document from a byte array containing the DOCX document:

**Example 2: Import document from a byte array**

<snippet id='libraries-flow-formats-and-conversion-word-file-formats-docx-docxformatprovider-2'/>

The resulting `RadFlowDocument` can be manipulated like any code-generated document.

## Export

To export a document to DOCX, use the `Export()` method of `DocxFormatProvider`.

The following code shows how to use `DocxFormatProvider` to export a `RadFlowDocument` to a file.

**Example 3: Export a document to a file**

<snippet id='libraries-flow-formats-and-conversion-word-file-formats-docx-docxformatprovider-3'/>

You can also export the document to a byte array and preserve it in a database.

**Example 4: Export a document to a byte array**

<snippet id='libraries-flow-formats-and-conversion-word-file-formats-docx-docxformatprovider-4'/>

The resulting documents can be opened in any application that supports DOCX documents.

## See Also

* [Timeout Mechanism]({%slug timeout-mechanism-in-dpl%})
* [Automatic Output Stream Clearing on Export]({%slug common-export-output-stream-clearing%})
