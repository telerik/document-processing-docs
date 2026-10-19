---
title: Using RtfFormatProvider
description: Learn how to import and export RadFlowDocument to and from RTF format using the RtfFormatProvider in RadWordsProcessing.
page_title: Using RtfFormatProvider
slug: radwordsprocessing-formats-and-conversion-rtf-rtfformatprovider
tags: format, provider, rtf, word, flow, docx, import, export, document, richtext
published: True
position: 2
components: [wordsprocessing]
---

# Using RtfFormatProvider

`RtfFormatProvider` allows you to import and export a `RadFlowDocument` to/from RTF format. The provider preserves the entire document structure and formatting.

To use `RtfFormatProvider`, add references to the following packages:

* Telerik.Windows.Documents.Core
* Telerik.Windows.Documents.Flow

## Import

To import an RTF document, use the `Import()` method of `RtfFormatProvider`.

The following code shows how to use `RtfFormatProvider` to import an RTF document from a file.

**Example 1: Open a Sample.rtf file stream and import it into a RadFlowDocument**

<snippet id='codeblock-ck'/>

You can also import a document from a string containing the RTF document:

**Example 2: Read RTF markup from a string and import it into a RadFlowDocument**

<snippet id='codeblock-cl'/>

The resulting `RadFlowDocument` can be used like any code-generated document.

## Export

To export a document to RTF, use the `Export()` method of `RtfFormatProvider`.

The following code shows how to use `RtfFormatProvider` to export a `RadFlowDocument` to a file.

**Example 3: Export a RadFlowDocument to a sample.rtf file stream**

<snippet id='codeblock-cm'/>

You can also export the document to a string and preserve it in a database.

**Example 4: Export a RadFlowDocument directly to an RTF string**

<snippet id='codeblock-cn'/>

The resulting documents can be opened in any application that supports RTF documents.

## End-to-End Workflow

Use the following workflow to process an RTF document with `RtfFormatProvider`:

1. Add references to `Telerik.Windows.Documents.Core` and `Telerik.Windows.Documents.Flow`.
2. Import the RTF document from a file stream or a string by using the `Import()` method.
3. Use the resulting `RadFlowDocument` like any code-generated document.
4. Export the `RadFlowDocument` to a file stream or a string by using the `Export()` method.

The four examples in this article show the complete file- and string-based import and export options. Choose the input and output form that matches your workflow.

## Known Limitations

`RtfFormatProvider` is compliant with Rich Text Format (RTF) specification version 1.9. The RTF articles do not list individual unsupported RTF features, so verify feature support against the available format documentation before relying on a specific RTF feature.

This article does not document provider-specific exception types or exception messages. Use the troubleshooting checks below to verify the documented setup and operation before investigating an exception.

## Troubleshooting

When an RTF import or export does not work as expected, check the following:

* Confirm that the project references `Telerik.Windows.Documents.Core` and `Telerik.Windows.Documents.Flow`.
* Confirm that the operation uses `RtfFormatProvider.Import()` for input and `RtfFormatProvider.Export()` for output.
* Confirm that the selected example matches the data source or destination: use a file stream for a file and a string for RTF markup stored as text.
* If a required RTF feature is not available, check the documented RTF specification and format support information. This article does not identify unsupported features by name.

## See Also

* [RadFlowDocument model and document content]({%slug radwordsprocessing-model-radflowdocument%})
* [Insert one RadFlowDocument into another document]({%slug radwordsprocessing-editing-insert-documents%})
* [RadWordsProcessing formats and conversion overview]({%slug radwordsprocessing-formats-and-conversion%})
* [Plain text]({%slug radwordsprocessing-formats-and-conversion-txt%})
* [Using HtmlFormatProvider]({%slug radwordsprocessing-formats-and-conversion-html-htmlformatprovider%})
* [Using PdfFormatProvider]({%slug radwordsprocessing-formats-and-conversion-pdf-pdfformatprovider%})
* [Timeout Mechanism]({%slug timeout-mechanism-in-dpl%})
* [Automatic Output Stream Clearing on Export]({%slug common-export-output-stream-clearing%})
