---
title: Creating Headers with Left, Center, and Right Text/Image in Exported PDF Documents Using RadWordsProcessing
description: Learn how to customize headers in PDF documents to have left, center, and right-aligned text using RadWordsProcessing library.
type: how-to
page_title: How to Customize Headers in PDF Documents with RadWordsProcessing
slug: customize-headers-pdf-radwordsprocessing
tags: wordsprocessing, document, processing, header, alignment, pdf, convert, html
res_type: kb
ticketid: 1665701
---

## Environment

| Version | Product | Author | 
| ---- | ---- | ---- | 
| 2024.3.806| RadWordsProcessing |[Desislava Yordanova](https://www.telerik.com/blogs/author/desislava-yordanova)| 

## Description
This article demonstrates how to generate a [RadFlowDocument]({%slug radwordsprocessing-model-radflowdocument%}), divide a header into three sections, and customize the font settings for each section respectively using the [RadWordsProcessing]({%slug radwordsprocessing-overview%}) library.

![Left, Center, Right Headers](images/left-center-right-header.png)    

## Solution

To achieve a header with left, center, and right aligned sections in a PDF document, use the [RadWordsProcessing]({%slug radwordsprocessing-overview%}) library to create a header and then insert a [Table]({%slug radwordsprocessing-model-table%}) with three [cells]({%slug radwordsprocessing-model-tablecell%}) into the header. Each cell represents one section of the header (left, center, right) and can contain text or an image. The following steps and code snippet demonstrate this process:

1. Create a new [RadFlowDocument]({%slug radwordsprocessing-model-radflowdocument%}) and add a section to it.
2. Define the page size and margins for the section.
3. Add a paragraph with some text to the document as content.
4. Add a header to the first section of the document.
5. Inside the header, add a table with a single row and three cells.
6. Set the preferred width for each cell to one-third of the page width.
7. Add text or an image to each cell with the desired alignment (left, center, right).
8. Use the [PdfFormatProvider]({%slug radwordsprocessing-formats-and-conversion-pdf-pdfformatprovider%}) to export the document to a PDF file.

```csharp
static void Main(string[] args)
{
            RadFlowDocument document = new RadFlowDocument();
            Section contentSection = document.Sections.AddSection();
            contentSection.PageMargins = new Telerik.Windows.Documents.Primitives.Padding(40, 40, 40, 40);
            Size size = Telerik.Windows.Documents.Model.PaperTypeConverter.ToSize(PaperTypes.A4);
            contentSection.PageSize = size;
            contentSection.Blocks.AddParagraph().Inlines.AddRun("Hello RadWordsProcessing!");

            Header header = document.Sections.First().Headers.Add();

            Table table = header.Blocks.AddTable();
            TableRow row = table.Rows.AddTableRow();

            TableCell cell = new TableCell(document);

            Run leftHeader = new Run(document);
            leftHeader.Text = "Left";
            leftHeader.FontWeight = FontWeights.Bold;
            leftHeader.FontSize = 16;  
            cell.Blocks.AddParagraph().Inlines.Add (leftHeader);
            cell.PreferredWidth = new TableWidthUnit(size.Width / 3);
            row.Cells.Add(cell);

            cell = new TableCell(document);
            Paragraph p = cell.Blocks.AddParagraph();

            Run centerHeader = new Run(document);
            centerHeader.Text = "Center";
            centerHeader.FontWeight = FontWeights.Regular;
            centerHeader.FontStyle = FontStyles.Italic; 
            centerHeader.FontSize = 18; 
            p.Inlines.Add(centerHeader);

            p = cell.Blocks.AddParagraph();
            ImageInline imageInline = new ImageInline(document);
            imageInline.Image.Width = 50;
            imageInline.Image.Height = 50;
            byte[] data = File.ReadAllBytes("ProgressNinjas.png");
            imageInline.Image.ImageSource = new ImageSource(data, "png");
            p.Inlines.Add(imageInline);
            cell.PreferredWidth = new TableWidthUnit(size.Width / 3);
            row.Cells.Add(cell);

            cell = new TableCell(document);
            Run rightHeader = new Run(document);
            rightHeader.Text = "Right";
            rightHeader.FontWeight = FontWeights.Bold;
            rightHeader.FontStyle = FontStyles.Italic;
            rightHeader.FontSize = 20; 
            cell.Blocks.AddParagraph().Inlines.Add(rightHeader);
            cell.PreferredWidth = new TableWidthUnit(size.Width / 3);
            row.Cells.Add(cell);

            PdfFormatProvider provider = new PdfFormatProvider();

            string outputFilePath = "output.pdf";
            using (Stream output = File.OpenWrite(outputFilePath))
            {
                provider.Export(document, output);
            }

            Process.Start(new ProcessStartInfo() { FileName = outputFilePath, UseShellExecute = true });
}
```

This method allows for flexible customization of headers in PDF documents, enabling the addition of left, center, and right aligned text within the same header.

## See Also

- [RadWordsProcessing]({%slug radwordsprocessing-overview%})
- [RadFlowDocument]({%slug radwordsprocessing-model-radflowdocument%})
- [Working with Tables in RadWordsProcessing]({%slug radwordsprocessing-model-table%})
