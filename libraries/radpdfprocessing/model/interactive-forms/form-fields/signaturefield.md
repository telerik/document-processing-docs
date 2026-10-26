---
title: SignatureField 
description: Learn about the SignatureField class in RadPdfProcessing, which represents a digital signature placeholder in interactive PDF forms.
page_title: SignatureField 
slug: radpdfprocessing-model-interactive-forms-form-fields-signaturefield
tags: signaturefield, pdf, form, fields, radpdfprocessing, digital, signature, acroform, interactive, model
components: [pdfprocessing]
---

# SignatureField

The `SignatureField` class corresponds to `FormFieldType.Signature` and stores digital signature data. Use it to sign PDF documents or validate existing signatures.

>important To use the signing functionality in RadPdfProcessing for .NET Standard/.NET Core, you must add a reference to the `System.Security.Cryptography.Pkcs` NuGet package, version {{site.cryptographypkcs}} or later. This functionality is available starting with R1 2022 SP1.

## Properties

The `SignatureField` class provides the following properties:

| Property | Description |
|---|---|
| `Signature` | Gets or sets the `Signature` value. Setting this property signs the document during export. Signing with multiple signatures is not supported. To validate a signature, use the `Validate()` and `TryValidate()` methods. Validation requires that the source stream is open and is performed against the document state at import time. See [Digital Signature]({%slug radpdfprocessing-features-digital-signature%}) for more details. |
| `LockSettings` | Gets the `SignatureFieldLock` settings that control which form fields become read-only after this signature field is signed. Returns `null` when no lock settings exist. |
| `Widgets` | The collection of Widget annotations representing the field on the PDF pages. Widgets can be added using `AddWidget()` and removed using `Remove()`. Implements `IEnumerable`. |

**Create a SignatureField and Add It to a Page**

<snippet id='pdf-signature-field'/>

## Locking Fields After Signing

Before you sign, configure the lock on `SignatureField`, not `Signature.Settings`. Each method replaces the previous configuration with the corresponding `SignatureFieldLockAction`:

| Method | Action | Result after signing |
|---|---|---|
| `LockAllFields()` | `All` | Locks every form field in the document. |
| `LockFields(IEnumerable<string> fieldNames)` | `Include` | Locks only the named fields. An empty sequence locks no fields. |
| `LockAllFieldsExcept(IEnumerable<string> fieldNames)` | `Exclude` | Locks every form field except the named fields. An empty sequence locks all fields. |

Use case-sensitive `FormField.Name` values. Both list-based methods copy the names, so later input changes have no effect. A `null` collection or field name throws `ArgumentNullException`.

This example configures the approval signature to lock customer details and leave `ReviewerComment` unaffected:

```csharp
Telerik.Documents.Fixed.Model.RadFixedDocument document =
    new Telerik.Documents.Fixed.Model.RadFixedDocument();
document.Pages.AddPage();

document.AcroForm.FormFields.AddTextBox("CustomerName");
document.AcroForm.FormFields.AddTextBox("CustomerEmail");
document.AcroForm.FormFields.AddTextBox("ReviewerComment");

Telerik.Documents.Fixed.Model.InteractiveForms.SignatureField signatureField =
    document.AcroForm.FormFields.AddSignature("Approval");
signatureField.LockFields(new[] { "CustomerName", "CustomerEmail" });
```

Alternatively, use `signatureField.LockAllFields()` or `signatureField.LockAllFieldsExcept(new[] { "ReviewerComment" })`. To sign during export, assign a `Signature` and follow the [PDF signing workflow]({%slug radpdfprocessing-features-digital-signature-getting-started%}).

>important `LockAllFields()` also locks other signature fields. For a workflow with later signatures, exclude those signature fields or lock only the fields that must become read-only.

## Inspecting and Preserving Lock Settings

Inspect `SignatureField.LockSettings` through `SignatureFieldLock.Action` and the read-only `Fields` list. Change the configuration only through the lock methods.

**RadPdfProcessing** preserves signature-field lock settings when you import, export, or clone a document. An unsigned field can carry these settings for a later signature in RadPdfProcessing or another PDF application.

When RadPdfProcessing signs the field, it writes a *FieldMDP transform*, a PDF signature rule that identifies the locked fields. It marks those fields as read-only in the output, not immediately in memory. Full-document export leaves source fields unchanged.

Locks support certificate-based and external signatures with full-document export or [`PdfStreamSigner.SignDocument`]({%slug radpdfprocessing-features-digital-signature-pdfstreamsigner%}). Use [`PdfStreamSigner.SignExistingField`]({%slug radpdfprocessing-features-signing-existing-signature-fields%}) for lock settings already stored in the PDF.

>important Preserved lock settings do not guarantee that existing signatures remain valid after a full import and export. Use incremental signing to preserve earlier signatures.

## See Also

* [FormField]({%slug radpdfprocessing-model-interactive-forms-form-fields%})
* [PDF Annotation Widgets]({%slug radpdfprocessing-model-annotations-widgets%})
* [Digital Signature Workflows]({%slug radpdfprocessing-features-digital-signature%})
* [Incremental Signing of Existing Fields]({%slug radpdfprocessing-features-signing-existing-signature-fields%})
* [Signature API Reference](https://docs.telerik.com/devtools/document-processing/api/Telerik.Windows.Documents.Fixed.Model.DigitalSignatures.Signature.html)
