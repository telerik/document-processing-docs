---
title: Block
description: Learn how to use the Block class in RadPdfProcessing to arrange content elements in a flow-like manner for measuring, drawing, and splitting.
page_title: Block
slug: radpdfprocessing-editing-block
tags: block, pdf, layout, textfragment, images, radpdfprocessing, flowlayout, drawing
published: True
position: 0
---

# Block



The `Block` class arranges the elements added to it in a flow-like manner. You can use it for measuring, drawing, and splitting of `FixedContentElements`.
      

## Add and Modify Content

The most common usage of `Block` is to draw flowing content. Similarly to [FixedContentEditor]({%slug radpdfprocessing-editing-fixedcontenteditor%}), a block can contain images, graphics, or text. The same Block instance can only be drawn once.
        

### Inserting Text

Insert [TextFragments]({%slug radpdfprocessing-model-textfragment%}) with one of the overloads of the `Insert()` method. **Example 1** shows all the overloads which allow specifying the styles and font family.
            
#### **Example 1: Insert text**

<snippet id='libraries-pdf-editing-block-insert-text'/>

>The '\r' and '\n' characters do not have the usual meaning of "go to next line" when inserted into a PDF document, and you cannot insert text containing these characters to produce multiline text. Instead, insert a line break.

>important In **.NET Standard/.NET (Target OS: None)** environments, fonts beyond the [14 standard ones]({%slug radpdfprocessing-concepts-fonts%}#standard-fonts) require a [FontsProvider implementation]({%slug pdfprocessing-implement-fontsprovider%}) to be resolved correctly.

### Inserting Line Break

Inserting a line break results in the next element starting on a new line. Use the `InsertLineBreak()` method as shown in **Example 2**.
            

#### **Example 2: Break the line**

<snippet id='libraries-pdf-editing-block-line-break'/>

### Inserting Image

`Block` provides the following methods for inserting images:
            
* block.InsertImage(imageSource);
* block.InsertImage(stream);
* block.InsertImage(imageSource, size);
* block.InsertImage(stream, size);
* block.InsertImage(imageSource, width, height);
* block.InsertImage(stream, width, height);
                
#### **Example 3: Inserting an image**

<snippet id='libraries-pdf-editing-block-insert-image'/>

Information on images in the context of the library is available in the [ImageSource]({%slug radpdfprocessing-model-imagesource%}) and [Image]({%slug radpdfprocessing-model-image%}) articles.
            
### Inserting Geometries

[Geometries]({%slug radpdfprocessing-concepts-geometry%}) allow you to describe 2D shapes in a document. The following methods can be used to insert different geometries:
            

* block.`InsertCircle`(center, radius);
* block.`InsertEllipse`(center, radiusX, radiusY);
* block.`InsertLine`(point1, point2);
* block.`InsertPath`(geometry);
* block.`InsertRectangle`(rectangle);
                
#### **Example 4: Inserting a geometry**

<snippet id='libraries-pdf-editing-block-insert-geometry'/>

### Inserting Form-XObject Elements

The Form (also known as Form-XObject) is an object that can contain PDF content and can be shared among the document. The `Block` class exposes the `InsertForm()` method that allows you to insert a `FormSource` object in the document. 

#### **Example 5: Insert a form**

<snippet id='libraries-pdf-editing-block-insert-form'/>

There are two more overloads of `InsertForm()` that allow you to pass the size that should be used for the form.


>For more information on how to create a form, see the [Form]({%slug radpdfprocessing-model-form%}) and [FormSource]({%slug radpdfprocessing-model-formsource-overview%}) articles.

### Inserting Link Annotation

The following example shows how to insert a link inside the text:

#### **Example: Insert a text link**

<snippet id='libraries-pdf-editing-block-text-link'/>

### Changing Current Styles

The `Block` class has properties and methods that affect how it is rendered:
            

* `SpacingBefore`: Represents the spacing before.
                

* `SpacingAfter`: Represents the spacing after.
                

* `LineSpacing`: The spacing between the lines.


* `LineSpacingType`: Specifies how to interpret the line spacing.
                

* `FirstLineIndent`: The indent for the first line.
                

* `LeftIndent`: The left indent.
                

* `RightIndent`: The right indent.
                

* `BackgroundColor`: The background color.
                

* `HorizontalAlignment`: The horizontal alignment of the content.
                

* `VerticalAlignment`: The vertical alignment of the content.


* `Bullet`: The element that is rendered as the `Block` list bullet.


* `IndentAfterBullet`: The indent size after the bullet element.


* `TextProperties` and `GraphicProperties`: Responsible for text and graphic properties. For more information, see the [Text and Graphic Properties]({%slug radpdfprocessing-editing-text-and-graphic-properties%}) article.
                

* `SaveTextProperties()`: Saves the TextProperties. It returns an IDisposable object which when disposed calls `RestoreTextProperties()` and can be used in a using statement.
                

* `RestoreTextProperties()`: Restores the TextProperties to their previous state.
                

* `SaveGraphicProperties()`: Saves the GraphicProperties. It returns an IDisposable object which when disposed calls `RestoreGraphicProperties()` and can be used in a using statement.
                

* `RestoreGraphicProperties()`: Restores the GraphicProperties to their previous state.
                

* `SaveProperties()`: Saves both text and graphic properties. It returns an IDisposable object which when disposed calls `RestoreProperties()` and can be used in a using statement.
                

* `RestoreProperties()`: Restores both text and graphic properties.

* `SetBullet(List list, int listLevel)`: This method helps you set bullet-related properties respecting the numbering and the formatting of some `List` class instance. More information about lists is available in the [List]({%slug radpdfprocessing-editing-list%}) article.
                

* `Clear()`: Clears all elements in the block.
                

#### **Example 6: Change Block properties**

<snippet id='libraries-pdf-editing-block-change-properties'/>

![Block Properties Result](images/radpdfprocessing-editing-block_5_result.png)

## Drawing a Block

A Block can be drawn to the content using the `Draw()` method. The method accepts as a parameter a `Rectangle`, specifying the desired size and position relative to the editor of the element.
        
#### **Example 7: Draw block**

<snippet id='libraries-pdf-editing-block-draw-block'/>

>important Every block can be drawn only once. Otherwise, an exception is thrown.
          

## Measuring Block Size

Measuring a `Block` can be achieved with one of the two overloads of the `Measure()` method. 

Invoking the method without a parameter returns the desired size of the block elements and sets it as the block `DesiredSize` property. The method is handy when you want to determine what size the `Block` needs depending on its content. 

**Example 8** creates a `Block` with text, measures the text, and sets the block size to match the content size.
        
<snippet id='libraries-pdf-editing-block-measure-without-parameter'/>

#### Example 8 Result
![Rad Pdf Processing Measuring Block 01](images/RadPdfProcessing_Measuring_Block_01.png)
        
The second overload accepts an available `Size`. Calling it measures the block content as if the `Block` was in that specific size. Additionally, it sets the `PendingElements` property with a collection of the elements that could not fit in the available size.
        
**Example 9** creates a `Block` with text and draws it with a specific size using the [FixedContentEditor]({%slug radpdfprocessing-editing-fixedcontenteditor%}). The block content auto-fits to the dimensions of the `Block`. The size of the auto-fitted content can then be measured.

<snippet id='libraries-pdf-editing-block-measure-with-parameter'/>

#### Example 9 Result
![Rad Pdf Processing Measuring Block 02](images/RadPdfProcessing_Measuring_Block_02.png)

## Splitting a Block

The `Split()` method of a Block returns a new Block with the same properties. The resulting block contains all pending elements that do not fit in the current block, based on the result of the last measure call.
        

The code in **Example 10** splits a block in two. The first contains text "Hello" and the second contains "RadPdfProcessing!".
        
#### **Example 10: Split block**

<snippet id='libraries-pdf-editing-block-split'/>


## See Also

* [FixedContentEditor]({%slug radpdfprocessing-editing-fixedcontenteditor%})
* [TextFragment]({%slug radpdfprocessing-model-textfragment%})
* [Image]({%slug radpdfprocessing-model-image%})
* [Geometry]({%slug radpdfprocessing-concepts-geometry%})
* [Text and Graphic Properties]({%slug radpdfprocessing-editing-text-and-graphic-properties%})
* [How to Measure Text in WordsProcessing .NET Framework]({%slug wordsprocessing-measure-text-netframework%})
* [How to Measure Text in WordsProcessing .NET Standard]({%slug wordsprocessing-measure-text-netstandard%})
* [How to Generate a PDF Document from Images with FixedContentEditor]({%slug pdf-from-images-with-fixedcontenteditor%})
* [How to Change Text Color Using PdfProcessing]({%slug pdfprocessing-text-color%})
* [Positioning Centered and Right-Aligned Text on the Same Line in PDF]({%slug aligning-centered-right-margin-text-pdf-telerik-document-processing%})
* [Clone PDF Template Pages with Form Fields to Accommodate Dynamic Content]({%slug clone-pdf-template-pages-with-form-fields-dynamic-content%})

