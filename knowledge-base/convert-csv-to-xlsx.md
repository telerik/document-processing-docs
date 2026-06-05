---
title: Convert CSV to XLSX
description: Learn how to convert a CSV file to XLSX format by using the RadSpreadProcessing library in Telerik Document Processing.
type: how-to 
page_title: Convert CSV to XLSX
slug: convert-csv-to-xlsx
position: 0
tags: radspreadprocessing, csv, xlsx, excel, conversion, spreadsheet, document, processing
res_type: kb
---

## Environment

|Product Version|Product|Author|
|----|----|----|
|2020.1.310|RadSpreadProcessing|[Dimitar Karamfilov](https://www.telerik.com/blogs/author/dimitar-karamfilov)|

## Description

This example shows how to convert a CSV file to XLSX format.

## Solution

Use the [SpreadProcessing]({%slug radspreadprocessing-overview%}) library to convert the file.

**Example 1: Convert CSV to XLSX**

```csharp
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

```

## See Also

* [SpreadProcessing Overview]({%slug radspreadprocessing-overview%})
* [CSV Format Provider]({%slug radspreadprocessing-formats-and-conversion-csv-csvformatprovider%})
* [XLSX Format Provider]({%slug radspreadprocessing-formats-and-conversion-xlsx-xlsxformatprovider%})
