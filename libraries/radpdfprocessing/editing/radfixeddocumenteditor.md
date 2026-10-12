---
title: RadFixedDocumentEditor
page_title: RadFixedDocumentEditor
description: Learn how RadFixedDocumentEditor creates flow-based PDF documents and manages pages, sections, paragraphs, tables, images, runs, lists, and forms.
slug: radpdfprocessing-editing-radfixeddocumenteditor
tags: radfixeddocumenteditor, pdf, editing, sections, tables, radpdfprocessing, flowlayout, paragraphs
published: True
position: 6
components: [pdfprocessing]
---

# RadFixedDocumentEditor

Use `RadFixedDocumentEditor` from [RadPdfProcessing]({%slug radpdfprocessing-overview%}) to create a [RadFixedDocument]({%slug radpdfprocessing-model-radfixeddocument%}) by inserting elements in sequence. The editor calculates element sizes and lays out content, moving it to new pages as needed.


## Creating RadFixedDocumentEditor

**Example 1** demonstrates how to create a `RadFixedDocumentEditor` instance.
        

#### __Example 1: Create a RadFixedDocumentEditor__

<snippet id='pdf-create-fixed-document-editor'/>

>important `RadFixedDocumentEditor` implements `IDisposable`. Dispose it after you finish building the document. Otherwise, some content may not be finalized and may not appear in the exported PDF file.
          

## Sections

A `Section` is a sequence of [RadFixedPage]({%slug radpdfprocessing-model-radfixedpage%}) instances that share the same properties.
        

### SectionProperties

The section properties control the page size, margins, and orientation of the pages in a section. The following list includes the available properties:
            

* `PageSize`: The size of the pages in the section.

* `PageMargins`: The page margins.

* `PageRotation`: The page rotation. This enum supports the following values:
	* `Rotate0`: The page is not rotated. This is the default value.
	* `Rotate90`: The page is rotated to 90°.
	* `Rotate180`: The page is rotated to 180°.
	* `Rotate270`: The page is rotated to 270°.

#### __Example 2: Set section properties__

<snippet id='pdf-create-fixed-document-editor-section-properties'/>

### Starting New Section

The first section starts as soon as you insert content in the editor. If you set the section properties before you insert any content, the automatically created first section uses these values.

Add another section with the `InsertSectionBreak()` method, as shown in **Example 3**.
             
#### __Example 3: Start a section__

<snippet id='pdf-create-fixed-document-editor-start-section'/>

>note To change the properties of the next section, set them **before** you insert the section break. New values apply only to newly created sections.
             
### Starting New Page

All pages that have the same `SectionProperties` are part of the current section. To start a new page, use the following code:

#### __Example 4: Start a new page__

<snippet id='pdf-create-fixed-document-editor-start-page'/>

## Paragraphs

Paragraphs contain flowing inline content such as text and images.
        

### ParagraphProperties

Like sections, paragraphs have their own properties that control appearance.
            

* `SpacingBefore`: The spacing before the paragraph.

* `SpacingAfter`: The spacing after the paragraph.

* `LineSpacing`: The spacing between lines. The default value is `1.15`. When `LineSpacingType` is `Auto`, the value acts as a line-height multiplier. When `LineSpacingType` is `Exact` or `AtLeast`, it specifies line height in [Device Independent Pixels]({%slug device-independent-pixels%}) (DIPs).

* `LineSpacingType`: Specifies how to interpret line spacing through the `HeightType` values: `Auto`, `Exact`, and `AtLeast`. The default value is `Auto`.

* `FirstLineIndent`: The indent for the first line.

* `LeftIndent`: The left indent.

* `RightIndent`: The right indent.

* `BackgroundColor`: The background color.

* `HorizontalAlignment`: The horizontal alignment of the content.

* `ListId`: The ID of the list that the paragraph belongs to. If the value is `null`, the paragraph does not belong to a list.

* `ListLevel`: The list level the paragraph belongs to.

#### __Example 5: Set paragraph properties__

<snippet id='pdf-create-fixed-document-editor-paragraph-properties'/>

### Starting New Paragraph

The first paragraph starts as soon as you insert content in the editor. If you set paragraph properties before you insert content, the automatically created first paragraph uses these values.

To start a new paragraph, use the code in **Example 6**.

#### __Example 6: Start a paragraph__

<snippet id='pdf-create-fixed-document-editor-start-paragraph'/>

Starting a new paragraph uses the current paragraph properties. Changes to those properties take effect only when you start another paragraph.

## Inlines

A paragraph consists of two inline types: runs and images.
            
### Runs

A `Run` represents a sequence of characters that share the same properties.
                

#### __Example 7: Set character properties__

The following character properties control the appearance of runs:
                

* `FontSize`: The font size.

* `Font`: The font.

* `ForegroundColor`: The foreground color.

* `HighlightColor`: The highlight color.

* `BaselineAlignment`: Describes how the baseline for a text-based element is positioned on the vertical axis, relative to the established baseline for text:
	* `Baseline`: A baseline that is aligned at the actual baseline of the containing box.
	* `Subscript`: A baseline that is aligned at the subscript position of the containing box.
	* `Superscript`: A baseline that is aligned at the superscript position of the containing box.

* `UnderlinePattern`: The underline pattern. The following two patterns are supported:
	* `None`: There is no underline. This is the default value.
	* `Single`: The underline is a single line.

* `UnderlineColor`: The color of the underline.

* `StrikethroughPattern`: The strikethrough pattern. The following two patterns are supported:
	* `None`: There is no strikethrough. This is the default value.
	* `Single`: The strikethrough is a single line.

* `StrikethroughColor`: The color of the strikethrough.

**Setting CharacterProperties**

<snippet id='pdf-create-fixed-document-editor-char-properties'/>

>note For the character properties to take effect, set them **before** you insert the run.

>important In **.NET Standard/.NET (Target OS: None)** environments, fonts beyond the [14 standard ones]({%slug radpdfprocessing-concepts-fonts%}#standard-fonts) require a [FontsProvider implementation]({%slug pdfprocessing-implement-fontsprovider%}) to be resolved correctly.

### Inserting a Run

Several overloads insert a run. The code snippet in **Example 8** inserts runs with a specific font family, style, and weight.

#### __Example 8: Insert a run__

<snippet id='pdf-create-fixed-document-editor-insert-run'/>
                
>note The `\r` and `\n` characters do not create a new line when you insert text in a PDF document. To create multiline text, split the text and insert a line break explicitly.

The code in **Example 9** inserts a new run and a line break after it.
                

#### __Example 9: Insert a run and a line break__

<snippet id='pdf-create-fixed-document-editor-insert-line-run'/>

### Images

An image inline is a combination of an [ImageSource]({%slug radpdfprocessing-model-imagesource%}) object and its desired size.
                
You can insert an image inline using one of the following methods:
         
#### __Example 10: Insert an image__
   
<snippet id='pdf-create-fixed-document-editor-insert-image'/>

## Tables

The `Table` class implements the `IBlockElement` interface. Call `InsertTable()` to insert a table as a block in the document. `RadFixedDocumentEditor` positions and measures the table, then splits it across pages when needed. Example 11 shows how to insert a table:
        

#### __Example 11: Insert a table__

<snippet id='pdf-fixed-document-editor-insert-table'/>     

For more detailed information on tables, see the [Table]({%slug radpdfprocessing-editing-table-overview%}) documentation article.
        
## Block Elements

The <a href="https://docs.telerik.com/devtools/document-processing/api/Telerik.Documents.Fixed.Model.Editing.Flow.IBlockElement" target="_blank">`IBlockElement` API reference</a> describes the interface that lets the editor draw and split block content across pages. The [Block]({%slug radpdfprocessing-editing-block%}) and [Table]({%slug radpdfprocessing-editing-table-overview%}) classes implement this interface. Call `InsertBlock()` to add a block element to `RadFixedDocumentEditor`, as shown in Example 12:

#### __Example 12: Insert a block element__

<snippet id='pdf-fixed-document-editor-insert-block-element'/>

## Lists

To insert list items with `RadFixedDocumentEditor`, add a `List` to its `ListCollection` through the `Lists` property. For each list item, set `ListId` and `ListLevel` through `RadFixedDocumentEditor.ParagraphProperties`. Each new paragraph becomes a list item.

The following example adds a list and inserts a paragraph with the corresponding list properties:

#### __Example 13: Insert a list__

<snippet id='pdf-fixed-document-editor-insert-list'/>

For more information, see the [RadPdfProcessing list documentation]({%slug radpdfprocessing-editing-list%}).

## Forms

With `RadFixedDocumentEditor`, you can insert a form (`Form XObject`) element.

#### __Example 14: Insert a form__
<snippet id='pdf-fixed-document-editor-insert-form'/>

There is an additional overload of `InsertFormInline()` that lets you pass the size to use for the form.

>note For more information about creating forms, see the [Form]({%slug radpdfprocessing-model-form%}) and [FormSource]({%slug radpdfprocessing-model-formsource-overview%}) articles.


## See Also

* [RadFixedDocument]({%slug radpdfprocessing-model-radfixeddocument%})
* [RadFixedPage]({%slug radpdfprocessing-model-radfixedpage%})
* [ImageSource]({%slug radpdfprocessing-model-imagesource%})
* [Table]({%slug radpdfprocessing-editing-table-overview%})
* [How to Generate a PDF Document from Images with RadFixedDocumentEditor]({%slug pdf-from-images-with-radfixeddocumenteditor%})
* [Generating a Table with RadFixedDocumentEditor]({%slug generate-table-with-radfixeddocumenteditor%})
* [Generating a PDF Product Catalog]({%slug generating-pdf-product-catalog%})
* [Choosing Between Word and PDF Editors for Document Generation]({%slug choose-right-editor-radflowdocumenteditor-radfixeddocumenteditor-fixedcontenteditor%})
