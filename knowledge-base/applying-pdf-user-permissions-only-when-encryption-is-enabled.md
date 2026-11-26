---
title: Applying PDF User Permissions Only When Encryption Is Enabled
description: Learn how to restrict printing, changes, and copying in exported PDFs by enabling encryption and configuring RadPdfProcessing user access permissions.
type: how-to
page_title: Applying User Permissions to Encrypted PDFs | RadPdfProcessing
slug: pdfprocessing-applying-user-permissions-only-when-encryption-is-enabled
tags: radpdfprocessing, pdf, encryption, user, permissions, export, fixed
res_type: kb
---

## Environment

| Version | Product | Author |
| --- | --- | --- |
| 2026.3.1027 | RadPdfProcessing | <a href="https://www.telerik.com/blogs/author/yoan-karamanov" target="_blank">Yoan Karamanov</a> |

## Description

`UserAccessPermissions` controls operations allowed when a reader opens an encrypted PDF with user access. Set `PdfExportSettings.IsEncrypted` to `true`; otherwise, the permissions do not apply.

This knowledge base article also answers the following questions:

* Why do `UserAccessPermissions` have no effect when `IsEncrypted` is `false`?
* How do I allow text access for assistive technologies without standard copying?
* Which password controls user permissions in an encrypted PDF?

## Solution

Configure encryption and the permission values before you export. The following example blocks printing and document changes while allowing text access for assistive technologies.

Follow these steps:

1. Create a `PdfFormatProvider` and set `ComplianceLevel` to `None`.
2. Set `IsEncrypted` to `true`, then configure the user and owner passwords.
3. Set the `Printing`, `Changing`, and `Copying` permissions.
4. Export the document.

```csharp
using System;
using System.IO;
using Telerik.Documents.Fixed.FormatProviders.Pdf;
using Telerik.Documents.Fixed.FormatProviders.Pdf.Export;
using Telerik.Documents.Fixed.FormatProviders.Pdf.Model.Encryption;
using Telerik.Documents.Fixed.Model;

class Program
{
    static void Main()
    {
        Telerik.Documents.Fixed.Model.RadFixedDocument document =
            new Telerik.Documents.Fixed.Model.RadFixedDocument();
        document.Pages.AddPage();

        Telerik.Documents.Fixed.FormatProviders.Pdf.PdfFormatProvider provider =
            new Telerik.Documents.Fixed.FormatProviders.Pdf.PdfFormatProvider();
        provider.ExportSettings.ComplianceLevel = PdfComplianceLevel.None;
        provider.ExportSettings.IsEncrypted = true;
        provider.ExportSettings.UserPassword = "user-password";
        provider.ExportSettings.OwnerPassword = "owner-password";
        provider.ExportSettings.UserAccessPermissions =
            new UserAccessPermissions
            {
                Printing = PrintingPermissionType.None,
                Changing = ChangingPermissionType.None,
                Copying = CopyingPermissionType.TextAccess
            };

        using (Stream output = File.OpenWrite("encrypted-output.pdf"))
        {
            provider.Export(document, output, TimeSpan.FromSeconds(10));
        }
    }
}
```

Replace the sample passwords with values from secure application settings. Use separate user and owner passwords when they need different access levels.

>important The permission values apply when you open the PDF with user access. The owner password grants owner access.

### Key Points

Choose permission values based on the access you want to grant:

* `PrintingPermissionType.None` blocks printing. Use `PrintingPermissionType.LowResolution` or `PrintingPermissionType.HighResolution` to allow printing at the selected level.
* `ChangingPermissionType.None` blocks document changes. Other values allow specific actions, such as form filling or document assembly.
* `CopyingPermissionType.TextAccess` allows text access for assistive technologies without enabling standard content copying.
* The exporter skips encryption when `ComplianceLevel` is not `None`. Set `ComplianceLevel` to `None` to apply these permissions; encryption does not apply to PDF/A or PDF/UA output.

## See Also

* [PDF Export Encryption and Access Permissions]({%slug radpdfprocessing-formats-and-conversion-pdf-settings%}#available-useraccesspermissions)
* [Removing Encryption from a PDF]({%slug remove-password-from-pdf-telerik-pdfprocessing%})
