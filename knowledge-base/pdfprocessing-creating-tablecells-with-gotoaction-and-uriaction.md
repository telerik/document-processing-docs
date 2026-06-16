---
title: Creating TableCells with GoToAction and UriAction
description: Learn how to create table cells with GoToAction and UriAction links in a PDF document by using RadPdfProcessing from the Telerik Document Processing libraries.
type: how-to 
page_title: Creating TableCells with GoToAction and UriAction
slug: kb-create-table-cells
position: 0
tags: radpdfprocessing, pdf, table, cell, action, hyperlink, document, processing
res_type: kb
---

## Environment

|Product Version|Product|Author|
|----|----|----|
|N/A|RadPdfProcessing|Maria Terzieva|

## Description

This article shows how to create table cells with `GoToAction` and `UriAction` in a PDF document with Telerik Document Processing.

With the PDF format, each content element has a specific position. In some cases, each character is positioned separately. The PDF standard does not have information about tables. Once exported, the tables in the document are represented by lines and text fragments. For this reason, use an Action that defines the behavior for an annotation. The annotation element associates an object with a location on a `RadFixedPage`.

## Solution

The following example shows how to create table cells with `GoToAction` and `UriAction`:

1. Create a table in the document.
2. Iterate through the elements of the page and find the target text fragment.
3. Create links to URLs or locations within the document by using actions (`UriAction` or `GoToAction`).

```csharp

    RadFixedDocument document = new RadFixedDocument();
    using (RadFixedDocumentEditor editor = new RadFixedDocumentEditor(document))
    {
        Table table = new Table();
        Border border = new Border(BorderStyle.Single);
        table.Borders = new TableBorders(left: border, top: border, right: border, bottom: border);
        TableRow firstRow = table.Rows.AddTableRow();
        TableCell firstRowFirstCell = firstRow.Cells.AddTableCell();
        firstRowFirstCell.Borders = new TableCellBorders(left: border, top: border, right: border, bottom: border);
        Block block1 = firstRowFirstCell.Blocks.AddBlock();
        block1.InsertText("Text in first cell.");

        TableRow secondRow = table.Rows.AddTableRow();
        TableCell secondRowFirstCell = secondRow.Cells.AddTableCell();
        secondRowFirstCell.Borders = new TableCellBorders(left: border, top: border, right: border, bottom: border);
        Block block2 = secondRowFirstCell.Blocks.AddBlock();
        block2.InsertText("Text in second cell.");

        editor.InsertTable(table);
    }

    RadFixedPage secondPage = document.Pages.AddPage();

    foreach (RadFixedPage page in document.Pages)
    {
        foreach (ContentElementBase element in page.Content)
        {
            if (element is TextFragment textFragment)
            {
                if (textFragment.Text == "Text in first cell.")
                {
                    Location location = new Location
                    {
                        Left = 225,
                        Top = 500,
                        Zoom = 1,
                        Page = secondPage
                    };

                    GoToAction goToAction = new GoToAction
                    {
                        Destination = location
                    };

                    Link goToLink = document.Pages[0].Annotations.AddLink(goToAction);
                    Rect clippingBounds = textFragment.Clipping.Clip.Bounds;
                    goToLink.Rect = new Rect(clippingBounds.X, clippingBounds.Y, clippingBounds.Width, clippingBounds.Height);
                }
                else if (textFragment.Text == "Text in second cell.")
                {
                    UriAction uriAction = new UriAction
                    {
                        Uri = new Uri(@"http://www.telerik.com"),
                    };

                    Link uriLink = document.Pages[0].Annotations.AddLink(uriAction);
                    Rect clippingBounds = textFragment.Clipping.Clip.Bounds;
                    uriLink.Rect = new Rect(clippingBounds.X, clippingBounds.Y, clippingBounds.Width, clippingBounds.Height);
                }
            }
        }
    }

    string outputPath = "Exported.pdf";
    if (File.Exists(outputPath))
    {
        File.Delete(outputPath);
    }

    using (Stream output = File.OpenWrite(outputPath))
    {
        PdfFormatProvider provider = new PdfFormatProvider();
        provider.Export(document, output);
    }

    Process.Start(new ProcessStartInfo() { FileName = outputPath, UseShellExecute = true });

```

## See Also

* [Link annotations]({%slug radpdfprocessing-model-annotations-links%})