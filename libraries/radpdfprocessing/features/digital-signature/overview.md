---
title: Overview
description: The digital signature feature in RadPdfProcessing enables you to sign and validate PDF documents using X509 certificates and signature fields.
page_title: Digital Signature - Overview
slug: radpdfprocessing-features-digital-signature
tags: digital, signature, pdf, signing, validation, radpdfprocessing, x509, certificates, overview
position: 0
---

# Overview

The **digital signature** feature enables you to sign and validate a PDF document. A signature confirms that the document content originated from the signer and has not been modified. A signed document is considered valid when it has not been changed after signing, and all of its certificates have a valid trusted root certificate.

<a name="signing-a-document"><a/>

Telerik **RadPdfProcessing** provides an API that allows you to:

* [Create a PDF document from scratch and add a signature field]({%slug radpdfprocessing-features-digital-signature-getting-started%}). 
* [Sign PDF documents that contain a predefined signature field](https://demos.telerik.com/document-processing/pdfprocessing/digitally_sign_document).
* [Verify existing signed PDF documents]({%slug radpdfprocessing-features-digital-signature-validation%}).
* [Multiple Digital Signing with PdfStreamSigner]({%slug radpdfprocessing-features-digital-signature-pdfstreamsigner%}). 

![RadPdfProcessing Overview of Signed PDF](images/radpdfprocessing-features-digital-signature-overview.png) 

## Online Demos

|Demo|Description|
|----|----|
|[PdfProcessing Digitally Sign Document](https://demos.telerik.com/document-processing/pdfprocessing/digitally_sign_document)|Demonstrates how to digitally sign a PDF.|
|[PdfProcessing Validate Digital Signature](https://demos.telerik.com/document-processing/pdfprocessing/validate_digital_signature)|Demonstrates how to validate a digitally signed PDF.|
|[PdfProcessing Multiple Digital Signatures](https://demos.telerik.com/document-processing/pdfprocessing/multiple_digital_signatures)|Demonstrates how to digitally sign a PDF without invalidating existing signatures.|


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
