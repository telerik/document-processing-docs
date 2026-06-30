---
title: Getting Started with Digital Signature
description: Learn how to add, configure, and validate digital signatures in PDF documents with RadPdfProcessing by using certificates, widgets, and signature settings.
page_title: Digital Signatures in RadPdfProcessing Getting Started
slug: radpdfprocessing-features-digital-signature-getting-started
tags: digital, signature, pdf, signing, certificates, radpdfprocessing, x509, validation, started
position: 1
---

# Getting Started with Digital Signature

Use `RadPdfProcessing` to add a digital signature to a PDF document that you create in code or import from an existing file. This article explains the required setup, the signing workflow, the available signature settings, and the checks to run after export.

>important To use digital signatures in `RadPdfProcessing` for **.NET Standard** or **.NET**, add a reference to the `System.Security.Cryptography.Pkcs` NuGet package, version 6 or later. This requirement applies starting with R1 2022 SP1.

>note [PdfProcessing Digitally Sign Document Demo](https://demos.telerik.com/document-processing/pdfprocessing/digitally_sign_document)

## What You Need Before You Sign a PDF

Before you sign a document, make sure you have the required inputs and document objects:

1. Prepare an [X509Certificate2](https://learn.microsoft.com/dotnet/api/system.security.cryptography.x509certificates.x509certificate2) instance that contains the private key used for signing.
2. Decide whether you will sign a newly created document or an imported [RadFixedDocument]({%slug radpdfprocessing-model-radfixeddocument%}).
3. Choose whether the signature will be visible or invisible in the document.
4. Prepare a stream that supports both reading and writing for the export operation.

## Signing a Document

Use this workflow to sign a PDF document:

1. Create a `Signature` instance and pass the certificate to its constructor.
2. Add the signature to a [SignatureField]({%slug radpdfprocessing-model-interactive-forms-form-fields-signaturefield%}) in the document form.
3. If you need a visible signature, create a [SignatureWidget]({%slug radpdfprocessing-model-annotations-widgets%}) and associate it with the `SignatureField`.
4. Assign a [FormSource]({%slug radpdfprocessing-model-formsource-overview%}) to the widget `Content.NormalContentSource` property.
5. Use `FixedContentEditor` to draw the visual content that will appear in the signature area.
6. Export the document to a readable and writable stream.

>caution When you export a digitally signed document, pass a stream that supports both reading and writing. Otherwise, `RadPdfProcessing` throws `NotSupportedException` with the message `Stream does not support reading.`

The following example signs a newly created document:

### Example: Sign a document

<snippet id='libraries-pdf-features-digital-signature-getting-started-sign-document'/>

>important In **.NET Standard**, use `Telerik.Documents.Primitives.Rect` instead of `System.Windows.Rect`.

![A PDF document with a visible digital signature field applied](images/radpdfprocessing-features-digital-signature.png)

## Signing an Existing PDF Document

When you sign an imported document, verify the form settings before export. Set the `AcroForm.ViewersShouldRecalculateWidgetAppearances` property to `false` so PDF viewers preserve the signed appearance. If this property remains `true`, the exported file may open without showing the document as signed.

## Signature Settings

Use `SignatureSettings`, available through `Signature.Settings`, to control how `RadPdfProcessing` produces the digital signature. The class, introduced in Q4 2025, lets you choose the digest algorithm, configure timestamping, and decide how much certificate chain information to embed.

| Property | Description |
|---|---|
| `DigestAlgorithm` | Gets or sets the digest (hash) algorithm used when producing the CMS (PKCS#7) signature. Default is `DigestAlgorithmType.Sha256`. Supported values: `Sha256` (recommended default), `Sha384` (for higher strength or P-384 key policy), `Sha512` (highest SHA-2 strength or long-term archival). |
| `TimeStampServer` | Gets or sets the [timestamp server]({%slug pdf-sign-timestamp-server%}) settings used to obtain a trusted timestamp for the signature. |
| `CertificateChainIncludeOption` | Gets or sets the option that determines which certificates are included in the certificate chain. Available values: `None` (no chain info), `ExcludeRoot` (entire chain except root), `EndCertOnly` (only the end certificate), `WholeChain` (entire chain). [Introduced in Q1 2026] |

Choose `Sha256` for most scenarios. Move to `Sha384` or `Sha512` only when your security policy, certificate type, or archival requirements call for a stronger hash.

## Signature Encodings

`RadPdfProcessing` can sign and validate signature fields by using these standard encodings:

* `adbe.x509.rsa_sha1` (PKCS #1)
* `adbe.pkcs7.sha1` (PKCS #7)
* `adbe.pkcs7.detached` (PKCS #7 Detached)

## Signature Flags

Use signature flags to declare whether the document contains signature fields and whether later saves can invalidate existing signatures.

The signature flags were introduced in R2 2022 SP1. The following example shows how to apply them:

### Example: Set signature flags

<snippet id='libraries-pdf-features-digital-signature-getting-started-flags'/>

Use these values:

| Value | Description |
|---|---|
| `None` | Indicates no signature fields exist. |
| `SignaturesExist` | If set, the document contains at least one signature field. This flag allows a viewer to enable signature-related UI (such as menu items or buttons) without scanning the entire document. |
| `AppendOnly` | The document contains signatures that may be invalidated if the file is saved in a way that alters its previous contents. Viewer applications can use this flag to warn users that saving will invalidate signatures. |

## How to Validate the Signed PDF

After you export the document, validate the result in a PDF viewer and in your application workflow:

1. Open the exported PDF in a viewer that supports digital signature inspection.
2. Confirm that the signature panel shows the document as signed.
3. If you created a visible signature, verify that the widget appearance renders as expected.
4. Inspect the certificate information, timestamp, and chain details when your workflow requires trust validation.
5. If you sign an imported file, confirm that the original content remains unchanged apart from the signature update.

## Troubleshooting Common Signing Issues

Use these checks when the exported document does not appear signed or the signing process fails:

* Verify that the certificate includes a private key and is valid for digital signing.
* Verify that the export stream supports both reading and writing.
* Verify that `AcroForm.ViewersShouldRecalculateWidgetAppearances` is set to `false` for imported documents.
* Verify that the `System.Security.Cryptography.Pkcs` package is referenced when you target **.NET Standard** or **.NET**.
* Verify that the PDF viewer you use supports digital signature validation and widget appearance rendering.

## See Also

* [Form]({%slug radpdfprocessing-model-form%})
* [Form Fields]({%slug radpdfprocessing-model-interactive-forms-form-fields%})
* [AcroForm]({%slug radpdfprocessing-model-interactive-forms-acroform%})
* [SignatureField]({%slug radpdfprocessing-model-interactive-forms-form-fields-signaturefield%})
* [Signing a document with a digital signature]({%slug signing-a-document-with-digital-signature%})
* [Widgets Types]({%slug radpdfprocessing-model-annotations-widgets%})
* [How to Create Invisible Signatures for PDF Documents]({%slug pdf-invisible-signatures%})
* [Signing a PDF Document with a SignatureWidget]({%slug sign-pdf-with-signature-widget%})
* [Verifying If Digital Signatures Exist in PDF Documents]({%slug verify-digital-signatures-radpdfprocessing%})
* [Signing an Unsigned PDF Document that Contains a Digital Signature with RadPdfProcessing]({%slug pdfprocessing-sign-an-unsigned-pdf%})
* [Digitally Sign Document](https://demos.telerik.com/document-processing/pdfprocessing/digitally_sign_document)
