---
title: Overview
description: Learn how to create, style, measure, and draw tables in PDF documents with RadPdfProcessing by using the Table API and editors.
page_title: RadPdfProcessing Table Overview
slug: radpdfprocessing-editing-table-overview
tags: table, pdf, tablerow, tablecell, radpdfprocessing, borders, padding, layout
published: True
position: 0
---

# RadPdfProcessing Table Overview

Use the `Table` class to generate tabular content in PDF documents with RadPdfProcessing. You define rows, cells, styling, and layout settings, and then pass the table to [FixedContentEditor]({%slug radpdfprocessing-editing-fixedcontenteditor%}) or [RadFixedDocumentEditor]({%slug radpdfprocessing-editing-radfixeddocumenteditor%}) to measure, position, draw, and split it across pages.

This overview explains the table building blocks, the main layout properties, and the different ways to insert or draw a table so you can choose the right workflow for your document scenario.

![Diagram of the RadPdfProcessing table model with rows and cells](images/RadPdfProcessing_Editing_Table_01.png)

Each table contains a series of [TableRow]({%slug radpdfprocessing-editing-table-tablerow%}) instances each of which contains a series of [TableCell]({%slug radpdfprocessing-editing-table-tablecell%}) instances. To define a simple table, generate the table cells and add some content to them.
        
Use this article when you need to:

* Create a PDF table from code.
* Apply shared styling to table cells.
* Control layout behavior such as width, spacing, and border collapse.
* Insert a table into a document by using `RadFixedDocumentEditor`.
* Draw a table with `FixedContentEditor` when you need extra placement control.
* Measure a table before you render it.

If you are new to the document editors, start with the editor choice in this article and then continue to the linked editor documentation for API details.

## Defining Table Content 

Each `Table` contains a collection of [TableRow]({%slug radpdfprocessing-editing-table-tablerow%}) instances, and each row contains a collection of [TableCell]({%slug radpdfprocessing-editing-table-tablecell%}) instances. To create a table, add the required cells and then assign content to each cell.

1. Create a `Table` instance.
2. Add rows and cells.
3. Put content in each cell.
4. Apply layout and styling properties.
5. Insert or draw the table with the appropriate editor.

Example 1 creates a table with two rows and three columns and fills each cell with sample text.

### Example 1: Create a Simple Table

<snippet id='libraries-pdf-editing-table-overview-create-simple-table'/>

The result is shown in Figure 1.

#### Figure 1: Table
![Simple two-row and three-column PDF table](images/RadPdfProcessing_Editing_Table_02.png)

## Using DefaultCellProperties

Use the table `DefaultCellProperties` property when the same styling should apply to every cell. This reduces repetitive cell-by-cell configuration and gives you a consistent base style for the whole table.

The most common default cell properties are:

| Property | Description |
|---|---|
| `Padding` | Specifies the distances between the inner cell border contour and the cell content. |
| `Borders` | Of type `TableCellBorders`. Specifies the borders of a single cell. The available borders are left, right, top, bottom, diagonal up, and diagonal down. |
| `Background` | Specifies the background of the cell. |

**Example 2** shows how to use the `DefaultCellProperties` of a table.
        

### Example 2: Use `DefaultCellProperties` on a Table

<snippet id='libraries-pdf-editing-table-overview-use-default-cell-properties-of-table'/>

The result of the snippet in **Example 2** is demonstrated in **Figure 2**.
        

#### Figure 2: Result of DefaultCellProperties modification
![Table with shared background, padding, and border styling](images/RadPdfProcessing_Editing_Table_03.png)

## Modifying a Table

Several table properties affect measurement, spacing, and rendering behavior:

* **Margin**: Specifies the distances between the table borders outline and the rest of the document content.
         
* **Padding**: Set through the `TableCell` `Padding` property, it specifies the distances between cell borders inner contour and the cell content.
            
* **LayoutType**: Specifies the algorithm used to layout table contents. Two options are available in the `TableLayoutType` enumeration:
	
	* **AutoFit** – The table width fits the content unless the needed width is bigger than the available measuring width.
	* **FixedWidth** – The table width always fits the available measuring width.

* **HorizontalAlignment**: Specifies the alignment of the table inside the page.

* **BorderSpacing**: Specifies the distance between all the borders in the table. This distance is measured differently depending on the **BorderCollapse** option.
         
* **BorderCollapse**: Specifies the way the border spacing calculations are done. Two options are available:
	* **Collapse**: The distance between borders is measured from the middle lines of the borders.
	* **Separate**: The distance between borders is measured from the outer border contour.

Examples 3 through 6 show how border calculations change when you switch the `BorderCollapse` option. Example 3 creates an empty table and applies default cell padding and a red table border with thickness `10`.

### Example 3: Create a Table with a Red Border

<snippet id='libraries-pdf-editing-table-overview-create-table-with-red-border'/>

Example 4 adds a single row with two cells to the table from Example 3. The first cell has a green border with thickness `5`, and the second cell has a blue border with thickness `3`.

### Example 4: Add Green and Blue Cells

<snippet id='libraries-pdf-editing-table-overview-add-green-and-blue-cells-to-table'/>

**Figure 3** shows the table from Example 3 and 4 with the `BorderCollapse` property set to `Collapse`. All borders are drawn so that their middle lines coincide.
        

### Example 5: Collapse Borders

<snippet id='libraries-pdf-editing-table-overview-collapse-table-border'/>

#### Figure 3: Collapsed border
![Table with collapsed borders where the border middle lines coincide](images/RadPdfProcessing_Editing_Table_04.png)

Figure 4 shows the same table with `BorderCollapse` set to `Separate`, so the outer border contours coincide.

### Example 6: Separate Borders

<snippet id='libraries-pdf-editing-table-overview-separate-table-border'/>

#### Figure 4: Separated border
![Table with separate borders and visible border spacing](images/RadPdfProcessing_Editing_Table_05.png)

## Drawing Table with RadFixedDocumentEditor

Use `RadFixedDocumentEditor.InsertTable()` when you want the editor to place the table in the document flow and split it across pages when needed. This is the easier option for standard document-generation scenarios.

Example 7 creates a simple table with two cells.

### Example 7: Create a Table

<snippet id='libraries-pdf-editing-table-overview-create-table'/>

**Example 8** inserts the table from **Example 7** in a `RadFixedDocumentEditor` and specifies the table layout type to `AutoFit`.
        

### Example 8: Insert an AutoFit Table

<snippet id='libraries-pdf-editing-table-overview-insert-autofit-table'/>

The result is that the table width is exactly as needed for fitting the cell content as visible in **Figure 5**.
        

#### Figure 5: AutoFit table
![AutoFit table sized to its cell content](images/RadPdfProcessing_Editing_Table_06.png)

Using `FixedWidth` produces different results because the editor fits the table to the available measuring width.

### Example 9: Insert a `FixedWidth` Table

<snippet id='libraries-pdf-editing-table-overview-insert-fixed-width-table'/>

#### Figure 6: FixedWidth table
![FixedWidth table stretched to the available width](images/RadPdfProcessing_Editing_Table_07.png)

## Drawing Table with FixedContentEditor

Use `FixedContentEditor.DrawTable()` when you need lower-level drawing control, such as custom positioning, transforms, or rotation.

Example 10 draws a rotated table with `FixedContentEditor`.

### Example 10: Draw a Rotated Table

<snippet id='libraries-pdf-editing-table-overview-draw-rotated-table'/>

Figure 7 shows a 45-degree rotated table similar to the one in Figure 5.

#### Figure 7: Rotated table
![Rotated PDF table drawn with FixedContentEditor](images/RadPdfProcessing_Editing_Table_08.png)

## Measuring a Table

The `Table` class exposes `Measure` overloads that calculate and return the desired size of the table without drawing it. This is useful when you need to know the table dimensions before inserting it into a document, for example when you must decide whether to use a new page or position other content relative to the table.

Use one of these overloads:

* `Measure(CancellationToken)`: Measures the table against an infinite available size and returns the resulting `Size`.
* `Measure(Size, CancellationToken)`: Measures the table against a constrained available size when the table must fit within a known width or height.

Example 11 demonstrates both measurement approaches.

### Example 11: Measure a Table

<snippet id='libraries-pdf-editing-table-overview-measure-table'/>

## Supported Border Styles

Starting with **Q3 2024**, RadPdfProcessing supports the `Dotted`, `Dashed`, and `DashSmallGap` border styles in addition to `BorderStyle.Single`. Starting with the same release, `Dotted`, `Dashed`, `DashSmallGap`, and `Thick` border lines are also exported from [RadFlowDocument]({%slug radwordsprocessing-model-radflowdocument%}) to [RadFixedDocument]({%slug radpdfprocessing-model-radfixeddocument%}).

| BorderStyle | Border design |
|----|----|
| `Single` | ![Preview of a single-line PDF table border](images/pdf-single-border.png) |
| `Dotted` | ![Preview of a dotted PDF table border](images/pdf-dotted-border.png) |
| `Dashed` | ![Preview of a dashed PDF table border](images/pdf-dashed-border.png) |
| `DashSmallGap` | ![Preview of a dash-small-gap PDF table border](images/pdf-dash-small-gap-border.png) |

## Next Steps

Continue with the article that matches your next task:

* [TableRow]({%slug radpdfprocessing-editing-table-tablerow%}) and [TableCell]({%slug radpdfprocessing-editing-table-tablecell%})&mdash;Customize row-level or cell-level behavior
* [Generating a Table with RadFixedDocumentEditor]({%slug generate-table-with-radfixeddocumenteditor%})&mdash;Follow a focused document-editor workflow
* [Creating Custom Layout Tables with RadPdfProcessing]({%slug customize-table-layout-radpdfprocessing%})&mdash;Apply more advanced layout control
* [Avoiding Table Splits Across Pages Using FixedContentEditor in RadPdfProcessing]({%slug avoid-table-splits-across-pages-radpdfprocessing%})&mdash;Handle page-breaking scenarios

## See Also

* [FixedContentEditor]({%slug radpdfprocessing-editing-fixedcontenteditor%})
* [RadFixedDocumentEditor]({%slug radpdfprocessing-editing-radfixeddocumenteditor%})
* [How to Generate a Table with Images with PdfProcessing]({%slug generate-table-with-images-pdf-processing%})
* [Implementing Column Span in RadPdfProcessing Tables]({%slug table-column-span-radpdfprocessing%})
* [How to Achieve Alternating Row Color for Tables in PdfProcessing]({%slug alternating-row-color-in-pdf-tables%})
