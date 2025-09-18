---
title: Simulating Mail Merge with formatted HTML content by Utilizing the Find and Replace Functionality
description: Learn how to simulate Mail Merge with formatted HTML content using Telerik Document Processing Library.
type: how-to
page_title: Simulating Mail Merge with formatted HTML content by Utilizing the Find and Replace Functionality
meta_title: Simulating Mail Merge with formatted HTML content by Utilizing the Find and Replace Functionality
slug: simulating-mail-merge-with-html-content
tags: words, processing, telerik, document, mail, merge, html, content, find, replace
res_type: kb
ticketid: 1694621
---

## Environment

| Version | Product | Author | 
| ---- | ---- | ---- | 
| 2025.2.520| RadWordProcessing |[Desislava Yordanova](https://www.telerik.com/blogs/author/desislava-yordanova)| 

## Description

This article demonstrates a sample approach how to simulate [mail merge]({%slug radwordsprocessing-editing-mail-merge%}), where formatted HTML content needs to replace placeholders in a DOCX template. When performing a mail merge, the WordProcessing library binds plain HTML text, instead of rendering the HTML with its original formatting.

## Solution

To successfully insert the formatted HTML content, you can use the [Find-and-Replace]({%slug radwordsprocessing-editing-find-and-replace%}) functionality instead. Replace placeholders with the styled HTML content using the following steps:

1. Import the HTML content using [HtmlFormatProvider]({%slug radwordsprocessing-formats-and-conversion-html-htmlformatprovider%}).
2. Import the DOCX template using [DocxFormatProvider]({%slug radwordsprocessing-formats-and-conversion-docx-docxformatprovider%}).
3. Find placeholders in the template and replace them with the imported HTML content.

![Replace Placeholders with HTML content in DOCX template ><](images/simulating-mail-merge-with-html-content.png) 

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
- Ensure the provided HTML content is [supported]({%slug radwordsprocessing-formats-and-conversion-html-supported-elements%}) by HtmlFormatProvider.

## See Also

- [HtmlFormatProvider]({%slug radwordsprocessing-formats-and-conversion-html-htmlformatprovider%})
- [DocxFormatProvider]({%slug radwordsprocessing-formats-and-conversion-docx-docxformatprovider%})
- [Mail Merge Documentation]({%slug radwordsprocessing-editing-mail-merge%})
- [Find-and-Replace]({%slug radwordsprocessing-editing-find-and-replace%}) 
