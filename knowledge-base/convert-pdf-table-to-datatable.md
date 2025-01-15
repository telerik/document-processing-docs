---
title: Converting PDF Table Content to DataTable
description: Learn how to transform a table from a PDF file into a DataTable object using the Telerik Document Processing libraries.
type: how-to
page_title: How to Convert PDF Table to DataTable with Telerik Document Processing
slug: convert-pdf-table-to-datatable
tags: document, processing, table, datatable, convert
res_type: kb
ticketid: 1675626
---

## Environment

| Version | Product | Author | 
| ---- | ---- | ---- | 
| 2024.4.1106| Telerik Document Processing Libraries|[Desislava Yordanova](https://www.telerik.com/blogs/author/desislava-yordanova)| 

## Description

Learn how to convert a specific table from a PDF file into a DataTable object using Telerik Document Processing libraries.

## Solution

Telerik Document Processing libraries do not offer a direct method to convert PDF table to a DataTable object. However, a feasible workaround is available. This method involves utilizing MS Excel or [RadSpreadsheet](https://docs.telerik.com/devtools/winforms/controls/spreadsheet/overview) for the intermediary conversion step.

1. Select and copy the desired table's content from the PDF file.
2. Paste the copied content into MS Excel or RadSpreadsheet. This step converts the PDF table into an Excel format.
3. Save the document into XLSX with [RadSpreadProcessing]({%slug radspreadprocessing-overview%}).
4. Use the RadSpreadProcessing library to convert the Excel document into a DataTable. Utilize the [DataTableFormatProvider]({%slug radspreadprocessing-formats-and-conversion-using-data-table-format-provider%}) from RadSpreadProcessing for this conversion.

Here is a code snippet demonstrating the conversion of an XLSX document to a DataTable using RadSpreadProcessing:

```csharp
using Telerik.Windows.Documents.Spreadsheet.FormatProviders.OpenXml.Xlsx;
using Telerik.Windows.Documents.Spreadsheet.Model;
using System.Data;
using Telerik.Windows.Documents.Spreadsheet.FormatProviders;

// Load the XLSX file
Workbook workbook;
using (FileStream input = new FileStream("path_to_your_xlsx_file.xlsx", FileMode.Open))
{
    IWorkbookFormatProvider formatProvider = new XlsxFormatProvider();
    workbook = formatProvider.Import(input);
}

// Convert the first worksheet to DataTable
Worksheet worksheet = workbook.Worksheets[0];
DataTable dataTable = new DataTable();

DataTableFormatProvider dataTableFormatProvider = new DataTableFormatProvider();
dataTable = dataTableFormatProvider.Export(worksheet);
```

This solution provides a way to parse PDF table content and use it as a DataTable, leveraging the powerful features of Telerik Document Processing libraries.

## See Also

- [RadWordsProcessing Overview](https://docs.telerik.com/devtools/document-processing/libraries/radwordsprocessing/overview)
- [RadSpreadProcessing Overview](https://docs.telerik.com/devtools/document-processing/libraries/radspreadprocessing/overview)
- [Using DataTable Format Provider](https://docs.telerik.com/devtools/document-processing/libraries/radspreadprocessing/formats-and-conversion/data-table/using-data-table-format-provider)
- [Import and Export to Excel File Formats](https://docs.telerik.com/devtools/document-processing/libraries/radspreadprocessing/formats-and-conversion/import-and-export-to-excel-file-formats/xlsx/xlsx)
