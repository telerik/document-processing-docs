---
title: Limitations
description: Learn what are the limitations related to the usage of digital signatures in RadPdfProcessing. 
page_title: Limitations
slug: radpdfprocessing-features-signature-validation
tags: digital, signature, limitations
position: 2
---

# Limitations

There are a few limitations related to the usage of digital signatures in RadPdfProcessing.

* Exporting a document that is signed must be done using a stream that supports reading.

* The validation of a signature depends on the bytes representing the document. Thus, to validate a signature, the stream used to import the document must be still open.

* The validation is always performed for the current field, against the state of the document at the moment of importing.

* At this point, RadPdfProcessing supports only the signing of a document that does not contain a signed signature field. Signing a document containing a signed signature field will result in invalidation and corruption of the existing signature.

* RadPdfProcessing currently supports only the signing of a single signature field. Signing more than one signature field will result in the invalidation of all signatures except the last one.

## See Also

* [Form]({%slug radpdfprocessing-model-form%})
* [Form Fields]({%slug radpdfprocessing-model-interactive-forms-form-fields%})
* [AcroForm]({%slug radpdfprocessing-model-interactive-forms-acroform%})
* [SignatureField]({%slug radpdfprocessing-model-interactive-forms-form-fields-signaturefield%})
* [Digital Signature]({%slug radpdfprocessing-features-digital-signature%})
