---
title: Extracting Text from PDF Documents
description: Learn how to extract the text from a PDF document using RadPdfProcessing from the Telerik Document Processing libraries.
type: how-to
page_title: How to Extract the Text from PDF documents 
slug: extract-text-from-pdf
tags: radpdfprocessing, pdf, text, extraction, content, document, processing, fixed
res_type: kb
ticketid: 1657503
---

## Environment

| Version | Product | Author | 
| ---- | ---- | ---- | 
| Q1 2025 | RadPdfProcessing |[Desislava Yordanova](https://www.telerik.com/blogs/author/desislava-yordanova)| 

## Description

Learn how to extract the text content from a PDF document.

## Solution

Follow these steps:

1. Import the PDF document with the [`PdfFormatProvider`]({%slug radpdfprocessing-formats-and-conversion-pdf-pdfformatprovider%}).

2. Export the `RadFixedDocument` content to text with the [`TextFormatProvider`]({%slug radpdfprocessing-formats-and-conversion-plain-text-textformatprovider%}). If the PDF document contains text fragments, the provider exports them to a plain text result.

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

>important The `TextFormatProvider` may not cover all scenarios depending on the internal document content. A common case is a document with scanned images that contain text information. In this case, the above approach does not parse the content to plain text because the text is represented as [`Path`]({%slug radpdfprocessing-model-path%}) elements. Use the [`OcrFormatProvider`]({%slug radpdfprocessing-formats-and-conversion-ocr-ocrformatprovider%}) to convert images of typed, handwritten, or printed text into machine-encoded text from a scanned document.

## See Also

* [RadPdfProcessing]({%slug radpdfprocessing-overview%})
* [OcrFormatProvider]({%slug radpdfprocessing-formats-and-conversion-ocr-ocrformatprovider%})
* [TextFormatProvider]({%slug radpdfprocessing-formats-and-conversion-plain-text-textformatprovider%}) 
* [Summarizing the Text Content of PDF Documents using Text Analytics with Azure AI services]({%slug summarize-pdf-content%})

