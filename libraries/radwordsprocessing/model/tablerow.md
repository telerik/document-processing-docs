---
title: TableRow
page_title: TableRow
slug: radwordsprocessing-model-tablerow
tags: tablerow
published: True
position: 6
---

# TableRow



__TableRow__ is a flow document element that defines a row within a [Table]({%slug radwordsprocessing-model-table%}). It contains a collection of [TableCell]({%slug radwordsprocessing-model-tablecell%}) elements.
      

* [Inserting a TableRow](#inserting-a-tablerow)

* [Modifying a TableRow](#modifying-a-tablerow)

* [Operating with a TableRow](#operating-with-a-tablerow)


## Inserting a TableRow

You can use the code snippet from __Example 1__ to create a __TableRow__ and add it in a __Table__.
        

#### __Example 1: Create a TableRow and add it to a table__

<snippet id='codeblock-dede'/> 

In order to create a __TableRow__ and add it in the document tree in the same time, you can use the __AddTableRow()__ method of the [Rows](https://docs.telerik.com/devtools/document-processing/api/Telerik.Windows.Documents.Flow.Model.Table.html#collapsible-Telerik_Windows_Documents_Flow_Model_Table_Rows) collection property of the table.
        

#### __Example 2: Create a TableRow and add it to a table in the same time__

<snippet id='codeblock-dfdf'/>



## Modifying a TableRow

The __TableRow__ element exposes several properties that allow you to customize its layout. Some of the properties are Style properties.
        

>tip Style properties are properties that can be inherited from a style. For more information about styles see [this article]({%slug radwordsprocessing-concepts-style-properties%}).


* __Properties__: Gets all table row properties as TableRowProperties object. More info on how to use table row properties can be found in [Style Properties]({%slug radwordsprocessing-concepts-style-properties%}) article.
            

* __Cells__: Retrieves a collection of __Cell__ elements in the current TableRow.
            

* __Table__: Retrieves the parent Table element of the row.
            

* __GridRowIndex__: Represents the index of the row in the table grid.
            

* __TableCellSpacing__: Specifies the spacing between adjacent cells and the edges of the table. The value is in device independent pixels (1/96 inch). The default value is *0*. *This is a Style property.*

* __RepeatOnEveryPage__: Indicates whether this row should be repeated on every new page. The default value is *false*. *This property cannot be derived from a style.*
            

* __CanSplit__: Specifies whether the content of the row can be split across multiple pages. The default value is *true*. *This property cannot be derived from a style.*
            

* __Height__: Specifies the row height. *This property cannot be derived from a style.*
            

          

## Operating with a TableRow

### Add TableCell Elements to a TableRow

__Example 3__ shows how to add a number of __TableCell__ elements in a TableRow.
            

#### __Example 3: Add TableCell objects to a TableRow__

<snippet id='codeblock-dgdg'/>



## See Also

 * [TableRow API Reference](https://docs.telerik.com/devtools/document-processing/api/Telerik.Windows.Documents.Flow.Model.TableRow.html)
 * [Table]({%slug radwordsprocessing-model-table%})
 * [TableCell]({%slug radwordsprocessing-model-tablecell%})
 * [Style Properties]({%slug radwordsprocessing-concepts-style-properties%})
