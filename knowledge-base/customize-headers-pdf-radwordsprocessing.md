---
title: Creating Headers with Left, Center, and Right Alignment in PDFs Using RadWordsProcessing
description: Learn how to customize headers in PDF documents to have left, center, and right aligned text using RadWordsProcessing library.
type: how-to
page_title: How to Customize Headers in PDF Documents with RadWordsProcessing
slug: customize-headers-pdf-radwordsprocessing
tags: radwordsprocessing, document processing, header, alignment, pdf, convert html to pdf
res_type: kb
ticketid: 1665701
---

## Environment

| Version | Product | Author | 
| --- | --- | ---- | 
| 2024.3.806| RadWordsProcessing |[Desislava Yordanova](https://www.telerik.com/blogs/author/desislava-yordanova)| 

## Description
When converting HTML documents to PDF format, it might be necessary to customize the document header to include left, center, and right aligned text. This article demonstrates how to divide a header into three sections and assign alignment to each section respectively using the RadWordsProcessing library.

This KB article also answers the following questions:
- How can I add different alignments to a single header in a PDF document?
- Is it possible to divide a PDF document header into three sections using RadWordsProcessing?
- What is the method to set left, center, and right alignments in document headers when converting HTML to PDF?

## Solution

To achieve a header with left, center, and right aligned sections in a PDF document, use the RadWordsProcessing library to create a header and then insert a table with three cells into the header. Each cell represents one section of the header (left, center, right) and can contain text with the desired alignment. The following steps and code snippet demonstrate this process:

1. Create a new `RadFlowDocument` and add a section to it.
2. Define the page size and margins for the section.
3. Add a paragraph with some text to the document as content.
4. Add a header to the first section of the document.
5. Inside the header, add a table with a single row and three cells.
6. Set the preferred width for each cell to one-third of the page width.
7. Add text to each cell with the desired alignment (left, center, right).
8. Use the `PdfFormatProvider` to export the document to a PDF file.

```csharp
static void Main(string[] args)
{
    RadFlowDocument document = new RadFlowDocument();
    Section contentSection = document.Sections.AddSection();
    contentSection.PageMargins = new Telerik.Windows.Documents.Primitives.Padding(40, 40, 40, 40);
    Size size = PaperTypeConverter.ToSize(PaperTypes.A4);
    contentSection.PageSize = size;
    contentSection.Blocks.AddParagraph().Inlines.AddRun("Hello RadWordsProcessing!");

    Header header = document.Sections.First().Headers.Add();

    Table table = header.Blocks.AddTable();
    TableRow row = table.Rows.AddTableRow();

    TableCell cell = new TableCell(document);
    cell.Blocks.AddParagraph().Inlines.AddRun("Left");
    cell.PreferredWidth = new TableWidthUnit(size.Width / 3);
    row.Cells.Add(cell);

    cell = new TableCell(document);
    cell.Blocks.AddParagraph().Inlines.AddRun("Center");
    cell.PreferredWidth = new TableWidthUnit(size.Width / 3);
    row.Cells.Add(cell);

    cell = new TableCell(document);
    cell.Blocks.AddParagraph().Inlines.AddRun("Right");
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

- [RadWordsProcessing Documentation](https://docs.telerik.com/devtools/document-processing/libraries/radwordsprocessing/overview)
- [RadFlowDocument Overview](https://docs.telerik.com/devtools/document-processing/libraries/radwordsprocessing/model/radflowdocument)
- [Working with Tables in RadWordsProcessing](https://docs.telerik.com/devtools/document-processing/libraries/radwordsprocessing/model/table)
