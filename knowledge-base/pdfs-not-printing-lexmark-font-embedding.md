```markdown
---
title: PDFs Not Printing with Lexmark Printers Due to Font Embedding
description: Solve the issue of PDFs not printing on Lexmark printers by ensuring all fonts are fully embedded.
type: troubleshooting
page_title: Resolving PDF Printing Issues with Lexmark Printers
meta_title: Resolving PDF Printing Issues with Lexmark Printers
slug: pdfs-not-printing-lexmark-font-embedding
tags: pdfprocessing, telerik document processing, font embedding, lexmark printers
res_type: kb
ticketid: 1715820
---

## Environment
<table>
<tbody>
<tr>
<td> Product </td>
<td>PdfProcessing for Telerik Document Processing</td>
</tr>
<tr>
<td> Version </td>
<td>Current</td>
</tr>
</tbody>
</table>

## Description
I encountered an issue where PDFs created using Telerik [PdfProcessing](https://docs.telerik.com/devtools/document-processing/libraries/radpdfprocessing/overview) would not print on Lexmark printers, specifically the Lexmark M3350 model. These PDFs printed successfully on other printers. The problem persisted despite setting font embedding to "full" and registering TrueType fonts during application startup.

## Cause
Lexmark printers enforce strict type-checking for fonts used in PDFs. If any font in the document is not fully embedded, Lexmark printers may fail to print the PDF. In this case, the issue arose from using embedded Arial for the main PDF content while using the out-of-the-box Helvetica font from Telerik for a watermark. Helvetica was not fully embedded, causing the printer to reject the PDF.

## Solution
To resolve the issue, ensure all fonts used in the PDF are fully embedded. Follow these steps:

1. Use the same embedded font for all content in the PDF, including watermarks.
2. Replace the default Telerik font (such as Helvetica) with an embedded font, like Arial, to ensure compliance with Lexmark printers.

Example for setting the watermark to use the embedded Arial font:
```csharp
// Example of setting the watermark font to Arial
var watermarkText = new TextBlock();
watermarkText.Text = "Confidential";
watermarkText.Font = FontsRepository.FindFont("Arial"); // Use an embedded Arial font
```

This approach ensures that all fonts in the PDF are embedded, meeting Lexmark printers' requirements and resolving the issue.

## See Also
- [PdfProcessing Documentation Overview](https://docs.telerik.com/devtools/document-processing/libraries/radpdfprocessing/overview)
- [PdfProcessing Fonts Overview](https://docs.telerik.com/devtools/document-processing/libraries/radpdfprocessing/features/fonts)
- [Telerik Document Processing Release History](https://www.telerik.com/support/whats-new/telerik-document-processing/release-history)
```
