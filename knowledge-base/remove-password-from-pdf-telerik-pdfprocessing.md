---
title: Removing Password from a PDF Using Telerik PdfProcessing
description: Learn how to use Telerik PdfProcessing to remove a password from a PDF file by importing a password-protected PDF and exporting it without encryption.
type: how-to
page_title: How to Remove Password from a PDF Using Telerik PdfProcessing
meta_title: How to Remove Password from a PDF Using Telerik PdfProcessing
slug: remove-password-from-pdf-telerik-pdfprocessing
tags: pdfprocessing,telerik document processing,password,remove password,exportsettings,isencrypted
res_type: kb
ticketid: 1715470
---

## Environment

<table>
<tbody>
<tr>
<td>Product</td>
<td>Telerik Document Processing PdfProcessing</td>
</tr>
<tr>
<td>Version</td>
<td>2026.2.519</td>
</tr>
</tbody>
</table>

## Description

I want to remove the password from a PDF file using Telerik PdfProcessing. The file is currently password-protected, but I need to save it as a new document without any password or encryption.

This knowledge base article also answers the following questions:
- How to open a password-protected PDF and save it without a password?
- How to remove password protection from a PDF using Telerik PdfProcessing?
- How to create a non-encrypted PDF from a password-protected file?

## Solution

To remove a password from a PDF using Telerik PdfProcessing, import the password-protected PDF by providing the password, and then export it without encryption or passwords.

1. Use the `PdfFormatProvider`'s `ImportSettings` to supply the password for the protected PDF.
2. Handle the `UserPasswordNeeded` or `OwnerPasswordNeeded` event to provide the password when required.
3. Import the document.
4. When exporting, ensure that the `ExportSettings.IsEncrypted` property is set to `false` (default) and do not set values for `UserPassword` or `OwnerPassword`. This will export the document without password protection.

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

- [PdfFormatProvider Export Settings](https://www.telerik.com/document-processing-libraries/documentation/libraries/radpdfprocessing/formats-and-conversion/pdf/pdfformatprovider/settings#export-settings)
- [PdfFormatProvider Overview](https://www.telerik.com/document-processing-libraries/documentation/libraries/radpdfprocessing/formats-and-conversion/pdf/pdfformatprovider/overview)
