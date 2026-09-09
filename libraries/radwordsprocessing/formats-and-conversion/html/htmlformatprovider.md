---
title: Using HtmlFormatProvider
description: Learn how to import HTML to RadFlowDocument and export RadFlowDocument to HTML by using the HtmlFormatProvider class in RadWordsProcessing.
page_title: Using HtmlFormatProvider
slug: radwordsprocessing-formats-and-conversion-html-htmlformatprovider
tags: html, format, provider, word, flow, docx, import, export, document, web
published: True
position: 3
---

# Using HtmlFormatProvider

Telerik Document Processing includes the `HtmlFormatProvider` class in **RadWordsProcessing** for importing HTML to `RadFlowDocument` and exporting `RadFlowDocument` to HTML. The provider maps supported HTML elements and CSS properties to the flow document model. The class is in the `Telerik.Documents.Flow.FormatProviders.Html` namespace. To use `HtmlFormatProvider`, reference the following packages:

* `Telerik.Documents.Core`
* `Telerik.Documents.Flow`

If your project uses the Windows-only package family, use the corresponding `Telerik.Windows.Documents.*` package names instead.

`HtmlFormatProvider` exposes [`ImportSettings`]({%slug radwordsprocessing-formats-and-conversion-html-settings%}#import-settings) and [`ExportSettings`]({%slug radwordsprocessing-formats-and-conversion-html-settings%}#export-settings) properties. Use `HtmlImportSettings` to handle external images and stylesheets through the `LoadImageFromUri` and `LoadStyleSheetFromUri` events. Use `HtmlExportSettings` to control options such as `ImagesExportMode`, `StylesExportMode`, and `DocumentExportLevel`.

## Import

To import an HTML document, use the overloads of the `HtmlFormatProvider.Import()` method.

**Example 1** shows how to use `HtmlFormatProvider` to import an HTML document from a file.

#### __Example 1: Import an HTML File__

<snippet id='codeblock-bubu'/>

**Example 2** shows how to import an HTML string.

#### __Example 2: Import an HTML String__

<snippet id='codeblock-bvbv'/>

The resulting `RadFlowDocument` works like any document that you create in code.

## Export

To export a document to HTML, use the overloads of the `HtmlFormatProvider.Export()` method.

**Example 3** shows how to use the `HtmlFormatProvider` to export an instance of `RadFlowDocument` to a file:

#### __Example 3: Export a RadFlowDocument to an HTML File__

<snippet id='codeblock-bwbw'/>

You can also export the document to a string variable as shown in **Example 4**.

#### __Example 4: Export a RadFlowDocument to an HTML String__

<snippet id='codeblock-bxbx'/>

## See Also

* [Resolving FileNotFoundException for System.Text.Encoding.CodePages in RadWordsProcessing]({%slug resolve-file-not-found-exception-system-text-encoding-codepages-radwordsprocessing%})
* [Timeout Mechanism]({%slug timeout-mechanism-in-dpl%})
* [Converting HTML to Image Using Telerik Document Processing]({%slug converting-html-to-image-using-document-processing%})