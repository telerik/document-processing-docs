---
title: Create, Open and Save Workbooks
page_title: Create, Open and Save Workbooks
slug: radspreadprocessing-working-with-workbooks-create-open-and-save-workbooks
tags: create,,open,and,save,workbooks
published: True
position: 1
---

# Create, Open and Save Workbooks



You have the possibility to create workbooks from scratch, open existing files as workbooks and save workbooks into different file formats. This article aims to help you get familiar with these operations.
      

* [Create a Workbook](#create-a-workbook)

* [Open a Workbook](#open-a-workbook)

* [Save a Workbook](#save-a-workbook)

## Create a Workbook

The fact that __RadSpreadProcessing__ is completely decoupled from UI enables numerous server side scenarios that build a document from scratch. The model allows you to instantiate a new workbook using the nullary constructor of the __Workbook__ class. Note that when a new workbook is created in this manner its __Worksheet__'s collection is still empty. 

__Example 1__ creates a new workbook and adds its first worksheet, which also becomes the __ActiveWorksheet__ of the workbook.
        

#### __[C#] Example 1: Create a workbook and add a worksheet to it__

{{region cs-radspreadprocessing-working-with-workbooks-create-open-and-save-workbooks_0}}
	Telerik.Windows.Documents.Spreadsheet.Model.Workbook workbook = new Telerik.Windows.Documents.Spreadsheet.Model.Workbook();
	Telerik.Windows.Documents.Spreadsheet.Model.Worksheet worksheet = workbook.Worksheets.Add();
{{endregion}}



## Open a Workbook

__RadSpreadProcessing__ allows you to easily import a workbook from a number of formats. Currently, the model supports `csv`, `txt`, `xlsx`, `xls` file formats and `DataTable` objects. 

To import a workbook, you need to instantiate a specific [FormatProvider]({%slug radspreadprocessing-formats-and-conversion-general-information%}), invoke its __Import()__ method and pass a `Stream` or `byte[]` array as an argument. 

__Example 2__ uses a WebClient to download a `xlsx` file stored on a server. Further, the code creates a [XlsxFormatProvider]({%slug radspreadprocessing-formats-and-conversion-xlsx-xlsxformatprovider%}) object and invokes its `public Workbook Import(Stream stream)` method.
        

#### __[C#] Example 2: Download and import xlsx file__

{{region cs-radspreadprocessing-working-with-workbooks-create-open-and-save-workbooks_1}}
	const string FilePath = @"http://localhost:54352/Resourses/SampleFile.xlsx";
	WebClient webClient = new WebClient();
	
	webClient.OpenReadCompleted += (sender, eventArgs) =>
	{
	    Telerik.Windows.Documents.Spreadsheet.FormatProviders.OpenXml.Xlsx.XlsxFormatProvider formatProvider = new Telerik.Windows.Documents.Spreadsheet.FormatProviders.OpenXml.Xlsx.XlsxFormatProvider();
	    Telerik.Windows.Documents.Spreadsheet.Model.Workbook workbook = formatProvider.Import(eventArgs.Result);
	};
	
	webClient.OpenReadAsync(new Uri(FilePath));
{{endregion}}



>note Additional examples about import are available in the [Import/Load and Export/Save RadSpreadProcessing Workbook]({%slug import-export-save-load-workbook%}) knowledge base article.
        

## Save a Workbook


__RadSpreadProcessing__ also allows you to save a workbook into a `XLSX`, `XLS`, `CSV`, `TXT`, and `PDF` file formats as well as into a `DataTable` object. 

To export a workbook, you need to instantiate the [FormatProvider]({%slug radspreadprocessing-formats-and-conversion-general-information%}) you would like to use and invoke its __Export()__ method. 

__Example 3__ demonstrates how to export an existing Workbook to a `XLSX` file. The snippet creates a new workbook with a single worksheet. Further, it creates a [XlsxFormatProvider]({%slug radspreadprocessing-formats-and-conversion-xlsx-xlsxformatprovider%}) object and invokes its `public void Export(Workbook workbook, Stream output)`. Saving to the other formats is done in the same way, using a different format provider class.
          

#### __[C#] Example 3: Save XLSX file__

{{region cs-radspreadprocessing-working-with-workbooks-create-open-and-save-workbooks_3}}
	Telerik.Windows.Documents.Spreadsheet.Model.Workbook workbook = new Telerik.Windows.Documents.Spreadsheet.Model.Workbook();
	workbook.Worksheets.Add();
	
	string fileName = "SampleFile.xlsx";
	IWorkbookFormatProvider formatProvider = new Telerik.Windows.Documents.Spreadsheet.FormatProviders.OpenXml.Xlsx.XlsxFormatProvider();
	
	using (Stream output = new FileStream(fileName, FileMode.Create))
	{
	    formatProvider.Export(workbook, output);
	}
{{endregion}}


For security purposes accessing files in *Silverlight* can be achieved only through user-initiated dialogs. That said, to save workbook's contents into a `csv` file, you need to use the `SaveFileDialog`. 

__Example 4__ passes the stream returned by the dialog and the current workbook to the __Export()__ method of the [CsvFormatProvider]({%slug radspreadprocessing-formats-and-conversion-csv-csvformatprovider %}).
          

#### __[C#] Example 4: Save csv file using SaveFileDialog__

{{region cs-radspreadprocessing-working-with-workbooks-create-open-and-save-workbooks_2}}
	Telerik.Windows.Documents.Spreadsheet.Model.Workbook workbook = new Telerik.Windows.Documents.Spreadsheet.Model.Workbook();
	workbook.Worksheets.Add();
	
	SaveFileDialog saveFileDialog = new SaveFileDialog();
	Telerik.Windows.Documents.Spreadsheet.FormatProviders.TextBased.Csv.CsvFormatProvider formatProvider = new Telerik.Windows.Documents.Spreadsheet.FormatProviders.TextBased.Csv.CsvFormatProvider();
	saveFileDialog.Filter = "CSV (comma delimited) (*.csv)|*.csv|All Files (*.*)|*.*";
	
	if (saveFileDialog.ShowDialog() == true)
	{
	    using (Stream output = saveFileDialog.OpenFile())
	    {
	        formatProvider.Export(workbook, output);
	    }
	}
{{endregion}}


>note Additional examples about export are available in the [Import/Load and Export/Save RadSpreadProcessing Workbook]({%slug import-export-save-load-workbook%}) knowledge base article.

## See Also

* [Formats and Conversion]({%slug radspreadprocessing-formats-and-conversion-general-information%}) 
* [Import/Load and Export/Save RadSpreadProcessing Workbook KB]({%slug import-export-save-load-workbook%}) 


