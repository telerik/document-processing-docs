---
title: Externally Sign a PDF Document
description: Learn how to externally sign a PDF document using RadPdfProcessing with IExternalSigner and ExternalSignerBase for HSM and remote signing scenarios.
page_title: Externally Sign a PDF Document
slug: external-digital-signing
tags: external, signing, pdf, hash, radpdfprocessing, digitalsignature, hsm, pkcs, certificates, sign
published: True
position: 3
---
<style> img[alt$="><"] { border: 1px solid lightgrey; } </style>

# Externally Sign a PDF Document

|Minimum Version|Q4 2025|
|----|----|

RadPdfProcessing supports creating a `Signature` instance configured for external signing. The external signing handler performs the actual signing operation. The private key is managed outside the PDF library (for example, HSMs, smart cards, or remote signing services), which allows integration without exposing private key material to the library.

>note [PdfProcessing Add Digital Signature External Demo](https://demos.telerik.com/document-processing/pdfprocessing/external_digitally_sign_document)

##  Using IExternalSigner

When you digitally sign a PDF, the signature data is typically embedded in the PDF file using **CMS** (Cryptographic Message Syntax). CMS is a standard used to digitally sign, encrypt, and authenticate data. CMS encapsulates the signature and contains the signed hash of the document, the signer certificate, and optionally a timestamp and other metadata.

The supported digest (hash) algorithms for producing CMS (PKCS #7) PDF signature values are `Sha256`, `Sha384`, and `Sha512` specified by the `DigestAlgorithm` property of the [SignatureSettings]({%slug radpdfprocessing-features-digital-signature-getting-started%}#signature-settings).

The following example demonstrates how to implement the `IExternalSigner` interface to produce an external CMS (PKCS #7) detached signature over a PDF byte range:

### CMS External Signer

<snippet id='libraries-pdf-features-digital-signature-external-digital-signing-cms-external-signing'/>

Then, initialize a `Signature` instance using the CMS External Signer:

<snippet id='libraries-pdf-features-digital-signature-external-digital-signing-externally-cms-sign-pdf'/>

## Using ExternalSignerBase

The PdfProcessing library allows you to create a base helper implementation for building external (client-supplied) digital signatures.

The following example implements external RSA-based digital signing for PDF documents by deriving the `ExternalSignerBase` class.
**RSA** (Rivest–Shamir–Adleman) is a widely used asymmetric cryptographic algorithm. RSA generates a **private key** and a **public key** where the private key signs the PDF and the public key verifies the signature. During the signing process, a hash (digest) of the PDF content is created (for example, using SHA-512). This hash is then encrypted with the RSA private key to create the digital signature. The signature is embedded in the PDF file, typically in a signature field.

### RSA External Signer

<snippet id='libraries-pdf-features-digital-signature-external-digital-signing-rsa-external-signing'/>

Now, create a `Signature` that uses the above implementation:

<snippet id='libraries-pdf-features-digital-signature-external-digital-signing-externally-rsa-sign-pdf'/>

## See Also

* [Using a TimeStamp Server]({%slug pdf-sign-timestamp-server%})
