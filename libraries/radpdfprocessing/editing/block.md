---
title: Block
page_title: Block
slug: radpdfprocessing-editing-block
tags: block
published: True
position: 0
---

# Block



The __Block__ class is intended to arrange the elements added to it in a flow-like manner. It can be used for measuring, drawing, and splitting of __FixedContentElements__.
      

## Add and Modify Content

The most common usage of __Block__ is to draw flowing content. Similarly to [FixedContentEditor]({%slug radpdfprocessing-editing-fixedcontenteditor%}), a block can contain images, graphics or text. The same Block instance can only be drawn once.
        

### Inserting Text

Inserting [TextFragments]({%slug radpdfprocessing-model-textfragment%}) is achieved with one of the overloads of the __Insert()__ method. __Example 1__ shows all the overloads which allow specifying the styles and font family.
            
#### __[C#] Example 1: Insert text__

<snippet id='pdf-block-insert-text'/>

>The '\r' and '\n' characters don't have the usual meaning of "go to next line" when they are inserted into a PDF document and you cannot simply insert text containing these characters to produce multiline text. Instead, you should insert a line break.

>important In **.NET Standard/.NET (Target OS: None)** environments, fonts beyond the [14 standard ones]({%slug radpdfprocessing-concepts-fonts%}#standard-fonts) require a [FontsProvider implementation]({%slug pdfprocessing-implement-fontsprovider%}) to be resolved correctly.

### Inserting Line Break

Inserting a line break results in the next element starting on a new line. The action is achieved with the __InsertLineBreak()__ method as shown in __Example 2__.
            

#### __[C#] Example 2: Break the line__

<snippet id='pdf-block-line-break'/>

### Inserting Image

__Block__ provides the following methods for inserting images:
            
* block.InsertImage(imageSource);
* block.InsertImage(stream);
* block.InsertImage(imageSource, size);
* block.InsertImage(stream, size);
* block.InsertImage(imageSource, width, height);
* block.InsertImage(stream, width, height);
                
#### __[C#] Example 3: Inserting an image__

<snippet id='pdf-block-insert-image'/>

Information on images in the context of the library is available in the [ImageSource]({%slug radpdfprocessing-model-imagesource%}) and [Image]({%slug radpdfprocessing-model-image%}) articles.
            
### Inserting Geometries

[Geometries]({%slug radpdfprocessing-concepts-geometry%}) allow you to describe 2D shapes in a document. The following methods can be used to insert different geometries.
            

* block.**InsertCircle**(center, radius);
* block.**InsertEllipse**(center, radiusX, radiusY);
* block.**InsertLine**(point1, point2);
* block.**InsertPath**(geometry);
* block.**InsertRectangle**(rectangle);
                
#### __[C#] Example 4: Inserting a geometry__

<snippet id='pdf-block-insert-geometry'/>

### Inserting Form-XObject Elements

The Form (or also known as Form-XObject) is an object that can contain PDF content and can be sheared among the document. The Block class exposes the **InsertForm()** method that allows you insert a FormSource object in the document. 

#### __[C#] Example 5: Insert a form__

<snippet id='pdf-block-insert-form'/>

There are two more overloads of InsertForm() that enables you to pass the size that should be used for the form.


>For more information on how to create a form, check the [Form]({%slug radpdfprocessing-model-form%}) and [FormSource]({%slug radpdfprocessing-model-formsource-overview%}) articles.

### Inserting Link Annotation

The following example shows how to insert a link inside the text:

#### __[C#] Example: Insert a text link__

<snippet id='pdf-block-text-link'/>

### Changing Current Styles

The __Block__ class has some properties and methods that affect how it will be rendered:
            

* __SpacingBefore:__ Represent the spacing before.
                

* __SpacingAfter:__ Represents the spacing after.
                

* __LineSpacing:__ The spacing between the lines.


* __LineSpacingType:__ Specifies how to interpret the line spacing.
                

* __FirstLineIndent:__ The indent for the first line.
                

* __LeftIndent:__ The left indent.
                

* __RightIndent:__ The right indent.
                

* __BackgroundColor:__ The background color.
                

* __HorizontalAlignment:__ The horizontal alignment of the content.
                

* __VerticalAlignment:__ The vertical alignment of the content.


* __Bullet__: The element that should be rendered as __Block__’s list bullet.


* __IndentAfterBullet__: The indent size after the bullet element.


* __TextProperties__ and __GraphicProperties__: Responsible for text and graphic properties. For more information see the [Text and Graphic Properties]({%slug radpdfprocessing-editing-text-and-graphic-properties%}) article.
                

* __SaveTextProperties():__ Saves the TextProperties. It returns an IDisposable object which when disposed calls __RestoreTextProperties()__ and can be used in using statement.
                

* __RestoreTextProperties():__ Restores the TextProperties to their previous state.
                

* __SaveGraphicProperties():__ Saves the GraphicProperties. It returns an IDisposable object which when disposed calls __RestoreTextProperties()__ and can be used in using statement.
                

* __RestoreGraphicProperties():__ Restores the GrahpicPropertie to their previous state.
                

* __SaveProperties():__ Saves both text and graphic properties. It returns an IDisposable object which when disposed calls __RestoreTextProperties()__ and can be used in using statement.
                

* __RestoreProperties():__ Restores both text and graphic properties.

* __SetBullet(List list, int listLevel):__ This method helps you to easily set bullet related properties respecting the numbering and the formatting of some List class instance. More information about lists you may find in [this article](#{%slug radpdfprocessing-editing-list%}).
                

* __Clear():__ Clears all elements in the block.
                

#### __[C#] Example 6: Change Block properties__

<snippet id='pdf-block-change-properties'/>

![Block Properties Result](images/radpdfprocessing-editing-block_5_result.png)

## Drawing a Block

A Block can be drawn to the content using the __Draw()__ method. The method accepts as a parameter a __Rectangle__, specifying the desired size and position relatively to the editor of the element.
        
#### __[C#] Example 7: Draw block__

<snippet id='pdf-draw-block'/>

>importantEvery block can be drawn only once. Otherwise, an exception will be thrown.
          

## Measuring Block Size

Measuring a __Block__ can be achieved with one of the two overloads of the __Measure()__ method. 

Invoking the method without a parameter will return the desired size of the block elements and set it as the block's __DesiredSize__ property. The method is handy when you want to determine what size the __Block__ should be depending on its content. 

__Example 8__ Creates a __Block__ with text, measures the text, and sets the block size to match the content size.
        
<snippet id='libraries-pdf-editing-block-measure-without-parameter'/>

#### Example 8 Result
![Rad Pdf Processing Measuring Block 01](images/RadPdfProcessing_Measuring_Block_01.png)
        
The second overload accepts available __Size__. Calling it measures the block content as if the __Block__ was in that specific size. 		
Additionally to setting the __DesiredSize__ property, it also sets the __PendingElements__ property with a collection of the elements that could not fit in the available size.
        
__Example 9__ Creates a __Block__ with text and draws it with a specific size using the [RadFixedContentEditor]({%slug radpdfprocessing-editing-fixedcontenteditor%}). The block content auto fits to the dimentions of the __Block__. The size of the auto fitted content can then be measured.

<snippet id='libraries-pdf-editing-block-measure-with-parameter'/>

#### Example 9 Result
![Rad Pdf Processing Measuring Block 02](images/RadPdfProcessing_Measuring_Block_02.png)

## Splitting a Block

The __Split()__ method of a Block returns a new Block with the same properties. The resulting block contains all pending elements that do not fit in the current block, based on the result of the last measure call.
        

The code in __Example 9__ splits a block in two. The first will contains text "Hello" and the second – "RadPdfProcessing!".
        
#### __[C#] Example 9: Split block__

<snippet id='pdf-block-split'/>


## See Also

 * [FixedContentEditor]({%slug radpdfprocessing-editing-fixedcontenteditor%})
 * [TextFragment]({%slug radpdfprocessing-model-textfragment%})
 * [Image]({%slug radpdfprocessing-model-image%})
 * [Geometry]({%slug radpdfprocessing-concepts-geometry%})
 * [Text and Graphic Properties]({%slug radpdfprocessing-editing-text-and-graphic-properties%})
 * [How to Measure Text in WordsProcessing .NET Framework]({%slug wordsprocessing-measure-text-netframework%})
 * [How to Measure Text in WordsProcessing .NET Standard]({%slug wordsprocessing-measure-text-netstandard%})
 * [How to Generate a PDF Document from Images with FixedContentEditor]({%slug pdf-from-images-with-fixedcontenteditor%})
