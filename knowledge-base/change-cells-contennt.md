---
title: Change Cells Content 
description: Learn how to change the content of a table cell using WordsProcessing.
type: how-to 
page_title: Change Cells Content
slug: change-cells-content
position: 0
tags:  
res_type: kb
---

|Product Version|Product|Author|
|----|----|----|
|2020 R3|RadWordsProcessing|[Dimitar Karamfilov](https://www.telerik.com/blogs/author/dimitar-karamfilov)|

## Description
You have a template that contains a table and you need to get this particular table and populate its cells using WordsProcessing. 

## Solution

To get all tables you can use the __EnumerateChildrenOfType__ method, then you can iterate the table and populate the cells with data.

#### __C# Iterate table Cells and add content__

{{region kb-change-cells-content_0}}

    var provider = new DocxFormatProvider();
    var document = provider.Import(File.ReadAllBytes("template.docx"));

    var tables = document.EnumerateChildrenOfType<Table>().ToList();

    var myTable = tables[1];

    foreach (var row in myTable.Rows)
    {
        foreach (var cell in row.Cells)
        {
            if (cell.Blocks.Count <= 0)
            {
                var paragraph = cell.Blocks.AddParagraph();
                var run = paragraph.Inlines.AddRun();
                run.Text = "Test";
            }
            else
            {
                var paragraph = cell.Blocks[0] as Paragraph;
                if (paragraph != null)
                {
                    if (paragraph.Inlines.Count > 0)
                    {
                        paragraph.Inlines.Clear();
                    }
                    var run = paragraph.Inlines.AddRun();
                    run.Text = "Test";
                }
            }
        }
    }

    var bytes = provider.Export(document);
    File.WriteAllBytes("result.docx", bytes);

{{endregion}}