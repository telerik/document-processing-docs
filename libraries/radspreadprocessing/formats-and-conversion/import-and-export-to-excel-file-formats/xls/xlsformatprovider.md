---
title: Using XlsFormatProvider
page_title: Import and Export to Excel 97-2003 File Format Using XlsFormatProvider
description: Import and Export to Excel 97-2003 File Format Using XlsFormatProvider
slug: radspreadprocessing-formats-and-conversion-xls-xlsformatprovider
tags: xlsformatprovider,excel97-2003,workbook,xls,import,export,save
published: True
position: 2
platforms: core, mvc, ajax, blazor, wpf, winforms, xamarin, winui
---

# Using XlsFormatProvider

__XlsFormatProvider__ makes it easy to import and export to XLS (Excel 97-2003 Workbook) files. The functionality is available since R3 2020.

>The __XlsFormatProvider__ requires references to the following assembly:
        
>* Telerik.Windows.Documents.Spreadsheet.FormatProviders.Xls.dll

Once you reference the aforementioned assemblies, you need to create an instance of the __XlsFormatProvider__ in order to import and export Excel 97-2003 Workbook files. This provider appears in the Telerik.Windows.Documents.Spreadsheet.FormatProviders.Xls namespace. __XlsFormatProvider__ implements the __IWorkbookFormatProvider__ interface, which in turn appears in the Telerik.Windows.Documents.Spreadsheet.FormatProviders. Depending on the whether you would like to work with the concrete class or the interface, you would need to include either the first or both namespaces.
      

## Import

__Example 1__ shows how to import an XLS file using a FileStream. The code assures that a file with the specified name exists. Further, the sample instantiates an __XlsFormatProvider__ and passes a FileStream to its __Import()__ method.
        

#### __[C#] Example 1: Import XLS (Excel 97-2003 Workbook) file__

{{region cs-radspreadprocessing-formats-and-conversion-xls-xlsformatprovider_0}}

    string fileName = "SampleFile.xls";
    if (!File.Exists(fileName))
    {
        throw new FileNotFoundException(String.Format("File {0} was not found!", fileName));
    }
    
    Telerik.Windows.Documents.Spreadsheet.Model.Workbook workbook;
    IWorkbookFormatProvider formatProvider = new Telerik.Windows.Documents.Spreadsheet.FormatProviders.Xls.XlsFormatProvider();
    
    using (Stream input = new FileStream(fileName, FileMode.Open))
    {
        workbook = formatProvider.Import(input);
    }
{{endregion}}



## Export

__Example 2__ demonstrates how to export an existing Workbook to an XLS file. The snippet creates a new workbook with a single worksheet. Further, the example creates an __XlsFormatProvider__ and invokes its __Export()__ method. Note that the __Export()__ method accepts a parameter of type __Stream__ so you can work with any of its inheritors.
        

#### __[C#] Example 2: Export spreadsheet document to XLS (Excel 97-2003 Workbook) file__

{{region cs-radspreadprocessing-formats-and-conversion-xls-xlsformatprovider_1}}
    Telerik.Windows.Documents.Spreadsheet.Model.Workbook workbook = new Telerik.Windows.Documents.Spreadsheet.Model.Workbook();
    workbook.Worksheets.Add();
    string fileName = "SampleFile.xls";
    
    Telerik.Windows.Documents.Spreadsheet.FormatProviders.IWorkbookFormatProvider formatProvider = new Telerik.Windows.Documents.Spreadsheet.FormatProviders.Xls.XlsFormatProvider();
    
    using (Stream output = new FileStream(fileName, FileMode.Create))
    {
        formatProvider.Export(workbook, output);
    }
{{endregion}}


#### __[C#] Example 3: Export spreadsheet document to a Stream and byte[]__

{{region cs-radspreadprocessing-formats-and-conversion-xls-xlsformatprovider_2}}

    Telerik.Windows.Documents.Spreadsheet.Model.Workbook workbook = new Telerik.Windows.Documents.Spreadsheet.Model.Workbook();
    workbook.Worksheets.Add();
    
    Telerik.Windows.Documents.Spreadsheet.FormatProviders.IWorkbookFormatProvider formatProvider = new Telerik.Windows.Documents.Spreadsheet.FormatProviders.Xls.XlsFormatProvider();
    
    byte[] bytes;
    using (MemoryStream output = new MemoryStream())
    {
        formatProvider.Export(workbook, output);
        bytes = output.ToArray();
    }
{{endregion}}


*This documentation is neither affiliated with, nor authorized, sponsored, or approved by, Microsoft Corporation.
