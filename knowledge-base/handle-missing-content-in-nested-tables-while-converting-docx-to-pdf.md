---
title: How To Handle Missing Content in Nested Tables While  Converting DOCX to PDF Format
description: Learn how to achieve strict table alignment for nested tables in DOCX and PDF documents using Telerik WordsProcessing.
type: how-to
page_title: How To Handle Missing Content in Nested Tables While  Converting DOCX to PDF Format
meta_title: How To Handle Missing Content in Nested Tables While  Converting DOCX to PDF Format
slug:handle-missing-content-in-nested-tables-while-converting-docx-to-pdf
tags: telerik document, processing, words,processing, tables, alignment, pdf, docx,width,column,table, nested
res_type: kb
ticketid: 1705627
---

## Environment

| Version | Product | Author | 
| ---- | ---- | ---- | 
| 2025.4.1104| RadWordsProcessing |[Desislava Yordanova](https://www.telerik.com/blogs/author/desislava-yordanova)| 
## Description

This article shows how to achieve strict alignment for nested tables in both DOCX and PDF output using Telerik [WordsProcessing](https://docs.telerik.com/devtools/document-processing/libraries/radwordsprocessing/overview). The DOCX document generated meets the desired layout, but the PDF output does not match due to differences in format rendering. The following approach shows how to achieve consistent table layout in exported documents.

## Solution

To achieve strict alignment in both DOCX and PDF, set the table's layout type to `TableLayoutType.FixedWidth`. Define column widths explicitly to ensure consistent rendering across formats. Follow these steps:

1. Create a `RadFlowDocument` and initialize a `RadFlowDocumentEditor`.
2. Insert a main table with predefined column widths and set the layout type to `TableLayoutType.FixedWidth`.
3. For each cell in the main table, add a nested table with explicitly defined column widths.
4. Define equal column widths in the nested table using `TableWidthUnitType.Fixed`.
5. Adjust page margins and dimensions for uniform rendering in PDF.

Below is a sample code snippet illustrating the solution:

```csharp
static void Main(string[] args)
{
    RadFlowDocument flowDocument = new RadFlowDocument();
    RadFlowDocumentEditor editor = new RadFlowDocumentEditor(flowDocument);

    // Create a table with 1 row and 3 columns
    Table table = editor.InsertTable(1, 3);
    table.PreferredWidth = new TableWidthUnit(TableWidthUnitType.Fixed, 1200);
    table.LayoutType = TableLayoutType.FixedWidth;

    table.Rows[0].Cells[0].PreferredWidth = new TableWidthUnit(TableWidthUnitType.Fixed, 400);
    table.Rows[0].Cells[1].PreferredWidth = new TableWidthUnit(TableWidthUnitType.Fixed, 400);
    table.Rows[0].Cells[2].PreferredWidth = new TableWidthUnit(TableWidthUnitType.Fixed, 400);

    foreach (TableRow row in table.Rows)
    {
        foreach (TableCell cell in row.Cells)
        {
            cell.Borders = new TableCellBorders(new Border(1, BorderStyle.Single, ThemableColor.FromColor(Color.FromHex("#000000"))),
                                                new Border(1, BorderStyle.Single, ThemableColor.FromColor(Color.FromHex("#000000"))),
                                                new Border(1, BorderStyle.Single, ThemableColor.FromColor(Color.FromHex("#000000"))),
                                                new Border(1, BorderStyle.Single, ThemableColor.FromColor(Color.FromHex("#000000"))));

            Table cellTable = new Table(flowDocument, 5, 2);
            cellTable.PreferredWidth = new TableWidthUnit(TableWidthUnitType.Fixed, 400);
            cellTable.Rows[0].Cells[0].PreferredWidth = new TableWidthUnit(TableWidthUnitType.Fixed, 200);
            cellTable.Rows[0].Cells[1].PreferredWidth = new TableWidthUnit(TableWidthUnitType.Fixed, 200);
            cell.Blocks.Add(cellTable);

            Paragraph paragraph = cellTable.Rows[0].Cells[0].Blocks.AddParagraph();
            Run run = paragraph.Inlines.AddRun();
            run.Text = "1: DPO1";

            paragraph = cellTable.Rows[1].Cells[0].Blocks.AddParagraph();
            run = paragraph.Inlines.AddRun();
            run.Text = "Flow = 672.6";

            paragraph = cellTable.Rows[1].Cells[1].Blocks.AddParagraph();
            run = paragraph.Inlines.AddRun();
            run.Text = "Efficiency = 70%";

            paragraph = cellTable.Rows[2].Cells[0].Blocks.AddParagraph();
            run = paragraph.Inlines.AddRun();
            run.Text = "Head = 36.6";

            paragraph = cellTable.Rows[2].Cells[1].Blocks.AddParagraph();
            run = paragraph.Inlines.AddRun();
            run.Text = "NPSHr";

            paragraph = cellTable.Rows[3].Cells[0].Blocks.AddParagraph();
            run = paragraph.Inlines.AddRun();
            run.Text = "Pump RPM = 806";

            paragraph = cellTable.Rows[3].Cells[1].Blocks.AddParagraph();
            run = paragraph.Inlines.AddRun();
            run.Text = "Power = 187.2";

            paragraph = cellTable.Rows[4].Cells[0].Blocks.AddParagraph();
            run = paragraph.Inlines.AddRun();
            run.Text = "Tip Speed = 25.7";

            paragraph = cellTable.Rows[4].Cells[1].Blocks.AddParagraph();
            run = paragraph.Inlines.AddRun();
            run.Text = "BEP = 107.8 %";
        }
    }

    foreach (var section in flowDocument.Sections)
    {
        section.PageMargins = new Padding(0);
        section.Rotate(PageOrientation.Landscape);
        section.PageSize = new Telerik.Documents.Primitives.Size(1250, 1000);
    }

    Telerik.Windows.Documents.Flow.FormatProviders.Docx.DocxFormatProvider provider = new Telerik.Windows.Documents.Flow.FormatProviders.Docx.DocxFormatProvider();
    string docxOutputFilePath = "Sample.docx";
    File.Delete(docxOutputFilePath);
    using (Stream output = File.OpenWrite(docxOutputFilePath))
    {
        provider.Export(flowDocument, output, TimeSpan.FromSeconds(10));
    }

    PdfFormatProvider pdfProvider = new PdfFormatProvider();
    string pdfOutputFilePath = "Sample.pdf";
    File.Delete(pdfOutputFilePath);
    using (Stream output = File.OpenWrite(pdfOutputFilePath))
    {
        pdfProvider.Export(flowDocument, output, TimeSpan.FromSeconds(10));
    }
}
```

## See Also

- [WordsProcessing Documentation](https://docs.telerik.com/devtools/document-processing/libraries/radwordsprocessing/overview)
- [Table API](https://docs.telerik.com/devtools/document-processing/libraries/radwordsprocessing/features/tables)
- [PDF Export in WordsProcessing](https://docs.telerik.com/devtools/document-processing/libraries/radwordsprocessing/formats/pdf)
