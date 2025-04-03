---
title: Correctly Rendering Non-Breaking Spaces in PDF from HTML with RadWordsProcessing
description: This article demonstrates how to properly handle non-breaking spaces in HTML when converting to PDF using RadWordsProcessing libraries.
type: how-to
page_title: How to Ensure Non-Breaking Spaces Are Rendered Correctly in PDFs Generated from HTML
slug: radwordsprocessing-correctly-render-non-breaking-spaces-in-pdf
tags: radwordsprocessing, documentprocessing, htmlformatprovider, pdf, fontsprovider, nonbreakingspaces
res_type: kb
ticketid: 1683368
---

## Environment

| Version | Product | Author | 
| ---- | ---- | ---- | 
| 2025.1.205| RadWordsProcessing |[Desislava Yordanova](https://www.telerik.com/blogs/author/desislava-yordanova)| 

## Description

When converting HTML content to PDF using RadWordsProcessing, non-breaking spaces (`&nbsp;`) within and surrounding HTML tags are not rendered correctly in the generated PDF document, although they appear as expected in the DOCX output. This issue occurs due to the .NET Standard version of RadWordsProcessing lacking a default mechanism for reading font data, which is required for accurate space rendering in PDFs.

This knowledge base article also answers the following questions:
- How can I ensure non-breaking spaces in HTML are correctly rendered in PDFs using RadWordsProcessing?
- What is the approach to correctly display HTML content in PDFs generated with RadWordsProcessing?
- How to implement a FontsProvider for accurate rendering of non-breaking spaces in PDFs?

## Solution

To resolve the issue of non-breaking spaces not being rendered correctly in PDF documents generated from HTML content, it is necessary to implement a custom `FontsProvider`. This ensures RadPdfProcessing has access to font data for accurately rendering spaces and other font-related features in the PDF output.

1. **Implement a Custom FontsProvider**

   Create a class that extends `FontsProviderBase` and override the `GetFontData` method to provide the necessary font data. This method should return the font data as a byte array for the specified font properties.

    ```csharp
    public class FontsProvider : Telerik.Windows.Documents.Extensibility.FontsProviderBase
    {
        public override byte[] GetFontData(Telerik.Windows.Documents.Core.Fonts.FontProperties fontProperties)
        {
            // Implementation details...
            return null; // Replace with actual font data retrieval logic.
        }
    }
    ```

2. **Set the Custom FontsProvider to the FixedExtensibilityManager**

   Before generating the PDF document, assign an instance of the custom `FontsProvider` to the `FontsProvider` property of `FixedExtensibilityManager`.

    ```csharp
    Telerik.Windows.Documents.Extensibility.FontsProviderBase fontsProvider = new FontsProvider();
    Telerik.Windows.Documents.Extensibility.FixedExtensibilityManager.FontsProvider = fontsProvider;
    ```

3. **Generate PDF Document from HTML Content**

   Utilize the `HtmlFormatProvider` to import HTML content and convert it to a `RadFlowDocument`. Then, use the `PdfFormatProvider` to export the document to PDF, ensuring non-breaking spaces and other font-related elements are rendered correctly.

    ```csharp
    // Example method implementation for converting HTML to PDF
    public static byte[] CreateDocumentFromHtml(string html, bool pdf = false)
    {
        // Conversion logic...
    }
    ```

For a detailed guide on implementing a `FontsProvider`, refer to the [How to implement a FontsProvider](https://docs.telerik.com/devtools/document-processing/knowledge-base/pdfprocessing-implement-fontsprovider) article. This implementation ensures that non-breaking spaces and other font-related elements are accurately rendered in PDF documents generated from HTML content using RadWordsProcessing.

## See Also

- [Distribute Telerik Document Processing Libraries for .NET Versions](https://docs.telerik.com/devtools/document-processing/knowledge-base/distribute-telerik-document-processing-libraries-net-versions)
- [RadWordsProcessing Documentation](https://docs.telerik.com/devtools/document-processing/libraries/radwordsprocessing/overview)
- [How to Implement a FontsProvider for RadPdfProcessing](https://docs.telerik.com/devtools/document-processing/knowledge-base/pdfprocessing-implement-fontsprovider)
