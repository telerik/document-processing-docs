---
title: Converting Comments of a RadFlowDocument to Annotations in RadFixedDocument 
description: Learn how to extract comments from Word documents and implement annotations in PDF using Telerik Document Processing libraries.
type: how-to
page_title: Extracting Word Document Comments and Converting to PDF Annotations
meta_title: Extracting Word Document Comments and Converting to PDF Annotations
slug: extracting-comments-flowdocuments-pdf-annotations
tags: wordsprocessing, pdfprocessing, radflowdocument, radfixeddocument, annotations
res_type: kb
ticketid: 1701044
---

## Environment

| Version | Product | Author | 
| ---- | ---- | ---- | 
| 2025.3.806| RadWordsProcessing |[Desislava Yordanova](https://www.telerik.com/blogs/author/desislava-yordanova)| 

## Description

I want to preview comments from Word documents when converting them to PDF using Telerik Document Processing libraries. Currently, comments in Word documents are not preserved during the conversion to PDF. However, I want to extract and display the comments from the Word document alongside the PDF preview. Additionally, I want to explore converting these comments into annotations in the PDF document.

This knowledge base article also answers the following questions:
- How to extract comments from Word documents using Telerik Document Processing?
- How to convert Word document comments to PDF annotations?
- How to preview annotations in PDF using Telerik Document Processing?

## Solution

To achieve the desired behavior, follow these steps:

### Extract Comments from Word Documents

Use the `RadFlowDocument` class from [Telerik WordsProcessing](https://docs.telerik.com/devtools/document-processing/libraries/radwordsprocessing/overview) to access and extract comments from Word documents.

Example code snippet:

```csharp
using System;
using System.Diagnostics;
using System.IO;
using Telerik.Windows.Documents.Flow.Model;
using Telerik.Windows.Documents.Flow.FormatProviders.Docx;

static void Main(string[] args)
{
    RadFlowDocument flowDocument;

    using (Stream input = File.OpenRead("Test.docx"))
    {
        var docxProvider = new DocxFormatProvider();
        flowDocument = docxProvider.Import(input);
    }

    foreach (Comment comment in flowDocument.Comments)
    {
        string author = comment.Author;
        DateTime date = comment.Date;
        Debug.WriteLine($"Author: {author}, Date: {date}");

        foreach (Paragraph commentText in comment.Blocks)
        {
            foreach (Run inline in commentText.Inlines)
            {
                Debug.Write(inline.Text);
            }
        }
        Debug.WriteLine("\n-------------------");
    }
}
```

### Convert Comments to PDF Annotations

Use the `RadFixedDocument` class from [Telerik PdfProcessing](https://docs.telerik.com/devtools/document-processing/libraries/radpdfprocessing/model/radfixeddocument) to add annotations for each comment in the PDF.

Example code snippet:

```csharp
private static void AddCommentsAsAnnotations(RadFixedDocument fixedDocument, RadFlowDocument flowDocument)
{
    foreach (Comment comment in flowDocument.Comments)
    {
        var commentTextBuilder = new System.Text.StringBuilder();
        foreach (Paragraph commentBlock in comment.Blocks)
        {
            foreach (Run inline in commentBlock.Inlines)
            {
                commentTextBuilder.AppendLine(inline.Text);
            }
        }

        string commentText = commentTextBuilder.ToString();

        if (fixedDocument.Pages.Count > 0)
        {
            TextSearch search = new TextSearch(fixedDocument);
            SearchResult result = search.Find(commentText, TextSearchOptions.Default);
            if (result.Result != null)
            {
                System.Windows.Rect rect = result.GetWordBoundingRect();
                RadFixedPage page = result.GetResultPage();
                TextAnnotation annotation = page.Annotations.AddText(rect);
                annotation.Contents = commentText;
                annotation.Opacity = 0.5;
                annotation.Color = new RgbColor(255, 0, 0);
            }
        }
    }
}

static void Main(string[] args)
{
    RadFlowDocument flowDocument;
    using (Stream input = File.OpenRead("Test.docx"))
    {
        var docxProvider = new DocxFormatProvider();
        flowDocument = docxProvider.Import(input);
    }

    var flowToPdfProvider = new Telerik.Windows.Documents.Flow.FormatProviders.Pdf.PdfFormatProvider();
    RadFixedDocument fixedDocument;

    using (var memoryStream = new MemoryStream())
    {
        flowToPdfProvider.Export(flowDocument, memoryStream);
        memoryStream.Position = 0;
        var fixedPdfProvider = new Telerik.Windows.Documents.Fixed.FormatProviders.Pdf.PdfFormatProvider();
        fixedDocument = fixedPdfProvider.Import(memoryStream);
    }

    AddCommentsAsAnnotations(fixedDocument, flowDocument);

    using (Stream output = File.Create("output.pdf"))
    {
        var pdfProvider = new Telerik.Windows.Documents.Fixed.FormatProviders.Pdf.PdfFormatProvider();
        pdfProvider.Export(fixedDocument, output);
    }

    Process.Start(new ProcessStartInfo() { FileName = "output.pdf", UseShellExecute = true });
}
```

### Preview PDF Annotations

Annotations added to the PDF can be previewed using the Kendo PDF Viewer. Ensure your annotations are supported by the viewer.

## See Also

- [RadFlowDocument Overview](https://docs.telerik.com/devtools/document-processing/libraries/radwordsprocessing/model/radflowdocument)
- [RadFixedDocument Overview](https://docs.telerik.com/devtools/document-processing/libraries/radpdfprocessing/model/radfixeddocument)
- [PdfProcessing Annotations Demo](https://demos.telerik.com/document-processing/pdfprocessing/annotations)
- [Kendo UI PDF Viewer Demo](https://demos.telerik.com/kendo-ui/pdfviewer/index)
- [WordsProcessing: Comments export to PDF Feedback Portal](https://feedback.telerik.com/document-processing/1680593-wordsprocessing-comments-export-to-pdf)
