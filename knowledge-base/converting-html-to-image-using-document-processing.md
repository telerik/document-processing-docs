---
title: Converting HTML to Image Using Telerik Document Processing
description: Learn how to convert HTML content to an image (JPEG or PNG) using Telerik Document Processing libraries.
type: how-to
page_title: How to Convert HTML to Image Using Telerik Document Processing Libraries
meta_title: How to Convert HTML to Image Using Telerik Document Processing Libraries
slug: converting-html-to-image-using-document-processing
tags: pdf,processing, word, flow,document, pdf, image, skia, html
res_type: kb
ticketid: 1675204
---

## Environment

| Version | Product | Author | 
| ---- | ---- | ---- | 
| 2025.4.1104|RadWordsProcessing|[Desislava Yordanova](https://www.telerik.com/blogs/author/desislava-yordanova)| 

## Description

This knowledge base article shows how to convert a string with HTML content to an image (JPEG or PNG) in a Blazor WASM application running on .NET 8 (or newer).

## Solution

To convert HTML content into an image, use the Telerik Document Processing libraries. This process requires converting the HTML to PDF first, then exporting the PDF pages to images. Follow these steps:

1. Import the HTML content as a [RadFlowDocument]({%slug radwordsprocessing-model-radflowdocument%}) using the [HtmlFormatProvider]({%slug radwordsprocessing-formats-and-conversion-html-htmlformatprovider%}) from the [WordsProcessing]({%slug radwordsprocessing-overview%}) library.
2. Export the RadFlowDocument to a PDF byte array using the [Flow PdfFormatProvider]({%slug radwordsprocessing-formats-and-conversion-pdf-pdfformatprovider%}).
3. Import the PDF byte array as a [RadFixedDocument]({%slug radpdfprocessing-model-radfixeddocument%}) with the [Fixed PdfFormatProvider]({%slug radpdfprocessing-formats-and-conversion-pdf-pdfformatprovider%}) from the [PdfProcessing]({%slug radpdfprocessing-overview%}) library.
4. Export each page of the RadFixedDocument to an image using the [SkiaImageFormatProvider]({%slug radpdfprocessing-formats-and-conversion-image-using-skiaimageformatprovider%}) (available in .NET Standard).

### Code Example

```csharp
RadFlowDocument htmlDocument;
HtmlFormatProvider htmlFormatProvider = new HtmlFormatProvider();

string htmlString = @"<!DOCTYPE html>
<html>
<body>
<p>I am normal</p>
<p style=""color:red;"">I am red</p>
<p style=""color:blue;"">I am blue</p>
<p style=""font-size:50px;"">I am big</p>
</body>
</html>";

htmlDocument = htmlFormatProvider.Import(htmlString, TimeSpan.FromSeconds(10));

var flowPdfFormatProvider = new Telerik.Windows.Documents.Flow.FormatProviders.Pdf.PdfFormatProvider();
var htmlToPdfArray = flowPdfFormatProvider.Export(htmlDocument, TimeSpan.FromSeconds(10));

var fixedPdfFormatProvider = new Telerik.Windows.Documents.Fixed.FormatProviders.Pdf.PdfFormatProvider();
RadFixedDocument pdfHtml = fixedPdfFormatProvider.Import(htmlToPdfArray, TimeSpan.FromSeconds(10));

SkiaImageFormatProvider imageProvider = new SkiaImageFormatProvider();

int count = 1;
foreach (RadFixedPage page in pdfHtml.Pages)
{
    byte[] resultImage = imageProvider.Export(page, TimeSpan.FromSeconds(10));
    File.WriteAllBytes(@"C:\Temp\Page " + count++ + ".png", resultImage);
}
```

For .NET Framework, consider these articles for image export:
- [PDF to Image - WPF]({%slug export-radfixedpage-to-image%})
- [PDF to Image - WinForms](https://docs.telerik.com/devtools/winforms/knowledge-base/pdfviewer-export-page-images-with-no-ui)
- [ThumbnailFactory - WPF](https://docs.telerik.com/devtools/wpf/controls/radpdfviewer/features/export-fixedpage-to-image)

## See Also

- [HtmlFormatProvider]({%slug radwordsprocessing-formats-and-conversion-html-htmlformatprovider%})
- [SkiaImageFormatProvider]({%slug radpdfprocessing-formats-and-conversion-image-using-skiaimageformatprovider%})
