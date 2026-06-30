---
title: Using a TimeStamp Server
description: Learn how to sign a PDF document using a TimeStamp server with RadPdfProcessing, including credentials and timeout configuration.
page_title: Signing a PDF using a TimeStamp Server
slug: pdf-sign-timestamp-server
tags: timestamp, pdf, signing, server, radpdfprocessing, digital, signature, ltv, tsa
published: True
position: 2
---
<style> img[alt$="><"] { border: 1px solid lightgrey; } </style>

# Signing a PDF using a TimeStamp Server

|Minimum Version|Q4 2025|
|----|----|

The `TimeStampServer` class encapsulates the details needed to communicate with an external Timestamp Authority (TSA), including the endpoint URL, optional authentication credentials, and timeout for requests. Set the `TimeStampServer` through the [SignatureSettings]({%slug radpdfprocessing-features-digital-signature-getting-started%}#signature-settings).

>note [PdfProcessing Add Digital Signature External Demo](https://demos.telerik.com/document-processing/pdfprocessing/external_digitally_sign_document)

<snippet id='libraries-pdf-features-digital-signature-pdf-sign-timestamp-server-timestampserver'/>

The produced result document indicates a valid embedded timestamp:

![Signed PDF with a TimeStamp Server ><](images/radpdfprocessing-features-digital-signature-timestamp.png) 

## Creating TimeStampServer with Credentials

The following example shows how to initialize a new instance of the `TimeStampServer` class with the specified URL, credentials, and timeout:

<snippet id='libraries-pdf-features-digital-signature-pdf-sign-timestamp-server-create-timestampserver'/>

## See Also

* [Digital Signature]({%slug radpdfprocessing-features-digital-signature%})
* [Signature Field]({%slug radpdfprocessing-model-interactive-forms-form-fields-signaturefield%})
* [Multiple Digital Signatures Demo](https://demos.telerik.com/document-processing/pdfprocessing/multiple_digital_signatures)
