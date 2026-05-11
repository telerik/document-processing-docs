---
title: Signature Validation
description: The digital signature feature enables you to sign and validate a PDF document. 
page_title: Signature Validation
slug: radpdfprocessing-features-digital-signature-validation
tags: signature, validation, pdf, certificates, radpdfprocessing, x509, revocation, chain
position: 4
---

## Validating a Signature

The validation is performed for the current field and, since it strongly depends on the file bytes of the document, against the state of the document at the moment of importing.

The `Signature` class exposes two methods that allow you to validate a signature:

| Method | Description |
|---|---|
| `Validate()` | Accepts a `SignatureValidationProperties` parameter and validates the signature using those properties. Returns a [SignatureValidationResult](https://docs.telerik.com/devtools/document-processing/api/Telerik.Windows.Documents.Fixed.Model.DigitalSignatures.SignatureValidationResult.html). |
| `TryValidate()` | Returns a `bool` indicating whether validation succeeded. The first overload accepts an `out` parameter containing a [SignatureValidationResult](https://docs.telerik.com/devtools/document-processing/api/Telerik.Windows.Documents.Fixed.Model.DigitalSignatures.SignatureValidationResult.html); the second overload also accepts `SignatureValidationProperties`. |

The **SignatureValidationProperties** class exposes the following properties:

| Property | Description |
|---|---|
| `Chain` | Gets or sets the chain used to validate the certificate that signed the digital signature. Of type [X509Chain](https://msdn.microsoft.com/en-us/library/system.security.cryptography.x509certificates.x509chain(v=vs.110).aspx). |
| `ChainStatusFlags` | Gets or sets the chain status flags that describe the used signature certificate as invalid. Of type [X509ChainStatusFlags](https://msdn.microsoft.com/en-us/library/system.security.cryptography.x509certificates.x509chainstatusflags(v=vs.110).aspx). |

>important The validation requires that the stream, from which the document is imported, to be opened. The validation is performed for the current field and against the state of the document at the moment of importing.

>note [PdfProcessing Validate Digital Signature Demo](https://demos.telerik.com/document-processing/pdfprocessing/validate_digital_signature)

The following example shows how the validation can be used:

#### **Example: Validate a field**


<snippet id='pdf-validate-signature'/>

>To evaluate a certificate as trusted, it must be added to the [trusted certificates on your machine](https://docs.microsoft.com/en-us/dotnet/framework/wcf/feature-details/how-to-view-certificates-with-the-mmc-snap-in).



## See Also

* [Form]({%slug radpdfprocessing-model-form%})
* [Form Fields]({%slug radpdfprocessing-model-interactive-forms-form-fields%})
* [AcroForm]({%slug radpdfprocessing-model-interactive-forms-acroform%})
* [SignatureField]({%slug radpdfprocessing-model-interactive-forms-form-fields-signaturefield%})
* [Validate Digital Signature Demo](https://demos.telerik.com/document-processing/pdfprocessing/validate_digital_signature)
