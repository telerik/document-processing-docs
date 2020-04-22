---
title: Convert CSV to XLSX
description: Convert CSV to XLSX
type: how-to 
page_title: Convert CSV to XLSX
slug: convert-csv-to-xlsx
position: 0
tags: csv, xlsx, excel, spreadprocessing
res_type: kb
---

|Product Version|Product|Author|
|----|----|----|
|2020.1.310|RadSpreadProcessing|[Dimitar Karamfilov](https://www.telerik.com/blogs/author/dimitar-karamfilov)|

## Description

Th below example shows how you can easily convert a CSV file to XLSX format.  

## Solution

Use the [SpreadProcessing]({%slug radspreadprocessing-overview%}) library to convert the file. 

#### __C# Convert CSV to XLSX__

{{region kb-convert-to-xlsx1}}
    static void Main(string[] args)
    {
        string fileName = @"..\\..\FileName.csv";
        if (!File.Exists(fileName))
        {
            throw new FileNotFoundException(String.Format("File {0} was not found!", fileName));
        }

        Workbook workbook;
        var csvFormatProvider = new CsvFormatProvider();

        using (Stream input = new FileStream(fileName, FileMode.Open))
        {
            workbook = csvFormatProvider.Import(input);
        }


        string resultFile = @"..\\..\ResultFile.xlsx";

        var formatProvider = new Telerik.Windows.Documents.Spreadsheet.FormatProviders.OpenXml.Xlsx.XlsxFormatProvider();

        using (Stream output = new FileStream(resultFile, FileMode.Create))
        {
            formatProvider.Export(workbook, output);
        }

        System.Diagnostics.Process.Start(resultFile);
    }

{{endregion}}

