---
title: Getting Started
page_title: Getting Started
slug: radspreadprocessing-getting-started
tags: getting,started
published: True
position: 1
---

# Getting Started

This article will get you started in using the __RadSpreadProcessing__ library.

>note If you still don't have **Telerik Document Processing** installed, check the **[First Steps]({%slug getting-started-first-steps%})** topic to learn how you can obtain the packages through the different suites. 

## Package References

You can find the required references in the [SpreadProcessing NuGet packages]({%slug available-nuget-packages%}#spreadprocessing-packages) section.

## Creating a Workbook

The document model allows you to instantiate a new [workbook]({%slug radspreadprocessing-working-with-workbooks-what-is-workbook%}) and populate it with any data you want.

__Example 1__ shows how you can create a workbook and add a new worksheet to it.


#### __Example 1: Create Workbook__

```csharp
	Workbook workbook = new Workbook();
	Worksheet worksheet = workbook.Worksheets.Add();
```

You can then create a [CellSelection]({%slug radspreadprocessing-working-with-cells-get-set-clear-properties%}) and set any value to the selected cells. __Example 2__ shows how you can create a cell and set a string value to it.


#### __Example 2: Set value of cell__

```csharp
	CellSelection selection = worksheet.Cells[1, 1]; //B2 cell
	selection.SetValue("Hello RadSpreadProcessing");
```

## Exporting

The __RadSpreadProcessing__ library supports a variety of formats to which you can export the contents of a workbook using [FormatProviders]({%slug radspreadprocessing-formats-and-conversion-general-information%}). __Example 3__ shows how you can export the previously created workbook to `.xlsx` format.

For more examples and application scenarios of Importing and Exporting a Workbook to various formats check out the [Import/Load and Export/Save RadSpreadProcessing Workbook]({%slug import-export-save-load-workbook%}) knowledge base article.


#### __Example 3: Export to Xlsx__

```csharp
	string fileName = "SampleFile.xlsx";
	
	XlsxFormatProvider formatProvider = new XlsxFormatProvider();
	
	using (Stream output = new FileStream(fileName, FileMode.Create))
	{
	    formatProvider.Export(workbook, output);
	}
```

>More information about the import and export functionalities of RadSpreadProcessing is available in the [Formats and Conversion section]({%slug radspreadprocessing-formats-and-conversion-general-information%}).

For more complete examples head to the [Developer Focused Examples]({%slug radspreadprocessing-sdk-examples%}) section of the library.

## Using RadSpreadsheet

__RadSpreadsheet__ is a UI control part of the Telerik UI for WPF/Silverlight suites. The document model explained in this section of the documentation and all its features are shared between the __RadSpreadProcessing__ library and __RadSpreadsheet__. [This help section](http://docs.telerik.com/devtools/wpf/controls/radspreadsheet/overview.html) contains information about all UI-specific features of __RadSpreadsheet__.

## See Also

 * [Using Telerik Document Processing First Steps]({%slug getting-started-first-steps%})
 * [What is a Workbook?]({%slug radspreadprocessing-working-with-workbooks-what-is-workbook%})
 * [What is a Worksheet?]({%slug radspreadprocessing-working-with-worksheets-what-is-worksheet%})
 * [Get, Set and Clear Cell Properties]({%slug radspreadprocessing-working-with-cells-get-set-clear-properties%})
 * [Using XlsxFormatProvider]({%slug radspreadprocessing-formats-and-conversion-xlsx-xlsxformatprovider%})
 * [Formats and Conversion section]({%slug radspreadprocessing-formats-and-conversion-general-information%})
 * [Import/Load and Export/Save RadSpreadProcessing Workbook KB]({%slug import-export-save-load-workbook%})
 * [Getting Started with RadSpreadProcessing Volume 1](https://www.telerik.com/blogs/getting-started-with-radspreadprocessing-volume-1)
 * [Getting started with RadSpreadProcessing Vol2](https://www.telerik.com/blogs/getting-started-with-radspreadprocessing-vol2)
 * [Getting Started with RadSpreadProcessing Vol3](https://www.telerik.com/blogs/getting-started-with-radspreadprocessing-vol3)
 * [SpreadProcessing Document Generation Demo](https://demos.telerik.com/document-processing/spreadprocessing/generate_documents)