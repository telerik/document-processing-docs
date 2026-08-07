---
title: XFA Forms in RadPdfProcessing
description: Learn how RadPdfProcessing imports, stores, and exports XFA form packets, configure ShouldExportXfa, and understand XFA authoring limitations.
page_title: XFA Forms in RadPdfProcessing
slug: radpdfprocessing-features-interactive-forms-xfa
tags: xfa, forms, acroform, pdf, import, export, radpdfprocessing
published: True
position: 3
---

# XFA Forms in RadPdfProcessing

RadPdfProcessing can import XFA (XML Forms Architecture) packets from a PDF, expose the packets through the document's `AcroForm`, and preserve them during export. XFA support is intended for packet inspection and preservation; it does not provide a complete XFA authoring or rendering engine.

>warning XFA preservation is not the same as full XFA support. Importing and exporting the packets does not guarantee that a PDF viewer will render dynamic layouts, execute XFA scripts, or support XFA data binding.

## Understanding XFA and AcroForm fields

XFA packets and AcroForm fields are separate parts of the PDF form model. RadPdfProcessing exposes ordinary AcroForm fields through `AcroForm.FormFields` and exposes imported XFA packets through `AcroForm.XfaForms`.

The `XfaForms` property is an `XfaCollection` that stores packet names and their raw data. The collection does not convert XFA packets into `FormField` objects, and the library does not parse the packet XML into a higher-level XFA object model.

## Inspecting XFA packets after import

Import a PDF with `PdfFormatProvider` to inspect the number, names, and byte sizes of the XFA packets stored in the document. The following example also reports the number of ordinary AcroForm fields so you can distinguish the two form models.

```C#
using System;
using System.Collections.Generic;
using System.IO;
using Telerik.Documents.Fixed.FormatProviders.Pdf;
using Telerik.Documents.Fixed.Model;

PdfFormatProvider provider = new PdfFormatProvider();
RadFixedDocument document;

using (FileStream input = File.OpenRead("xfa-form.pdf"))
{
    document = provider.Import(input);
}

Console.WriteLine($"AcroForm fields: {document.AcroForm.FormFields.Count}");
Console.WriteLine($"XFA packets: {document.AcroForm.XfaForms.Count}");

foreach (KeyValuePair<string, byte[]> packet in document.AcroForm.XfaForms)
{
    Console.WriteLine($"{packet.Key}: {packet.Value.Length} bytes");
}
```

A document can contain XFA packets, AcroForm fields, both, or neither. A nonzero `XfaForms.Count` indicates that the imported document contains XFA packet data that RadPdfProcessing stored in the model.

## Preserving XFA packets during export

Set `PdfExportSettings.ShouldExportXfa` to `true` before exporting when the output PDF must include the imported XFA packets. The property defaults to `false`, so the default export omits XFA content.

The following example imports a PDF, verifies that it contains XFA packets, and exports the packets to a new PDF.

```C#
using System;
using System.IO;
using Telerik.Documents.Fixed.FormatProviders.Pdf;
using Telerik.Documents.Fixed.Model;

PdfFormatProvider provider = new PdfFormatProvider();
RadFixedDocument document;

using (FileStream input = File.OpenRead("xfa-form.pdf"))
{
    document = provider.Import(input);
}

if (document.AcroForm.XfaForms.Count == 0)
{
    throw new InvalidOperationException("The imported PDF does not contain XFA packets.");
}

provider.ExportSettings.ShouldExportXfa = true;

using (FileStream output = File.Create("xfa-form-preserved.pdf"))
{
    provider.Export(document, output);
}
```

`ShouldExportXfa` controls XFA packet inclusion independently of ordinary AcroForm field export. The following table describes the export behavior:

| `ShouldExportXfa` value | Imported XFA packets | Export behavior |
|---|---|---|
| `false` (default) | Present | XFA packets are omitted. Ordinary AcroForm fields are exported when the document contains them. |
| `true` | Present | XFA packets are included in the exported PDF. Ordinary AcroForm fields are also exported when the document contains them. |
| `false` or `true` | None | No XFA content is exported. |

## Working with the XFA packet collection

The `XfaCollection` provides limited packet-level access for imported XFA data. You can enumerate packet names and raw bytes or remove all packets from the collection.

```C#
using System.Collections.Generic;
using Telerik.Documents.Fixed.Model.InteractiveForms;

XfaCollection packets = document.AcroForm.XfaForms;

foreach (KeyValuePair<string, byte[]> packet in packets)
{
    string packetName = packet.Key;
    byte[] packetData = packet.Value;
}

packets.Clear();
```

The public API does not provide methods to add a new named XFA packet, replace a packet as XML, or edit XFA data through semantic objects. Use a dedicated XFA authoring or processing tool when your workflow requires changes to XFA templates, datasets, scripts, calculations, data binding, or dynamic form layout.

## XFA limitations and compliance

XFA preservation does not provide full XFA form behavior. RadPdfProcessing stores packet bytes and writes them back to the PDF; it does not expose APIs for XFA layout, scripting, calculations, data binding, or dynamic form reflow.

XFA packets are also separate from the ordinary AcroForm field and widget model. Operations that work with `AcroForm.FormFields`, such as creating fields or flattening fields, do not represent or flatten XFA packets. Test the resulting PDF in the target viewer when a document contains both XFA packets and AcroForm fields.

`ShouldExportXfa` only controls whether XFA packets are included. It does not validate XFA XML, guarantee viewer compatibility, or make the output conform to PDF/A or PDF/UA requirements. When you set `PdfExportSettings.ComplianceLevel`, validate the exported PDF with a conformance checker and verify the form behavior in the target PDF viewer.

## Troubleshooting missing XFA content

Check these conditions when XFA content is missing after export:

* Confirm that `document.AcroForm.XfaForms.Count` is greater than zero after import.
* Set `provider.ExportSettings.ShouldExportXfa` to `true` before calling `Export()`.
* Confirm that the output PDF is the file produced by the export operation and that a PDF viewer supports the XFA content it displays.
* Inspect the exported PDF again with `PdfFormatProvider` and check `AcroForm.XfaForms.Count`.

## See Also

* [Interactive forms overview]({%slug radpdfprocessing-model-interactive-forms-overview%})
* [AcroForm fields and XFA collections]({%slug radpdfprocessing-model-interactive-forms-acroform%})
* [PdfFormatProvider import and export settings]({%slug radpdfprocessing-formats-and-conversion-pdf-settings%})
* [Using PdfFormatProvider for PDF import and export]({%slug radpdfprocessing-formats-and-conversion-pdf-pdfformatprovider%})
* [How to comply with the PDF/A standard]({%slug radpdfprocessing-concepts-comply-with-pdfa-standard%})
