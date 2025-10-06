---
title: Using XlsxFormatProvider
page_title: Import and Export to Excel File Format Using XlsxFormatProvider
description: Import and Export to XLSX File Format Using XlsxFormatProvider
slug: radspreadprocessing-formats-and-conversion-xlsx-xlsxformatprovider
tags: xlsxformatprovider,excel,workbook,xlsx,import,export,save
published: True
position: 2
---

# Using XlsxFormatProvider



__XlsxFormatProvider__ makes it easy to import and export XLSX (Excel Workbook) files. An XLSX file is a group of zipped files that conform to the Office Open XML schema. That said, the format allows you export all parts of a workbook: worksheets, formula values, formatting, hyperlinks, etc.
      

>Unlike the CSV and TXT format providers, the __XlsxFormatProvider__ requires references to the following assemblies:    
>* Telerik.Windows.Documents.Spreadsheet.FormatProviders.OpenXml.dll         

>note *As of **Q2 2025** the Zip Library will no longer be used as an internal dependency in the rest of the Document Processing Libraries - PdfProcessing, WordsProcessing, SpreadProcessing, SpreadStreamProcessing. It will be replaced by the System.IO.Compression. We will continue to ship the Telerik Zip Library as a standalone library so clients can still use it separately.           

Once you reference the aforementioned assemblies, you need to create an instance of the __XlsxFormatProvider__ in order to import and export XLSX (Excel Workbook) files. This provider appears in the Telerik.Windows.Documents.Spreadsheet.FormatProviders.OpenXml.Xlsx namespace. __XlsxFormatProvider__ implements the __IWorkbookFormatProvider__ interface, which in turn appears in the Telerik.Windows.Documents.Spreadsheet.FormatProviders. Depending on the whether you would like to work with the concrete class or the interface, you would need to include either the first or both namespaces.

>note For more examples and application scenarios of Importing and Exporting a Workbook to various formats using a FormatProvider check out the [Import/Load and Export/Save RadSpreadProcessing Workbook]({%slug import-export-save-load-workbook%}) knowledge base article.
  

## Import

__Example 1__ shows how to import an xlsx file using a FileStream. The code assures that a file with the specified name exists. Further, the sample instantiates an __XlsxFormatProvider__ and passes a FileStream to its __Import()__ method.
        

#### __[C#] Example 1: Import XLSX (Excel Workbook) file__

{{region cs-radspreadprocessing-formats-and-conversion-xlsx-xlsxformatprovider_0}}

    string fileName = "SampleFile.xlsx";
    if (!File.Exists(fileName))
    {
        throw new FileNotFoundException(String.Format("File {0} was not found!", fileName));
    }

    Telerik.Windows.Documents.Spreadsheet.Model.Workbook workbook;
    IWorkbookFormatProvider formatProvider = new Telerik.Windows.Documents.Spreadsheet.FormatProviders.OpenXml.Xlsx.XlsxFormatProvider();

    using (Stream input = new FileStream(fileName, FileMode.Open))
    {
        workbook = formatProvider.Import(input, TimeSpan.FromSeconds(10));
    }

{{endregion}}



## Export

__Example 2__ demonstrates how to export an existing Workbook to an xlsx file. The snippet creates a new workbook with a single worksheet. Further, the example creates an __XlsxFormatProvider__ and invokes its __Export()__ method. Note that the __Export()__ method accepts a parameter of type __Stream__ so you can work with any of its inheritors.
        

#### __[C#] Example 2: Export spreadsheet document to XLSX (Excel Workbook) file__

{{region cs-radspreadprocessing-formats-and-conversion-xlsx-xlsxformatprovider_1}}

     Telerik.Windows.Documents.Spreadsheet.Model.Workbook workbook = new Telerik.Windows.Documents.Spreadsheet.Model.Workbook();
     workbook.Worksheets.Add();
     string fileName = "SampleFile.xlsx";

     Telerik.Windows.Documents.Spreadsheet.FormatProviders.IWorkbookFormatProvider formatProvider = new Telerik.Windows.Documents.Spreadsheet.FormatProviders.OpenXml.Xlsx.XlsxFormatProvider();

     using (Stream output = new FileStream(fileName, FileMode.Create))
     {
         formatProvider.Export(workbook, output, TimeSpan.FromSeconds(10));
     }

{{endregion}}


#### __[C#] Example 3: Export spreadsheet document to a Stream and byte[]__

{{region cs-radspreadprocessing-formats-and-conversion-xlsx-xlsxformatprovider_2}}

    Telerik.Windows.Documents.Spreadsheet.Model.Workbook workbook = new Telerik.Windows.Documents.Spreadsheet.Model.Workbook();
    workbook.Worksheets.Add();

    Telerik.Windows.Documents.Spreadsheet.FormatProviders.IWorkbookFormatProvider formatProvider = new Telerik.Windows.Documents.Spreadsheet.FormatProviders.OpenXml.Xlsx.XlsxFormatProvider();

    byte[] bytes;
    using (MemoryStream output = new MemoryStream())
    {
        formatProvider.Export(workbook, output, TimeSpan.FromSeconds(10));
        bytes = output.ToArray();
    }

{{endregion}}


*This documentation is neither affiliated with, nor authorized, sponsored, or approved by, Microsoft Corporation.

## See Also

* [Import/Load and Export/Save RadSpreadProcessing Workbook]({%slug import-export-save-load-workbook%})
* [Timeout Mechanism]({%slug timeout-mechanism-in-dpl%})
* [Resolve Exporting Corrupted Excel Files With SpreadProcessing]({%slug resolving-excel-file-corruption-warning-after-spreadprocessing-export%})
