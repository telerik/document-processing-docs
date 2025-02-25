---
title: RadFixedDocumentEditor
page_title: RadFixedDocumentEditor
description: RadFixedDocumentEditor
slug: radpdfprocessing-editing-radfixeddocumenteditor
published: True
position: 6
---

# RadFixedDocumentEditor 

**RadFixedDocumentEditor** allows you to create a [RadFixedDocument]({%slug radpdfprocessing-model-radfixeddocument%}) in a flow-like manner and insert all desired elements one after another. When the document is rendered, the size of the elements will be automatically calculated. The editor provides a convenient API that enables the generation of documents, which automatically flow to pages.    

* [Creating RadFixedDocumentEditor](#creating-radfixeddocumenteditor)

* [Sections](#sections)

* [Paragraphs](#paragraphs)

* [Inlines](#inlines)

* [Tables](#tables)

* [Block Elements](#block-elements)

* [Lists](#lists)

* [Forms](#forms)

## Creating RadFixedDocumentEditor

__Example 1__ demonstrates how a RadFixedDocumentEditor instance can be created.
        

#### __[C#] Example 1: Create RadFixedDocumentEditor__

{{region cs-radpdfprocessing-editing-radfixeddocumenteditor_0}}
	RadFixedDocument radFixedDocument = new RadFixedDocument();
	RadFixedDocumentEditor radFixedDocumentEditor = new RadFixedDocumentEditor(radFixedDocument);
	
	//Use RadFixedDocumentEditor...

	radFixedDocumentEditor.Dispose();
{{endregion}}

>__RadFixedDocumentEditor__ inherits from __IDisposable__ so it should be properly disposed when the document is created. Otherwise, some of the content may not be finished, i.e. it might not appear on the PDF document.
          

## Sections

__Section__ is a sequence of [RadFixedPages]({%slug radpdfprocessing-model-radfixedpage%}) with the same properties.
        

### SectionProperties

The section properties are responsible for the page size, margins and orientation of __RadFixedPages__ in a section. Below is the complete list of section properties:
            

* __PageSize__: The size of the pages that are part of the section.                

* __PageMargins__: The page margins of a page.

* __PageRotation__: The page rotation. This is enum that can take one of the following values:
	* __Rotate0__: The page is not rotated. This is the default value.
	* __Rotate90__: The page is rotated to 90°.
	* __Rotate180__: The page is rotated to 180°.
	* __Rotate270__: The page is rotated to 270°.

#### __[C#] Example 2: Setting section properties__                    

{{region cs-radpdfprocessing-editing-radfixeddocumenteditor_1}}
	radFixedDocumentEditor.SectionProperties.PageSize = new Size(100,100);
	radFixedDocumentEditor.SectionProperties.PageRotation = Telerik.Windows.Documents.Fixed.Model.Data.Rotation.Rotate90;
{{endregion}}

### Starting New Section

The first section of a document starts as soon as a content is inserted to the editor. You can change the Section properties before inserting any content and they will be applied to the section that is automatically created.
            

Adding an additional section is achieved with the __InsertSectionBreak()__ method as demonstrated in __Example 2__.
            

#### __[C#] Example 3: Start a section__

{{region cs-radpdfprocessing-editing-radfixeddocumenteditor_2}}
	radFixedDocumentEditor.InsertSectionBreak();
{{endregion}}



>If you want to change the properties of the next section, make sure to do it __before__ you insert the section break. New properties are only used for newly created sections.
            
### Starting New Page
All pages that have the same __SectionProperties__ are part of the current section. To start a new page, you can use the following code:

#### __[C#] Example 4: Start new page__
{{region cs-radpdfprocessing-editing-radfixeddocumenteditor_3}}
	radFixedDocumentEditor.InsertPageBreak();
{{endregion}}

## Paragraphs

__Paragraphs__ are blocks of flowing inlines - images and text.
        

### ParagraphProperties

Similar to the section properties, paragraph has its own properties that are responsible for the way it looks.
            

* __SpacingBefore__: Represents the spacing before.

* __SpacingAfter__: Represents the spacing after.

* __LineSpacing__: The spacing between the lines.

* __LineSpacingType__: Specifies how to interpret the line spacing.

* __FirstLineIndent__: The indent for the first line.

* __LeftIndent__: The left indent.

* __RightIndent__: The right indent.

* __BackgroundColor__: The background color.

* __HorizontalAlignment__: The horizontal alignment of the content.

* __ListId__: The id of the list the paragraph belongs to. If null, then the paragraph belongs to no list.

* __ListLevel__: The list level the paragraph belongs to.

#### __[C#] Example 5: Setting paragraph properties__

{{region cs-radpdfprocessing-editing-radfixeddocumenteditor_4}}
	radFixedDocumentEditor.ParagraphProperties.SpacingAfter = 10;
	radFixedDocumentEditor.ParagraphProperties.LineSpacingType = HeightType.Auto;
	adFixedDocumentEditor.ParagraphProperties.BackgroundColor = new RgbColor(0, 100, 0);
	radFixedDocumentEditor.ParagraphProperties.HorizontalAlignment = Telerik.Windows.Documents.Fixed.Model.Editing.Flow.HorizontalAlignment.Center;
{{endregion}}

### Starting New Paragraph

The first paragraph is created as soon as content is inserted in the editor. You can change paragraph properties before inserting content and when the first paragraph is created automatically, it will use the desired properties.
            

In order to start a new paragraph, use the code in __Example 4__.
            

#### __[C#] Example 6: Start a paragraph__

{{region cs-radpdfprocessing-editing-radfixeddocumenteditor_5}}
	radFixedDocumentEditor.InsertParagraph();
{{endregion}}


The result of this method is that a new paragraph is started and it uses the current paragraph properties. Until a new paragraph is started, changes in the paragraph properties are not applied.
            

## Inlines

A Paragraph is built of two types of inlines - runs and images.
            

### Runs

__Run__ represents a collection of characters that have the same properties.
                

__CharacterProperties__

The character properties that are responsible for the look of the runs are listed below.
                

* __FontSize__: The font size.

* __Font__: The font.

* __ForegroundColor__: The foreground color.

* __HighlightColor__: The highlight color.

* __BaselineAlignment__: Describes how the baseline for a text-based element is positioned on the vertical axis, relative to the established baseline for text.
	* __Baseline__: A baseline that is aligned at the actual baseline of the containing box.
	* __Subscript__: A baseline that is aligned at the subscript position of the containing box.
	* __Superscript__: A baseline that is aligned at the superscript position of the containing box.

* __UnderlinePattern__: Тhe underline pattern. Two patterns are supported.
	* __None__: There is no underline. This is the default value.
	* __Single__: The underline is a single line.

* __UnderlineColor__: The color of the underline.

* __StrikethroughPattern__: Тhe strikethrough pattern. Two patterns are supported.
	* __None__: There is no strikethrough. This is the default value.
	* __Single__: The strikethrough is a single line.

* __StrikethroughColor__: The color of the strikethrough.

#### __[C#] Example 7: Setting CharacterProperties__ 

{{region cs-radpdfprocessing-editing-radfixeddocumenteditor_6}}
	radFixedDocumentEditor.CharacterProperties.FontSize = 12;
	radFixedDocumentEditor.CharacterProperties.Font = FontsRepository.Courier;
	radFixedDocumentEditor.CharacterProperties.HighlightColor = new RgbColor(10, 100, 80);
	radFixedDocumentEditor.CharacterProperties.BaselineAlignment = Telerik.Windows.Documents.Fixed.Model.Editing.Flow.BaselineAlignment.Subscript;
	radFixedDocumentEditor.CharacterProperties.UnderlinePattern = Telerik.Windows.Documents.Fixed.Model.Editing.Flow.UnderlinePattern.Single;
{{endregion}}

>In order for the character properties to be respected, make sure to set them __before__ inserting the Run.

### Inserting a Run

There are a number of overloads that insert a run. The code snippet in __Example 5__ inserts new runs with specific font family, style and weight.
                

#### __[C#] Example 8: Insert run__

{{region cs-radpdfprocessing-editing-radfixeddocumenteditor_7}}
	radFixedDocumentEditor.InsertRun("text");
	radFixedDocumentEditor.InsertRun(new FontFamily("Helvetica"),"text");
{{endregion}}



There are a number of overloads that insert a run. The code snippet in __Example 5__ inserts a couple of new runs, one of which with a specific font family.
                
>The '\r' and '\n' characters don't have the usual meaning of "go to next line" when they are inserted into a PDF document and you cannot simply insert text containing these characters to produce multiline text. Instead, you should split the text and insert a line break.

The code in __Example 9__ inserts a new run and a line break after it.
                

#### __[C#] Example 9: Insert run and line break__

{{region cs-radpdfprocessing-editing-radfixeddocumenteditor_8}}
	radFixedDocumentEditor.InsertLine("Line of text");
{{endregion}}


### Images

Image inline is a combination of an [ImageSource]({%slug radpdfprocessing-model-imagesource%}) object and its desired size.
                

### Inserting Image

You can insert image inline using one of the following methods:
         
#### __[C#] Example 10: Insert image__    
   
{{region cs-radpdfprocessing-editing-radfixeddocumenteditor_9}}
	ImageSource imageSource = new ImageSource(new FileStream("image.jpeg", FileMode.Open));
 	radFixedDocumentEditor.InsertImageInline(imageSource);
 	radFixedDocumentEditor.InsertImageInline(imageSource, new Size(100, 100));
{{endregion}}

## Tables

The __Table__ class implements the __IBlockElement__ interface and an instance of this class can be easily inserted as a new block in the document. You could insert the table using the __InsertTable()__ method like illustrated in __Example 8__. __RadFixedDocumentEditor__ takes care for positioning, measuring and splitting the table onto pages.
        

#### __[C#] Example 11: Insert table__

{{region cs-radpdfprocessing-editing-radfixeddocumenteditor_10}}
	Table table = new Table();
	TableRow firstRow = table.Rows.AddTableRow();
	firstRow.Cells.AddTableCell().Blocks.AddBlock().InsertText("cellText");

	radFixedDocumentEditor.InsertTable(table);
{{endregion}}     

For more detailed information on tables, check the [Table]({%slug radpdfprocessing-editing-table%}) documentation article.
        
## Block Elements

The [IBlockElement](https://docs.telerik.com/devtools/document-processing/api/Telerik.Windows.Documents.Fixed.Model.Editing.Flow.IBlockElement.html) interface allows you to easily draw and split some block content onto pages. The interface is implemented by [Block]({%slug radpdfprocessing-editing-block%}) and [Table]({%slug radpdfprocessing-editing-table%}) classes. You can easily add some block element instance with RadFixedDocumentEditor using the InsertBlock() method like illustrated in __Example 9__.

#### __[C#] Example 12: Insert Block element__

{{region cs-radpdfprocessing-editing-radfixeddocumenteditor_11}}
	Block block = new Block();
	block.InsertText("Text");

	radFixedDocumentEditor.InsertBlock(block);
{{endregion}}


## Lists

You can easily insert list items with __RadFixedDocumentEditor__. The first thing you have to do is add a __List__ in editor’s __ListCollection__ by using the __Lists__ property. Then, each time you want to add list item you have to set the appropriate __ListId__ and __ListLevel__ property values through __RadFixedDocumentEditor__’s __ParagraphProperties__. Inserting a new paragraph will result in adding a new list item.

The following code snippet shows how to add a new list to __RadFixedDocumentEditor’s ListCollection__ and after that insert a paragraph with the corresponding list properties:

#### __[C#] Example 13: Insert list__
{{region cs-radpdfprocessing-editing-radfixeddocumenteditor_12}}
	List list = radFixedDocumentEditor.Lists.AddList(ListTemplateType.NumberedDefault);
	radFixedDocumentEditor.ParagraphProperties.ListId = list.Id;
	radFixedDocumentEditor.ParagraphProperties.ListLevel = 0;
	radFixedDocumentEditor.InsertParagraph();
{{endregion}}

More detailed information about lists is available in the [List documentation article]({%slug  radpdfprocessing-editing-list%}).

### Forms

With the RadFixedDocumentEditor class you can insert a Form (Form-XObject) element. 

#### __[C#] Example 14: Insert a form__
{{region cs-radpdfprocessing-editing-radfixeddocumenteditor_13}}
	radFixedDocumentEditor.InsertFormInline(formSource);
{{endregion}}

There is an additional overload of InsertFormInline() that enables you to pass the size that should be used for the form.

>For more information on how to create a form, check the [Form]({%slug radpdfprocessing-model-form%}) and [FormSource]({%slug radpdfprocessing-model-formsource%}) articles.


## See Also

 * [RadFixedDocument]({%slug radpdfprocessing-model-radfixeddocument%})
 * [RadFixedPage]({%slug radpdfprocessing-model-radfixedpage%})
 * [ImageSource]({%slug radpdfprocessing-model-imagesource%})
 * [Table]({%slug radpdfprocessing-editing-table%})
 * [How to Generate a PDF Document from Images with RadFixedDocumentEditor]({%slug pdf-from-images-with-radfixeddocumenteditor%})
 * [Generating a Table with RadFixedDocumentEditor]({%slug generate-table-with-radfixeddocumenteditor%})
