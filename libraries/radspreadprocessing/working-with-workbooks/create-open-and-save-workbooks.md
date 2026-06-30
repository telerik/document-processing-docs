---
title: Create, Open and Save Workbooks
description: Learn how to create, open existing files as, and save workbooks in different formats using RadSpreadProcessing.
page_title: Create, Open and Save Workbooks
slug: radspreadprocessing-working-with-workbooks-create-open-and-save-workbooks
tags: workbook, spreadsheet, radspreadprocessing, create, open, save, xlsx, formats
published: True
position: 1
---

# Create, Open and Save Workbooks



You can create workbooks from scratch, open existing files as workbooks, and save workbooks into different file formats. The following sections describe these operations.
      

* [Create a Workbook](#create-a-workbook)

* [Open a Workbook](#open-a-workbook)

* [Save a Workbook](#save-a-workbook)

## Create a Workbook

The fact that RadSpreadProcessing is completely decoupled from UI enables numerous server side scenarios that build a document from scratch. The model allows you to create a new workbook using the nullary constructor of the `Workbook` class. When a new workbook is created in this manner, its `Worksheets` collection is still empty. 

**Example 1** creates a new workbook and adds its first worksheet, which also becomes the `ActiveWorksheet` of the workbook.
        

**Example 1: Create a Workbook and Add a Worksheet to It**

<snippet id='libraries-spread-working-with-workbooks-create-open-and-save-workbooks-1'/>



## Open a Workbook

RadSpreadProcessing allows you to import a workbook from a number of formats. The model supports `csv`, `txt`, `xlsx`, `xls` file formats, and `DataTable` objects. 

To import a workbook, instantiate a specific [FormatProvider]({%slug radspreadprocessing-formats-and-conversion-general-information%}), invoke its `Import()` method, and pass a `Stream` or `byte[]` array as an argument. 

**Example 2** uses a `WebClient` to download a `xlsx` file stored on a server. The code then creates a [XlsxFormatProvider]({%slug radspreadprocessing-formats-and-conversion-xlsx-xlsxformatprovider%}) object and invokes its `public Workbook Import(Stream stream)` method.
        

**Example 2: Download and Import XLSX File**

<snippet id='libraries-spread-working-with-workbooks-create-open-and-save-workbooks-2'/>



>note Additional examples about import are available in the [Import/Load and Export/Save RadSpreadProcessing Workbook]({%slug import-export-save-load-workbook%}) knowledge base article.
        

## Save a Workbook


RadSpreadProcessing also allows you to save a workbook into a `XLSX`, `XLS`, `CSV`, `TXT`, and `PDF` file format as well as into a `DataTable` object. 

To export a workbook, instantiate the [FormatProvider]({%slug radspreadprocessing-formats-and-conversion-general-information%}) you want to use and invoke its `Export()` method. 

**Example 3** demonstrates how to export an existing `Workbook` to a `XLSX` file. The snippet creates a new workbook with a single worksheet. It then creates a [XlsxFormatProvider]({%slug radspreadprocessing-formats-and-conversion-xlsx-xlsxformatprovider%}) object and invokes its `public void Export(Workbook workbook, Stream output)` method. Saving to the other formats works the same way with a different format provider class.
          

**Example 3: Save XLSX File**

<snippet id='libraries-spread-working-with-workbooks-create-open-and-save-workbooks-3'/>


For security purposes accessing files in *Silverlight* can be achieved only through user-initiated dialogs. That said, to save workbook's contents into a `csv` file, you need to use the `SaveFileDialog`. 

**Example 4** passes the stream returned by the dialog and the current workbook to the `Export()` method of the [CsvFormatProvider]({%slug radspreadprocessing-formats-and-conversion-csv-csvformatprovider %}).
          

**Example 4: Save CSV File Using SaveFileDialog**

<snippet id='libraries-spread-working-with-workbooks-create-open-and-save-workbooks-4'/>


>note Additional examples about export are available in the [Import/Load and Export/Save RadSpreadProcessing Workbook]({%slug import-export-save-load-workbook%}) knowledge base article.

## See Also

* [Formats and Conversion]({%slug radspreadprocessing-formats-and-conversion-general-information%}) 
* [Import/Load and Export/Save RadSpreadProcessing Workbook KB]({%slug import-export-save-load-workbook%}) 


