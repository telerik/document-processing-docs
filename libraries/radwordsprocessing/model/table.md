---
title: Table
page_title: Table
slug: radwordsprocessing-model-table
tags: table
published: True
position: 5
---

# Table



__Table__ element is a __Block__ element that provides a grid-based organization. It accepts [TableRow]({%slug radwordsprocessing-model-tablerow%}) objects as children. The __TableRow__ object contains [TableCell]({%slug radwordsprocessing-model-tablecell%}).
      

* [Inserting a Table](#inserting-a-table)

* [Modifying a Table](#modifying-a-table)

* [Operating with a Table](#operating-with-a-table)


## Inserting a Table

When creating an instance of the Table class, you should pass the document that the table belongs to as a parameter to the constructor. Tables can be added as a child of a [BlockContainer](https://docs.telerik.com/devtools/document-processing/api/Telerik.Windows.Documents.Flow.Model.BlockContainerBase.html) element – [Section]({%slug radwordsprocessing-model-section%}), [TableCell]({%slug radwordsprocessing-model-tablecell%}), [Headers and Footers]({%slug radwordsprocessing-model-headers-footers%}), through the __Blocks__ collection. 
        

The code snippet from __Example 1__ creates and inserts a Table to a Section.
        

#### __Example 1: Create and insert a table to a section__

<snippet id='codeblock-dz'/>



>tip The parent BlockContainer element (in this case - the *section*) should belong to the same document that is passed to the constructor of the __Table__.
          

You can add a table at a specific index in the __Blocks__ collection of a __BlockContainer__ using the __Insert()__ method. __Example 2__ shows how to add a table at the beginning of a section.
        

#### __Example 2: Insert a table at a specific index__

<snippet id='codeblock-dada'/>



You can also use the __AddTable()__ method of the __Blocks__ collection of a __BlockContainer__. The method creates a new __Table__ instance, adds it to the container and returns it.
        

#### __Example 3: Insert a new table to a container__

<snippet id='codeblock-dbdb'/>



Inserting a new __Table__ in the document can also be achieved with the [RadFlowDocumentEditor]({%slug radwordsprocessing-editing-radflowdocumenteditor%}) class.
        

#### __Example 4: Insert a table using RadFlowDocumentEditor__

<snippet id='codeblock-dcdc'/>



## Modifying a Table

__Properties__ exposes several properties that allow you to customize the layout of the elements placed underneath it. A part of these properties are Style properties and some of the values represent a themable object.
        
>tip Style properties are properties that can be inherited from a style. For more information about styles see [this article]({%slug radwordsprocessing-concepts-style-properties%}).
          

>tip Themable objects are objects that can be inherited from a theme. For more information about themes check [this article]({%slug radwordsprocessing-concepts-document-themes%}).



* __Properties__:  Gets all table properties as TableProperties object. More info on how to use table properties can be found in [Style Properties]({%slug radwordsprocessing-concepts-style-properties%}) article.
            

* __Rows__: Represents __TableRowCollection__ of the Table.
            
* __StyleId__: Represents the ID of the style applied to the Table element.
            
* __Alignment__: Specifies the alignment of the Table. *This is a Style property.*

* __Borders__: Specifies the borders of the Table. *This is a Style property.*

* __Shading__: Represents the shading applied to the table. It is a composite object and is read-only. You can obtain the following properties from it:

    * __BackgroundColor__: Specifies the background color for the shading. *This is a Style property. The value is themable object.*
    * __PatternColor__: Specifies the pattern color for the shading. *This is a Style property. The value is themable object.*
    * __Pattern__: Specifies the pattern which is used to lay the pattern color over the background color for the shading. *This is a Style property.*

* __GridColumnsCount__: Returns the number of the columns in the table grid.
            

* __GridRowsCount__: Returns the number of the rows in the table grid.
            

* __TableCellSpacing__: Specifies the spacing between adjacent cells and the edges of the table.The value is in device independent pixels (1/96 inch). *This is a Style property.*

* __HasCellSpacing__: Indicates whether there is TableCellSpacing applied in the table.
            

* __TableCellPadding__: Specifies the default padding of the cells inside the table. *This is a Style property.*

* __Indent__: Represents the size of the indent added before the leading edge of the table.The value is in device independent pixels (1/96 inch). *This is a Style property.*

* __FlowDirection__: Represents the flow direction of cells inside the table. The default value is LeftToRight. This property cannot be derived from a style.
            

* __PreferredWidth__: Specifies the preferred width of the table. This property cannot be derived from a style.
            

* __Looks__: Specifies the value indicating which components of the conditional style should be applied if such exists. This property cannot be derived from a style.
            

* __LayoutType__: Specifies the algorithm which is used to lay out the contents of this table. The possible values are __FixedWidth__ or __AutoFit__. The default is __AutoFit__. This property cannot be derived from a style.
            

* __Overlap__: Indicates whether this floating table allows other floating tables to overlap its extents. This property cannot be derived from a style.
         

## Operating with a Table

### Creating a Table with Content

__Example 5__ demonstrates how to add a __Table__ with 5 rows and 10 columns to a __RadFlowDocument__.
            

#### __Example 5: Create a table with content and add it to a RadFlowDocument__

<snippet id='codeblock-dddd'/>



## See Also

 * [Table API Reference](https://docs.telerik.com/devtools/document-processing/api/Telerik.Windows.Documents.Flow.Model.Table.html)
 * [Section]({%slug radwordsprocessing-model-section%})
 * [TableRow]({%slug radwordsprocessing-model-tablerow%})
 * [TableCell]({%slug radwordsprocessing-model-tablecell%})
 * [Style Properties]({%slug radwordsprocessing-concepts-style-properties%})
 * [Finding a Table Containing a Specific Bookmark in Word Documents]({%slug radwordsprocessing-find-table-by-bookmark%})
 * [Generating Dynamic DOCX Documents with Tables and CheckBoxes using RadWordsProcessing]({%slug dynamic-docx-document-generation-radwordsprocessing%})
 * [Creating Headers with Left, Center, and Right Text/Image in Exported PDF Documents Using RadWordsProcessing]({%slug customize-headers-pdf-radwordsprocessing%})
 * [How To Handle Missing Content in Nested Tables While  Converting DOCX to PDF Format]({%slug handle-missing-content-in-nested-tables-while-converting-docx-to-pdf%})

