---
title: Resizing Rows and Columns
page_title: Resizing Rows and Columns
description: Resizing Rows and Columns
slug: radspreadprocessing-working-with-rows-and-columns-resizing
tags: resizing,rows,and,columns
published: True
position: 2
---

# Resizing Rows and Columns



Worksheets in __RadSpreadProcessing__'s document model consist of cells organized in rows and columns. The API of the model allows you to set the width of each column and the height of each row. Additionally, you can choose to use the autofit feature that sizes the rows and columns based on their current content. This article demonstrates the different options for changing row height and column width.
      

* [Row Height](#row-height)

* [Auto Fit Rows Height](#auto-fit-rows-height)

* [Columns Width](#columns-width)

* [Auto Fit Columns Width](#auto-fit-columns-width)

* [Measurement Units](#measurement-units)

* [LayoutHelper class](#layouthelper-class)

## Row Height

The height of a row is retrieved and changed through an instance of type __RowHeight__. The class exposes two properties: __Value__, which holds the height of the row, and __IsCustom__ that indicates whether the height is set by the user. If the __IsCustom__ property is set to false, the row height changes automatically in certain cases, for example when you increase the font size of a cell that contains a number value and its content no longer fits in the available size. However, if you increase the font size and the __IsCustom__ property is set to true, the row height is not going to change and part of the cell content would stay hidden.
        

In order to change the rows' height, you need to create a __RowSelection__ instance that includes the rows to be resized. The __RowSelection__ class exposes __GetHeight()__, __SetHeight()__ and __ClearHeight()__ methods that are used to manipulate the height of the selected rows.
        

The __GetHeight()__ method returns a __RangePropertyValue<RowHeight>__ instance that holds information about the height of all selected rows. The object exposes two properties that indicate the value of __RowHeight__ for the cell range:
        

* __IsIndeterminate__: Indicates whether the value of __RowHeight__ is consistent among all rows in the specified __RowSelection__. If the __RowHeight__ has one and the same value for all rows, __IsIndeterminate__ is set to false. However, if the value of __RowHeight__ varies throughout the rows in the __RowSelection__, the __IsIndeterminate__ property is set to true and the __Value__ property of the __RangePropertyValue<T>__ class returns the default __RowHeight__.
            

* __Value__: Holds the actual __RowHeight__. If the __IsIndeterminate__ property is set to false, __Value__ contains the __RowHeight__ for the whole __RowSelection__ region. If the __IsIndeterminate__ property is set to true, this indicates that the __RowHeight__ is not the same for all rows in the __RowSelection__ and the __Value__ property is set to its default value.
            

The __SetHeight()__ method is used to change the height of rows. It takes a single argument of type __RowHeight__ which specifies the new height. The __ClearHeight()__ method is used to reset the __RowHeight__ of the selected rows to the default height. Note that the default row height can be manipulated through the __GetDefaultHeight()__ and __SetDefaultHeight()__ methods exposed by the __Rows__ class.
        

__Example 1__ shows how to retrieve and change the height of several rows.
        

#### __[C#] Example 1: Change row height__

{{region cs-radspreadprocessing-working-with-rows-and-columns-resizing_0}}
	Workbook workbook = new Workbook();
	Worksheet worksheet = workbook.Worksheets.Add();
	
	RowSelection rowSelection = worksheet.Rows[5, 7];
	double rowsHeight = rowSelection.GetHeight().Value.Value;
	rowSelection.SetHeight(new RowHeight(rowsHeight + 50, true));
{{endregion}}



## Auto Fit Rows Height

The autofit feature offers a handy approach for resizing multiple rows so that each of them chooses a height that fits its content. To autofit the height of rows, you need to create a __RowSelection__ instance that contains the rows that need to be resized and invoke the __AutoFitHeight()__ method of the __RowSelection__ object. __Example 2__ shows how to fit the height of rows with indexes 6, 7 and 8.
        

#### __[C#] Example 2: Fit height of rows__

{{region cs-radspreadprocessing-working-with-rows-and-columns-resizing_1}}
	Workbook workbook = new Workbook();
	Worksheet worksheet = workbook.Worksheets.Add();
	
	RowSelection rowSelection = worksheet.Rows[5, 7];
	rowSelection.AutoFitHeight();
{{endregion}}

> The expected behavior when calling the **AutoFitHeight** method on a row that contains merged and wrapped cells is to set the default [RowHeight](https://docs.telerik.com/devtools/document-processing/api/telerik.windows.documents.spreadsheet.model.rowheight) value instead of calculating the row height according to its content. In order to measure the cell content you can check the exposed by the [LayoutHelper class](#layouthelper-class) methods. 

## Columns Width

The width of a column is retrieved and changed through an instance of type __ColumnWidth__. The class exposes two properties: __Value__, which holds the width of the column, and __IsCustom__ that indicates whether the width is set by the user. If the __IsCustom__ property is set to false, the column width changes automatically in certain cases, for example when you increase the font size of a cell that contains a number value and its content no longer fits in the available size. However, if you increase the font size and the __IsCustom__ property is set to true, the column width is not going to change and part of the cell content would stay hidden.
        

In order to change the columns' width, you need to create a __ColumnSelection__ instance that includes the columns to be resized. The __ColumnSelection__ class exposes __GetWidth()__, __SetWidth()__ and __ClearWidth()__ methods that are used to manipulate the width of the selected columns.
        

The __GetWidth()__ method returns a __RangePropertyValue<ColumnWidth>__ instance that holds information about the width of all selected columns. The object exposes two properties that indicate the value of the property for the cell range:
        

* __IsIndeterminate__: Indicates whether the value of __ColumnWidth__ is consistent among all columns in the specified __ColumnSelection__. If the __ColumnWidth__ has one and the same value for all columns, __IsIndeterminate__ is set to false. However, if the value of __ColumnWidth__ varies throughout the columns in the __ColumnSelection__, the __IsIndeterminate__ property is set to true and the __Value__ property of the __RangePropertyValue<T>__ class is set to its default value.
            

* __Value__: Holds the actual __ColumnWidth__. If the __IsIndeterminate__ property is set to false, __Value__ contains the __ColumnWidth__ for the whole __ColumnSelection__ region. If the __IsIndeterminate__ property is set to true, this indicates that the __ColumnWidth__ is not the same for all columns in the __ColumnSelection__ and the __Value__ property is set to its default value.
            

The __SetWidth()__ method is used to change the width of columns. It takes a single argument of type __ColumnWidth__ that specifies the new width. The __ClearWidth()__ method is used to reset the __ColumnWidth__ of the selected columns to the default width. Note that the default column width can be manipulated through the __GetDefaultWidth()__ and __SetDefaultWidth()__ methods exposed by the __Columns__ class.
        

__Example 3__ shows how to retrieve and change the width of several columns.
        

#### __[C#] Example 3: Change columns width__

{{region cs-radspreadprocessing-working-with-rows-and-columns-resizing_2}}
	Workbook workbook = new Workbook();
	Worksheet worksheet = workbook.Worksheets.Add();
	
	ColumnSelection columnSelection = worksheet.Columns[5, 7];
	double columnWidth = columnSelection.GetWidth().Value.Value;
	columnSelection.SetWidth(new ColumnWidth(columnWidth + 50, true));
{{endregion}}



## Auto Fit Columns Width

The autofit feature offers a handy approach for resizing multiple columns so that each of them chooses a width that fits its content. To autofit the columns, you need to create a __ColumnSelection__ instance that holds the columns to be resized, and invoke its __AutoFitWidth()__ method. __Example 4__ shows how to fit the column width of columns F to H.
        

#### __[C#] Example 4: Fit width of columns__

{{region cs-radspreadprocessing-working-with-rows-and-columns-resizing_3}}
	Workbook workbook = new Workbook();
	Worksheet worksheet = workbook.Worksheets.Add();
	
	ColumnSelection columnSelection = worksheet.Columns[5, 7];
	columnSelection.AutoFitWidth();
{{endregion}}



Another way to auto fit column widths is to use the __ExpandToFitNumberValuesWidth()__ method. It affects cells that contain only number values and have a __ColumnWidth__ with __IsCustom__ property set to true. __Example 5__ demonstrates the alternative way to fit the column width.
        

#### __[C#] Example 5: Fit with ExpandToFitNumberValuesWidth()__

{{region cs-radspreadprocessing-working-with-rows-and-columns-resizing_4}}
	Workbook workbook = new Workbook();
	Worksheet worksheet = workbook.Worksheets.Add();
	
	ColumnSelection columnSelection = worksheet.Columns[5, 7];
	columnSelection.ExpandToFitNumberValuesWidth();
{{endregion}}


## Measurement Units

The unit type used to set the width of the columns and the height of the rows in RadSpreadProcessing is [Device Independent Pixels](https://en.wikipedia.org/wiki/Device-independent_pixel) (DIPs).

### UnitHelper class

The [UnitHelper](https://docs.telerik.com/devtools/document-processing/api/telerik.windows.documents.spreadsheet.utilities.unithelper) class provides a bunch of methods for converting from DIPs to other measurement units and vice versa (e.g. points, picas, centimeters, inches, etc.).

#### Convert From Dip to Unit:
* **DipToPoint**: Converts dips to points.
* **DipToPointI**: Converts dips to points.
* **DipToPica**: Converts dips to picas.
* **DipToCm**: Converts dips to centimeters.
* **DipToMm**: Converts dips to millimeters.
* **DipToInch**: Converts dips to inches.
* **DipToTwip**: Converts dips to twips.
* **DipToEmu**: Converts dips to EMUs.
* **DipToTwipI**: Converts dips to twips.
* **DipToTwipF**: Converts dips to twips.
* **DipToUnit**: Converts DIPs to units.

#### Convert From Unit to Dip:
* **PointToDip**: Converts points to dips.
* **PicaToDip**: Converts to points dips.
* **EmuToDip**: Converts EMUs to dips.
* **CmToDip**: Converts centimeters to dips.
* **MmToDip**: Converts millimeters to dips.
* **InchToDip**: Converts inches to dips.
* **TwipToDip**: Converts twips to dips.
* **TwipToDipF**: Converts twips to dips.
* **TwipToDipI**: Converts twips to dips.
* **UnitToDip**: Converts Units to dips.

Most of the methods follow the same pattern for converting units:

__Example 5__ shows how to convert from DIP to Point and set the row height.    

#### __[C#] Example 5: Convert from DIP to Point__

{{region cs-radspreadprocessing-working-with-rows-and-columns-resizing_5}}

	double points = UnitHelper.DipToPoint(80);
	RowHeight newRowHeight = new RowHeight(points, isCustom: true);
	worksheet.Rows[0].SetHeight(newRowHeight);
{{endregion}}

except the **DipToUnit** and **UnitToDip** methods which accepts not only the units but the [UnitType](https://docs.telerik.com/devtools/document-processing/api/telerik.windows.documents.media.unittype) as well as a parameter:

__Example 6__ shows how to convert from Point to DIP and set the row height.    

#### __[C#] Example 6: Convert from Point to DIP__

{{region cs-radspreadprocessing-working-with-rows-and-columns-resizing_6}}

	double dips = UnitHelper.UnitToDip(60, UnitType.Point);
	RowHeight newRowHeight = new RowHeight(dips, isCustom: true);
	worksheet.Rows[0].SetHeight(newRowHeight);
{{endregion}}

### Telerik RadSpreadProcessing vs MS Excel 

 In the other hand, MS Excel uses its [own measurement unit](https://docs.microsoft.com/en-sg/office/troubleshoot/excel/determine-column-widths), so in order to convert between pixel and MS Excel width you can use the following methods of the UnitHelper class in combination with the **SetWidth**() method: 

* PixelWidthToExcelColumnWidth: Converts column width in pixels to MS Excel column width.

__Example 7__ shows how to convert and set from pixel to MS Excel column width.    

#### __[C#] Example 7: Convert from pixel column width to MS Excel column width__

{{region cs-radspreadprocessing-working-with-rows-and-columns-resizing_7}}

	double pixelWidthToExcelWidth = UnitHelper.PixelWidthToExcelColumnWidth(workbook, 57);
	ColumnWidth newColumnWidth = new ColumnWidth(pixelWidthToExcelWidth, isCustom: true);
	worksheet.Columns[0].SetWidth(newColumnWidth);
{{endregion}}

* ExcelColumnWidthToPixelWidth: Converts MS Excel column width to pixels width.

__Example 8__ shows how to convert and set from MS Excel to pixel column width.    

#### __[C#] Example 8: Convert from MS Excel column width to pixel column width__

{{region cs-radspreadprocessing-working-with-rows-and-columns-resizing_8}}

	double excelWidthToPixelWidth = UnitHelper.ExcelColumnWidthToPixelWidth(workbook, 8.11);
	ColumnWidth newColumnWidth = new ColumnWidth(excelWidthToPixelWidth, isCustom: true);
	worksheet.Columns[0].SetWidth(newColumnWidth);
{{endregion}}

The row height in MS Excel is measured in points so in order to set them you can convert this unit and set the exact number you are passing to the **SetHeight**() method for the height using the UnitHelper class.


## LayoutHelper class

The [LayoutHelper](https://docs.telerik.com/devtools/document-processing/api/telerik.windows.documents.spreadsheet.layout.layouthelper) class exposes the following methods that help to calculate the size of the page content:

* **CalculateCellContentSize**: Calculates the size of the cell content.

#### __[C#] Example 9: Get the Size of the cell content__

{{region cs-radspreadprocessing-working-with-rows-and-columns-resizing_9}}

	Size cellContentSize = LayoutHelper.CalculateCellContentSize(worksheet, rowIndex, columnIndex);
{{endregion}}

* **CalculateCellLayoutBox**: Creates, arranges and return the cell layout box.

#### __[C#] Example 10: Get the cell layout box__

{{region cs-radspreadprocessing-working-with-rows-and-columns-resizing_10}}

	CellLayoutBox cellLayoutBox = LayoutHelper.CalculateCellLayoutBox(worksheet, rowIndex, columnIndex);
{{endregion}}

## See Also

* [LayoutHelper](https://docs.telerik.com/devtools/document-processing/api/telerik.windows.documents.spreadsheet.layout.layouthelper)
