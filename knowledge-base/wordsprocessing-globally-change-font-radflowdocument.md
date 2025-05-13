---
title: How to Globally Change the Font of a RadFlowDocument Before Export
description: Learn how to recursively change all fonts in a document before exporting it to another format using RadWordsProcessing.
type: how-to
page_title: How to Globally Change the Font of a RadFlowDocument Before Export
slug: wordsprocessing-globally-change-font-radflowdocument
tags: font, radflowdocument, wordsprocessing, document, processing, pdf, export, global, font, change
res_type: kb
---

## Environment

| Version | Product | Author |
|----|----|----|
| 2025.1.205 | [RadWordsProcessing]({%slug radwordsprocessing-overview%}) | [Yoan Karamanov](https://www.telerik.com/blogs/author/yoan-karamanov) |

## Description

When working with documents in various Word formats, you might need to ensure consistent font usage across the entire document before exporting it. This is particularly useful when:

- You need to ensure proper font display in the exported document
- You want to maintain consistent styling across different sections
- You need to replace fonts that might not be available in the target environment or format
This article demonstrates how to recursively iterate through all text runs in a [RadFlowDocument]({%slug radwordsprocessing-model-radflowdocument%}) and apply a global font change before export. The solution supports various document formats that can be imported as a **RadFlowDocument**, including DOCX, DOC, RTF, HTML, and plain text.

## Solution

The solution involves three key steps:

1. Import the document from your source format
2. Recursively iterate through all [Run]({%slug radwordsprocessing-model-run%}) elements in the document and change their font
3. Export the document to your desired format

Here's a complete code example that demonstrates how to change all fonts in a **RadFlowDocument** to _Arial_ before exporting to PDF:

```csharp
using System;
using System.IO;
using Telerik.Windows.Documents.Flow.FormatProviders.Docx;
using Telerik.Windows.Documents.Flow.FormatProviders.Pdf;
using Telerik.Windows.Documents.Flow.Model;
using Telerik.Windows.Documents.Flow.Model.Styles;

namespace GlobalFontChanger
{
    class Program
    {
        static void Main(string[] args)
        {
            // 1. Import the document
            DocxFormatProvider docxProvider = new DocxFormatProvider();
            RadFlowDocument radFlowDocument;
            
            using (Stream input = File.OpenRead("input.docx"))
            {
                radFlowDocument = docxProvider.Import(input);
            }

            // 2. Change the font for all runs in the document
            foreach (Run run in radFlowDocument.EnumerateChildrenOfType<Run>())
            {
                run.FontFamily = new ThemableFontFamily("Arial");
            }

            // 3. Export the document to PDF
            PdfFormatProvider pdfProvider = new PdfFormatProvider();
            
            using (Stream output = File.OpenWrite("output.pdf"))
            {
                pdfProvider.Export(radFlowDocument, output);
            }
            
            Console.WriteLine("Document successfully processed and exported with Arial font.");
        }
    }
}
```

You can adapt this solution to work with other formats by changing the import and export format providers. For example, to import from RTF and export to DOCX:

```csharp
// Import from RTF
RtfFormatProvider rtfProvider = new RtfFormatProvider();
using (Stream input = File.OpenRead("input.rtf"))
{
    radFlowDocument = rtfProvider.Import(input);
}

// Change fonts as shown above

// Export to DOCX
DocxFormatProvider docxExportProvider = new DocxFormatProvider();
using (Stream output = File.OpenWrite("output.docx"))
{
    docxExportProvider.Export(radFlowDocument, output);
}
```

### Advanced Font Handling

If you need more control over font changes, you can implement conditional logic:

```csharp
foreach (Run run in radFlowDocument.EnumerateChildrenOfType<Run>())
{
    // Change only specific fonts
    if (run.FontFamily.ToString().Contains("Times New Roman"))
    {
        run.FontFamily = new ThemableFontFamily("Arial");
    }
    else if (run.FontFamily.ToString().Contains("Calibri"))
    {
        run.FontFamily = new ThemableFontFamily("Verdana");
    }

    // Transform bold styling to italic
    if (run.FontWeight == FontWeights.Bold)
    {
        run.FontWeight = FontWeights.Normal;
        run.FontStyle = FontStyles.Italic;
    }
    // Transform italic styling to bold
    else if (run.FontStyle == FontStyles.Italic)
    {
        run.FontStyle = FontStyles.Normal;
        run.FontWeight = FontWeights.Bold;
    }

    // Increase font size for small text, decrease for large text
    if (run.FontSize < 11)
    {
        run.FontSize = 11; // Increase smaller fonts
    }
    else if (run.FontSize > 16)
    {
        run.FontSize = 16; // Decrease larger fonts
    }
}
```

>note In **.NET Standard**, font handling for PDF export differs from other frameworks. System fonts may not be properly embedded or may use fallback fonts which can affect text appearance and layout in documents exported to PDF. For more details on how to resolve this, see the [Export section of the Flow PdfFormatProvider]({%slug radwordsprocessing-formats-and-conversion-pdf-pdfformatprovider%}#export).

## See Also

* [RadFlowDocument Overview]({%slug radwordsprocessing-model-radflowdocument%})
* [Working with Runs]({%slug radwordsprocessing-model-run%})
* [Styles and Formatting]({%slug radwordsprocessing-concepts-styles%})
* [Style Properties]({%slug radwordsprocessing-concepts-style-properties%})
