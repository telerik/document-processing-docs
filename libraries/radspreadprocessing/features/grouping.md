---
title: Grouping
description: Learn how to group rows and columns in spreadsheet worksheets using RadSpreadProcessing.
page_title: Grouping
slug: radspreadprocessing-features-grouping
tags: grouping, spreadsheet, radspreadprocessing, rows, columns, worksheet, outline, collapse, spread, xlsx
published: True
position: 16
---

# Grouping



Grouping organizes data in sections to show and hide relevant chunks. The following sections explain how to work with grouping through the **RadSpreadProcessing** model:

* [What is Grouping?](#what-is-grouping)

* [Grouping Rows or Columns](#grouping-rows-or-columns)

* [Ungrouping Rows or Columns](#ungrouping-rows-or-columns)

* [Getting the Outline Level](#getting-the-outline-level)


## What Is Grouping?

Grouping is a mechanism to organize data in sections, to show and hide the relevant chunks. 

Each row or column which is part of a group is assigned an outline level, which determines the level of grouping and which rows or columns it is grouped with. 

**Figure 1: Grouped worksheet rows with nested outline levels**
![Telerik Document Processing RadSpreadProcessing worksheet showing grouped rows with nested outline levels and expand-collapse controls](images/RadSpreadProcessing_Features_Grouping_01.png)

In **Figure 1**, the rows 1, 2, 4, and 8 have outline level value of 1. Rows 5, 6, and 7 have outline level 2. Rows 3 and 9 do not participate in the grouping and have the default value of 0.

The maximum outline level is 7.


## Grouping Rows or Columns

There are two available options when grouping. The first option is to assign the outline level property of the rows or columns:

**Example 1: Group columns by setting the outline level**

<snippet id='codeblock-cif'/>

The other option is to use the `Group` method exposed by the row/column selection classes.

**Example 2: Group columns by using the Group method**

<snippet id='codeblock-cih'/>

**Figure 2** shows the result of both approaches.

**Grouped worksheet columns created through both grouping approaches**
![Telerik Document Processing RadSpreadProcessing worksheet showing grouped columns with outline controls after applying column grouping](images/RadSpreadProcessing_Features_Grouping_02.png)

## Ungrouping Rows or Columns

As with grouping, you can ungroup both through setting the outline level property of the row or column selection, or by using the `Ungroup` method exposed by the same classes.

The following code snippets show the two approaches to make these changes in a file.

**Ungrouping result after removing a nested worksheet group**
![Telerik Document Processing RadSpreadProcessing worksheet before and after ungrouping nested row groups](images/RadSpreadProcessing_Features_Grouping_03.png)


**Example 3: Ungroup columns by using the Ungroup method**

<snippet id='codeblock-cij'/>

You can achieve the same result with the code in **Example 4**.

**Example 4: Ungroup columns by resetting the outline level**

<snippet id='codeblock-cil'/>

## Getting the Outline Level

You can get the outline level of a row/column or a group of rows/columns using the code in **Example 5**:


**Example 5: Get the current outline level**

<snippet id='codeblock-cin'/>


## Setting the Position of the Summary Row or Column

When you group a selection of rows, the row immediately below them is automatically designated to be a summary row for this group. In the context of the grouping feature, this means that the plus/minus outline symbol aligns with this row. The same applies to columns, whose summary column is automatically placed to the right of the group.

**Figure 4: Summary rows positioned below grouped worksheet rows**
![Telerik Document Processing RadSpreadProcessing worksheet showing summary rows positioned below grouped row sections](images/RadSpreadProcessing_Features_Grouping_04.png)

In **Figure 4**, the summary row for the group of rows 1 to 4 is row 5 and for rows 7 to 10 it is row 11.

If you want to change the placement of the summary row or column, use the `GroupingProperties` class, which exposes the following two Boolean properties:

* `SummaryRowIsBelow`

* `SummaryColumnIsToRight`

Both properties have a default value of `true`. The following snippet shows how to set the value of the `SummaryColumnIsToRight` property and what result to expect in the produced file.

**Example 6: Place the summary column to the left of the group**

<snippet id='codeblock-cip'/>

**Summary column moved to the left of grouped worksheet columns**
![Telerik Document Processing RadSpreadProcessing worksheet showing the summary column positioned to the left of grouped columns](images/RadSpreadProcessing_Features_Grouping_05.png)

## See Also

* [Filtering]({%slug radspreadprocessing-features-filtering%})
* [Sorting]({%slug radspreadprocessing-features-sorting%})
* [Grouping Data Example Using RadSpreadProcessing]({%slug grouping-data-using-radspreadprocessing%})

