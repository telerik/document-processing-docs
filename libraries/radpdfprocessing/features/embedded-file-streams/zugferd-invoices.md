---
title: ZUGFeRD invoices
description: Learn how to embed a ZUGFeRD invoice into a PDF document utilizing the Telerik PdfProcessing library. 
page_title: ZUGFeRD invoices
slug: radpdfprocessing-embedded-file-streams-zugferd-invoices
tags: pdf, file, stream, embedded, zugferd, invoice
position: 1
---

# ZUGFeRD invoices

|Minimum Version|Q4 2025|
|----|----|

[ZUGFeRD](https://de.wikipedia.org/wiki/ZUGFeRD) (acronym for Zentraler User Guide des Forums elektronische Rechnung Deutschland) is a specification for the electronic invoice format of the same name. **RadPdfProcessing** provides support for embedding of ZUGFeRD invoices.

### Creating an Embedded Electronic (ZUGFeRD) Invoice

#### **Add ZUGFeRD invoice**

<snippet id='pdf-add-zugferd-invoice'/>

>note Only a single XML invoice attachment is allowed according to the ZUGFeRD standard.

>important To comply with the PDF/A-3B standard all the fonts in the documents should be embedded, so please avoid using [Standard Fonts]({%slug radpdfprocessing-concepts-fonts%}) because they are not being embedded in the document. In **.NET Standard/.NET (Target OS: None)** environments, fonts beyond the [14 standard ones]({%slug radpdfprocessing-concepts-fonts%}#standard-fonts) require a [FontsProvider implementation]({%slug pdfprocessing-implement-fontsprovider%}) to be resolved correctly.

#### **Remove ZUGFeRD invoice**

<snippet id='pdf-remove-zugferd-invoice'/>

## ZugferdConformanceLevel 

As of **Q4 2025** RadPdfProcessing provides support for specifying the ZUGFeRD (Factur-X) **conformance level** to use when exporting PDF invoices. Higher levels generally include all requirements of the lower levels and add more structured data to support automated processing and validation scenarios.

RadPdfProcessing offers the functionality to specify the **ZugferdConformanceLevel** when embedding the invoice. The available options are:

* **Minimum**: The minimal profile providing only the essential data needed for a compliant e-invoice. Suitable for simple use cases with limited automation.
* **Basic**: The basic profile providing core structured data for improved interoperability and basic automated processing between trading partners. This is the default value. 
* **Comfort**: The comfort profile with richer structured content, typically aligned with common business requirements to enable advanced automation.
* **Extended**: The most comprehensive profile including extended data elements to cover advanced or industry-specific scenarios beyond the comfort profile.

<snippet id='pdf-specify-zugferd-conformance-level'/>

## See Also

* [Embedded File Streams]({%slug radpdfprocessing-embedded-file-streams-overview%})

