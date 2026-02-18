---
title: Getting Started
page_title: Getting Started
slug: radspreadstreamprocessing-getting-started
tags: getting started
published: True
position: 1
---

# Getting Started

This article will get you started in using the **RadSpreadStreamProcessing** library. It contains the following sections:

* [Package References](#package-references)

* [Supported Formats](#supported-formats)

* [Create a Spreadsheet Document](#create-a-spreadsheet-document)

>note If you still don't have **Telerik Document Processing** installed, check the **[First Steps]({%slug getting-started-first-steps%})** topic to learn how you can obtain the packages through the different suites. 

## Package References

>The libraries support {{site.dotnetversions}}. .NET Standard-compatible packages are available as well. The packages for .NET Standard don't include 'Windows' in their names. (e.g. **Telerik.Zip.**).

In order to use **RadSpreadStreamProcessing** in your project, you will need to add the references listed below.

<table>
<thead>
	<tr>
		<th>.NET Framework </th>
		<th>.NET Standard-compatible</th>
	</tr>
</thead>
<tbody>
	<tr>
		<td><b>Telerik.Documents.SpreadsheetStreaming</b></td>
		<td><b>Telerik.Documents.SpreadsheetStreaming</b></td>
	</tr>
	<tr>
	    <td colspan="2">&nbsp;</td>
	</tr>
	<tr>
        <td colspan="2">To describe different colors, shapes and other properties, <b>RadSpreadStreamProcessing</b> depends on the listed below .NET assemblies, which you should also refer in your project:</td> 
    </tr>
    <tr>
	    <td><b>WindowsBase.dll</b></td>
		<td><b>-</b></td>
	</tr>
	<tr>
	    <td><b>PresentationFramework.dll</b></td>
		<td><b>-</b></td>
	</tr>
</tbody>
</table>

>note The binaries compatible with .NET Standard are distributed with the packages targeting .NET Standard and {{site.dotnetversions}}. For the full list of suites including Telerik Document Processing, check the [Installing on Your Computer]({%slug installation-installing-on-your-computer%}) help topic. There are **NuGet** packages as well that you can access if you have a license for one of the above mentioned suites.

## Create a Spreadsheet Document

This section will explain how a document could be created. If you need more detailed information about the classes that export the different document elements, you can check the articles from the [Model section]({%slug radspreadstreamprocessing-model-workbook%}).

When creating a document with **RadSpreadStreamProcessing**, the order in which the elements are created is very important. In order to minimize resource consumption, the library writes the content directly to a stream, and due to the structure of the file format, it is necessary to create the elements in the following order:


1. Create a Workbook 

2. Create a Worksheet

3. Create Columns (optional)

4. Create Rows (a worksheet must contain at least one row)

5. Create Cells (optional)

6. Merge Cells (optional)

**Example 1** shows how you could create a simple document.

#### Example 1: Create a document

```csharp
	using (FileStream stream = File.OpenWrite("sample.xlsx"))
	{
	    using (IWorkbookExporter workbook = SpreadExporter.CreateWorkbookExporter(SpreadDocumentFormat.Xlsx, stream))
	    {
	        using (IWorksheetExporter worksheet = workbook.CreateWorksheetExporter("My sheet"))
	        {
	            worksheet.SkipColumns(1);
	            using (IColumnExporter column = worksheet.CreateColumnExporter())
	            {
	                column.SetWidthInPixels(80);
	            }
	
	            worksheet.SkipRows(3);
	            using (IRowExporter row = worksheet.CreateRowExporter())
	            {
	                row.SkipCells(3);
	                using (ICellExporter cell = row.CreateCellExporter())
	                {
	                    cell.SetValue("Merged cell.");
	                    cell.SetFormat(new SpreadCellFormat()
	                    {
	                        HorizontalAlignment = SpreadHorizontalAlignment.Center,
	                        VerticalAlignment = SpreadVerticalAlignment.Center
	                    });
	                }
	            }
	
	            using (IRowExporter row = worksheet.CreateRowExporter())
	            {
	                row.SetHeightInPixels(200);
	                using (ICellExporter cell = row.CreateCellExporter())
	                {
	                    cell.SetValue(123.456);
	                }
	
	                using (ICellExporter cell = row.CreateCellExporter())
	                {
	                    SpreadCellFormat format = new SpreadCellFormat()
	                    {
	                        NumberFormat = "dd/mm/yyyy",
	                        IsBold = true
	                    };
	                    cell.SetFormat(format);
	                    cell.SetValue(42370);
	                }
	            }
	
	            worksheet.MergeCells(3, 3, 6, 6);
	        }
	    }
	}
```

**Figure 1** shows the result of executing the code from **Example 1**.

#### Figure 1: The document created in Example 1
![](images/SpreadStreamProcessing-GettingStarted_01.png)


## Read Existing Document

When reading a document with **RadSpreadStreamProcessing**, the order of parsing the content is very important. To minimize resource consumption, the library parses only the parts required by the user and, due to the file structure, it is necessary to read the desired elements in the following order:


1. Read the Workbook 

2. Read a Worksheet

3. Read Columns (optional)

4. Read Rows (a worksheet must contain at least one row)

5. Read Cells (optional)

**Example 2** demonstrates how you could read the data from an existing document.

#### Example 2: Read data from a document

```csharp

	using (FileStream fs = new FileStream(fileName, FileMode.Open))
	{
		using (IWorkbookImporter workBookImporter = SpreadImporter.CreateWorkbookImporter(SpreadDocumentFormat.Xlsx, fs))
		{
			foreach (IWorksheetImporter worksheetImporter in workBookImporter.WorksheetImporters)
			{
				foreach (IRowImporter rowImporter in worksheetImporter.Rows)
				{
					foreach (ICellImporter cell in rowImporter.Cells)
					{
						string value = cell.Value;
					}
				}
			}
		}
	}

```

For more complete examples head to the [Developer Focused Examples]({%slug radspreadstreamprocessing-sdk-examples%}) section of the library.

## See Also 

* [Using Telerik Document Processing First Steps]({%slug getting-started-first-steps%})
* [Rows]({%slug radspreadstreamprocessing-model-rows%})
* [Columns]({%slug radspreadstreamprocessing-model-columns%})
* [Cells]({%slug radspreadstreamprocessing-model-cells%})
* [Worksheets]({%slug radspreadstreamprocessing-model-worksheet%})
* [Workbook]({%slug radspreadstreamprocessing-model-workbook%})
* [Accessing Specific Cells in RadSpreadStreamProcessing]({%slug accessing-specific-cells-radspreadstreamprocessing%})
