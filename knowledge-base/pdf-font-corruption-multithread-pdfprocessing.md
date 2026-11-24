---
title: Resolving Multithread Font Subset Corruption in PdfProcessing
description: Learn how to address font corruption caused by a race condition in multi-threaded PDF exports using PdfProcessing in Telerik Document Processing.
type: how-to
page_title: Fixing PDF Font Corruption in Multithreaded PdfProcessing
meta_title: Fixing PDF Font Corruption in Multithreaded PdfProcessing
slug: pdf-font-corruption-multithread-pdfprocessing
tags: pdfprocessing,pdfformatprovider,font,subsetting,multithread
res_type: kb
ticketid: 1719101
---

## Environment

| Version | Product | Author | 
| ---- | ---- | ---- | 
| 2026.3.923 | RadPdfProcessing | <a href="https://www.telerik.com/blogs/author/desislava-yordanova" target="_blank">Desislava Yordanova</a> |

## Description

When exporting PDFs using the [RadPdfProcessing]({%slug radpdfprocessing-overview%}) library in a multithreaded environment, font corruption may occur. This issue is caused by a race condition during the font subsetting process where multiple threads attempt to access the font cache simultaneously.

The issue manifests when generating PDFs in parallel, such as in an ASP.NET application handling multiple requests concurrently. Corruption may appear as missing or garbled characters in the exported PDF. 

This knowledge base article also answers the following questions:
- How can I prevent PDF font corruption in Telerik Document Processing?
- What causes missing or corrupted characters in PDFs generated with PdfProcessing?
- How do I handle multithreading when exporting PDFs with PdfProcessing?

## Solution

To resolve the issue of corrupted characters in PDFs generated in a multithreaded environment, use a process-wide lock to serialize access to the `Export` method of the `PdfFormatProvider` class. This approach prevents concurrent access to the font cache, eliminating the race condition.

### Steps to Implement a Process-Wide Lock

1. Define a static lock object at the beginning of your code.
2. Surround the `Export` method call with a lock statement using the lock object.
3. Ensure that all threads follow the locking mechanism to prevent concurrent execution.

Here is an example of how to implement the fix:

```csharp
using System;
using System.IO;
using System.Threading;
using Telerik.Windows.Documents.Fixed.FormatProviders.Pdf;
using Telerik.Windows.Documents.Fixed.Model;

public class PdfExportHandler
{
    private static readonly object PdfExportLock = new object();

    public void ExportPdf(RadFixedDocument document, string outputPath)
    {
        var pdfFormatProvider = new PdfFormatProvider();

        // Use a lock to serialize access to the Export method
        lock (PdfExportLock)
        {
            using (var outputStream = new FileStream(outputPath, FileMode.Create))
            {
                pdfFormatProvider.Export(document, outputStream);
            }
        }
    }
}
```

### Additional Notes
- Changing the `FixedFontEmbeddingType` to `Full` or `None` does not reliably fix the issue.release.


## See Also

- [PdfProcessing Documentation](https://docs.telerik.com/devtools/document-processing/libraries/radpdfprocessing/overview)
- [Feedback Portal Task: Missing/corrupted font characters during multithreaded PDF export](https://feedback.telerik.com/document-processing/1719107-wordsprocessing-pdfformatprovider-missing-corrupted-font-characters-during-multithreaded-pdf-export)