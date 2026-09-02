---
title: XFA Forms
description: Learn how RadPdfProcessing imports, stores, and exports XFA form packets, configures ShouldExportXfa, and understands XFA authoring limitations.
page_title: XFA Forms in RadPdfProcessing
slug: radpdfprocessing-features-interactive-forms-xfa
tags: xfa, forms, acroform, pdf, import, export, radpdfprocessing
published: True
position: 3
---

# XFA Forms

RadPdfProcessing can import XFA (XML Forms Architecture) packets from a PDF, expose them through the document's `AcroForm`, and preserve them during export. This support is intended for **inspection and preservation** only, it does not provide a complete XFA authoring or rendering engine.

>warning XFA preservation is not the same as full XFA support. Importing and exporting the packets does not guarantee that a PDF viewer will render dynamic layouts, execute XFA scripts, or support XFA data binding.

## XFA and AcroForm fields

XFA packets and AcroForm fields are separate parts of the PDF form model. RadPdfProcessing exposes ordinary AcroForm fields through `AcroForm.FormFields` and imported XFA packets through `AcroForm.XfaForms`.

The `XfaForms` property is an `XfaCollection` that stores packet names and their raw bytes. The collection does not convert XFA packets into `FormField` objects, and the library does not parse the XML into a higher-level XFA object model.

A document can contain XFA packets, AcroForm fields, both, or neither. A nonzero `XfaForms.Count` indicates that the imported document contains XFA packet data stored in the RadPdfProcessing model.

## Inspect XFA packets after import

Use `PdfFormatProvider` to inspect the number, names, and byte sizes of the XFA packets in a document. The following example also reports the number of ordinary AcroForm fields so you can distinguish the two form models.

<snippet id='libraries-pdf-model-interactiveforms-xfa-forms-inspect'/>

## Preserve XFA packets during export

Set `PdfExportSettings.ShouldExportXfa` to `true` before exporting when the output PDF must include the imported XFA packets. The property defaults to `false`, so the default export strips XFA content.

<snippet id='libraries-pdf-model-interactiveforms-xfa-forms-preserve'/>

`ShouldExportXfa` is independent from ordinary AcroForm field export. The behavior is summarized below:

| `ShouldExportXfa` value | Imported XFA packets | Export behavior |
|---|---|---|
| `false` (default) | Present | XFA packets are stripped. AcroForm fields are exported when present. |
| `true` | Present | XFA packets are included in the exported PDF. AcroForm fields are also exported when present. |
| `false` or `true` | None | No XFA content is exported. |

## Work with the XFA packet collection

The `XfaCollection` provides limited packet-level access for imported XFA data. You can enumerate packet names and raw bytes, or clear all packets from the collection.

<snippet id='libraries-pdf-model-interactiveforms-xfa-forms-work'/>

The public API does not provide methods to create a new XFA packet, replace a packet as XML, or edit XFA data through semantic objects. 

## Important limitations and compliance notes

RadPdfProcessing preserves XFA packets by storing the packet bytes and writing them back to the PDF. It does not expose APIs for XFA layout, scripting, calculations, data binding, or dynamic form reflow.

XFA packets are separate from the ordinary AcroForm field and widget model. Operations that work with `AcroForm.FormFields`, such as creating fields or flattening fields, do not represent or flatten XFA packets. If a document contains both XFA packets and AcroForm fields, validate the result in the target viewer.

`ShouldExportXfa` only controls whether XFA packets are included. It does not validate XFA XML, guarantee viewer compatibility, or ensure that the output conforms to PDF/A or PDF/UA requirements. When you set `PdfExportSettings.ComplianceLevel`, validate the exported PDF with a conformance checker and verify the form behavior in the target PDF viewer.

## See Also

* [Interactive forms overview]({%slug radpdfprocessing-model-interactive-forms-overview%})
* [AcroForm fields and XFA collections]({%slug radpdfprocessing-model-interactive-forms-acroform%})
* [PdfFormatProvider import and export settings]({%slug radpdfprocessing-formats-and-conversion-pdf-settings%})
* [Using PdfFormatProvider for PDF import and export]({%slug radpdfprocessing-formats-and-conversion-pdf-pdfformatprovider%})
* [How to comply with the PDF/A standard]({%slug radpdfprocessing-concepts-comply-with-pdfa-standard%})
