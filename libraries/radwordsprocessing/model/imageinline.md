---
title: ImageInline
page_title: ImageInline
slug: radwordsprocessing-model-imageinline
tags: imageinline
published: True
position: 8
---

# ImageInline

__ImageInline__ element is an inline-level flow content element intended to contain an image object.
      
## Supported Image Extensions

With **WordsProcessing**, you can work with images from the following file formats:

 - JPG
 - JPEG
 - PNG
 - BMP
 - TIFF
 - TIF
 - GIF
 - ICON
 - WMF 
 - EMF
 - BIN
 - SVG (*introduced in 2024 Q3*)

## Inserting an ImageInline

__Example 1__ demonstrates how you can create an ImageInline and add it to a [Paragraph]({%slug radwordsprocessing-model-paragraph%}):
        

#### __[C#] Example 1: Create an image inline and insert it in a paragraph__

<snippet id='codeblock-cQ'/>



>tipThe parent __Paragraph__ should belong to the same document that is passed to the constructor of the __ImageInline__.


You can add an image at a specific index in the __Inlines__ collection of a paragraph using the __Insert()__ method. Here is how to add an ImageInline at the beginning of a paragraph:
        

#### __[C#] Example 2: Add an image inline to a specific position__

<snippet id='codeblock-cR'/>



You can also use the __AddImageInline()__ method of the __Inlines__ collection of a paragraph. The method creates a new ImageInline, adds it to the paragraph and returns it.
        

#### __[C#] Example 3: Using AddImageInline() method__

<snippet id='codeblock-cS'/>



Inserting __ImageInline__ element in RadFlowDocument can also be achieved with [RadFlowDocumentEditor]({%slug radwordsprocessing-editing-radflowdocumenteditor%}).
        

#### __[C#] Example 4: Insert an image inline using RadFlowDocumentEditor__

<snippet id='codeblock-cT'/>



## Modifying an ImageInline

The __ImageInline__ element exposes the following properties:
        

* __Image__: Represents the image object that is contained in the ImageInline. It is a read-only composite object that contains the properties listed below:

    * __ImageSource__: Specifies the image source that is visualized in the image object.
    * __Name__: Represents the name of the image.
    * __Width__: The width of the image.
    * __Height__: The height of the image.    
	* __Size__: The size of the image. Can also be set to __Size.Empty__.
    * __IsHorizontallyFlipped__: Specifies whether the image is horizontally flipped.
    * __IsVerticallyFlipped__: Specifies whether the image is vertically flipped.
    * __RotationAngle__: Specifies the rotation angle of the image.    
	* __LockAspectRatio__: Determines whether the aspect ratio between the width and the height of the image will be preserved. 
    * __Link__: Specifies the link that would be opened when the image is clicked. The property is of type string, currently it works with the docx format only.            

## Working with Image Size

This section explains the behavior of the __Size__ property of The __Image__ object in an __ImageInline__ and how the image sizes are exported to the supported formats.

>important When using the **.NET Standard** version of the RadWordsProcessing packages, in order to **export to PDF** format documents containing images different than Jpeg and Jpeg2000 or ImageQuality different than High, the **JpegImageConverter** property inside the **FixedExtensibilityManager** has to be set. For more information check the FixedExtensibilityManager in the [PdfProcessing`s Cross-Platform Support]({%slug radpdfprocessing-cross-platform%})

* __Insert image without specifying its size__
	* Model: Size will be Size.Empty.
	* Export to DOCX: Size will be decoded
	* Export to RTF: Size will be decoded
	* Export to HTML: Width and height attributes will not be exported
	* Export to PDF: Size will be decoded


* __Insert image and set its size to Size.Empty__
	* Model: Size will be Size.Empty
	* Export to DOCX: Size will be (1,1)
	* Export to RTF: Size will be (1,1)
	* Export to HTML: Width and height attributes will not be exported
	* Export to PDF: Size will be (1,1)

* __Inserting image without specifying its size and obtain its size later (through the property getter)__
	* Model: Size will be decoded


## See Also

 * [ImageInline API Reference](https://docs.telerik.com/devtools/document-processing/api/Telerik.Windows.Documents.Flow.Model.Shapes.ImageInline.html)
 * [Document model]({%slug radwordsprocessing-model%})
 * [FloatingImage]({%slug radwordsprocessing-model-floatingimage%})
 * [Paragraph]({%slug radwordsprocessing-model-paragraph%})
 * [Converting WMF Images to PNG in RTF Documents with RadWordsProcessing]({%slug convert-wmf-to-png-radwordsprocessing%})
 * [Converting WEBP Images to PNG in HTML Documents using Telerik WordsProcessing]({%slug convert-webp-to-png-radwordsprocessing%})
