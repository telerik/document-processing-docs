---
title: Generating a Table with RadFixedDocumentEditor
description: Learn how to build a table using RadFixedDocumentEditor in RadPdfProcessing and explores the alternative RadFixedDocumentEditor for a flow-like content management.
type: how-to
page_title: How to Generate a Table with RadFixedDocumentEditor
slug: generate-table-with-radfixeddocumenteditor
tags: pdf, document, processing, fixedcontenteditor, radfixeddocumenteditor, edit, table
res_type: kb
ticketid: 1674934
---
| Version | Product | Author | 
| ---- | ---- | ---- | 
| 2024.4.1106| RadPdfProcessing |[Desislava Yordanova](https://www.telerik.com/blogs/author/desislava-yordanova)| 

## Description

When creating or editing a PDF document using [RadPdfProcessing]({%slug radpdfprocessing-overview%}), understanding how to manage the positioning of elements is essential. This knowledge base article addresses the question of whether it's necessary to reposition all elements below a newly added element in the middle of the PDF file using [FixedContentEditor]({%slug radpdfprocessing-editing-fixedcontenteditor%}) and explores the alternative functionality offerred by the [RadFixedDocumentEditor]({%slug radpdfprocessing-editing-radfixeddocumenteditor%}) to generate a PDF table.

## Solution

RadPdfProcessing offers two options for manipulating the content in a PDF document:

* **[FixedContentEditor]({%slug radpdfprocessing-editing-fixedcontenteditor%})** - requires managing the Position at which the document elements will be drawn.

* **[RadFixedDocumentEditor]({%slug radpdfprocessing-editing-radfixeddocumenteditor%})** - manages the document's content in a flow-like manner and allows you to insert all desired elements one after another without calculating the elements' position.

### Managing Elements with FixedContentEditor

The [FixedContentEditor]({%slug radpdfprocessing-editing-fixedcontenteditor%}) in RadPdfProcessing enables precise control over the element's positioning within a PDF page. It acts as a pencil, allowing content to be drawn at specific locations. After adding an element, adjust the editor's Position to prevent overlapping with subsequent elements. This method requires manual management of each element's position, especially when inserting a new element amidst existing ones.

For more insights on using FixedContentEditor effectively, consider reviewing these resources:
- [Creating Custom Layout Tables with RadPdfProcessing]({%slug customize-table-layout-radpdfprocessing%})
- [How to Generate a Table with Images with PdfProcessing]({%slug generate-table-with-images-pdf-processing%})

### Flow-Like Content Management with RadFixedDocumentEditor

Alternatively, RadPdfProcessing offers the [RadFixedDocumentEditor]({%slug radpdfprocessing-editing-radfixeddocumenteditor%}, which allows for a flow-like content management approach. This editor automates the positioning of elements, enabling you to insert content sequentially without manually calculating positions. This option might be more suitable for scenarios where manual positioning is cumbersome.

The following example demonstrates how to create a table which result is illustrated below:

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

  ![Table with RadFixedDocumentEditor](images/pdf-table-with-radfixeddocumenteditor.png)    

## See Also
- [RadPdfProcessing]({%slug radpdfprocessing-overview%})
- [RadFixedDocumentEditor]({%slug radpdfprocessing-editing-radfixeddocumenteditor%})
- [Table]({%slug radpdfprocessing-editing-table%})

 
