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

The `SignatureSubFilterNames` class defines constants for the supported PDF signature subfilters. RadPdfProcessing registers a validation handler for each subfilter by default.

The following table lists all `SignatureSubFilterNames` constants and their values:

| Constant | Subfilter value | Signature encoding |
|---|---|---|
| `SignatureSubFilterNames.ADBE_X509_RSA_SHA1` | `adbe.x509.rsa_sha1` | X.509 RSA signature with SHA-1. |
| `SignatureSubFilterNames.ADBE_PKCS7_SHA1` | `adbe.pkcs7.sha1` | PKCS#7 (CMS) signature with an embedded SHA-1 digest. |
| `SignatureSubFilterNames.ADBE_PKCS7_DETACHED` | `adbe.pkcs7.detached` | Detached PKCS#7 (CMS) signature. |
| `SignatureSubFilterNames.ETSI_CADES_DETACHED` | `ETSI.CAdES.detached` | Detached CAdES signature encoded as CMS SignedData. Validation checks the signer certificate binding, signed attributes, and document byte ranges. |

The `Signature` class exposes two methods for validating a signature:

| Method | Description |
|---|---|
| `Validate()` | Accepts a `SignatureValidationProperties` parameter and validates the signature using those properties. Returns a [SignatureValidationResult](https://docs.telerik.com/devtools/document-processing/api/Telerik.Windows.Documents.Fixed.Model.DigitalSignatures.SignatureValidationResult.html). |
| `TryValidate()` | Returns a `bool` indicating whether validation succeeded. The first overload accepts an `out` parameter containing a [SignatureValidationResult](https://docs.telerik.com/devtools/document-processing/api/Telerik.Windows.Documents.Fixed.Model.DigitalSignatures.SignatureValidationResult.html); the second overload also accepts `SignatureValidationProperties`. |

## Validation Properties

The `SignatureValidationProperties` class exposes the following properties:

| Property | Description |
|---|---|
| `Chain` | Gets or sets the chain used to validate the certificate that signed the digital signature. Of type [X509Chain](https://learn.microsoft.com/en-us/dotnet/api/system.security.cryptography.x509certificates.x509chain). |
| `ChainStatusFlags` | Gets or sets the chain status flags that describe the used signature certificate as not valid. Of type [X509ChainStatusFlags](https://learn.microsoft.com/en-us/dotnet/api/system.security.cryptography.x509certificates.x509chainstatusflags). |

>important The validation requires that the stream from which the document is imported remains open. The validation runs for the current field and checks against the state of the document at the moment of import.

## Validation Result

The `Validate()` and `TryValidate()` methods return a `SignatureValidationResult` that describes the outcome of the verification. The following table lists its properties:

| Property | Type | Description |
|---|---|---|
| `FieldName` | `string` | The name of the signature form field associated with this result. |
| `IsDocumentModified` | `bool` | Indicates whether the signed byte ranges were altered after signing. |
| `IsCertificateValid` | `bool` | Indicates whether the signing certificate builds a valid chain. Check `CertificatesChainElements` for details when the certificate is invalid. |
| `Certificates` | `X509Certificate2Collection` | The certificates included with the signature, used to validate the chain. |
| `CertificatesChainElements` | `X509ChainElementCollection` | Chain elements produced during validation that describe any issues with the certificate path. |
| `SignerInformation` | `string` | Signer information, typically the name or entity extracted from the signature. |
| `HashAlgorithm` | `Oid` | The hash algorithm OID used to compute the message digest for this signature. |
| `HashAlgorithmName` | `string` | The friendly name of the hash algorithm (for example, `SHA1` or `SHA256`), falling back to the OID value string when no friendly name is available. Returns `null` when `HashAlgorithm` is not set. |

The following example shows how to validate a signature field:

>note [PdfProcessing Validate Digital Signature Demo](https://demos.telerik.com/document-processing/pdfprocessing/validate_digital_signature)

**Validate a Field**

<snippet id='pdf-validate-signature'/>

>tip To evaluate a certificate as trusted, add it to the [trusted certificates on your machine](https://learn.microsoft.com/en-us/dotnet/framework/wcf/feature-details/how-to-view-certificates-with-the-mmc-snap-in).



## See Also

* [Form]({%slug radpdfprocessing-model-form%})
* [Form Fields]({%slug radpdfprocessing-model-interactive-forms-form-fields%})
* [AcroForm]({%slug radpdfprocessing-model-interactive-forms-acroform%})
* [SignatureField]({%slug radpdfprocessing-model-interactive-forms-form-fields-signaturefield%})
* [Validate Digital Signature Demo](https://demos.telerik.com/document-processing/pdfprocessing/validate_digital_signature)
