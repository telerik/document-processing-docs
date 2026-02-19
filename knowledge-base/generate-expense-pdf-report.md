---
title: Generate PDF Expense Report
description: Learn how to generate a pdf expense report with attachments using Telerik Document Processing libraries.
type: how-to
page_title: How to generate an expense report
meta_title: How to generate an expense report
slug: generate-expense-pdf-report
tags: pdf, expense, report, receipt, attachment, file, embed, document, processing, telerik
res_type: kb
ticketid: 1710179
---

## Environment

| Version | Product | Author | 
| ---- | ---- | ---- | 
| 2026.1.210| RadPdfProcessing |[Desislava Yordanova](https://www.telerik.com/blogs/author/desislava-yordanova)| 

## Description

This article shows a sample approach of generating a PDF expense report. The report is purposed to contain receipt images (e.g. gas, toll, meal) or PDF attachments of receipts.

## Solution

To achieve this, use [RadPdfProcessing]({%slug radpdfprocessing-overview%}) from the Telerik Document Processing libraries. The library provides functionality for creating PDF documents, inserting images, embedding files, and merging multiple PDF documents.

### Steps to generate the PDF report

1. Create a new instance of [RadFixedDocument]({%slug radpdfprocessing-model-radfixeddocument%}).
2. Add a new [page]({%slug radpdfprocessing-model-radfixedpage%}) to the document.
3. Use [FixedContentEditor]({%slug radpdfprocessing-editing-fixedcontenteditor%}) to draw text, images, and other content onto the page.
4. Embed images and PDF files as attachments using [EmbeddedFiles.Add()]({%slug radpdfprocessing-embedded-file-streams-overview%}).
6. Export the constructed document to a PDF file using [PdfFormatProvider]({%slug radpdfprocessing-formats-and-conversion-pdf-pdfformatprovider%}).

### Code Example

The following code demonstrates creating a PDF report containing embedded images and PDF files:

```csharp
internal class Program
{
    static void Main(string[] args)
    {
        string outputFilePath = "ExpenseReport.pdf";
        File.Delete(outputFilePath);
        string receiptImagePath = "receipt.png"; // Replace with your image path
        string receiptPdfPath = "sample_receipt.pdf"; // Replace with your PDF path
        Build("John Smith", "January 2026", receiptImagePath, receiptPdfPath, outputFilePath);

        Process.Start(new ProcessStartInfo() { FileName = outputFilePath, UseShellExecute = true });
    }

    public static void Build(string employeeName,
                             string periodLabel,
                             string receiptImagePath,
                             string receiptPdfPath,
                             string outputPdfPath)
    {
        var document = new RadFixedDocument();
        var page = document.Pages.AddPage();
        var editor = new FixedContentEditor(page);
        const double left = 50, top = 50;
        editor.Position.Translate(left, top);

        var h1 = new Block();
        h1.TextProperties.FontSize = 20;
        h1.TextProperties.Font = FontsRepository.TimesBold;
        h1.InsertText("Expense Report");
        editor.DrawBlock(h1);
        editor.Position.Translate(editor.Position.Matrix.OffsetX + 50, editor.Position.Matrix.OffsetY + 50);

        var info = new Block();
        info.SpacingBefore = 6;
        info.TextProperties.FontSize = 12;
        info.InsertText($"Employee: {employeeName}\n");
        info.InsertText($"Period:   {periodLabel}\n");
        editor.DrawBlock(info);
        editor.Position.Translate(editor.Position.Matrix.OffsetX, editor.Position.Matrix.OffsetY + 50);

        var note = new Block();
        note.SpacingBefore = 8;
        note.TextProperties.FontSize = 10;
        note.InsertText("Note: This PDF contains embedded attachments (see the Attachments panel in your PDF viewer).");
        editor.DrawBlock(note);
        editor.Position.Translate(editor.Position.Matrix.OffsetX, editor.Position.Matrix.OffsetY + 50);

        if (File.Exists(receiptImagePath))
        {
            Telerik.Windows.Documents.Fixed.Model.Objects.Image img = new Telerik.Windows.Documents.Fixed.Model.Objects.Image();
            using (FileStream fileStream = new FileStream(receiptImagePath, FileMode.Open))
            {
                ImageSource imageSrc = new ImageSource(fileStream);
                img.ImageSource = imageSrc;
                img.Width = 500;
                img.Height = 740;
                SimplePosition simplePosition = new SimplePosition();
                simplePosition.Translate(200, 300);
                img.Position = simplePosition;
                page.Content.Add(img);
            }

            byte[] pdfBytes = File.ReadAllBytes(receiptImagePath);
            var embedded = document.EmbeddedFiles.Add(Path.GetFileName(receiptImagePath), pdfBytes);
            embedded.MimeType = "image/png";
        }

        if (File.Exists(receiptPdfPath))
        {
            byte[] pdfBytes = File.ReadAllBytes(receiptPdfPath);
            var embedded = document.EmbeddedFiles.Add(Path.GetFileName(receiptPdfPath), pdfBytes);
            embedded.MimeType = "application/pdf";
        }

        var provider = new PdfFormatProvider();
        Directory.CreateDirectory(Path.GetDirectoryName(Path.GetFullPath(outputPdfPath)) ?? ".");
        using var outStream = File.Create(outputPdfPath);
        provider.Export(document, outStream, TimeSpan.FromSeconds(10));
    }
}
```

## See Also

- [RadPdfProcessing]({%slug radpdfprocessing-overview%})
- [FixedContentEditor]({%slug radpdfprocessing-editing-fixedcontenteditor%}) 
