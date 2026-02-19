---
title: FloatingImage
page_title: FloatingImage
slug: radwordsprocessing-model-floatingimage
tags: floatingimage
published: True
position: 9
---

# FloatingImage



__FloatingImage__ is an inline-level anchor flow document element linked with a floating image object. The supported image extensions are JPG, JPEG, PNG, BMP, TIFF, TIF, GIF, ICON, SVG, WMF and EMF.
      

## Inserting a FloatingImage

__Example 1__ shows how to create a FloatingImage and add it to a [Paragraph]({%slug radwordsprocessing-model-paragraph%}).
        

#### __Example 1: Create a floating image and insert it in a paragraph__

<snippet id='codeblock-chch'/>



>tip The parent __Paragraph__ should belong to the same document that is passed to the constructor of the __FloatingImage__.
          

You can add an image at a specific index in the __Inlines__ collection of a paragraph using the __Insert()__ method. Here is how to add a FloatingImage at the beginning of a paragraph:
        

#### __Example 2: Add a floating image to a specific position__

<snippet id='codeblock-cici'/>



You can also use the __AddFloatingImage()__ method of the __Inlines__ collection of a paragraph. The method creates a new __FloatingImage__, adds it to the paragraph and returns it.
        

#### __Example 3: Using AddFloatingImage() method__

<snippet id='codeblock-cjcj'/>



Inserting __FloatingImage__ element in RadFlowDocument can also be achieved with [RadFlowDocumentEditor]({%slug radwordsprocessing-editing-radflowdocumenteditor%}).
        

#### __Example 4: Insert a floating image using RadFlowDocumentEditor__

<snippet id='codeblock-ckck'/>



## Modify a FloatingImage

The __FloatingImage__ element exposes the following properties:
        

* __Image__: Represents the image object that is contained in the __FloatingImage__. It is a read-only composite object that contains the properties listed below:

    * __ImageSource__: Specifies the image source that is visualized in the image object.
    * __Name__: Represents the name of the image.
    * __Width__: The width of the image.
    * __Height__: The height of the image.    
	* __Size__: The size of the image. Can also be set to __Size.Empty__.  
    * __IsHorizontallyFlipped__: Specifies whether the image is horizontally flipped. 
    * __IsVerticallyFlipped__: Specifies whether the image is vertically flipped. 
    * __RotationAngle__: Specifies the rotation angle of the image. 
    * __LockAspectRatio__: Determines whether the aspect ratio between the width and the height of the image will be preserved. 

* __AllowOverlap__: Specifies whether the image is allowed to overlap the contents of the other image objects. The default value is *true*. 

* __IsLocked__: Specifies if the anchor can be modified at runtime.

* __ShapeWrapping__: Specifies the image wrapping. It is a composite object and contains the properties listed below:

    * __WrappingType__: The wrapping type. The default value is *Square*.
    * __TextWrap__: The text wrap. The default value is *BothSides*.

* __LayoutInCell__: Indicates if the layout of the image should be calculated relative to the cell that is holding the shape. 

* __IsBehindDocument__: Indicates if the shape should be displayed behind the document content.

* __ZIndex__: Specifies the ZIndex of the floating image.

* __Margin__: Represents the margins for the floating image.

* __HorizontalPosition__: Specifies the horizontal position of the floating image. It is composite object that contains the properties listed below:

    * __ValueType__: Specifies whether the positioning should be based on the Offset or the Alignment value. The default value is *Offset*.
    * __RelativeFrom__: Specifies the relative horizontal positioning base. The default value is *Column*.
    * __Alignment__: Specifies the alignment to be used if the position type is *Alignment*.
    * __Offset__: Specifies the offset to be used if the position type is *Offset*.

* __VerticalPosition__: Specifies the vertical position of the floating image. It is composite object that contains the properties listed below:

    * __ValueType__: Specifies whether the positioning should be based on the *Offset* or the *Alignment* value. The default value is Offset.
    * __RelativeFrom__: Specifies the relative horizontal positioning base. The default value is *Column*.
    * __Alignment__: Specifies the alignment to be used if the position type is *Alignment*.
    * __Offset__: Specifies the offset to be used if the position type is *Offset*.
                

## Working with Image Size

This section explains the behavior of the  __Size__ property of The __Image__ object in a __FloatingImage__  and how the image sizes are exported to the supported formats.



* __Insert image without specifying its size__
	* Model: Size will be Size.Empty.
	* Export to DOCX: Size will be decoded
	* Export to RTF: Size will be decoded
	* Export HTML: Width and height attributes will not be exported
	* Export to PDF: Size will be decoded


* __Insert image and set its size to Size.Empty__
	* Model: Size will be Size.Empty
	* Export to DOCX: Size will be (1,1)
	* Export to RTF: Size will be (1,1)
	* Export to HTML: Width and height attributes will not be exported
	* Export to PDF: Size will be (1,1)

* __Inserting image without specifying its size and obtain its size later (through the property getter)__
	* Model: Size will be decoded

## Exporting to PDF

WordsProcessing enables you to export documents with floating images to PDF. However, the set of supported properties is **limited** compared to the other document formats. Following is a list of the properties that are not supported by the **PdfFormatProvider** class:

* __IsHorizontallyFlipped__
* __IsVerticallyFlipped__
* __RotationAngle__
* __AllowOverlap__: All images are drawn as they have AllowOverlap set to `true`.
* __LayoutInCell__: The image is always drawn inside the cell.
* When exporting floating images that are anchored to elements **inside tables**, they will be inserted on a separate paragraph inside that cell, disregarding their wrapping properties.

## See Also

 * [FloatingImage API Reference](https://docs.telerik.com/devtools/document-processing/api/Telerik.Windows.Documents.Flow.Model.Shapes.FloatingImage.html)
 * [Document model]({%slug radwordsprocessing-model%})
 * [ImageInline]({%slug radwordsprocessing-model-imageinline%})
 * [Paragraph]({%slug radwordsprocessing-model-paragraph%})
 * [Converting WMF Images to PNG in RTF Documents with RadWordsProcessing]({%slug convert-wmf-to-png-radwordsprocessing%})
