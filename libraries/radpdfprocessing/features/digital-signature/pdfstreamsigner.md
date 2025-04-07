---
title: PdfStreamSigner
description: Learn how to add multiple Digital Signatures to a PDF document using PdfStreamSigner.
page_title: PdfStreamSigner
slug: radpdfprocessing-features-digital-signature-pdfstreamsigner
tags: pdfprocessing, document, processing, pdf, digital, sigature, stream, writer, multiple, sign
published: True
position: 1
---

# PdfStreamSigner

As of **Q2 2025** RadPdfProcessing intorduces the **PdfStreamSigner**. The **SignDocument** method it exposes allows the user to insert one or more [Digital Signatures]({%slug radpdfprocessing-features-digital-signature%}) into a PDF document.

|Method|Description|
|----|----|
|**PdfStreamSigner(Stream outputStream)**|Creates a new instance of thе PdfStreamSigner and specifies the output stream of the signed document.|
|**SignDocument(Stream originalStream, SignatureField signatureField, int pageIndex, TimeSpan? timeout)**|Adds a [Digital Signature]({%slug radpdfprocessing-features-digital-signature%}) to the PDF document|

The following example shows how to insert multiple [Digital Signatures]({%slug radpdfprocessing-features-digital-signature%}) into a PDF document using the PdfStreamSigner:

>important In .NET Standard use __Telerik.Documents.Primitives.Rect__ instead of __System.Windows.Rect__.

>important When adding multiple signatures, make sure the document is exported after each signature before importing it back again.

<snippet id='libraries-pdf-features-digital-signature-pdfstreamsigner'/>

![PdfProcessing Multiple Digital Signatures](images/radpdfprocessing-features-digital-signature-pdfstreamsigner.png)

## See Also

 * [Digital Signature]({%slug radpdfprocessing-features-digital-signature%})
 * [Signature Field]({%slug radpdfprocessing-model-interactive-forms-form-fields-signaturefield%})