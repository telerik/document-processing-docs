---
title: Generating a Table with RadFixedDocumentEditor
description: Learn how to build a table using the RadFixedDocumentEditor for flow-like content management in RadPdfProcessing.
type: how-to
page_title: How to Generate a Table with RadFixedDocumentEditor
slug: generate-table-with-radfixeddocumenteditor
tags: pdf, document, processing, fixedcontenteditor, fixeddocumenteditor, edit, table, flow, position
res_type: kb
ticketid: 1674934
---
| Version | Product | Author | 
| ---- | ---- | ---- | 
| 2024.4.1106| RadPdfProcessing |[Desislava Yordanova](https://www.telerik.com/blogs/author/desislava-yordanova)| 

## Description

When creating or editing a PDF document using [RadPdfProcessing]({%slug radpdfprocessing-overview%}), understanding how to manage the positioning of elements is essential. To eliminate the necessity of repositioning all elements below a newly added element in the middle of the PDF file, explore the functionality offered by the [RadFixedDocumentEditor]({%slug radpdfprocessing-editing-radfixeddocumenteditor%}) to generate a PDF table.

## Solution

RadPdfProcessing offers the [RadFixedDocumentEditor]({%slug radpdfprocessing-editing-radfixeddocumenteditor%}, which allows for a flow-like content management approach and allows you to insert all desired elements one after another without calculating the elements' position. We will use this approach to generate the PDF table.

 This editor automates the positioning of elements, enabling you to insert content sequentially without manually calculating positions. This option might be more suitable for scenarios where manual positioning is cumbersome.

The following example demonstrates how to create a table whose result is illustrated below:

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

The observed result is illustrated below:

  ![Table with RadFixedDocumentEditor](images/pdf-table-with-radfixeddocumenteditor.png)    

>note RadPdfProcessing offers an alternative approach with **[FixedContentEditor]({%slug radpdfprocessing-editing-fixedcontenteditor%})**. However, it requires managing the Position at which the document elements will be drawn. Enables precise control over the element's positioning within a PDF page. It acts as a pencil, allowing content to be drawn at specific locations.

## See Also
- [RadPdfProcessing]({%slug radpdfprocessing-overview%})
- [RadFixedDocumentEditor]({%slug radpdfprocessing-editing-radfixeddocumenteditor%})
- [Table]({%slug radpdfprocessing-editing-table%})
- [Creating Custom Layout Tables with RadPdfProcessing]({%slug customize-table-layout-radpdfprocessing%})
- [How to Generate a Table with Images with PdfProcessing]({%slug generate-table-with-images-pdf-processing%})
 
