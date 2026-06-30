---
title: TableRow
description: Learn about the TableRow flow document element in RadWordsProcessing that defines a row of cells within a table.
page_title: TableRow
slug: radwordsprocessing-model-tablerow
tags: table, row, word, docx, document, flow, model, cells, layout
published: True
position: 6
---

# TableRow

`TableRow` is a flow document element that defines a row within a [Table]({%slug radwordsprocessing-model-table%}). It contains a collection of [TableCell]({%slug radwordsprocessing-model-tablecell%}) elements.

* [Inserting a TableRow](#inserting-a-tablerow)
* [Modifying a TableRow](#modifying-a-tablerow)
* [Operating with a TableRow](#operating-with-a-tablerow)


## Inserting a TableRow

You can use the code snippet from **Example 1** to create a `TableRow` and add it in a `Table`.

**Example 1: Create a TableRow and add it to a table**

<snippet id='libraries-flow-model-tablerow-1'/>

To create a `TableRow` and add it in the document tree at the same time, you can use the `AddTableRow()` method of the [Rows](https://docs.telerik.com/devtools/document-processing/api/Telerik.Windows.Documents.Flow.Model.Table.html#collapsible-Telerik_Windows_Documents_Flow_Model_Table_Rows) collection property of the table.

**Example 2: Create a TableRow and add it to a table at the same time**

<snippet id='libraries-flow-model-tablerow-2'/>

## Modifying a TableRow

The `TableRow` element exposes several properties that allow you to customize its layout. Some of the properties are style properties.

>tip Style properties are properties that can be inherited from a style. For more information about styles, see [Style Properties]({%slug radwordsprocessing-concepts-style-properties%}).

* `Properties`: Gets all table row properties as a `TableRowProperties` object. For more information on how to use table row properties, see the [Style Properties]({%slug radwordsprocessing-concepts-style-properties%}) article.

* `Cells`: Retrieves a collection of `Cell` elements in the current `TableRow`.

* `Table`: Retrieves the parent `Table` element of the row.

* `GridRowIndex`: Represents the index of the row in the table grid.

* `TableCellSpacing`: Specifies the spacing between adjacent cells and the edges of the table. The value is in device independent pixels (1/96 inch). The default value is `0`. *This is a style property.*

* `RepeatOnEveryPage`: Indicates whether this row repeats on every new page. The default value is `false`. This property cannot be derived from a style.

* `CanSplit`: Specifies whether the content of the row can be split across multiple pages. The default value is `true`. This property cannot be derived from a style.

* `Height`: Specifies the row height. This property cannot be derived from a style.

## Operating with a TableRow

### Add TableCell Elements to a TableRow

**Example 3** shows how to add a number of `TableCell` elements in a `TableRow`.

**Example 3: Add TableCell objects to a TableRow**

<snippet id='libraries-flow-model-tablerow-3'/>

## See Also

* [TableRow API Reference](https://docs.telerik.com/devtools/document-processing/api/Telerik.Windows.Documents.Flow.Model.TableRow.html)
* [Table]({%slug radwordsprocessing-model-table%})
* [TableCell]({%slug radwordsprocessing-model-tablecell%})
* [Style Properties]({%slug radwordsprocessing-concepts-style-properties%})
