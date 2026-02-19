---
title: TableCell
page_title: TableCell
slug: radwordsprocessing-model-tablecell
tags: tablecell
published: True
position: 7
---

# TableCell



__TableCell__ element is a __BlockContainer__ element and defines a cell of content within a [Table]({%slug radwordsprocessing-model-table%}). It contains __Block__ elements such as [Paragraph]({%slug radwordsprocessing-model-paragraph%}) and [Table]({%slug radwordsprocessing-model-table%}).

## Inserting a TableCell

You can use the code snippet from __Example 1__ to create a __TableCell__ and add it in a [TableRow]({%slug radwordsprocessing-model-tablerow%}).
        

#### __Example 1: Create a TableCell object and add it to a TableRow__

```csharp
RadFlowDocument radFlowDocument = new RadFlowDocument();
Table table = radFlowDocument.Sections.AddSection().Blocks.AddTable();
TableRow row = table.Rows.AddTableRow();

TableCell cell = new TableCell(radFlowDocument);
row.Cells.Add(cell);
```



To create a __TableCell__ and add it in the document tree in the same time, you can use the __AddTableCell()__ method.
        

#### __Example 2: Create a TableCell and add it to a TableRow in the same time__

```csharp
TableRow row = table.Rows.AddTableRow();
TableCell cell = row.Cells.AddTableCell();
```


## Modifying a TableCell

The __TableCell__ element exposes several properties that allow you to customize its layout. A part of these properties are Style properties and some of the values represent a themable object.
        

>tip Style properties are properties that can be inherited from a style. For more information about styles see [this article]({%slug radwordsprocessing-concepts-style-properties%}).
          

>tip Themable objects are objects that can be inherited from a theme. For more information about themes check [this article]({%slug radwordsprocessing-concepts-document-themes%}).
          


* __Properties__: Retrieves all __TableCellProperties__. For more information read [this article]({%slug radwordsprocessing-concepts-style-properties%}).
            

* __Row__: Represents the parent __TableRow__ of the cell.
            
* __Table__: Represents the parent __Table__ of the cell.

* __Borders__: Specifies the borders of the cell. *This is a Style property.*

* __Shading__: Represents the shading applied to the cell. It is a composite object and is read-only. You can obtain the following properties from it:
            

    * __BackgroundColor__: Specifies the background color for the shading. *This is a Style property. The value is themable object.*

    * __PatternColor__: Specifies the pattern color for the shading. *This is a Style property. The value is themable object.*

    * __Pattern__: Specifies the pattern which is used to lay the pattern color over the background color for the shading. *This is a Style property.*

* __Padding__: Specifies the padding of the cell. *This is a Style property.*

* __ColumnSpan__: Indicates the total number of columns that the __TableCell__ spans within a __TableRow__. This property cannot be derived from a style.
            

* __RowSpan__: Specifies the total number of rows that the __TableCell__ spans within a __Table__. This property cannot be derived from a style.
            

* __IgnoreCellMarkerInRowHeightCalculation__: Specifies whether cell marker is ignored when row height is calculated. This property cannot be derived from a style.
            

* __CanWrapContent__: Specifies whether the content can be wrapped during the table layout. This property cannot be derived from a style.
            

* __PreferredWidth__: Specifies the preferred width of the cell. This property cannot be derived from a style.
            

* __VerticalAlignment__: Specifies the vertical alignment of the cell's content. This property cannot be derived from a style.

* __TextDirection__: Specifies the direction of the text in the cell. It could have one of the values of the [TextDirection enumeration](https://docs.telerik.com/devtools/document-processing/api/Telerik.Windows.Documents.Flow.Model.Styles.TextDirection.html). This property cannot be derived from a style.
            

* __GridColumnIndex__: Represents the column index of the cell in the table grid.
            

* __GridRowIndex__: Represents the row index of the cell in the table grid.
         
		    
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

__Example 3__ demonstrates how to add a __Paragraph__ to a __TableCell__.
            

#### __Example 3: Add a paragraph to a TableCell__


```csharp
Paragraph paragraph = cell.Blocks.AddParagraph();
```

Through the __BlockCollection__ property of the __TableCell__ element you can add a __Table__ or any other [BlockBase](https://docs.telerik.com/devtools/document-processing/api/Telerik.Windows.Documents.Flow.Model.BlockBase.html) element.
            

## See Also

 * [TableCell API Reference](https://docs.telerik.com/devtools/document-processing/api/Telerik.Windows.Documents.Flow.Model.TableCell.html)
 * [Document model]({%slug radwordsprocessing-model%})
 * [Table]({%slug radwordsprocessing-model-table%})
 * [TableRow]({%slug radwordsprocessing-model-tablerow%})
