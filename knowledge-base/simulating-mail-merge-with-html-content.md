---
title: Simulating Mail Merge with HTML content by Utilizing the Find and Replace Functionality
description: Learn how to render HTML content with formatting options during mail merge using Telerik Document Processing Library.
type: how-to
page_title: Simulating Mail Merge with HTML content by Utilizing the Find and Replace Functionality
meta_title: Simulating Mail Merge with HTML content by Utilizing the Find and Replace Functionality
slug: simulating-mail-merge-with-html-content
tags: wordsprocessing,telerik document processing,mail merge,html content,html format provider
res_type: kb
ticketid: 1694621
---

## Environment

| Version | Product | Author | 
| ---- | ---- | ---- | 
| 2025.2.520| RadWordProcessing |[Desislava Yordanova](https://www.telerik.com/blogs/author/desislava-yordanova)| 

## Description

I want to perform mail merge using Telerik Document Processing Library, where HTML content needs to replace placeholders in a DOCX template. When performing mail merge, the library binds plain HTML text instead of rendering the HTML with formatting. In some cases, using the HtmlFormatProvider results in corrupted documents.

This knowledge base article also answers the following questions:
- How to insert formatted HTML content in mail merge using Telerik Document Processing?
- How to replace placeholders with styled HTML content in RadFlowDocument?
- How to use HtmlFormatProvider correctly in Telerik WordsProcessing?

## Solution

To render HTML content during mail merge, use the find-and-replace functionality instead of the default mail merge engine. Replace placeholders with styled HTML content using the following steps:

1. Import the HTML content using HtmlFormatProvider.
2. Import the DOCX template using DocxFormatProvider.
3. Find placeholders in the template and replace them with the imported HTML content.

### Code Example

```csharp
// Import HTML content
RadFlowDocument htmlFlowDocument;
using (Stream input = File.OpenRead(@"info.html"))
{
    Telerik.Windows.Documents.Flow.FormatProviders.Html.HtmlFormatProvider htmlProvider = new Telerik.Windows.Documents.Flow.FormatProviders.Html.HtmlFormatProvider(); 
    htmlFlowDocument = htmlProvider.Import(input, TimeSpan.FromSeconds(10));
}

// Import DOCX template
RadFlowDocument templateFlowDocument;
Telerik.Windows.Documents.Flow.FormatProviders.Docx.DocxFormatProvider docxProvider = new Telerik.Windows.Documents.Flow.FormatProviders.Docx.DocxFormatProvider();

using (Stream input = File.OpenRead("template.docx"))
{
    templateFlowDocument = docxProvider.Import(input, TimeSpan.FromSeconds(10));
}

// Replace placeholder with HTML content
List<BlockBase> newContent = new List<BlockBase>();
RadFlowDocumentEditor editor = new RadFlowDocumentEditor(templateFlowDocument);

foreach (Section section in htmlFlowDocument.Sections)
{
    Section clonedSection = section.Clone(templateFlowDocument);
    newContent.AddRange(clonedSection.Blocks);
}

editor.ReplaceText("<<EXSUSection>>", newContent, true, false);

// Export the modified document
string outputFilePath = "output.docx";
File.Delete(outputFilePath);
using (Stream output = File.OpenWrite(outputFilePath))
{
    docxProvider.Export(templateFlowDocument, output, TimeSpan.FromSeconds(10));
}

// Open the output file
Process.Start(new ProcessStartInfo() { FileName = outputFilePath, UseShellExecute = true });
```

### Notes:
- Replace `<<EXSUSection>>` with your placeholder text.
- Modify the code to suit your template and requirements.
- Ensure the provided HTML content is supported by HtmlFormatProvider.

## See Also

- [HtmlFormatProvider Documentation](https://docs.telerik.com/devtools/document-processing/libraries/radwordsprocessing/formats-and-conversion/html/htmlformatprovider)
- [DocxFormatProvider Documentation](https://docs.telerik.com/devtools/document-processing/libraries/radwordsprocessing/formats-and-conversion/word-file-formats/docx/docxformatprovider)
- [Mail Merge Documentation](https://docs.telerik.com/devtools/document-processing/libraries/radwordsprocessing/editing/mail-merge)
- [Replace Text with Document Elements](https://docs.telerik.com/devtools/document-processing/libraries/radwordsprocessing/editing/find-and-replace/replace-document-elements)
