---
title: Accessing Cells of a Worksheet
page_title: Accessing Cells of a Worksheet
slug: radspreadprocessing-working-with-cells-accessing-cells-of-worksheet
tags: accessing,cells,worksheet,selection,workbook,xlsx,spreadprocessing,
published: True
position: 2
---

# Accessing Cells of a Worksheet

Each worksheet consists of cells organized in rows and columns. To manipulate the data and properties of the cells, you need to create and use an instance of the __CellSelection__ class that holds the desired cell region and then invoke the appropriate action for this __CellSelection__ instance. This class exposes a rich API that allows you to get, set and clear cell's value, colors, borders and style.    

The document model offers multiple ways to create a __CellSelection__ object. The following examples list all approaches you can use to retrieve a __CellSelection__ instance. Note that each example creates a new workbook, adds one worksheet and creates a selection for its cells.

Using a **CellIndex** object allows you to specify a single cell (identified by a row index and column index) from the sheet and create a CellSelection for this single cell. Then, you can get the [Value]({%slug radspreadprocessing-working-with-cells-cell-value-types%}) of the cell.                

#### __Example 1: Create CellSelection using CellIndex__

```csharp
	Workbook workbook = new Workbook();
	Worksheet worksheet = workbook.Worksheets.Add();
	
	CellIndex cellIndex = new CellIndex(0, 5);
	CellSelection selection1 = worksheet.Cells[cellIndex];
```


#### __Example 2: Create CellSelection using CellRange__

```csharp
	Workbook workbook = new Workbook();
	Worksheet worksheet = workbook.Worksheets.Add();
	
	CellRange cellRange = new CellRange(0, 0, 5, 5);
	CellSelection selection2 = worksheet.Cells[cellRange];
```
            

#### __Example 3: Create CellSelection using multiple CellRange objects__

```csharp
	Workbook workbook = new Workbook();
	Worksheet worksheet = workbook.Worksheets.Add();
	
	List<CellRange> ranges = new List<CellRange>();
	ranges.Add(new CellRange(0, 0, 5, 5));
	ranges.Add(new CellRange(0, 10, 5, 15));
	CellSelection selection3 = worksheet.Cells[ranges];
```


#### __Example 4: Create CellSelection using two CellIndex instances that specify a CellRange__

```csharp
	Workbook workbook = new Workbook();
	Worksheet worksheet = workbook.Worksheets.Add();
	
	CellIndex fromIndex = new CellIndex(0, 0);
	CellIndex toIndex = new CellIndex(5, 5);
	CellSelection selection4 = worksheet.Cells[fromIndex, toIndex];
```


#### __Example 5:  Create CellSelection using two integers that indicate the CellIndex__

```csharp
	Workbook workbook = new Workbook();
	Worksheet worksheet = workbook.Worksheets.Add();
	
	CellSelection selection5 = worksheet.Cells[0, 5];
```
 

#### __Example 6: Create CellSelection using four integers that specify the CellRange__

```csharp
	Workbook workbook = new Workbook();
	Worksheet worksheet = workbook.Worksheets.Add();
	
	CellSelection selection6 = worksheet.Cells[0, 0, 5, 5];
```



Once you have a __CellSelection__ object you can get, set and clear the properties of the selected cells. More information about cell properties is available in the [Get, Set and Clear Cell Properties]({%slug radspreadprocessing-working-with-cells-get-set-clear-properties%}) article.
        
