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

**Example 1: Import HTML file**

<snippet id='libraries-flow-formats-and-conversion-html-htmlformatprovider-1'/>



**Example 2** shows how to import an HTML string.

**Example 2: Import HTML string**

<snippet id='libraries-flow-formats-and-conversion-html-htmlformatprovider-2'/>



The resulting `RadFlowDocument` can be used like any code-generated document.

## Export

To export a document to HTML, use the overloads of the `HtmlFormatProvider.Export()` method.

**Example 3** shows how to use the `HtmlFormatProvider` to export an instance of `RadFlowDocument` to a file:

**Example 3: Export HTML to file**

<snippet id='libraries-flow-formats-and-conversion-html-htmlformatprovider-3'/>



You can also export the document to a string variable as shown in **Example 4**.

**Example 4: Export HTML to string**

<snippet id='libraries-flow-formats-and-conversion-html-htmlformatprovider-4'/>


## See Also

* [Resolving FileNotFoundException for System.Text.Encoding.CodePages in RadWordsProcessing]({%slug resolve-file-not-found-exception-system-text-encoding-codepages-radwordsprocessing%})
* [Timeout Mechanism]({%slug timeout-mechanism-in-dpl%})
* [Converting HTML to Image Using Telerik Document Processing]({%slug converting-html-to-image-using-document-processing%})