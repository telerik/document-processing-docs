---
title: Using a TimeStamp Server
description: Learn how to sign a PDF document using a TimeStamp server.
page_title: Signing a PDF using a TimeStamp Server
slug: pdf-sign-timestamp-server
tags: pdf, sign, document, timestamp, time, stamp, server, telerik, processing
published: True
position: 2
---
<style> img[alt$="><"] { border: 1px solid lightgrey; } </style>

# Signing a PDF using a TimeStamp Server

|Minimum Version|Q4 2025|
|----|----|

The **TimeStampServer** class encapsulates the necessary details to communicate with an external Timestamp Authority (TSA), including the endpoint URL, optional authentication credentials and timeout for requests. The TimeStampServer can be set via the [SignatureSettings]({%slug radpdfprocessing-features-digital-signature-getting-started%}#signature-settings):

<snippet id='libraries-pdf-features-digital-signature-timestampserver'/>

The produced result document indicates a valid embedded timestamp:

![Signed PDF with a TimeStamp Server ><](images/radpdfprocessing-features-digital-signature-timestamp.png) 

## Creating TimeStampServer with Credentials

The following example shows how to initialize a new instance of the TimeStampServer class with the specified URL, credentials, and timeout:

<snippet id='libraries-pdf-features-digital-signature-create-timestampserver'/>

## See Also

 * [Digital Signature]({%slug radpdfprocessing-features-digital-signature%})
 * [Signature Field]({%slug radpdfprocessing-model-interactive-forms-form-fields-signaturefield%})
 * [Multiple Digital Signatures Demo](https://demos.telerik.com/document-processing/pdfprocessing/multiple_digital_signatures)
