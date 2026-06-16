---
title: Limitations
description: Learn about the limitations related to the use of digital signatures in RadPdfProcessing, including stream requirements and validation constraints.
page_title: Limitations
slug: radpdfprocessing-features-digital-signature-limitations
tags: digital, signature, limitations, pdf, radpdfprocessing, signing, constraints, certificates, forms
position: 7
---

# Limitations

The following limitations apply to digital signatures in RadPdfProcessing:

* Export a signed document using a stream that supports **reading**. To ensure compatibility, always use a stream that supports both reading and writing when you export signed documents.

* Signature validation depends on the bytes that represent the document. To validate a signature, the stream used to import the document must remain **open**.

* The validation always runs for the current field, against the state of the document at the moment of import.

## See Also

* [Form]({%slug radpdfprocessing-model-form%})
* [Form Fields]({%slug radpdfprocessing-model-interactive-forms-form-fields%})
* [AcroForm]({%slug radpdfprocessing-model-interactive-forms-acroform%})
* [SignatureField]({%slug radpdfprocessing-model-interactive-forms-form-fields-signaturefield%})
* [Digital Signature]({%slug radpdfprocessing-features-digital-signature%})
