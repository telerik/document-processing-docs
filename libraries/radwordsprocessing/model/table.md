---
title: Table
description: Learn about the Table block element in RadWordsProcessing that provides grid-based organization using rows and cells.
page_title: Table
slug: radwordsprocessing-model-table
tags: table, word, docx, document, flow, model, rows, cells, layout
published: True
position: 5
---

# Table

The `Table` element is a `Block` element that provides a grid-based organization. It accepts [TableRow]({%slug radwordsprocessing-model-tablerow%}) objects as children. The `TableRow` object contains [TableCell]({%slug radwordsprocessing-model-tablecell%}).

* [Inserting a Table](#inserting-a-table)
* [Modifying a Table](#modifying-a-table)
* [Operating with a Table](#operating-with-a-table)


## Inserting a Table

When creating an instance of the `Table` class, pass the document that the table belongs to as a parameter to the constructor. You can add tables as a child of a [BlockContainer](https://docs.telerik.com/devtools/document-processing/api/Telerik.Windows.Documents.Flow.Model.BlockContainerBase.html) element—[Section]({%slug radwordsprocessing-model-section%}), [TableCell]({%slug radwordsprocessing-model-tablecell%}), [Headers and Footers]({%slug radwordsprocessing-model-headers-footers%})—through the `Blocks` collection.

The code snippet from **Example 1** creates and inserts a `Table` to a `Section`.

**Example 1: Create and insert a table to a section**

<snippet id='libraries-flow-model-table-1'/>

>tip The parent `BlockContainer` element (in this case, the `Section`) must belong to the same document that is passed to the constructor of the `Table`.

You can add a table at a specific index in the `Blocks` collection of a `BlockContainer` by using the `Insert()` method. **Example 2** shows how to add a table at the beginning of a section.

**Example 2: Insert a table at a specific index**

<snippet id='libraries-flow-model-table-2'/>

You can also use the `AddTable()` method of the `Blocks` collection of a `BlockContainer`. The method creates a new `Table` instance, adds it to the container, and returns it.

**Example 3: Insert a new table to a container**

<snippet id='libraries-flow-model-table-3'/>

You can also insert a new `Table` in the document with the [RadFlowDocumentEditor]({%slug radwordsprocessing-editing-radflowdocumenteditor%}) class.

**Example 4: Insert a table using RadFlowDocumentEditor**

<snippet id='libraries-flow-model-table-4'/>

## Modifying a Table

The `Table` element exposes several properties that allow you to customize the layout of the elements placed underneath it. Some of these properties are style properties, and some of the values represent a themable object.

>tip Style properties are properties that can be inherited from a style. For more information about styles, see [Style Properties]({%slug radwordsprocessing-concepts-style-properties%}). Themable objects are objects that can be inherited from a theme. For more information about themes, see [Document Themes]({%slug radwordsprocessing-concepts-document-themes%}).

* `Properties`: Gets all table properties as a `TableProperties` object. For more information on how to use table properties, see the [Style Properties]({%slug radwordsprocessing-concepts-style-properties%}) article.

* `Rows`: Represents the `TableRowCollection` of the `Table`.

* `StyleId`: Represents the ID of the style applied to the `Table` element.

* `Alignment`: Specifies the alignment of the `Table`. *This is a style property.*

* `Borders`: Specifies the borders of the `Table`. *This is a style property.*

* `Shading`: Represents the shading applied to the table. It is a composite object and is read-only. You can obtain the following properties from it:

    * `BackgroundColor`: Specifies the background color for the shading. *This is a style property. The value is a themable object.*
    * `PatternColor`: Specifies the pattern color for the shading. *This is a style property. The value is a themable object.*
    * `Pattern`: Specifies the pattern that is used to lay the pattern color over the background color for the shading. *This is a style property.*

* `GridColumnsCount`: Returns the number of columns in the table grid.

* `GridRowsCount`: Returns the number of rows in the table grid.

* `TableCellSpacing`: Specifies the spacing between adjacent cells and the edges of the table. The value is in device independent pixels (1/96 inch). *This is a style property.*

* `HasCellSpacing`: Indicates whether `TableCellSpacing` is applied in the table.

* `TableCellPadding`: Specifies the default padding of the cells inside the table. *This is a style property.*

* `Indent`: Represents the size of the indent added before the leading edge of the table. The value is in device independent pixels (1/96 inch). *This is a style property.*

* `FlowDirection`: Represents the flow direction of cells inside the table. The default value is `LeftToRight`. This property cannot be derived from a style.

* `PreferredWidth`: Specifies the preferred width of the table. This property cannot be derived from a style.

* `Looks`: Specifies which components of the conditional style to apply, if one exists. This property cannot be derived from a style.

* `LayoutType`: Specifies the algorithm that is used to lay out the contents of this table. The possible values are `FixedWidth` or `AutoFit`. The default is `AutoFit`. This property cannot be derived from a style.

* `Overlap`: Indicates whether this floating table allows other floating tables to overlap its extents. This property cannot be derived from a style.

## Operating with a Table

### Creating a Table with Content

**Example 5** demonstrates how to add a `Table` with 5 rows and 10 columns to a `RadFlowDocument`.

**Example 5: Create a table with content and add it to a RadFlowDocument**

<snippet id='libraries-flow-model-table-5'/>

## See Also

* [Table API Reference](https://docs.telerik.com/devtools/document-processing/api/Telerik.Windows.Documents.Flow.Model.Table.html)
* [Section]({%slug radwordsprocessing-model-section%})
* [TableRow]({%slug radwordsprocessing-model-tablerow%})
* [TableCell]({%slug radwordsprocessing-model-tablecell%})
* [Style Properties]({%slug radwordsprocessing-concepts-style-properties%})
* [Finding a Table Containing a Specific Bookmark in Word Documents]({%slug radwordsprocessing-find-table-by-bookmark%})
* [Generating Dynamic DOCX Documents with Tables and CheckBoxes Using RadWordsProcessing]({%slug dynamic-docx-document-generation-radwordsprocessing%})
* [Creating Headers with Left, Center, and Right Text/Image in Exported PDF Documents Using RadWordsProcessing]({%slug customize-headers-pdf-radwordsprocessing%})
* [How to Handle Missing Content in Nested Tables While Converting DOCX to PDF Format]({%slug handle-missing-content-in-nested-tables-while-converting-docx-to-pdf%})

