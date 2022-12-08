---
title: Creating TableCells with GoToAction and UriAction
description: This article demonstrates how can create table cells with GoTo action and UriAction in PDF document with Telerik Document Processing.
type: how-to 
page_title: Creating TableCells with GoToAction and UriAction
slug: 
position: 0
tags: pdf, datatable, cells, widget
res_type: kb
---

|Product Version|Product|Author|
|----|----|----|
|N/A|Telerik Document Processing|Maria Terzieva|

## Description

The pdf format is different than the format in MS Word or other commonly used editors. With the PDF format, each content element has a specific position, and in some cases, each character is positioned separately. PDF standard does not have any information about tables as well, once exported the tables in the document are represented by lines and text fragments. 

Although the editors do not allow you to insert the widgets it is possible to insert a place holder and then use its postion to insert the widget.

## Solution

This article shows example of how you implement solution for inserting a widget.

## Table of Contents

 - [Convert a Document to PDF](#convert-a-document-to-pdf)
	- [DOCX to PDF](#convert-docx-to-pdf)
	- [DOC to PDF](#convert-doc-to-pdf)
	- [HTML to PDF](#convert-html-to-pdf)
	- [RTF to PDF](#convert-rtf-to-pdf)
	- [Plain text to PDF](#convert-txt-to-pdf)
- [Convert a Spreadsheet Document to PDF](#convert-a-spreadsheet-document-to-pdf)
	- [XLSX to PDF](#convert-xlsx-to-pdf)
	- [XLS to PDF](#convert-xls-to-pdf)
	- [CSV to PDF](#convert-csv-to-pdf)	
	- [DataTable object to PDF](#convert-datatable-to-pdf)	
	

## Insert widgets in table cell

````C#
var doc = new RadFixedDocument();

var editor = new RadFixedDocumentEditor(doc);
editor.InsertRun("Sample Document");

Table table = new Table();
for (int i = 0; i < 100; i++)
{
    TableRow row = table.Rows.AddTableRow();
    for (int j = 0; j < 5; j++)
    {
        var cell = row.Cells.AddTableCell();
        cell.Blocks.AddBlock().InsertText("Test");
    }
}
TableRow lastRow = table.Rows.AddTableRow();
var lastCell = lastRow.Cells.AddTableCell();
lastCell.Blocks.AddBlock().InsertText("##FieldHolder");

editor.InsertTable(table);

var provider = new PdfFormatProvider();
var docBytes = provider.Export(doc);

var document = provider.Import(docBytes);

SimplePosition holderPosition = new SimplePosition();
RadFixedPage holderPage = null;

foreach (var page in document.Pages)
{
    foreach (var element in page.Content)
    {
        if (element is TextFragment fragment)
        {
            if (fragment.Text == "##FieldHolder")
            {
                var fragmentPosition = fragment.Position;
                holderPosition.Translate(fragmentPosition.Matrix.OffsetX, fragmentPosition.Matrix.OffsetY);
                holderPage = page;
                fragment.Text = "";
            }
        }
    }
}

TextBoxField textField = new TextBoxField("SampleTextBox")
{
    MaxLengthOfInputCharacters = 500,
    IsMultiline = true,
    IsPassword = false,
    IsFileSelect = false,
    ShouldSpellCheck = true,
    AllowScroll = true,
    Value = "Sample content",
};

VariableContentWidget widget = textField.Widgets.AddWidget();
widget.Rect = new Rect(new Point(holderPosition.Matrix.OffsetX, holderPosition.Matrix.OffsetY), new Size(250, 50));
widget.RecalculateContent();

document.AcroForm.FormFields.Add(textField);
holderPage.Annotations.Add(widget);

File.WriteAllBytes(@"..\..\result.pdf", provider.Export(document));
````