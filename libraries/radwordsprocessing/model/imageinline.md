---
title: ImageInline
description: Learn how to use the ImageInline element in RadWordsProcessing to embed inline images within flow document content.
page_title: ImageInline
slug: radwordsprocessing-model-imageinline
tags: image, inline, word, docx, document, flow, model, embedded
published: True
position: 8
---

# ImageInline

`ImageInline` is an inline-level flow content element intended to contain an image object.

## Supported Image Extensions

With WordsProcessing, you can work with images from the following file formats:

* JPG
* JPEG
* PNG
* BMP
* TIFF
* TIF
* GIF
* ICON
* WMF
* EMF
* BIN
* SVG (Starting with 2024 Q3)

## Inserting an ImageInline

**Example 1** demonstrates how to create an `ImageInline` and add it to a [Paragraph]({%slug radwordsprocessing-model-paragraph%}):

**Example 1: Create an image inline and insert it in a paragraph**

<snippet id='codeblock-cqcq'/>

>tip The parent `Paragraph` must belong to the same document that is passed to the constructor of the `ImageInline`.


You can add an image at a specific index in the `Inlines` collection of a paragraph using the `Insert()` method. The following example shows how to add an `ImageInline` at the beginning of a paragraph:

**Example 2: Add an image inline to a specific position**

<snippet id='codeblock-crcr'/>

You can also use the `AddImageInline()` method of the `Inlines` collection of a paragraph. The method creates a new `ImageInline`, adds it to the paragraph, and returns it.

**Example 3: Using the AddImageInline() method**

<snippet id='codeblock-cscs'/>

You can also insert an `ImageInline` element in a `RadFlowDocument` with [RadFlowDocumentEditor]({%slug radwordsprocessing-editing-radflowdocumenteditor%}).

**Example 4: Insert an image inline using RadFlowDocumentEditor**

<snippet id='codeblock-ctct'/>

## Modifying an ImageInline

The `ImageInline` element exposes the following properties:

* `Image`: Represents the image object that is contained in the `ImageInline`. It is a read-only composite object that contains the properties listed below:

    * `ImageSource`: Specifies the image source that is visualized in the image object.
    * `Name`: Represents the name of the image.
    * `Width`: The width of the image.
    * `Height`: The height of the image.
    * `Size`: The size of the image. Can also be set to `Size.Empty`.
    * `IsHorizontallyFlipped`: Specifies whether the image is horizontally flipped.
    * `IsVerticallyFlipped`: Specifies whether the image is vertically flipped.
    * `RotationAngle`: Specifies the rotation angle of the image.
    * `LockAspectRatio`: Determines whether the aspect ratio between the width and the height of the image is preserved.
    * `Link`: Specifies the link that opens when the image is clicked. The property is of type `string`. This property works with the DOCX format only.

## Working with Image Size

This section explains the behavior of the `Size` property of the `Image` object in an `ImageInline` and how the image sizes are exported to the supported formats.

>important When using the .NET Standard version of the RadWordsProcessing packages, to export to PDF format documents containing images different than Jpeg and Jpeg2000 or `ImageQuality` different than High, you must set the `JpegImageConverter` property inside the `FixedExtensibilityManager`. For more information, refer to the `FixedExtensibilityManager` in the [PdfProcessing Cross-Platform Support]({%slug radpdfprocessing-cross-platform%}) article.

* **Insert image without specifying its size**
	* Model: Size is `Size.Empty`.
	* Export to DOCX: Size is decoded.
	* Export to RTF: Size is decoded.
	* Export to HTML: Width and height attributes are not exported.
	* Export to PDF: Size is decoded.

* **Insert image and set its size to Size.Empty**
	* Model: Size is `Size.Empty`.
	* Export to DOCX: Size is (1,1).
	* Export to RTF: Size is (1,1).
	* Export to HTML: Width and height attributes are not exported.
	* Export to PDF: Size is (1,1).

* **Insert image without specifying its size and obtain its size later (through the property getter)**
	* Model: Size is decoded.


## See Also

* [ImageInline API Reference](https://docs.telerik.com/devtools/document-processing/api/Telerik.Windows.Documents.Flow.Model.Shapes.ImageInline.html)
* [Document Model]({%slug radwordsprocessing-model%})
* [FloatingImage]({%slug radwordsprocessing-model-floatingimage%})
* [Paragraph]({%slug radwordsprocessing-model-paragraph%})
* [Converting WMF Images to PNG in RTF Documents with RadWordsProcessing]({%slug convert-wmf-to-png-radwordsprocessing%})
* [Converting WEBP Images to PNG in HTML Documents Using Telerik WordsProcessing]({%slug convert-webp-to-png-radwordsprocessing%})
