---
title: Using HtmlFormatProvider
description: Learn how to import and export RadFlowDocument to and from HTML format using the HtmlFormatProvider in RadWordsProcessing.
page_title: Using HtmlFormatProvider
slug: radwordsprocessing-formats-and-conversion-html-htmlformatprovider
tags: html, format, provider, word, flow, docx, import, export, document, web
published: True
position: 3
---

# Using HtmlFormatProvider

`HtmlFormatProvider` allows you to import and export `RadFlowDocument` to/from HTML format, preserving as much as possible of the document structure and formatting. To use `HtmlFormatProvider`, add references to the following packages:

* `Telerik.Windows.Documents.Core`
* `Telerik.Windows.Documents.Flow`

## Import

To import an HTML document, use the overloads of the `HtmlFormatProvider.Import()` method.

**Example 1** shows how to use `HtmlFormatProvider` to import an HTML document from a file.

**Example 1: Open an HTML file stream and import it into a RadFlowDocument**

<snippet id='codeblock-bubu'/>



**Example 2** shows how to import an HTML string.

**Example 2: Import an HTML string containing a paragraph into a RadFlowDocument**

<snippet id='codeblock-bvbv'/>



The resulting `RadFlowDocument` can be used like any code-generated document.

## Export

To export a document to HTML, use the overloads of the `HtmlFormatProvider.Export()` method.

**Example 3** shows how to use the `HtmlFormatProvider` to export an instance of `RadFlowDocument` to a file:

**Example 3: Export a RadFlowDocument to an HTML file stream**

<snippet id='codeblock-bwbw'/>



You can also export the document to a string variable as shown in **Example 4**.

**Example 4: Export a RadFlowDocument directly to an HTML string**

<snippet id='codeblock-bxbx'/>


## See Also

* [Resolving FileNotFoundException for System.Text.Encoding.CodePages in RadWordsProcessing]({%slug resolve-file-not-found-exception-system-text-encoding-codepages-radwordsprocessing%})
* [Timeout Mechanism]({%slug timeout-mechanism-in-dpl%})
* [Converting HTML to Image Using Telerik Document Processing]({%slug converting-html-to-image-using-document-processing%})