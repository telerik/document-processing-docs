---
title: Using TxtFormatProvider
description: Learn how to import and export RadFlowDocument to plain text format using the TxtFormatProvider in RadWordsProcessing.
page_title: Using TxtFormatProvider
slug: radwordsprocessing-formats-and-conversion-txt-txtformatprovider
tags: format, provider, txt, word, flow, docx, import, export, document, plaintext
published: True
position: 1
---

# Using TxtFormatProvider

`TxtFormatProvider` allows you to import and export a `RadFlowDocument` to and from plain text format, preserving the document structure.

To use `TxtFormatProvider`, add references to the following packages:

* `Telerik.Windows.Documents.Core`
* `Telerik.Windows.Documents.Flow`

## Import

To import a plain text document, use the `Import()` method of `TxtFormatProvider`.

**Example 1** shows how to use `TxtFormatProvider` to import a document from a file.

**Example 1: Import Document from a File**

<snippet id='libraries-flow-formats-and-conversion-plain-text-txt-txtformatprovider-1'/>

You can also import a document from a string:

**Example 2: Import Document from a String**

<snippet id='libraries-flow-formats-and-conversion-plain-text-txt-txtformatprovider-2'/>

The resulting `RadFlowDocument` can be manipulated like any code-generated document.

## Export

To export a document to plain text, use the `Export()` method of `TxtFormatProvider`.

**Example 3** shows how to use `TxtFormatProvider` to export a `RadFlowDocument` to a file.

**Example 3: Export a Document to a File**

<snippet id='libraries-flow-formats-and-conversion-plain-text-txt-txtformatprovider-3'/>

You can also export the document to a string and preserve it in a database.

**Example 4: Export a Document to a String**

<snippet id='libraries-flow-formats-and-conversion-plain-text-txt-txtformatprovider-4'/>

## See Also

* [Timeout Mechanism]({%slug timeout-mechanism-in-dpl%})
* [Automatic Output Stream Clearing on Export]({%slug common-export-output-stream-clearing%})
