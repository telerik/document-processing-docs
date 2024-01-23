---
title: Resolving Compiler Ambiguous Reference Error CS0104 with PdfFormatProvider 
description: Learn how to resolve the ambiguous reference error (Compiler Error CS0104) when using PdfFormatProvider.
type: troubleshooting
page_title: Compiler Error CS0104 with PdfFormatProvider
slug: cs0104-error-pdf-format-provider-winforms
tags: troubleshooting, PdfFormatProvider, Compiler Error, CS0104,  ambiguous, reference
res_type: kb

---

## Environment

| Version | Product | Author |
| --- | --- | ---- |
| 2023.3.1106 | RadPdfProcessing |[Desislava Yordanova](https://www.telerik.com/blogs/author/desislava-yordanova)|

## Description
When using the **PdfFormatProvider** in your project, you may encounter one of the following [Compiler Error CS0104](https://learn.microsoft.com/en-us/dotnet/csharp/misc/cs0104?f1url=%3FappId%3Droslyn%26k%3Dk(CS0104)) messages during the application build:

- **'PdfFormatProvider' is an ambiguous reference between 'Telerik.Windows.Documents.Fixed.FormatProviders.Pdf.PdfFormatProvider' and 'Telerik.Windows.Documents.Flow.FormatProviders.Pdf.PdfFormatProvider'**

- **'PdfFormatProvider' is an ambiguous reference between 'Telerik.Windows.Documents.Fixed.FormatProviders.Pdf.PdfFormatProvider' and 'Telerik.Windows.Documents.Spreadsheet.FormatProviders.Pdf.PdfFormatProvider'**

Usually, such an error may occur when the following **using** statements are imported:

```csharp
using Telerik.Windows.Documents.Fixed.FormatProviders.Pdf;
using Telerik.Windows.Documents.Flow.FormatProviders.Pdf;
using Telerik.Windows.Documents.Spreadsheet.FormatProviders.Pdf;

PdfFormatProvider provider = PdfFormatProvider();
   ```
## Solution

Telerik Document Processing Libraries offer PdfFormatProvider which makes it easy to import/export a [RadFixedDocument](https://docs.telerik.com/devtools/document-processing/libraries/radpdfprocessing/model/radfixeddocument) from/to PDF format, preserving the entire document structure and formatting. It is available for: 

* [RadWordsProcessing](https://docs.telerik.com/devtools/document-processing/libraries/radwordsprocessing/formats-and-conversion/pdf/pdfformatprovider): The PdfFormatProvider class of RadWordsProcessing is located in the Telerik.Windows.Documents.Flow.FormatProviders.Pdf.

* [RadSpreadProcessing](https://docs.telerik.com/devtools/document-processing/libraries/radspreadprocessing/formats-and-conversion/pdf/pdfformatprovider): The PdfFormatProvider class of RadSpreadProcessing is located in the Telerik.Windows.Documents.Spreadsheet.FormatProviders.Pdf

* [RadPdfProcessing](https://docs.telerik.com/devtools/document-processing/libraries/radpdfprocessing/formats-and-conversion/pdf/pdfformatprovider/pdfformatprovider): The PdfFormatProvider class of RadPdfProcessing is located in the Telerik.Windows.Documents.Fixed.FormatProviders.Pdf namespace.

Explicitly specify the namespace when declaring the **PdfFormatProvider** object based on your specific requirement:
   - If you are working with **RadSpreadProcessing**, use the following namespace:
     ```csharp
     Telerik.Windows.Documents.Spreadsheet.FormatProviders.Pdf.PdfFormatProvider provider = new Telerik.Windows.Documents.Spreadsheet.FormatProviders.Pdf.PdfFormatProvider();
     ```
   - If you are working with **RadWordsProcessing**, use the following namespace:
     ```csharp
     Telerik.Windows.Documents.Flow.FormatProviders.Pdf.PdfFormatProvider provider = new Telerik.Windows.Documents.Flow.FormatProviders.Pdf.PdfFormatProvider();
     ```
   - If you are working with **RadPdfProcessing**, use the following namespace:
     ```csharp
     Telerik.Windows.Documents.Fixed.FormatProviders.Pdf.PdfFormatProvider provider = new Telerik.Windows.Documents.Fixed.FormatProviders.Pdf.PdfFormatProvider();
     ```

By explicitly specifying the namespace, you ensure that the correct `PdfFormatProvider` is used and avoid ambiguous reference errors.

## See Also
* [Using PdfFormatProvider in RadWordsProcessing](https://docs.telerik.com/devtools/document-processing/libraries/radwordsprocessing/formats-and-conversion/pdf/pdfformatprovider) 
* [Using PdfFormatProvider in RadPdfProcessing](https://docs.telerik.com/devtools/document-processing/libraries/radpdfprocessing/formats-and-conversion/pdf/pdfformatprovider/pdfformatprovider)
* [Using PdfFormatProvider in RadSpreadProcessing](https://docs.telerik.com/devtools/document-processing/libraries/radspreadprocessing/formats-and-conversion/pdf/pdfformatprovider) 
