---
title: Settings
page_title: Settings
slug: radspreadprocessing-format-and-conversion-pdf-settings
tags: settings
published: True
position: 3
---

# Settings



__PdfFormatProvider__ allows to export PDF documents. Additionally, there are a number of settings that allow you to modify the export. The current article outlines the available settings.
      

## 

__PdfExportSettings__ allow controlling how a __Workbook__ is exported to PDF. Using __PdfExportSettings__ you may specify:
        

* __ExportWhat__: Enumeration specifying whether to export the __Active Sheet__, the __Entire Workbook__ or the current __Selection__.
            

* __IgnorePrintArea__: Boolean value indicating whether or not to ignore print area when exporting worksheets.
            
* __IncludeHiddenSheets__: Bolean value indicating whether to include the hidden sheets or to skip them. Default value is `false`.

* __SelectedRanges property__: A list of ranges specifying which areas of the active worksheet should be exported. Using the __ExportWhat.Selection__ option you may specify that you need to export exactly this __SelectedRanges__ from the current worksheet, __ignoring PrintArea and PageBreaks__ from __WorksheetPageSetup__.

* __PdfFileSettings__:  A property of type __Telerik.Windows.Documents.Fixed.FormatProviders.Pdf.Export.PdfExportSettings__ which is a class related to the [RadPdfProcessing library]({%slug radpdfprocessing-overview%}). Thus, the property allows you to control the image quality, encryption, compliance level and other PDF format related properties. More information on the settings is available in the [export settings article for RadPdfProcessing]({%slug radpdfprocessing-formats-and-conversion-pdf-settings%}).

* **ChartRenderer**: A property of type [IPdfChartRenderer](https://docs.telerik.com/devtools/document-processing/api/telerik.windows.documents.spreadsheet.formatproviders.pdf.export.ipdfchartrenderer) that gets or sets the renderer which will be used to render charts. It is not relevant for the .NET Standard version of the Telerik Document Processing libraries. Read more in the [Export Chart to PDF]({%slug radspreadprocessing-features-charts-pdf-export%}) article. 


__Example 1__ shows how to export the Entire Workbook without ignoring the __PrintArea__ property in all worksheets.
        

#### __Example 1: Export entire workbook__

```csharp
	PdfFormatProvider provider = new PdfFormatProvider();
	provider.ExportSettings = new PdfExportSettings(ExportWhat.EntireWorkbook, false);
```



__Example 2__ shows how to export only two selected ranges from the active worksheet, ignoring print areas and page breaks.
        

#### __Example 2: Export selection__

```csharp
	CellRange[] rangesToExport = new CellRange[]
	{
	    new CellRange(2, 3, 10, 15),
	    new CellRange(4, 5, 8, 20)
	};
	
	PdfFormatProvider provider = new PdfFormatProvider();
	provider.ExportSettings = new PdfExportSettings(rangesToExport);
```


>In order to specify file export settings to the __PdfFormatProvider__ you need to add both the Telerik.Windows.Documents.Fixed.FormatProviders.Pdf.Export and Telerik.Windows.Documents.Flow.FormatProviders.Pdf.Export namespaces. In Example 3 the *Fixed* alias corresponds to the __Telerik.Windows.Documents.Fixed.FormatProviders.Pdf.Export__ namespace.


Another export option is to specify settings specific to the PDF format to the exported document. __Example 3__ demonstrates how to utilize the __PdfFileSettings__ property in order to export a PDF/A-compliant document.


#### __Example 3: Export PDF/A compliant document__

```csharp
	PdfFormatProvider provider = new PdfFormatProvider();
	
	Fixed.PdfExportSettings fileSettings = new Fixed.PdfExportSettings();
	fileSettings.ComplianceLevel = Fixed.PdfComplianceLevel.PdfA2B;
	
	provider.ExportSettings.PdfFileSettings = fileSettings;
```


## See Also

* [PdfProcessing Export Settings]({%slug radpdfprocessing-formats-and-conversion-pdf-settings%})
* [PdfProcessing PDF/A Compliancy]({%slug radpdfprocessing-concepts-comply-with-pdfa-standard%})
