---
title: General Information
page_title: General Information
slug: radspreadprocessing-formats-and-conversion-general-information
tags: formats,and,conversion
published: True
position: 0
---

# General Information

__RadSpreadProcessing__'s document model allows you to easily open and save files of different formats. This article will share more details on the [supported formats](#supported-formats), [available format providers](#format-providers), the [additional assembly references](#additional-assembly-references) each provider requires and the [Format Providers Manager](#format-providers-manager).

## Supported formats      

* __Xlsx__: Rich text format, which exports the whole content of a workbook: worksheets, formula values, formatting, hyperlinks etc.
* __Xls__: Rich text format, which exports the content of a workbook: worksheets, formula values, formatting, hyperlinks etc. Supported in older applications. This format is not supported in Silverlight.
* __Xlsm__: Rich text format, which exports all that is included in the Xlsx format with the addition of macro instructions.
* __Pdf__: Fixed format, which preserves the content of a workbook in independent from software or hardware manner.
* __Csv__(comma separated): Plain text format that saves the content of the cell in the active worksheet. The format strips all formatting and keeps only the result values of cells. These values are separated by a culture dependent delimiter.
* __Txt__(tab delimited): Plain text format, which preserves only the content of the cells in the active worksheet. The format does not save any formatting and keeps only the result values of the cells. These values are delimited via tabs.
* **DataTable**: This allows you to convert the DataTable that is coming form your database to a spreadsheet and vice versa. 

>note In **Q4 2024** Telerik Document Processing Libraries introduced a new timeout mechanism for importing and exporting documents. The **Import** and **Export** methods of all FormatProviders have a mandatory *TimeSpan?* timeout parameter after which the operation will be cancelled.  


## Format providers​          

The document model exposes separate format providers that work with each of the formats above: 
- [XlsxFormatProvider]({%slug radspreadprocessing-formats-and-conversion-xlsx-xlsxformatprovider %}) for `.xlsx` files
- [XlsFormatProvider]({%slug radspreadprocessing-formats-and-conversion-xls-xlsformatprovider %}) for `.xls` files
- [XlsmFormatProvider]({%slug radspreadprocessing-formats-and-conversion-xlsm-xlsmformatprovider %}) for `.xlsm` files
- [PdfFormatProvider]({%slug radspreadprocessing-formats-and-conversion-pdf-pdfformatprovider %}) for `.pdf` files
- [CsvFormatProvider]({%slug radspreadprocessing-formats-and-conversion-csv-csvformatprovider %}) for comma separated `.csv` files
- [TxtFormatProvider]({%slug radspreadprocessing-formats-and-conversion-txt-txtformatprovider %}) for tab delimited `.txt` files
- [DataTableFormatProvider]({%slug radspreadprocessing-formats-and-conversion-using-data-table-format-provider %}) for `DataTable` objects

> Some FormatProviders require additional assembly references. Check them out in the [Additional Assemlby References](#additional-assembly-references) section.
 
## Import and Export methods

All of the listed providers implement the `IWorkbookFormatProvider` and `IBinaryWorkbookFormatProvider` interfaces and, thus, share a common API that enables import and export of files. To conform to the interfaces each of the providers implements two methods that, respectively, turn a `Stream` or `byte[]` into a workbook and save the contents of the workbook into a `Stream` or `byte[]`. In the [IWorkbookFormatProvider interface methods](#iworkbookformatprovider-interface-methods) and  [IBinaryWorkbookFormatProvider interface methods](#ibinaryworkbookformatprovider-interface-methods) sections below you can see the interfaces' declaration and an example usage of the Import and Export methods.

### IWorkbookFormatProvider interface methods

````C#
public interface IWorkbookFormatProvider
{
    string Name { get; }
    string FilesDescription { get; }
    IEnumerable<string> SupportedExtensions { get; }
    bool CanImport { get; }
    bool CanExport { get; }

    // Import and Export methods with Stream support
    void Export(Workbook workbook, Stream output);
    Workbook Import(Stream input);
}
````

__Example__: Use FormatProver's Import() and Export() methods with `Stream` array 

````C#
var path = "MyWorkbook.xlsx";
Telerik.Windows.Documents.Spreadsheet.Model.Workbook workbook;
IWorkbookFormatProvider formatProvider = new Telerik.Windows.Documents.Spreadsheet.FormatProviders.OpenXml.Xlsx.XlsxFormatProvider();

// Import 
using (Stream input = new FileStream(path, FileMode.Open))
{
    workbook = formatProvider.Import(input);
}

// Export
using (Stream output = new FileStream(path, FileMode.Create))
{
    formatProvider.Export(workbook, output);
}
````


### IBinaryWorkbookFormatProvider interface methods

````C#
public interface IBinaryWorkbookFormatProvider : IWorkbookFormatProvider
{
    // Overloading IWorkbookFormatProvider's Import and Export methods to support byte[]
    byte[] Export(Workbook workbook);
    Workbook Import(byte[] input);
}
````

__Example__: Use FormatProver's Import() and Export() methods with `byte[]` array 

````C#
var path = "MyWorkbook.xlsx";
Telerik.Windows.Documents.Spreadsheet.Model.Workbook workbook;
IBinaryWorkbookFormatProvider formatProvider = new Telerik.Windows.Documents.Spreadsheet.FormatProviders.OpenXml.Xlsx.XlsxFormatProvider();

// Import
byte[] fileAsByteArray = File.ReadAllBytes(path);
workbook = formatProvider.Import(fileAsByteArray);

// Export
byte[] workbookAsByteArray = formatProvider.Export(workbook);
````

>note For more examples of importing and exporting workbooks check out the [Import/Load and Export/Save RadSpreadProcessing Workbook]({%slug import-export-save-load-workbook%}) knowledge base article.

## Additional assembly references

Unlike the __CsvFormatProvider__, __TxtFormatProvider__ and __DataTableFormatProvider__ classes, the other RadSpreadProcessing format providers require references to additional assemblies.

- **XlsxFormatProvider** and **XlsmFormatProvider** additional assembly references
  * Telerik.Windows.Documents.Spreadsheet.FormatProviders.OpenXml.dll
  * Telerik.Windows.Zip.dll

- **PdfFormatProvider**
  * Telerik.Windows.Documents.Spreadsheet.FormatProviders.Pdf.dll

- **XlsFormatProvider**
  * Telerik.Windows.Documents.Spreadsheet.FormatProviders.Xls.dll


## Format Providers Manager

The document model of RadSpreadProcessing also contains a __WorkbookFormatProvidersManager__ class, which exposes a whole set of useful static methods. The manager also allows you to specify a set of format providers you would like to use. Then you can import and export a file leaving the manager to choose the appropriate format provider to use. You only need to specify the extension of the file that you open or save.

More information on the Format Providers Manager and the __WorkbookFormatProvidersManager__ class can be found in the dedicated [Format Providers Manager]({%slug radspreadprocessing-formats-and-conversion-format-providers-manager %}) article.
      
````C#
public class WorkbookFormatProvidersManager
{
    public static IEnumerable<IWorkbookFormatProvider> FormatProviders { get; }

    public static void Export(Workbook workbook, string extension, Stream output);
    public static void Export(Workbook workbook, string extension, Stream output, IEnumerable<IWorkbookFormatProvider> formatProviders);

    public static IWorkbookFormatProvider GetProviderByExtension(string extension);
    public static IWorkbookFormatProvider GetProviderByName(string providerName);

    public static IEnumerable<string> GetSupportedExtensions();
    
    public static Workbook Import(string extension, Stream input);
    public static Workbook Import(string extension, Stream input, IEnumerable<IWorkbookFormatProvider> formatProviders);
    
    public static void RegisterFormatProvider(IWorkbookFormatProvider provider);
    public static void UnregisterFormatProvider(IWorkbookFormatProvider provider);
}
````

## See Also

 * [Activate a Worksheet]({%slug radspreadprocessing-working-with-worksheets-activate-worksheet%})
