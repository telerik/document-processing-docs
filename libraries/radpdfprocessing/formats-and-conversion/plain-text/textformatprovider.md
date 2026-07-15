---
title: Using TextFormatProvider
description: Learn how to export a RadFixedDocument to plain text format using the TextFormatProvider in RadPdfProcessing.
page_title: Using TextFormatProvider
slug: radpdfprocessing-formats-and-conversion-plain-text-textformatprovider
tags: textformatprovider, pdf, plaintext, radpdfprocessing, export, text, document, extraction
published: True
position: 1
---

# Using TextFormatProvider

`TextFormatProvider` exports a `RadFixedDocument` to plain text format while preserving the document structure.

To use `TextFormatProvider`, add references to the following packages:

* Telerik.Windows.Documents.Core
* Telerik.Windows.Documents.Fixed

## Export

To export a document to plain text, use the `Export()` method of `TextFormatProvider`.

The following example shows how to use `TextFormatProvider` to export a `RadFixedDocument` to a string.

**Export RadFixedDocument to string**

<snippet id='pdf-export-to-text'/>

## See Also

* [Plain Text Format Overview]({%slug radpdfprocessing-formats-and-conversion-plain-text-text%})
* [TextFormatProvider Settings]({%slug radpdfprocessing-formats-and-conversion-plain-text-settings%})
* [Timeout Mechanism]({%slug timeout-mechanism-in-dpl%})
* [Extracting Text from PDF Documents]({%slug extract-text-from-pdf%})
* [Summarizing PDF Text Content with Azure AI Text Analytics]({%slug summarize-pdf-content%})
* [Automatic Output Stream Clearing on Export]({%slug common-export-output-stream-clearing%})
