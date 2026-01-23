---
title: Using XlsmFormatProvider
page_title: Import and Export to Xlsm File Format Using XlsmFormatProvider
description: Import and Export to Xlsm File Format Using XlsmFormatProvider
slug: radspreadprocessing-formats-and-conversion-xlsm-xlsmformatprovider
tags: Xlsmformatprovider,excel,workbook,xlsm,import,export,save
published: True
position: 1

---

# Using XlsmFormatProvider


__XlsmFormatProvider__ makes it easy to import and export Xlsm (Excel Workbook that supports Macros) files. An Xlsm file is a group of zipped files that conform to the Office Open XML schema. That said, the format allows you export all parts of a workbook: worksheets, formula values, formatting, hyperlinks, etc.

> Currently the Macros are only preserved during import and export. They cannot be executed or changed in the code.

>Unlike the CSV and TXT format providers, the __XlsmFormatProvider__ requires references to the following packages:
>* Telerik.Windows.Documents.Spreadsheet.FormatProviders.OpenXml.
>* ~~Telerik.Windows.Zip~~*

>note *As of **Q2 2025** the Zip Library will no longer be used as an internal dependency in the rest of the Document Processing Libraries - PdfProcessing, WordsProcessing, SpreadProcessing, SpreadStreamProcessing. It will be replaced by the System.IO.Compression. We will continue to ship the Telerik Zip Library as a standalone library so clients can still use it separately.

Once you reference the aforementioned packages, you need to create an instance of the __XlsmFormatProvider__ in order to import and export Xlsm (Excel Workbook) files. This provider appears in the Telerik.Windows.Documents.Spreadsheet.FormatProviders.OpenXml.Xlsm namespace. __XlsmFormatProvider__ implements the __IWorkbookFormatProvider__ interface, which in turn appears in the Telerik.Windows.Documents.Spreadsheet.FormatProviders. Depending on the whether you would like to work with the concrete class or the interface, you would need to include either the first or both namespaces.

>note For more examples and application scenarios of Importing and Exporting a Workbook to various formats using a FormatProvider check out the [Import/Load and Export/Save RadSpreadProcessing Workbook]({%slug import-export-save-load-workbook%}) knowledge base article.


## Import

__Example 1__ shows how to import an Xlsm file using a FileStream. The code assures that a file with the specified name exists. Further, the sample instantiates an __XlsmFormatProvider__ and passes a FileStream to its __Import()__ method.
        

#### __Example 1: Import Xlsm (Excel Workbook) file__

```csharp
    string fileName = "SampleFile.Xlsm";
    if (!File.Exists(fileName))
    {
        throw new FileNotFoundException(String.Format("File {0} was not found!", fileName));
    }


    Telerik.Windows.Documents.Spreadsheet.Model.Workbook workbook;
    Telerik.Windows.Documents.Spreadsheet.FormatProviders.OpenXml.Xlsm.XlsmFormatProvider formatProvider = new Telerik.Windows.Documents.Spreadsheet.FormatProviders.OpenXml.Xlsm.XlsmFormatProvider();

    using (Stream input = new FileStream(fileName, FileMode.Open))
    {
        workbook = formatProvider.Import(input, TimeSpan.FromSeconds(10));
    }

```

## Export

__Example 2__ demonstrates how to export an existing Workbook to an Xlsm file. The snippet creates a new workbook with a single worksheet. Further, the example creates an __XlsmFormatProvider__ and invokes its __Export()__ method. Note that the __Export()__ method accepts a parameter of type __Stream__ so you can work with any of its inheritors.

>Exporting worbook created with RadSpreadProcessing will result in a file with empty Macros (VBA Project).

#### __Example 2: Export spreadsheet document to Xlsm (Excel Workbook) file__

```csharp
    Telerik.Windows.Documents.Spreadsheet.Model.Workbook workbook = new Telerik.Windows.Documents.Spreadsheet.Model.Workbook();
    workbook.Worksheets.Add();
    string fileName = "SampleFile.Xlsm";


    Telerik.Windows.Documents.Spreadsheet.FormatProviders.OpenXml.Xlsm.XlsmFormatProvider formatProvider = new Telerik.Windows.Documents.Spreadsheet.FormatProviders.OpenXml.Xlsm.XlsmFormatProvider();

    using (Stream output = new FileStream(fileName, FileMode.Create))
    {
        formatProvider.Export(workbook, output, TimeSpan.FromSeconds(10));
    }


```


#### __Example 3: Export spreadsheet document to a Stream and byte[]__

```csharp

    Telerik.Windows.Documents.Spreadsheet.Model.Workbook workbook = new Telerik.Windows.Documents.Spreadsheet.Model.Workbook();
    workbook.Worksheets.Add();

    Telerik.Windows.Documents.Spreadsheet.FormatProviders.OpenXml.Xlsm.XlsmFormatProvider formatProvider = new Telerik.Windows.Documents.Spreadsheet.FormatProviders.OpenXml.Xlsm.XlsmFormatProvider();

    byte[] bytes;
    using (MemoryStream output = new MemoryStream())
    {
        formatProvider.Export(workbook, output, TimeSpan.FromSeconds(10));
        bytes = output.ToArray();
    }

``` 

## See Also

* [Import/Load and Export/Save RadSpreadProcessing Workbook]({%slug import-export-save-load-workbook%})
* [Timeout Mechanism]({%slug timeout-mechanism-in-dpl%})