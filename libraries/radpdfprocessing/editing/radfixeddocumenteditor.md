---
title: RadFixedDocumentEditor
page_title: RadFixedDocumentEditor
description: Learn how to use RadFixedDocumentEditor to create PDF documents in a flow-like manner with automatic page management, sections, paragraphs, tables, and lists.
slug: radpdfprocessing-editing-radfixeddocumenteditor
tags: radfixeddocumenteditor, pdf, editing, sections, tables, radpdfprocessing, flowlayout, paragraphs
published: True
position: 6
---

# RadFixedDocumentEditor 

`RadFixedDocumentEditor` allows you to create a [RadFixedDocument]({%slug radpdfprocessing-model-radfixeddocument%}) in a flow-like manner and insert all desired elements one after another. When the document is rendered, the size of the elements is automatically calculated. The editor provides a convenient API that allows the generation of documents, which automatically flow to pages.    

* [Creating RadFixedDocumentEditor](#creating-radfixeddocumenteditor)

* [Sections](#sections)

* [Paragraphs](#paragraphs)

* [Inlines](#inlines)

* [Tables](#tables)

* [Block Elements](#block-elements)

* [Lists](#lists)

* [Forms](#forms)

## Creating RadFixedDocumentEditor

**Example 1** demonstrates how to create a `RadFixedDocumentEditor` instance.
        

**Create RadFixedDocumentEditor**

<snippet id='pdf-create-fixed-document-editor'/>

>`RadFixedDocumentEditor` inherits from `IDisposable` so you must properly dispose it when the document is created. Otherwise, some of the content may not be finished, that is, it might not appear on the PDF document.
          

## Sections

A `Section` is a sequence of [RadFixedPages]({%slug radpdfprocessing-model-radfixedpage%}) with the same properties.
        

### SectionProperties

The section properties control the page size, margins, and orientation of `RadFixedPages` in a section. The following is the complete list of section properties:
            

* `PageSize`: The size of the pages that are part of the section.                

* `PageMargins`: The page margins of a page.

* `PageRotation`: The page rotation. This is an enum that can take one of the following values:
	* `Rotate0`: The page is not rotated. This is the default value.
	* `Rotate90`: The page is rotated to 90°.
	* `Rotate180`: The page is rotated to 180°.
	* `Rotate270`: The page is rotated to 270°.

**Setting section properties**

<snippet id='pdf-create-fixed-document-editor-section-properties'/>

### Starting New Section

The first section of a document starts as soon as content is inserted to the editor. You can change the section properties before inserting any content and they are applied to the section that is automatically created.     

Add an additional section with the `InsertSectionBreak()` method as demonstrated in **Example 2**.
             
**Start a section**

<snippet id='pdf-create-fixed-document-editor-start-section'/>

>To change the properties of the next section, ensure you do it **before** you insert the section break. New properties are only used for newly created sections.
             
### Starting New Page

All pages that have the same `SectionProperties` are part of the current section. To start a new page, use the following code:

**Start new page**

<snippet id='pdf-create-fixed-document-editor-start-page'/>

## Paragraphs

Paragraphs are blocks of flowing inlines—images and text.
        

### ParagraphProperties

Similar to the section properties, a paragraph has its own properties that control its appearance.
            

* `SpacingBefore`: Represents the spacing before.

* `SpacingAfter`: Represents the spacing after.

* `LineSpacing`: The spacing between the lines.

* `LineSpacingType`: Specifies how to interpret the line spacing.

* `FirstLineIndent`: The indent for the first line.

* `LeftIndent`: The left indent.

* `RightIndent`: The right indent.

* `BackgroundColor`: The background color.

* `HorizontalAlignment`: The horizontal alignment of the content.

* `ListId`: The ID of the list the paragraph belongs to. If null, then the paragraph belongs to no list.

* `ListLevel`: The list level the paragraph belongs to.

**Setting paragraph properties**

<snippet id='pdf-create-fixed-document-editor-paragraph-properties'/>

### Starting New Paragraph

The first paragraph is created as soon as content is inserted in the editor. You can change paragraph properties before inserting content and when the first paragraph is created automatically, it uses the desired properties.            

To start a new paragraph, use the code in **Example 4**.           

**Start a paragraph**

<snippet id='pdf-create-fixed-document-editor-start-paragraph'/>

The result of this method is that a new paragraph starts and uses the current paragraph properties. Until a new paragraph starts, changes in the paragraph properties are not applied.

## Inlines

A paragraph is built of two types of inlines—runs and images.
            
### Runs

A `Run` represents a collection of characters that have the same properties.
                

**CharacterProperties**

The following character properties control the appearance of runs:
                

* `FontSize`: The font size.

* `Font`: The font.

* `ForegroundColor`: The foreground color.

* `HighlightColor`: The highlight color.

* `BaselineAlignment`: Describes how the baseline for a text-based element is positioned on the vertical axis, relative to the established baseline for text.
	* `Baseline`: A baseline that is aligned at the actual baseline of the containing box.
	* `Subscript`: A baseline that is aligned at the subscript position of the containing box.
	* `Superscript`: A baseline that is aligned at the superscript position of the containing box.

* `UnderlinePattern`: The underline pattern. Two patterns are supported.
	* `None`: There is no underline. This is the default value.
	* `Single`: The underline is a single line.

* `UnderlineColor`: The color of the underline.

* `StrikethroughPattern`: The strikethrough pattern. Two patterns are supported.
	* `None`: There is no strikethrough. This is the default value.
	* `Single`: The strikethrough is a single line.

* `StrikethroughColor`: The color of the strikethrough.

**Setting CharacterProperties**

<snippet id='pdf-create-fixed-document-editor-char-properties'/>

>For the character properties to take effect, set them **before** inserting the run.

>important In **.NET Standard/.NET (Target OS: None)** environments, fonts beyond the [14 standard ones]({%slug radpdfprocessing-concepts-fonts%}#standard-fonts) require a [FontsProvider implementation]({%slug pdfprocessing-implement-fontsprovider%}) to be resolved correctly.

### Inserting a Run

Several overloads insert a run. The code snippet in **Example 8** inserts new runs with specific font family, style, and weight.         

**Insert run**

<snippet id='pdf-create-fixed-document-editor-insert-run'/>

Several overloads insert a run. The code snippet in **Example 8** inserts a couple of new runs, one of which with a specific font family.
                
>The '\r' and '\n' characters do not have the usual meaning of "go to next line" when inserted into a PDF document, and you cannot insert text containing these characters to produce multiline text. Instead, split the text and insert a line break.

The code in **Example 9** inserts a new run and a line break after it.
                

**Insert run and line break**

<snippet id='pdf-create-fixed-document-editor-insert-line-run'/>

### Images

An image inline is a combination of an [ImageSource]({%slug radpdfprocessing-model-imagesource%}) object and its desired size.
                
### Inserting Image

You can insert an image inline using one of the following methods:
         
**Insert image**
   
<snippet id='pdf-create-fixed-document-editor-insert-image'/>

## Tables

The `Table` class implements the `IBlockElement` interface and you can insert an instance of this class as a new block in the document. Insert the table using the `InsertTable()` method as illustrated in **Example 11**. `RadFixedDocumentEditor` takes care of positioning, measuring, and splitting the table onto pages.
        

**Insert table**

<snippet id='pdf-fixed-document-editor-insert-table'/>     

For more detailed information on tables, see the [Table]({%slug radpdfprocessing-editing-table-overview%}) documentation article.
        
## Block Elements

The [IBlockElement](https://docs.telerik.com/devtools/document-processing/api/Telerik.Windows.Documents.Fixed.Model.Editing.Flow.IBlockElement.html) interface allows you to draw and split block content onto pages. The [Block]({%slug radpdfprocessing-editing-block%}) and [Table]({%slug radpdfprocessing-editing-table-overview%}) classes implement this interface. Add a block element instance with `RadFixedDocumentEditor` using the `InsertBlock()` method as illustrated in **Example 12**.

**Insert Block element**

<snippet id='pdf-fixed-document-editor-insert-block-element'/>

## Lists

You can insert list items with `RadFixedDocumentEditor`. First, add a `List` to the editor `ListCollection` by using the `Lists` property. Then, each time you want to add a list item, set the appropriate `ListId` and `ListLevel` property values through the `RadFixedDocumentEditor` `ParagraphProperties`. Inserting a new paragraph results in adding a new list item.

The following code snippet shows how to add a new list to the `RadFixedDocumentEditor` `ListCollection` and then insert a paragraph with the corresponding list properties:

**Insert list**

<snippet id='pdf-fixed-document-editor-insert-list'/>

More detailed information about lists is available in the [List documentation article]({%slug  radpdfprocessing-editing-list%}).

### Forms

With the `RadFixedDocumentEditor` class you can insert a Form (Form-XObject) element. 

**Insert a form**
<snippet id='pdf-fixed-document-editor-insert-form'/>

There is an additional overload of `InsertFormInline()` that allows you to pass the size that should be used for the form.

>For more information on how to create a form, see the [Form]({%slug radpdfprocessing-model-form%}) and [FormSource]({%slug radpdfprocessing-model-formsource-overview%}) articles.


## See Also

* [RadFixedDocument]({%slug radpdfprocessing-model-radfixeddocument%})
* [RadFixedPage]({%slug radpdfprocessing-model-radfixedpage%})
* [ImageSource]({%slug radpdfprocessing-model-imagesource%})
* [Table]({%slug radpdfprocessing-editing-table-overview%})
* [How to Generate a PDF Document from Images with RadFixedDocumentEditor]({%slug pdf-from-images-with-radfixeddocumenteditor%})
* [Generating a Table with RadFixedDocumentEditor]({%slug generate-table-with-radfixeddocumenteditor%})
* [Generating a PDF Product Catalog]({%slug generating-pdf-product-catalog%})
* [Choosing Between Word and PDF Editors for Document Generation]({%slug choose-right-editor-radflowdocumenteditor-radfixeddocumenteditor-fixedcontenteditor%})
