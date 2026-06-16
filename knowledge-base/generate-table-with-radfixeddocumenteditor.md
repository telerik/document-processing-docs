---
title: Generating a Table with RadFixedDocumentEditor
description: Learn how to build a table using the RadFixedDocumentEditor for flow-like content management in RadPdfProcessing without manual position calculations.
type: how-to
page_title: How to Generate a Table with RadFixedDocumentEditor
slug: generate-table-with-radfixeddocumenteditor
tags: radpdfprocessing, pdf, table, fixeddocumenteditor, document, processing, flow, fixed
res_type: kb
ticketid: 1674934
---

## Environment

| Version | Product | Author | 
| ---- | ---- | ---- | 
| 2024.4.1106| RadPdfProcessing |[Desislava Yordanova](https://www.telerik.com/blogs/author/desislava-yordanova)| 

## Description

When you create or edit a PDF document with [RadPdfProcessing]({%slug radpdfprocessing-overview%}), you need to understand how to manage the positioning of elements. To avoid repositioning all elements below a newly added element in the middle of the PDF file, use the [RadFixedDocumentEditor]({%slug radpdfprocessing-editing-radfixeddocumenteditor%}) to generate a PDF table.

## Solution

`RadPdfProcessing` provides the [`RadFixedDocumentEditor`]({%slug radpdfprocessing-editing-radfixeddocumenteditor%}), which allows a flow-like content management approach. You can insert all desired elements one after another without calculating element positions.

This editor automates element positioning. You can insert content sequentially without manually calculating positions. This option is more suitable for scenarios where manual positioning is cumbersome.

The following example shows how to create a table whose result is shown in the image after the code:

```csharp
            RadFixedDocument radFixedDocument = new RadFixedDocument();
            RadFixedDocumentEditor radFixedDocumentEditor = new RadFixedDocumentEditor(radFixedDocument);

            Table table = new Table();
            table.LayoutType = Telerik.Windows.Documents.Fixed.Model.Editing.Flow.TableLayoutType.FixedWidth;
           
            TableRow row = table.Rows.AddTableRow();
            TableCell cell = row.Cells.AddTableCell();
            cell.Blocks.AddBlock().InsertText("Account No.");
            cell.Blocks.AddBlock().InsertText("12345678910");

            cell = row.Cells.AddTableCell();
            cell.Background = new RgbColor(255, 100, 100);
            cell.Blocks.AddBlock().InsertText("Statement Date");
            cell.Blocks.AddBlock().InsertText("November 15, 2021");

            row = table.Rows.AddTableRow();
            cell = row.Cells.AddTableCell();
            cell.Blocks.AddBlock().InsertText(" ");
            cell = row.Cells.AddTableCell();
            cell.Background = new RgbColor(255, 100, 100);

            row = table.Rows.AddTableRow();
            cell = row.Cells.AddTableCell();
            cell.Blocks.AddBlock().InsertText("Account Name");
            cell.Blocks.AddBlock().InsertText("Leslie Holden");

            cell = row.Cells.AddTableCell();
            cell.Background = new RgbColor(255, 100, 100);
            cell.Blocks.AddBlock().InsertText("Period Statement from");
            cell.Blocks.AddBlock().InsertText("November 1, 2021");;

            row = table.Rows.AddTableRow();
            cell = row.Cells.AddTableCell();
            cell.Blocks.AddBlock().InsertText(" ");
            cell = row.Cells.AddTableCell();
            cell.Background = new RgbColor(255, 100, 100);

            row = table.Rows.AddTableRow();
            cell = row.Cells.AddTableCell();
            cell.Blocks.AddBlock().InsertText("Address");
            cell.Blocks.AddBlock().InsertText("4344 Poco Mas Drive");
            cell.Blocks.AddBlock().InsertText("Dallas, FL, 33009");

            cell = row.Cells.AddTableCell();
            cell.Background = new RgbColor(255, 100, 100);
            cell.Blocks.AddBlock().InsertText("Period Statement until");
            cell.Blocks.AddBlock().InsertText("November 13, 2021");  

            radFixedDocumentEditor.InsertTable(table);

            radFixedDocumentEditor.Dispose();

            string outputFilePath = "output.pdf";
            File.Delete(outputFilePath);
            PdfFormatProvider provider = new PdfFormatProvider();
            using (Stream output = File.OpenWrite(outputFilePath))
            {
                provider.Export(radFixedDocument, output, TimeSpan.FromSeconds(10));
            }

            Process.Start(new ProcessStartInfo() { FileName = outputFilePath, UseShellExecute = true });
```

The following image shows the result:

  ![Table with RadFixedDocumentEditor](images/pdf-table-with-radfixeddocumenteditor.png)    

>note `RadPdfProcessing` provides an alternative approach with **[FixedContentEditor]({%slug radpdfprocessing-editing-fixedcontenteditor%})**. This approach requires you to manage the position at which the document elements are drawn. It enables precise control over element positioning within a PDF page and acts as a pencil that allows content to be drawn at specific locations.

## See Also

* [RadPdfProcessing]({%slug radpdfprocessing-overview%})
* [RadFixedDocumentEditor]({%slug radpdfprocessing-editing-radfixeddocumenteditor%})
* [Table]({%slug radpdfprocessing-editing-table-overview%})
* [Creating Custom Layout Tables with RadPdfProcessing]({%slug customize-table-layout-radpdfprocessing%})
* [Generating a Table with Images Using PdfProcessing]({%slug generate-table-with-images-pdf-processing%})
 
