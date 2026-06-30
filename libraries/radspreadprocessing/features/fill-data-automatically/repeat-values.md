---
title: Repeat Values
description: Learn how to use the auto-fill feature in RadSpreadProcessing to automatically repeat existing cell data across adjacent rows or columns.
page_title: Repeat Values
slug: radspreadprocessing-features-fill-data-automatically-repeat-values
tags: auto, fill, repeat, spreadsheet, radspreadprocessing, cells, values, rows, columns, spread, xlsx
published: True
position: 0
---

# Repeat Values

The document model allows you to automatically repeat data that has already been entered in your worksheet. The auto fill feature is useful when you want to copy the contents of a row or a column into its adjacent rows or columns. You can spread the values into a specified range instead of populating the cells manually.

## Repeating Values

To repeat the values, first create a [CellSelection]({%slug radspreadprocessing-working-with-cells-accessing-cells-of-worksheet%}) for the range of cells that you want to populate. Note that the range must include the values that you want to repeat. Then, invoke the `FillData()` method of the `CellSelection` instance and pass the appropriate `FillDirection` as an argument. There are four `FillDirection` values:

* `Left`: The values in the rightmost column are copied to the rest of the columns in the range.

* `Up`: The values in the bottom row are copied to the rest of the rows in the range.

* `Right`: The values in the leftmost column are copied to the rest of the columns in the range.

* `Down`: The values in the top row are copied to the rest of the rows in the range.

**Example 1** illustrates how the contents of column *A* can be copied to the rest of the columns in the range *A1:D4*. The code creates a new worksheet and populates the cells *A1*, *A2*, *A3*, and *A4* with the values 5, 8, 13, and 21 respectively. It then invokes the `FillData()` method for the specified range with `FillDirection.Right`.

#### __Example 1: Fill Right__

<snippet id='libraries-spread-features-fill-data-automatically-repeat-values-1'/>



**Figure 1** demonstrates the result of **Example 1**.

#### Figure 1: Data filled right
![Data filled right using FillDirection.Right](images/RadSpreadProcessing_Features_Fill_Data_Automatically_Repeat_Values_01.png)

Similarly, you can automatically copy the values of a row to its adjacent rows.

**Example 2** invokes the `FillData()` method with `FillDirection.Down` for the range *B2:D4*. The sample code creates an empty worksheet and enters values in the range *B2:D2*. These values are propagated to the rest of the rows in the specified region.

#### __Example 2: Fill Down__

<snippet id='libraries-spread-features-fill-data-automatically-repeat-values-2'/>



**Figure 2** demonstrates the result of **Example 2**.

#### Figure 2: Data filled down
![Data filled down using FillDirection.Down](images/RadSpreadProcessing_Features_Fill_Data_Automatically_Repeat_Values_02.png)

## See Also

* [Accessing Cells of a Worksheet]({%slug radspreadprocessing-working-with-cells-accessing-cells-of-worksheet%})
* [Series]({%slug radspreadprocessing-features-fill-data-automatically-series%})
