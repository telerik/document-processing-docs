---
title: Extracting Text from PDF Documents
description: Learn how to extract the text from a PDF document using RadPdfProcessing from the Telerik Document Processing libraries.
type: how-to
page_title: How to Extract the Text from PDF documents 
slug: extract-text-from-pdf
tags: pdf, document, processing, text, extract, content 
res_type: kb
ticketid: 1657503
---

## Environment

| Version | Product | Author | 
| ---- | ---- | ---- | 
| Q1 2025 | RadPdfProcessing |[Desislava Yordanova](https://www.telerik.com/blogs/author/desislava-yordanova)| 

## Description

Learn how to extract the text content in a PDF document.

## Solution

Follow the steps:

1\. Import the PDF document using the [PdfFormatProvider]({%slug radpdfprocessing-formats-and-conversion-pdf-pdfformatprovider%}).

2\. Export the RadFixedDocument's content to text using the [TextFormatProvider]({%slug radpdfprocessing-formats-and-conversion-plain-text-textformatprovider%}). Thus, if the PDF document contains text fragments, it will be exported to the plain text result.

```csharp
            string filePath = "input.pdf";
            PdfFormatProvider pdf_provider = new PdfFormatProvider();
            RadFixedDocument fixed_document;
            using (Stream stream = File.OpenRead(filePath))
            {
                fixed_document = pdf_provider.Import(stream);
            }
            Telerik.Windows.Documents.Fixed.FormatProviders.Text.TextFormatProvider provider = new Telerik.Windows.Documents.Fixed.FormatProviders.Text.TextFormatProvider();

            string documentContent = provider.Export(fixed_document);
            Debug.WriteLine(documentContent);
```
>important However, depending on the internal document's content, the **TextFormatProvider** may not be applicable for covering all the cases. A common scenario is a document with scanned images which contain text information. In this case, the above approach wouldn't parse the content to plain text because all the text inside is actually not text but [Path]({%slug radpdfprocessing-model-path%}) elements. Here comes the benefit of using the [OcrFormatProvider]({%slug radpdfprocessing-formats-and-conversion-ocr-ocrformatprovider%}) allowing you to convert images of typed, handwritten, or printed text into machine-encoded text from a scanned document.

## See Also

- [RadPdfProcessing]({%slug radpdfprocessing-overview%})
- [OcrFormatProvider]({%slug radpdfprocessing-formats-and-conversion-ocr-ocrformatprovider%})
- [TextFormatProvider]({%slug radpdfprocessing-formats-and-conversion-plain-text-textformatprovider%}) 
- [Summarizing the Text Content of PDF Documents using Text Analytics with Azure AI services]({%slug summarize-pdf-content%})

