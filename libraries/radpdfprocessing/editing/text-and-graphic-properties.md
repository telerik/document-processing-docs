---
title: Text and Graphic Properties
description: Learn how to control the appearance of text and graphic content elements in RadPdfProcessing using GraphicProperties and TextProperties.
page_title: Text and Graphic Properties
slug: radpdfprocessing-editing-text-and-graphic-properties
tags: text, properties, graphic, pdf, font, colors, radpdfprocessing, rendering, editing
published: True
position: 5
---

# Text and Graphic Properties

The methods of the [FixedContentEditor]({%slug radpdfprocessing-editing-fixedcontenteditor%}) and [Block]({%slug radpdfprocessing-editing-block%}) classes create different content elements. Control the appearance of the newly created elements with the following properties:
      

## GraphicProperties

These properties hold the current graphics control parameters. You can modify the following parameters through `GraphicProperties`:
        

* `IsFilled`: A boolean property specifying whether content elements are filled.

* `IsStroked`: A boolean property specifying whether content elements are stroked.

* `FillColor`: The color used to fill the content elements. The property is of type [ColorBase](https://docs.telerik.com/devtools/document-processing/api/Telerik.Windows.Documents.Fixed.Model.ColorSpaces.ColorBase.html).

* `StrokeColor`: The color used to stroke the content elements. The property is of type [ColorBase](https://docs.telerik.com/devtools/document-processing/api/Telerik.Windows.Documents.Fixed.Model.ColorSpaces.ColorBase.html).

* `StrokeThickness`: The width of the stroke outline of content elements. The property is of type `double`.

* `MiterLimit`: Specifies the miter limit for graphic elements. The property is of type `double?`.

* `StrokeDashOffset`: The dash offset for graphic elements. The property is of type `double`.

* `StrokeDashArray`: The stroke dash array for graphic elements. The property is of type `IEnumerable<double>`.

* `StrokeLineJoin`: The stroke line join for graphic elements. The property is of type [LineJoin](https://docs.telerik.com/devtools/document-processing/api/Telerik.Windows.Documents.Fixed.Model.Graphics.LineJoin.html).

* `StrokeLineCap`: The stroke line cap for graphic elements. The property is of type [LineCap](https://docs.telerik.com/devtools/document-processing/api/Telerik.Windows.Documents.Fixed.Model.Graphics.LineCap.html).
            
#### **Example 1: Using GraphicProperties with FixedContentEditor**

<snippet id='libraries-pdf-editing-text-and-graphic-properties-editor'/>

## TextProperties

These properties hold the parameters for text fragments. You can modify the following parameters through `TextProperties`:
        

* `UnderlinePattern`: The underline pattern. The property is an enumeration of type [UnderlinePattern](https://docs.telerik.com/devtools/document-processing/api/Telerik.Windows.Documents.Fixed.Model.Editing.Flow.UnderlinePattern.html). Two patterns are supported:   
	* `None`: There is no underline. This is the default value.      
	* `Single`: The underline is a single line.

* `UnderlineColor`: The color of the underline.

* `StrikethroughPattern`: The strikethrough pattern. The property is an enumeration of type [StrikethroughPattern](https://docs.telerik.com/devtools/document-processing/api/Telerik.Windows.Documents.Fixed.Model.Editing.Flow.StrikethroughPattern.html). Two patterns are supported:   
	* `None`: There is no strikethrough. This is the default value.      
	* `Single`: The strikethrough is a single line.

* `StrikethroughColor`: The color of the strikethrough.
	
* `CharacterSpacing`: The character spacing for text fragments. The property is of type `double?`.

* `WordSpacing`: The word spacing for text fragments. The property is of type `double?`.

* `HorizontalScaling`: The horizontal scaling for text fragments. The property is of type `double?`.

* `FontSize`: The font size for text fragments. The property is of type `double`. The measurement unit used for font size is [Device Independent Pixels]({%slug device-independent-pixels%}) (DIPs). You can convert it to points or other units using the [Unit](https://docs.telerik.com/devtools/document-processing/api/Telerik.Windows.Documents.Media.Unit.html) class.

* `RenderingMode`: The rendering mode for text fragments. The property is of type [RenderingMode](https://docs.telerik.com/devtools/document-processing/api/Telerik.Windows.Documents.Fixed.Model.Text.RenderingMode.html).

* `BaselineAlignment`: Describes how the baseline for a text-based element is positioned on the vertical axis, relative to the established baseline for text. The property is an enumeration of type [BaselineAlignment](https://docs.telerik.com/devtools/document-processing/api/Telerik.Windows.Documents.Fixed.Model.Editing.Flow.BaselineAlignment.html) and exposes the following values:
	* `Baseline`: A baseline that is aligned at the actual baseline of the containing box.
	* `Subscript`: A baseline that is aligned at the subscript position of the containing box.
	* `Superscript`: A baseline that is aligned at the superscript position of the containing box.

* `Font`: The font for the inserted text, of type [FontBase](https://docs.telerik.com/devtools/document-processing/api/Telerik.Windows.Documents.Fixed.Model.Fonts.FontBase.html).

* `HorizontalAlignment`: The horizontal positioning of the inserted text in the text block. The property is of type [HorizontalAlignment](https://docs.telerik.com/devtools/document-processing/api/Telerik.Windows.Documents.Fixed.Model.Editing.Flow.HorizontalAlignment.html).

* `VerticalAlignment`: The vertical positioning of the inserted text in the text block. The property is of type [VerticalAlignment](https://docs.telerik.com/devtools/document-processing/api/Telerik.Windows.Documents.Fixed.Model.Editing.Flow.VerticalAlignment.html).
            
#### **Example 2: Using TextProperties with Block**

<snippet id='libraries-pdf-editing-text-and-graphic-properties-text-properties-block'/>

`TextProperties` also exposes the following methods for changing the current font:
        

* `TextProperties.TrySetFont(FontFamily fontFamily)`

* `TextProperties.TrySetFont(fontFamily, fontStyle, fontWeight)`

>important In **.NET Standard/.NET (Target OS: None)** environments, fonts beyond the [14 standard ones]({%slug radpdfprocessing-concepts-fonts%}#standard-fonts) require a [FontsProvider implementation]({%slug pdfprocessing-implement-fontsprovider%}) to be resolved correctly.

## Preserving Current State

Both text and graphic properties contain methods that preserve and restore the current state.
        

* `properties.Save()`

* `properties.Restore()`

> The `Save()` method returns an `IDisposable` object that executes `Restore()` when the dispose method is called. You can use it in a `using` statement.
          

## See Also

* [FixedContentEditor]({%slug radpdfprocessing-editing-fixedcontenteditor%})
* [Block]({%slug radpdfprocessing-editing-block%})
* [Changing Block's Text Color in PDF Documents Using RadPdfProcessing]({%slug change-text-color-pdf-radpdfprocessing%})
* [How to Change Text Color Using PdfProcessing]({%slug pdfprocessing-text-color%})
