---
title: TableCell
description: Learn about the TableCell block container element in RadWordsProcessing that defines individual cells within a table.
page_title: TableCell
slug: radwordsprocessing-model-tablecell
tags: table, cell, word, docx, document, flow, model, content, container
published: True
position: 7
---

# TableCell

The `TableCell` element is a `BlockContainer` element and defines a cell of content within a [Table]({%slug radwordsprocessing-model-table%}). It contains `Block` elements such as [Paragraph]({%slug radwordsprocessing-model-paragraph%}) and [Table]({%slug radwordsprocessing-model-table%}).

## Inserting a TableCell

You can use the code snippet from **Example 1** to create a `TableCell` and add it in a [TableRow]({%slug radwordsprocessing-model-tablerow%}).

**Example 1: Create a TableCell associated with the document and add it to an existing table row**

```csharp
RadFlowDocument radFlowDocument = new RadFlowDocument();
Table table = radFlowDocument.Sections.AddSection().Blocks.AddTable();
TableRow row = table.Rows.AddTableRow();

TableCell cell = new TableCell(radFlowDocument);
row.Cells.Add(cell);
```

To create a `TableCell` and add it in the document tree at the same time, you can use the `AddTableCell()` method.

**Example 2: Create a TableCell and add it to a TableRow at the same time**

```csharp
TableRow row = table.Rows.AddTableRow();
TableCell cell = row.Cells.AddTableCell();
```


## Modifying a TableCell

The `TableCell` element exposes several properties that allow you to customize its layout. Some of these properties are style properties, and some of the values represent a themable object.

>tip Style properties are properties that can be inherited from a style. For more information about styles, see [Style Properties]({%slug radwordsprocessing-concepts-style-properties%}). Themable objects are objects that can be inherited from a theme. For more information about themes, see [Document Themes]({%slug radwordsprocessing-concepts-document-themes%}).

* `Properties`: Retrieves all `TableCellProperties`. For more information, see the [Style Properties]({%slug radwordsprocessing-concepts-style-properties%}) article.

* `Row`: Represents the parent `TableRow` of the cell.

* `Table`: Represents the parent `Table` of the cell.

* `Borders`: Specifies the borders of the cell. *This is a style property.*

* `Shading`: Represents the shading applied to the cell. It is a composite object and is read-only. You can obtain the following properties from it:

    * `BackgroundColor`: Specifies the background color for the shading. *This is a style property. The value is a themable object.*

    * `PatternColor`: Specifies the pattern color for the shading. *This is a style property. The value is a themable object.*

    * `Pattern`: Specifies the pattern that is used to lay the pattern color over the background color for the shading. *This is a style property.*

* `Padding`: Specifies the padding of the cell. *This is a style property.*

* `ColumnSpan`: Indicates the total number of columns that the `TableCell` spans within a `TableRow`. This property cannot be derived from a style.

* `RowSpan`: Specifies the total number of rows that the `TableCell` spans within a `Table`. This property cannot be derived from a style.

* `IgnoreCellMarkerInRowHeightCalculation`: Specifies whether the cell marker is ignored when the row height is calculated. This property cannot be derived from a style.

* `CanWrapContent`: Specifies whether the content can be wrapped during the table layout. This property cannot be derived from a style.

* `PreferredWidth`: Specifies the preferred width of the cell. This property cannot be derived from a style.

* `VerticalAlignment`: Specifies the vertical alignment of the cell content. This property cannot be derived from a style.

* `TextDirection`: Specifies the direction of the text in the cell. It can have one of the values of the [TextDirection enumeration](https://docs.telerik.com/devtools/document-processing/api/Telerik.Windows.Documents.Flow.Model.Styles.TextDirection.html). This property cannot be derived from a style.

* `GridColumnIndex`: Represents the column index of the cell in the table grid.

* `GridRowIndex`: Represents the row index of the cell in the table grid.

```csharp
Border border = new Border(1, BorderStyle.Single, new ThemableColor(Colors.Blue));
cell.Borders = new Telerik.Windows.Documents.Flow.Model.Styles.TableCellBorders(border, border, border, border);
cell.Shading.BackgroundColor = new ThemableColor(Colors.Red);
cell.Padding = new Telerik.Windows.Documents.Primitives.Padding(20,20,20,20);
cell.VerticalAlignment = VerticalAlignment.Bottom;
cell.TextDirection = TextDirection.LeftToRightTopToBottom;
```

## Operating with a TableCell

### Add a Paragraph to a TableCell

**Example 3** demonstrates how to add a `Paragraph` to a `TableCell`.

**Example 3: Add a paragraph block to a table cell**

```csharp
Paragraph paragraph = cell.Blocks.AddParagraph();
```

Through the `BlockCollection` property of the `TableCell` element, you can add a `Table` or any other [BlockBase](https://docs.telerik.com/devtools/document-processing/api/Telerik.Windows.Documents.Flow.Model.BlockBase.html) element.

## See Also

* [TableCell API Reference](https://docs.telerik.com/devtools/document-processing/api/Telerik.Windows.Documents.Flow.Model.TableCell.html)
* [Document Model]({%slug radwordsprocessing-model%})
* [Table]({%slug radwordsprocessing-model-table%})
* [TableRow]({%slug radwordsprocessing-model-tablerow%})
