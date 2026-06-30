---
title: ZUGFeRD and XRechnung Invoices
description: Learn how to embed ZUGFeRD and XRechnung invoices into a PDF document utilizing the Telerik PdfProcessing library.
page_title: ZUGFeRD and XRechnung Invoices
slug: radpdfprocessing-embedded-file-streams-zugferd-invoices
tags: zugferd, xrechnung, invoice, pdf, xml, radpdfprocessing, embedded, finance, ereceiving
position: 1
---

# ZUGFeRD and XRechnung Invoices

|Minimum Version|Q4 2025|
|----|----|

[ZUGFeRD](https://de.wikipedia.org/wiki/ZUGFeRD) (acronym for Zentraler User Guide des Forums elektronische Rechnung Deutschland) is a specification for the electronic invoice format of the same name. **RadPdfProcessing** supports embedding ZUGFeRD invoices, including the XRechnung profile for German public-sector electronic invoicing compliance.

## Creating an Embedded Electronic (ZUGFeRD) Invoice

### Add ZUGFeRD Invoice

<snippet id='libraries-pdf-features-embedded-file-streams-zugferd-invoices-add-zugferd-invoice'/>

>note Only a single XML invoice attachment is allowed according to the ZUGFeRD standard.

>important To comply with the PDF/A-3B standard, all the fonts in the documents must be embedded. Avoid using [Standard Fonts]({%slug radpdfprocessing-concepts-fonts%}) because they are not embedded in the document. In **.NET Standard/.NET (Target OS: None)** environments, fonts beyond the [14 standard ones]({%slug radpdfprocessing-concepts-fonts%}#standard-fonts) require a [FontsProvider implementation]({%slug pdfprocessing-implement-fontsprovider%}) to be resolved correctly.

### Remove ZUGFeRD Invoice

<snippet id='libraries-pdf-features-embedded-file-streams-zugferd-invoices-remove-zugferd-invoice'/>

## ZugferdConformanceLevel 

Starting with **Q4 2025**, RadPdfProcessing supports specifying the ZUGFeRD (Factur-X) **conformance level** when exporting PDF invoices. Higher levels generally include all requirements of the lower levels and add more structured data to support automated processing and validation scenarios.

RadPdfProcessing allows you to set the `ZugferdConformanceLevel` when embedding the invoice. The available options are:

| Level | Description |
|---|---|
| `Minimum` | The minimal profile providing only the essential data needed for a compliant e-invoice. Suitable for simple use cases with limited automation. |
| `Basic` | The basic profile providing core structured data for improved interoperability and basic automated processing between trading partners. This is the default value. |
| `Comfort` | The comfort profile with richer structured content, typically aligned with common business requirements to enable advanced automation. |
| `Extended` | The most comprehensive profile including extended data elements to cover advanced or industry-specific scenarios beyond the comfort profile. |
| `XRechnung` | The German CIUS (Core Invoice Usage Specification) reference profile based on EN 16931. Used for public-sector electronic invoicing in Germany. Exports with `XRECHNUNG` conformance metadata and embeds the invoice XML as `xrechnung.xml`. |

<snippet id='libraries-pdf-features-embedded-file-streams-zugferd-invoices-specify-zugferd-conformance-level'/>

### XRechnung Profile

XRechnung is the German electronic invoicing standard mandated for public-sector invoicing. ZUGFeRD 2.1.1 defines an XRECHNUNG profile that enables XRechnung-compliant invoice data to be embedded in a PDF/A-3 document.

When you set the conformance level to `XRechnung`, **RadPdfProcessing** automatically:

* Sets the conformance level metadata to `XRECHNUNG` in the XMP metadata.
* Embeds the invoice XML with the file name `xrechnung.xml` instead of the default `factur-x.xml`.

<snippet id='libraries-pdf-features-embeddedfilestreams-zugferdinvoices-xrechnung'/>

>note When using the `XRechnung` conformance level, the embedded file name is fixed to `xrechnung.xml`. For all other conformance levels the file name is `factur-x.xml`.

## Validating Documents

RadPdfProcessing follows the business-rule validation for ZUGFeRD / Factur-X XML published by European Committee for Standardization: [Open-source E-invoice Validator](https://interoperable-europe.ec.europa.eu/collection/eprocurement/news/open-source-e-invoice-validator).

## See Also

* [Embedded File Streams]({%slug radpdfprocessing-embedded-file-streams-overview%})

