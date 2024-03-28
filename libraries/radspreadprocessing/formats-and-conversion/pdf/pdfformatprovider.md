---
title: Using PdfFormatProvider
page_title: Using PdfFormatProvider
slug: radspreadprocessing-formats-and-conversion-pdf-pdfformatprovider
tags: using,pdfformatprovider
published: True
position: 2
---

# Using PdfFormatProvider



__PdfFormatProvider__ is part of SpreadProcessing which allows export to PDF format.
      

## Using PdfFormatProvider

__PdfFormatProvider__ makes it easy to export a Workbook to a PDF format. Each Worksheet exported to PDF is being divided into pages according to its WorksheetPageSetup. More information about paging a Worksheet is available in the [Worksheet Page Setup]({%slug radspreadprocessing-features-worksheetpagesetup%}) documentation article.

>note For more examples and application scenarios of Importing and Exporting a Workbook to various formats using a FormatProvider check out the [Import/Load and Export/Save RadSpreadProcessing Workbook]({%slug import-export-save-load-workbook%}) knowledge base article.
  

## Prerequisites

In order to use __PdfFormatProvider__ you need to add references to the assemblies listed below:
        

* Telerik.Windows.Documents.Spreadsheet.dll
            

* Telerik.Windows.Documents.Spreadsheet.FormatProviders.Pdf.dll
            

## Export

>note The **.NET Standard** specification does not define APIs for getting specific fonts. **PdfFormatProvider** needs to have access to the font data so that it can read it and add it to the PDF file. That is why, to allow the library to create and use fonts, you will need to provide an implementation of the **FontsProviderBase** abstract class and set this implementation to the **FontsProvider** property of **FixedExtensibilityManager**. For detailed information, check the [Cross-Platform Support]({%slug radpdfprocessing-cross-platform%}) article.

>note **.NET Standard**: In order to export images different than **Jpeg** and **Jpeg2000** or **ImageQuality** different than High, the **JpegImageConverter** property inside the **FixedExtensibilityManager** has to be set. For more information check the FixedExtensibilityManager in the [PdfProcessing`s Cross-Platform Support]({%slug radpdfprocessing-cross-platform%})


__Example 1__ shows how to use __PdfFormatProvider__ to export a Workbook to a file.
        

#### __[C#] Example 1: PdfFormatProvider export example__

{{region cs-radspreadprocessing-formats-and-conversion-pdf-pdfformatprovider_0}}

    Telerik.Windows.Documents.Spreadsheet.FormatProviders.Pdf.PdfFormatProvider pdfFormatProvider = new Telerik.Windows.Documents.Spreadsheet.FormatProviders.Pdf.PdfFormatProvider();
    using (Stream output = File.OpenWrite("Sample.pdf"))
    {
        Workbook workbook = CreateSampleWorkbook(); // The CreateSampleWorkbook() method generates a sample spreadsheet document. Use your Workbook object here.
        pdfFormatProvider.Export(workbook, output);
    }
{{endregion}}



The result from the export method is a document that can be opened in any application that supports PDF documents.
        
#### __[C#] Example 2: Export to RadFixedDocument__
{{region cs-radspreadprocessing-formats-and-conversion-pdf-pdfformatprovider_1}}
	Workbook workbook = CreateSampleWorkbook();
	
	Telerik.Windows.Documents.Spreadsheet.FormatProviders.Pdf.PdfFormatProvider provider = new Telerik.Windows.Documents.Spreadsheet.FormatProviders.Pdf.PdfFormatProvider();
	RadFixedDocument fixedDocument = provider.ExportToFixedDocument(workbook);
{{endregion}}

>tip __RadFixedDocument__ is the base class of the __RadPdfProcessing__ library. Additional information on the library and its functionality can be found [here]({%slug radpdfprocessing-overview%}).

## See Also
- [How to Eliminate Formatting Issues when Exporting XLSX to PDF Format]({%slug exporting-xlsx-to-pdf-formatting-issues%}})
- [Import/Load and Export/Save RadSpreadProcessing Workbook]({%slug import-export-save-load-workbook%})

