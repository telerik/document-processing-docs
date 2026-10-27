---
title: Signature Validation
description: Learn how to validate digital signatures in PDF documents using the Signature class methods and SignatureValidationProperties in RadPdfProcessing.
page_title: Signature Validation
slug: radpdfprocessing-features-digital-signature-validation
tags: signature, validation, pdf, certificates, radpdfprocessing, x509, revocation, chain
position: 6
components: [pdfprocessing]
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
| `TryValidate()` | Returns `true` if validation completes without an exception. This does not mean the signature is valid. Check the returned [SignatureValidationResult](https://docs.telerik.com/devtools/document-processing/api/Telerik.Windows.Documents.Fixed.Model.DigitalSignatures.SignatureValidationResult.html) through the `out` parameter. An overload also accepts `SignatureValidationProperties`. |

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
| `CoversWholeDocument` | `bool` | Read-only. Shows whether the signature covers the entire current PDF, except for its own signature bytes. |
| `IsCertificateValid` | `bool` | Shows whether the signing certificate passes your certificate-validation settings. Check `CertificatesChainElements` for details when the certificate is not valid. |
| `Certificates` | `X509Certificate2Collection` | The certificates included with the signature, used to validate the chain. |
| `CertificatesChainElements` | `X509ChainElementCollection` | Chain elements produced during validation that describe any issues with the certificate path. |
| `SignerInformation` | `string` | Built-in handlers return the signing certificate's full `Subject`, not the PDF `Name`. Custom handlers can return different signer information. |
| `HashAlgorithm` | `Oid` | The hash algorithm OID used to compute the message digest for this signature. |
| `HashAlgorithmName` | `string` | The friendly name of the hash algorithm (for example, `SHA1` or `SHA256`), falling back to the OID value string when no friendly name is available. Returns `null` when `HashAlgorithm` is not set. |

The following example shows how to validate a signature field:

>note [PdfProcessing Validate Digital Signature Demo](https://demos.telerik.com/document-processing/pdfprocessing/validate_digital_signature)

**Validate a Field**

<snippet id='pdf-validate-signature'/>

>tip To evaluate a certificate as trusted, add it to the [trusted certificates on your machine](https://learn.microsoft.com/en-us/dotnet/framework/wcf/feature-details/how-to-view-certificates-with-the-mmc-snap-in).

## Whole-Document Coverage

Use `CoversWholeDocument` to check whether a signature covers the entire current PDF. Only the matching hexadecimal `/Contents` value, which holds the signature bytes, is excluded. Validation calculates this read-only value for built-in and custom handlers. `SignatureValidationResultBuilder` has no method to set it.

Coverage does not prove that a signature is valid or its certificate is trusted. A signature can cover the whole PDF even if its signed bytes have changed. In that case, both `CoversWholeDocument` and `IsDocumentModified` can be `true`.

An *incremental update* adds a new PDF revision without changing earlier signed bytes. An earlier signature can then report `IsDocumentModified == false` and `CoversWholeDocument == false`: its signed bytes are unchanged, but later content is not covered.

>important Partial coverage does not mean later changes are unauthorized. A later signature, timestamp, or Document Security Store (DSS) update can also cause partial coverage. Validation does not check whether document or field permissions (`DocMDP` or `FieldMDP`) allow those changes.

For an imported, signed `signatureField`, check all three results together. Keep the original source stream open during validation.

```csharp
using System;
using System.Security.Cryptography.X509Certificates;
using Telerik.Documents.Fixed.Model.DigitalSignatures;

var validationProperties = new SignatureValidationProperties
{
    ChainStatusFlags = (X509ChainStatusFlags)~0
};

using (X509Chain chain = validationProperties.Chain)
{
    chain.ChainPolicy.VerificationFlags = X509VerificationFlags.NoFlag;
    chain.ChainPolicy.RevocationMode = X509RevocationMode.Online;
    chain.ChainPolicy.UrlRetrievalTimeout = TimeSpan.FromSeconds(10);

    SignatureValidationResult result = signatureField.Signature.Validate(validationProperties);

    bool signedCurrentSource = !result.IsDocumentModified
        && result.IsCertificateValid
        && result.CoversWholeDocument;

    Console.WriteLine("Current PDF passes all three checks: " + signedCurrentSource);
}
```

The example rejects all reported certificate-chain errors. Online revocation checks can fail without network access. Even when all three checks pass, they do not check modification permissions.

Default certificate settings have not changed. They do not reject expired certificates, unknown or offline revocation status, or usage errors. Set `ChainStatusFlags` and `Chain.ChainPolicy` to match your trust requirements.

## Signer Identity

`Signature.Properties.Name` is a name stored in the PDF, not proof of the signer's identity. Use the certificate-based `SignerInformation` from built-in handlers instead. Custom handlers define their own identity rules.

Before trusting the identity, check `IsDocumentModified` and `IsCertificateValid`. Also check `CoversWholeDocument` if you require a signature for the entire current PDF.

## Concurrent Validation

A shared validation handler processes one call at a time. If a call starts another validation on the same thread, the first call's state is restored afterward, even after an exception.

For concurrent validation, use separate `SignatureValidationProperties` and `X509Chain` instances. Different handlers do not coordinate access to shared source streams or certificate chains.

## Signing Time and Time Zone

The `Signature.Properties` object (of type `SignatureDataProperties`) exposes the signing time through the following properties:

| Property | Type | Description |
|---|---|---|
| `TimeOfSigning` | `DateTime` | The time of signing. When imported from a PDF, the instant is converted to the local time zone configured on the current machine, so the value does not necessarily represent the signer's time zone. If the conversion to local time cannot preserve the instant, the value is returned in UTC. When signing, a `Local` value is written with the machine's UTC offset and any other kind is written as UTC (`Z`). |
| `TimeOfSigningOffset` | `TimeSpan?` | Read-only. The numeric UTC offset recorded in the signing date of an imported signature, for example, `+03:00`. It is `null` for signatures created in code, in which case the `TimeOfSigning` encoding described above is used. |

When a signature is imported, `TimeOfSigningOffset` is populated from the PDF date string (`D:YYYYMMDDHHmmSSOHH'mm'`). A date with `Z` or without an offset is reported as `TimeSpan.Zero`. A date that cannot be parsed (for example, an invalid offset) is ignored, and both properties keep their default values. When an imported document is exported again, the original offset is written back to the signing date.

>note PDF date strings store numeric UTC offsets, not time zone identifiers such as `Europe/Sofia`, so the time zone name cannot be recovered. Offsets use whole-minute increments from -23:59 through +23:59.

The following example shows how to obtain the original signing time, including its UTC offset, from an imported signature:

```csharp
foreach (SignatureField signatureField in document.AcroForm.FormFields.OfType<SignatureField>())
{
    SignatureDataProperties properties = signatureField.Signature.Properties;

    TimeSpan? offset = properties.TimeOfSigningOffset;
    if (offset.HasValue)
    {
        DateTimeOffset signedAt = new DateTimeOffset(properties.TimeOfSigning.ToUniversalTime().Add(offset.Value).Ticks, offset.Value);
        Debug.WriteLine("Signed on: " + signedAt.ToString("yyyy-MM-dd HH:mm:ss zzz"));
    }
}
```



## See Also

* [Form]({%slug radpdfprocessing-model-form%})
* [Form Fields]({%slug radpdfprocessing-model-interactive-forms-form-fields%})
* [AcroForm]({%slug radpdfprocessing-model-interactive-forms-acroform%})
* [SignatureField]({%slug radpdfprocessing-model-interactive-forms-form-fields-signaturefield%})
* [Validate Digital Signature Demo](https://demos.telerik.com/document-processing/pdfprocessing/validate_digital_signature)
