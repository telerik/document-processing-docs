---
title: FloatingImage
description: Learn how to work with FloatingImage elements in RadWordsProcessing, which are inline anchors linked to floating images in flow documents.
page_title: FloatingImage
slug: radwordsprocessing-model-floatingimage
tags: floating, image, word, docx, document, flow, model, anchor, layout
published: True
position: 9
---

# FloatingImage

`FloatingImage` is an inline-level anchor flow document element linked with a floating image object. The supported image extensions are JPG, JPEG, PNG, BMP, TIFF, TIF, GIF, ICON, SVG, WMF, and EMF.

## Inserting a FloatingImage

**Example 1** shows how to create a `FloatingImage` and add it to a [Paragraph]({%slug radwordsprocessing-model-paragraph%}).

**Example 1: Create a FloatingImage instance and append it to a paragraph**

<snippet id='codeblock-chch'/>

>tip The parent `Paragraph` must belong to the same document that is passed to the constructor of the `FloatingImage`.

You can add an image at a specific index in the `Inlines` collection of a paragraph using the `Insert()` method. The following example shows how to add a `FloatingImage` at the beginning of a paragraph:

**Example 2: Assign an image source and insert the floating image at the beginning of a paragraph**

<snippet id='codeblock-cici'/>

You can also use the `AddFloatingImage()` method of the `Inlines` collection of a paragraph. The method creates a new `FloatingImage`, adds it to the paragraph, and returns it.

**Example 3: Create and add a floating image with the AddFloatingImage method**

<snippet id='codeblock-cjcj'/>

You can also insert a `FloatingImage` element in a `RadFlowDocument` with [RadFlowDocumentEditor]({%slug radwordsprocessing-editing-radflowdocumenteditor%}).

**Example 4: Insert a floating PNG image from a stream with RadFlowDocumentEditor**

<snippet id='codeblock-ckck'/>

## Modifying a FloatingImage

The `FloatingImage` element exposes the following properties:

* `Image`: Represents the image object that is contained in the `FloatingImage`. It is a read-only composite object that contains the properties listed below:
    * `ImageSource`: Specifies the image source that is visualized in the image object.
    * `Name`: Represents the name of the image.
    * `Width`: The width of the image.
    * `Height`: The height of the image.
    * `Size`: The size of the image. Can also be set to `Size.Empty`.
    * `IsHorizontallyFlipped`: Specifies whether the image is horizontally flipped.
    * `IsVerticallyFlipped`: Specifies whether the image is vertically flipped.
    * `RotationAngle`: Specifies the rotation angle of the image.
    * `LockAspectRatio`: Determines whether the aspect ratio between the width and the height of the image is preserved.

* `AllowOverlap`: Specifies whether the image is allowed to overlap the contents of the other image objects. The default value is `true`.

* `IsLocked`: Specifies if the anchor can be modified at runtime.

* `ShapeWrapping`: Specifies the image wrapping. It is a composite object and contains the properties listed below:
    * `WrappingType`: The wrapping type. The default value is `Square`.
    * `TextWrap`: The text wrap. The default value is `BothSides`.

* `LayoutInCell`: Indicates if the layout of the image is calculated relative to the cell that holds the shape.

* `IsBehindDocument`: Indicates if the shape is displayed behind the document content.

* `ZIndex`: Specifies the ZIndex of the floating image.

* `Margin`: Represents the margins for the floating image.

* `HorizontalPosition`: Specifies the horizontal position of the floating image. It is a composite object that contains the properties listed below:
    * `ValueType`: Specifies whether the positioning is based on the `Offset` or the `Alignment` value. The default value is `Offset`.
    * `RelativeFrom`: Specifies the relative horizontal positioning base. The default value is `Column`.
    * `Alignment`: Specifies the alignment to be used if the position type is `Alignment`.
    * `Offset`: Specifies the offset to be used if the position type is `Offset`.

* `VerticalPosition`: Specifies the vertical position of the floating image. It is a composite object that contains the properties listed below:
    * `ValueType`: Specifies whether the positioning is based on the `Offset` or the `Alignment` value. The default value is `Offset`.
    * `RelativeFrom`: Specifies the relative vertical positioning base. The default value is `Column`.
    * `Alignment`: Specifies the alignment to be used if the position type is `Alignment`.
    * `Offset`: Specifies the offset to be used if the position type is `Offset`.

## Working with Image Size

This section explains the behavior of the `Size` property of the `Image` object in a `FloatingImage` and how the image sizes are exported to the supported formats.

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

## Exporting to PDF

WordsProcessing enables you to export documents with floating images to PDF. The set of supported properties is **limited** compared to other document formats. The following list contains the properties that the `PdfFormatProvider` class does not support:

* `IsHorizontallyFlipped`
* `IsVerticallyFlipped`
* `RotationAngle`
* `AllowOverlap`: All images are drawn as if `AllowOverlap` is set to `true`.
* `LayoutInCell`: The image is always drawn inside the cell.
* When exporting floating images that are anchored to elements **inside tables**, the exporter inserts them on a separate paragraph inside that cell, disregarding their wrapping properties.

## See Also

* [FloatingImage API Reference](https://docs.telerik.com/devtools/document-processing/api/Telerik.Windows.Documents.Flow.Model.Shapes.FloatingImage.html)
* [Document Model]({%slug radwordsprocessing-model%})
* [ImageInline]({%slug radwordsprocessing-model-imageinline%})
* [Paragraph]({%slug radwordsprocessing-model-paragraph%})
* [Converting WMF Images to PNG in RTF Documents with RadWordsProcessing]({%slug convert-wmf-to-png-radwordsprocessing%})
