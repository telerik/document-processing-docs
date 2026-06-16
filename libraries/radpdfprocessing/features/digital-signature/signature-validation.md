---
title: Signature Validation
description: Learn how to validate digital signatures in PDF documents using the Signature class methods and SignatureValidationProperties in RadPdfProcessing.
page_title: Signature Validation
slug: radpdfprocessing-features-digital-signature-validation
tags: signature, validation, pdf, certificates, radpdfprocessing, x509, revocation, chain
position: 6
---

# Signature Validation

The validation runs for the current field and checks against the state of the document at the moment of import. Because it depends on the file bytes, the source stream must remain open.

The `Signature` class exposes two methods for validating a signature:

| Method | Description |
|---|---|
| `Validate()` | Accepts a `SignatureValidationProperties` parameter and validates the signature using those properties. Returns a [SignatureValidationResult](https://docs.telerik.com/devtools/document-processing/api/Telerik.Windows.Documents.Fixed.Model.DigitalSignatures.SignatureValidationResult.html). |
| `TryValidate()` | Returns a `bool` indicating whether validation succeeded. The first overload accepts an `out` parameter containing a [SignatureValidationResult](https://docs.telerik.com/devtools/document-processing/api/Telerik.Windows.Documents.Fixed.Model.DigitalSignatures.SignatureValidationResult.html); the second overload also accepts `SignatureValidationProperties`. |

The `SignatureValidationProperties` class exposes the following properties:

| Property | Description |
|---|---|
| `Chain` | Gets or sets the chain used to validate the certificate that signed the digital signature. Of type [X509Chain](https://learn.microsoft.com/en-us/dotnet/api/system.security.cryptography.x509certificates.x509chain). |
| `ChainStatusFlags` | Gets or sets the chain status flags that describe the used signature certificate as not valid. Of type [X509ChainStatusFlags](https://learn.microsoft.com/en-us/dotnet/api/system.security.cryptography.x509certificates.x509chainstatusflags). |

>important The validation requires that the stream from which the document is imported remains open. The validation runs for the current field and checks against the state of the document at the moment of import.

The following example shows how to validate a signature field:

>note [PdfProcessing Validate Digital Signature Demo](https://demos.telerik.com/document-processing/pdfprocessing/validate_digital_signature)

### Example: Validate a Field


<snippet id='pdf-validate-signature'/>

>tip To evaluate a certificate as trusted, add it to the [trusted certificates on your machine](https://learn.microsoft.com/en-us/dotnet/framework/wcf/feature-details/how-to-view-certificates-with-the-mmc-snap-in).



## See Also

* [Form]({%slug radpdfprocessing-model-form%})
* [Form Fields]({%slug radpdfprocessing-model-interactive-forms-form-fields%})
* [AcroForm]({%slug radpdfprocessing-model-interactive-forms-acroform%})
* [SignatureField]({%slug radpdfprocessing-model-interactive-forms-form-fields-signaturefield%})
* [Validate Digital Signature Demo](https://demos.telerik.com/document-processing/pdfprocessing/validate_digital_signature)
