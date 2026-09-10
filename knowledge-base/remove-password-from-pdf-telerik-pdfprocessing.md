---
title: Removing Password from a PDF Using Telerik PdfProcessing
description: Learn how to use Telerik PdfProcessing to remove a password from a PDF file by importing a password-protected PDF and exporting it without encryption.
type: how-to
page_title: How to Remove Password from a PDF Using Telerik PdfProcessing
meta_title: How to Remove Password from a PDF Using Telerik PdfProcessing
slug: remove-password-from-pdf-telerik-pdfprocessing
tags: pdf,pdfprocessing,password,encryption,import,export
res_type: kb
ticketid: 1715470
---

## Environment

| Version | Product | Author |
| --- | --- | --- |
| 2026.2.519 | [RadPdfProcessing]({%slug radpdfprocessing-overview%}) | [Yoan Karamanov](https://www.telerik.com/blogs/author/yoan-karamanov) |

## Description

Use [RadPdfProcessing]({%slug radpdfprocessing-overview%}) to open a password-protected PDF file and save it again as a new document without password protection or encryption.

This knowledge base article also answers the following questions:
- How to open a password-protected PDF and save it without a password?
- How to remove password protection from a PDF using Telerik PdfProcessing?
- How to create a non-encrypted PDF from a password-protected file?

## Solution

To remove a password from a PDF using [PdfFormatProvider]({%slug radpdfprocessing-formats-and-conversion-pdf-pdfformatprovider%}), import the password-protected document with [PdfImportSettings]({%slug radpdfprocessing-formats-and-conversion-pdf-settings%}#import-settings), then export it with [PdfExportSettings]({%slug radpdfprocessing-formats-and-conversion-pdf-settings%}#export-settings) without encryption.

1. Use the [ImportSettings]({%slug radpdfprocessing-formats-and-conversion-pdf-settings%}#import-settings) property of [PdfFormatProvider]({%slug radpdfprocessing-formats-and-conversion-pdf-pdfformatprovider%}) to supply the password for the protected PDF.
2. Handle the [UserPasswordNeeded]({%slug radpdfprocessing-formats-and-conversion-pdf-settings%}#import-settings) or [OwnerPasswordNeeded]({%slug radpdfprocessing-formats-and-conversion-pdf-settings%}#import-settings) event to provide the password when required.
3. Import the document into a [RadFixedDocument]({%slug radpdfprocessing-model-radfixeddocument%}).
4. When exporting, keep [ExportSettings]({%slug radpdfprocessing-formats-and-conversion-pdf-settings%}#export-settings) configured so that [IsEncrypted]({%slug radpdfprocessing-formats-and-conversion-pdf-settings%}#export-settings) is `false` and leave [UserPassword]({%slug radpdfprocessing-formats-and-conversion-pdf-settings%}#export-settings) and [OwnerPassword]({%slug radpdfprocessing-formats-and-conversion-pdf-settings%}#export-settings) unset.

The following example demonstrates this process:

```csharp
using Telerik.Windows.Documents.Fixed.FormatProviders.Pdf;
using Telerik.Windows.Documents.Fixed.FormatProviders.Pdf.Import;
using Telerik.Windows.Documents.Fixed.Model;
using System.IO;

// Create PdfFormatProvider and configure import settings
PdfFormatProvider provider = new PdfFormatProvider();
PdfImportSettings settings = new PdfImportSettings();
bool isPasswordProtected = false;

// Handle UserPasswordNeeded event
settings.UserPasswordNeeded += (s, a) =>
{
    isPasswordProtected = true;
    a.Password = "YourPasswordHere"; // Supply the user password
};

// Handle OwnerPasswordNeeded event
settings.OwnerPasswordNeeded += (s, a) =>
{
    isPasswordProtected = true;
    a.Password = "OwnerPasswordHere"; // Supply the owner password
};

provider.ImportSettings = settings;

// Import the password-protected PDF
RadFixedDocument document;
using (Stream stream = File.OpenRead("input.pdf"))
{
    document = provider.Import(stream);
    // Document is loaded if the password is correct
}

// Configure export settings
provider.ExportSettings.IsEncrypted = false; // Ensure no encryption

// Export the document to a new PDF file
string pdfOutputPath = "output.pdf";
File.Delete(pdfOutputPath);
using (Stream output = File.OpenWrite(pdfOutputPath))
{
    provider.Export(document, output);
}
```

## See Also

* [PdfFormatProvider Export Settings](https://www.telerik.com/document-processing-libraries/documentation/libraries/radpdfprocessing/formats-and-conversion/pdf/pdfformatprovider/settings#export-settings)
* [PdfFormatProvider Overview](https://www.telerik.com/document-processing-libraries/documentation/libraries/radpdfprocessing/formats-and-conversion/pdf/pdfformatprovider/overview)
