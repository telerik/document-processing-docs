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

**Example 1: Open a Sample.txt file stream and import it into a RadFlowDocument**

<snippet id='codeblock-cg'/>

You can also import a document from a string:

**Example 2: Read plain-text content from a string and import it into a RadFlowDocument**

<snippet id='codeblock-ch'/>

The resulting `RadFlowDocument` can be manipulated like any code-generated document.

## Export

To export a document to plain text, use the `Export()` method of `TxtFormatProvider`.

**Example 3** shows how to use `TxtFormatProvider` to export a `RadFlowDocument` to a file.

**Example 3: Export a RadFlowDocument to a sample.txt file stream**

<snippet id='codeblock-ci'/>

You can also export the document to a string and preserve it in a database.

**Example 4: Export a RadFlowDocument directly to a plain-text string**

<snippet id='codeblock-cj'/>

## See Also

* [Timeout Mechanism]({%slug timeout-mechanism-in-dpl%})
* [Automatic Output Stream Clearing on Export]({%slug common-export-output-stream-clearing%})
