```markdown
---
title: Exporting Spreadsheet with Chart in .NET Standard
description: Learn how to export a spreadsheet containing an image and a chart to a PDF in a .NET MAUI application using Telerik Document Processing libraries.
type: how-to
page_title: Export Spreadsheet with Chart in .NET Standard
meta_title: Export Spreadsheet with Chart in .NET Standard
slug: export-spreadsheet-with-chart-net-standard
tags: spreadprocessing,telerik document processing,charts,pdf-export,images
res_type: kb
ticketid: 1663021
---

## Environment

<table>
<tbody>
<tr>
<td>Product</td>
<td>SpreadProcessing for Telerik Document Processing</td>
</tr>
<tr>
<td>Version</td>
<td>Current</td>
</tr>
</tbody>
</table>

## Description

I want to export an existing spreadsheet template containing an image and a chart into a PDF file in a .NET MAUI application. The chart is linked to data that I modify programmatically. However, I encounter two issues:  
1. An error occurs when exporting the spreadsheet if it contains an image.  
2. The chart does not display in the resulting PDF.

This knowledge base article also answers the following questions:
- How to export a spreadsheet with a chart and image to PDF in .NET MAUI?
- How to handle missing chart rendering in PDF export using Telerik SpreadProcessing?
- How to resolve text-cutting issues in exported PDFs with SpreadProcessing?

## Solution

Follow these steps to export a spreadsheet with an image and a workaround for the chart rendering issue:

### 1. Handle Image Export

Use a custom `ImagePropertiesResolver` and `JpegImageConverter` to enable image exporting with Telerik SpreadProcessing in .NET MAUI.

```csharp
Telerik.Windows.Documents.Extensibility.FixedExtensibilityManager.ImagePropertiesResolver = new CustomImagePropertiesResolver();
Telerik.Windows.Documents.Extensibility.FixedExtensibilityManager.JpegImageConverter = new CustomJpegImageConverter();
```

Implement the `CustomImagePropertiesResolver` and `CustomJpegImageConverter` classes to handle image decoding and conversion.

### 2. Register a Custom Fonts Provider

Set a custom fonts provider to eliminate text formatting issues in the exported PDF.

```csharp
Telerik.Windows.Documents.Extensibility.FixedExtensibilityManager.FontsProvider = new CustomFontsProvider();
SpreadExtensibilityManager.TextMeasurer = new SpreadFixedTextMeasurer();
```

### 3. Workaround for Chart Export

Currently, exporting charts to PDF is supported only in the .NET Framework version of Telerik SpreadProcessing. As a workaround, export the chart in the Excel file as an image and add it to the PDF manually.

#### Export Chart as Image
1. Extract the chart as an image before exporting to PDF. Use libraries like SkiaSharp or ImageSharp for this purpose.
2. Add the chart image to the PDF using the Telerik PdfProcessing API.

### 4. Ensure Proper NuGet Configuration

Ensure the Telerik NuGet server is correctly configured. Add the `Telerik.Documents.ImageUtils` package separately if it is not included in the dependencies.

```plaintext
https://nuget.telerik.com/v3/index.json
```

### 5. Handling Text-Cutting Issues

To resolve text-cutting problems in the exported PDF:
1. Use the `SpreadFixedTextMeasurer` instance.
2. Ensure proper font embedding by setting `FontEmbeddingType.Full` in the `PdfExportSettings`.

```csharp
var pdfExportSettings = new Telerik.Windows.Documents.Fixed.FormatProviders.Pdf.Export.PdfExportSettings
{
    FontEmbeddingType = FontEmbeddingType.Full,
    ImageQuality = ImageQuality.High
};
settings.PdfFileSettings = pdfExportSettings;
```

### Complete Code Example

Integrate these solutions into your MAUI application as shown below:

```csharp
private async Task GeneratePdfWithSpreadsheetTemplate(CancellationToken cancellationToken)
{
    Workbook workbook;

    // Load the spreadsheet
    IWorkbookFormatProvider workbookProvider = new XlsxFormatProvider();
    using (Stream input = await FileSystem.OpenAppPackageFileAsync("Resources/ReportModel.xlsx"))
    {
        workbook = workbookProvider.Import(input);
    }

    // Modify the workbook
    Worksheet worksheet = workbook.ActiveWorksheet;
    worksheet.Cells[9, 10].SetValue(10);

    // Register custom resolvers and fonts
    FixedExtensibilityManager.ImagePropertiesResolver = new CustomImagePropertiesResolver();
    FixedExtensibilityManager.JpegImageConverter = new CustomJpegImageConverter();
    FixedExtensibilityManager.FontsProvider = new CustomFontsProvider();
    SpreadExtensibilityManager.TextMeasurer = new SpreadFixedTextMeasurer();

    // Export to PDF
    using (Stream output = new MemoryStream())
    {
        var pdfFormatProvider = new Telerik.Windows.Documents.Spreadsheet.FormatProviders.Pdf.PdfFormatProvider();
        var settings = new Telerik.Windows.Documents.Spreadsheet.FormatProviders.Pdf.Export.PdfExportSettings(ExportWhat.EntireWorkbook, false);
        settings.PdfFileSettings = new Telerik.Windows.Documents.Fixed.FormatProviders.Pdf.Export.PdfExportSettings
        {
            FontEmbeddingType = FontEmbeddingType.Full,
            ImageQuality = ImageQuality.High
        };
        pdfFormatProvider.ExportSettings = settings;

        pdfFormatProvider.Export(workbook, output);

        await FileSaver.Default.SaveAsync("Report.pdf", output, cancellationToken);
    }
}
```

## See Also

- [RadSpreadProcessing Overview](https://docs.telerik.com/devtools/document-processing/libraries/radspreadprocessing/overview)
- [Exporting Images in .NET Standard](https://docs.telerik.com/devtools/document-processing/libraries/radspreadprocessing/cross-platform-support/images)
- [Export Chart to PDF](https://docs.telerik.com/devtools/document-processing/libraries/radspreadprocessing/features/charts/pdf-export)
- [How to Eliminate Formatting Issues when Exporting XLSX to PDF Format](https://docs.telerik.com/devtools/document-processing/knowledge-base/exporting-xlsx-to-pdf-formatting-issues)
```
