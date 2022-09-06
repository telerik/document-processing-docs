---
title: Import
page_title: Import
slug: radspreadstreamprocessing-import
tags: import, read, parse, xlsx, csv
published: True
position: 4
---

# Import

With **RadSpreadStreamProcessing** you can read spreadsheet documents from the following file formats:

* XLSX

* CSV

This functionality is introduced in R3 2022.

## Specifics

The library reads dynamically the document content. To achieve this, the IWorksheetImporter and IWorkbookImporter  classes responsible for importing the elements of the document implement **IDisposable** and keep the corresponding content and settings into the memory until it is disposed. 

## Read File Data

To read the data from a file, you should parse the desired elements in a sequence keeping the following consecution:

1. Read the Workbook 

2. Read a Worksheet

3. Read Columns (optional)

4. Read Rows 

5. Read Cells 


#### [C#] Example 1: Read data from a document

{{region radspreadstreamprocessing-import_0}}

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

{{endregion}}

Through the importer objects, you can access the properties of the different elements.

## See Also

* [Getting Started]({%slug radspreadstreamprocessing-getting-started%})
* [Workbook]({%slug radspreadstreamprocessing-model-workbook%})
