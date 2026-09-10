---
title: Overview
description: Learn how the digital signature feature in RadPdfProcessing signs and validates PDF documents with X.509 certificates, PKI chains, and signature fields.
page_title: Digital Signature - Overview
slug: radpdfprocessing-features-digital-signature
tags: digital, signature, pdf, signing, validation, radpdfprocessing, x509, certificates, pki, public-key-infrastructure, overview
position: 0
---

# Overview

The **digital signature** feature in `RadPdfProcessing`, part of Telerik Document Processing, lets you sign and validate PDF documents. A digital signature confirms that the document content came from the signer and has not been modified. A signed document remains valid when the content stays unchanged after signing and the certificate chain resolves to a trusted root certificate.

In a *public key infrastructure* (PKI) workflow, `RadPdfProcessing` uses X.509 certificates, certificate chains, trusted roots, and revocation checks for PDF signing and validation. Certificate issuance and certificate-authority management are outside the library scope.
<a name="signing-a-document"><a/>
With `RadPdfProcessing`, you can:

* [Create a PDF document from scratch and add a signature field]({%slug radpdfprocessing-features-digital-signature-getting-started%}). 
* [Sign PDF documents that contain a predefined signature field](https://demos.telerik.com/document-processing/pdfprocessing/digitally_sign_document).
* [Verify existing signed PDF documents]({%slug radpdfprocessing-features-digital-signature-validation%}).
* [Multiple Digital Signing with PdfStreamSigner]({%slug radpdfprocessing-features-digital-signature-pdfstreamsigner%}). 

![RadPdfProcessing Overview of Signed PDF](images/radpdfprocessing-features-digital-signature-overview.png) 

## Online Demos

The following demos show common signing scenarios:

| Demo | Description |
|----|----|
| [PdfProcessing Digitally Sign Document](https://demos.telerik.com/document-processing/pdfprocessing/digitally_sign_document) | Demonstrates how to digitally sign a PDF. |
| [PdfProcessing Validate Digital Signature](https://demos.telerik.com/document-processing/pdfprocessing/validate_digital_signature) | Demonstrates how to validate a digitally signed PDF. |
| [PdfProcessing Multiple Digital Signatures](https://demos.telerik.com/document-processing/pdfprocessing/multiple_digital_signatures) | Demonstrates how to digitally sign a PDF without invalidating existing signatures. |


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
