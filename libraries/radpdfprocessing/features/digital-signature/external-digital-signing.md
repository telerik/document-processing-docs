---
title: Externally Sign a PDF Document
description: Learn how to sign externally a PDF document using PdfProcessing.
page_title: Externally Sign a PDF Document
slug: external-digital-signing
tags: pdf, sign, document, external, hash, telerik, processing
published: True
position: 3
---
<style> img[alt$="><"] { border: 1px solid lightgrey; } </style>

# Externally Sign a PDF Document

|Minimum Version|Q4 2025|
|----|----|

RadPdfProcessing provides support for creating a **Signature** instance configured for external signing. The external signing handler performs the actual signing operation. The private key is managed outside the PDF library (e.g., HSMs, smart cards, remote signing services) and it allows integration without exposing private key material to the library.

>note [PdfProcessing Add Digital Signature External Demo](https://demos.telerik.com/document-processing/pdfprocessing/external_digitally_sign_document)

##  Using IExternalSigner

When you digitally sign a PDF, the signature data is typically embedded in the PDF file using **CMS** (Cryptographic Message Syntax). It is a standard used to digitally sign, encrypt, and authenticate data. CMS encapsulates the signature and it contains the signed hash of the document, the signer's certificate, and optionally a timestamp and other metadata.

The supported digest (hash) algorithms for producing CMS (PKCS #7) PDF signature values are **Sha256**, **Sha384** and **Sha512** specified by the **DigestAlgorithm** property of the [SignatureSettings]({%slug radpdfprocessing-features-digital-signature-getting-started%}#signature-settings).

The following example demonstrates how to implement the **IExternalSigner** interface producing an external CMS (PKCS #7) detached signature over a PDF byte range:

#### [C#] CMS External Signer 

<snippet id='libraries-pdf-features-digital-signature-cms-external-signing'/>

Then, initialize a Signature instance using the CMS External Signer:

<snippet id='libraries-pdf-features-digital-signature-externally-cms-sign-pdf'/>

## Using ExternalSignerBase

The PdfProcessing library allows creating a base helper implementation for building external (client supplied) digital signatures. 

The following example implements external RSA-based digital signing for PDF documents deriving the ExternalSignerBase class.
**RSA** (Rivest–Shamir–Adleman) algorithm is a widely used asymmetric cryptographic algorithm. RSA generates a **private key** and a **public key** where the private key is used to sign the PDF and the public key is used to verify the signature. During the signing process a hash (digest) of the PDF content is created (e.g., using SHA-512). This hash is then encrypted with the RSA private key to create the digital signature. The signature is embedded in the PDF file, typically in a signature field.

#### [C#] RSA External Signer 

<snippet id='libraries-pdf-features-digital-signature-rsa-external-signing'/>

Now, create a Signature that uses the above implementation:

<snippet id='libraries-pdf-features-digital-signature-externally-rsa-sign-pdf'/>

## See Also

 * [Using a TimeStamp Server]({%slug pdf-sign-timestamp-server%})
