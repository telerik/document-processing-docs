---
title: Inserting HTML Content into PDF TableCell with RadPdfProcessing
description: Learn how to insert HTML content into a TableCell in a PDF document using RadPdfProcessing and RadWordsProcessing libraries.
type: how-to
page_title: How to Insert HTML Content into PDF TableCell Using RadPdfProcessing
slug: insert-html-content-into-pdf-tablecell-radpdfprocessing
tags: radpdfprocessing, documentprocessing, pdf, html, tablecell, insert, radwordsprocessing
res_type: kb
ticketid: 1671595
---

## Description
When generating PDF documents, a common requirement is to insert HTML content into specific sections of the document, such as a `TableCell`. This article demonstrates how to achieve this using the RadPdfProcessing and RadWordsProcessing libraries. This knowledge base article also answers the following questions:
- How can I display HTML content in a PDF document?
- What is the approach to convert HTML to PDF content for insertion into a PDF table cell?
- How to use RadWordsProcessing to import HTML content and RadPdfProcessing to insert it into a PDF document?

## Environment

<table>
<tbody>
<tr>
<td>Product</td>
<td>
RadPdfProcessing for Document Processing, <br/>
RadWordsProcessing for Document Processing
</td>
</tr>
</tbody>
</table>

## Solution
To insert HTML content into a `TableCell` in a PDF document, you can use the RadWordsProcessing library to import the HTML content and then either convert it to a PDF document or export it as images to insert into the PDF. Below are the steps and code snippet for achieving this.

1. **Import HTML Content**: Use RadWordsProcessing's `HtmlFormatProvider` to import the HTML content into a `RadFlowDocument`.
2. **Export HTML to PDF or Images**: Use RadWordsProcessing's `PdfFormatProvider` to convert the `RadFlowDocument` into PDF format or export it as images.
3. **Insert PDF or Images into TableCell**: Use RadPdfProcessing to create or edit a PDF document and insert the converted PDF content or images into the desired `TableCell`.

### Inserting HTML Content as PDF

```csharp
// Import HTML as RadFlowDocument
HtmlFormatProvider htmlFormatProvider = new HtmlFormatProvider();
RadFlowDocument htmlDocument = htmlFormatProvider.Import(htmlContent, TimeSpan.FromSeconds(10));

// Export HTML to PDF
Telerik.Windows.Documents.Flow.FormatProviders.Pdf.PdfFormatProvider flowPdfFormatProvider = new Telerik.Windows.Documents.Flow.FormatProviders.Pdf.PdfFormatProvider();
byte[] htmlToPdfByteArray = flowPdfFormatProvider.Export(htmlDocument, TimeSpan.FromSeconds(10));

// Import htmlToPdfByteArray as RadFixedDocument
Telerik.Windows.Documents.Fixed.FormatProviders.Pdf.PdfFormatProvider fixedPdfFormatProvider = new Telerik.Windows.Documents.Fixed.FormatProviders.Pdf.PdfFormatProvider();
RadFixedDocument htmlPdfDocument = fixedPdfFormatProvider.Import(htmlToPdfByteArray, TimeSpan.FromSeconds(10));

// Insert the HTML PDF content into the table cell in the main PDF document
// Refer to the provided code snippet in the support engineer response for detailed implementation
```

### Inserting HTML Content as Images

```csharp
// Export the HTML content as images
Telerik.Documents.Fixed.FormatProviders.Image.Skia.SkiaImageFormatProvider imageProvider = new Telerik.Documents.Fixed.FormatProviders.Image.Skia.SkiaImageFormatProvider();
byte[] resultImage = imageProvider.Export(htmlDocument.Pages.First(), TimeSpan.FromSeconds(10));

// Insert the image into the table cell in the main PDF document
// Refer to the provided code snippet in the support engineer response for detailed implementation
```

## See Also
- [RadPdfProcessing Overview](https://docs.telerik.com/devtools/document-processing/libraries/radpdfprocessing/overview)
- [RadWordsProcessing Overview](https://docs.telerik.com/devtools/document-processing/libraries/radwordsprocessing/overview)
- [Importing HTML Content with RadWordsProcessing](https://docs.telerik.com/devtools/document-processing/libraries/radwordsprocessing/formats-and-conversion/html/htmlformatprovider)
- [Converting Documents to Images with RadPdfProcessing](https://docs.telerik.com/devtools/document-processing/libraries/radpdfprocessing/formats-and-conversion/convert-to-image/using-image-format-provider)
- [Generate Table with Images using RadPdfProcessing](https://docs.telerik.com/devtools/document-processing/knowledge-base/generate-table-with-images-pdf-processing)
