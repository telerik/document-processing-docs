---
title: Text and Graphic Properties
page_title: Text and Graphic Properties
slug: radpdfprocessing-editing-text-and-graphic-properties
tags: text,and,graphic,properties
published: True
position: 5
---

# Text and Graphic Properties

When using the methods of [FixedContentEditor]({%slug radpdfprocessing-editing-fixedcontenteditor%}) or [Block]({%slug radpdfprocessing-editing-block%}) classes they will create different content elements. You can control the look of the newly created elements with the following properties:
      

## GraphicProperties

These properties are used to hold the current graphics control parameters. The following parameters can be modified using the __GraphicProperties__:
        

* __IsFilled__: A boolean property specifying whether content elements should be filled.

* __IsStroked__: A boolean property specifying whether content elements should be stroked.

* __FillColor__: The color which will be used to fill the content elements. The property is of type [ColorBase](https://docs.telerik.com/devtools/document-processing/api/Telerik.Windows.Documents.Fixed.Model.ColorSpaces.ColorBase.html).

* __StrokeColor__: The color which will be used to stroke the content elements. The property is of type [ColorBase](https://docs.telerik.com/devtools/document-processing/api/Telerik.Windows.Documents.Fixed.Model.ColorSpaces.ColorBase.html).

* __StrokeThickness__: The width of the stroke outline of content elements. The property is of type `double`.

* __MiterLimit__: Specifies the miter limit for graphic elements. The property is of type `double?`.

* __StrokeDashOffset__: The dash array for graphic elements. The property is of type `double`.

* __StrokeDashArray__: The stroke dash array for graphic elements. The property is of type `IEnumerable<double>`.

* __StrokeLineJoin__: The stroke line join for graphic elements. The property is of type [LineJoin](https://docs.telerik.com/devtools/document-processing/api/Telerik.Windows.Documents.Fixed.Model.Graphics.LineJoin.html).

* __StrokeLineCap__: The stroke line cap for graphic elements. The property is of type [LineCap](https://docs.telerik.com/devtools/document-processing/api/Telerik.Windows.Documents.Fixed.Model.Graphics.LineCap.html).
            
#### [C#] Example 1: Using GraphicProperties with FixedContentEditor

{{region radpdfprocessing-editing-text-and-graphic-properties_0}}

	editor.GraphicProperties.IsFilled = true;
	editor.GraphicProperties.IsStroked = true;

	editor.GraphicProperties.FillColor = new RgbColor(255, 0, 0);
	editor.GraphicProperties.StrokeColor = RgbColors.Black;
	editor.GraphicProperties.StrokeThickness = 2;
	editor.GraphicProperties.StrokeDashArray = new double[] { 2, 2, 5 };
	editor.GraphicProperties.StrokeLineJoin = Telerik.Windows.Documents.Fixed.Model.Graphics.LineJoin.Round;
{{endregion}}

## TextProperties

These properties hold the parameters used for text fragments. The following parameters can be modified using the __TextProperties__:
        

* __UnderlinePattern__: The underline pattern. The property is an enumeration of type [UnderlinePattern](https://docs.telerik.com/devtools/document-processing/api/Telerik.Windows.Documents.Fixed.Model.Editing.Flow.UnderlinePattern.html). Two patterns are supported:   
	* __None__: There is no underline. This is the default value.      
	* __Single__: The underline is a single line.

* __UnderlineColor__: The color of the underline.

* __StrikethroughPattern__: The strikethrough pattern. The property is an enumeration of type [StrikethroughPattern](https://docs.telerik.com/devtools/document-processing/api/Telerik.Windows.Documents.Fixed.Model.Editing.Flow.StrikethroughPattern.html). Two patterns are supported:   
	* __None__: There is no strikethrough. This is the default value.      
	* __Single__: The strikethrough is a single line.

* __StrikethroughColor__: The color of the strikethrough.
	
* __CharacterSpacing__: The character spacing for text fragments. The property is of type `double?`.

* __WordSpacing__: The word spacing for text fragments. The property is of type `double?`.

* __HorizontalScaling__: The horizontal scaling for text fragments. The property is of type `double?`.

* __FontSize__: The font size for text fragments. The property is of type `double`. The measurement unit used for font size is [Device Independent Pixels]({%slug device-independent-pixels%}) (DIPs). You can convert it to points or other units using the [Unit](https://docs.telerik.com/devtools/document-processing/api/Telerik.Windows.Documents.Media.Unit.html) class.

* __RenderingMode__: The rendering mode for text fragments. The property is of type [RenderingMode](https://docs.telerik.com/devtools/document-processing/api/Telerik.Windows.Documents.Fixed.Model.Text.RenderingMode.html).

* __BaselineAlignment__: Describes how the baseline for a text-based element is positioned on the vertical axis, relative to the established baseline for text. The property is an enumeration of type [BaselineAlignment](https://docs.telerik.com/devtools/document-processing/api/Telerik.Windows.Documents.Fixed.Model.Editing.Flow.BaselineAlignment.html) and exposes the following values:
	* __Baseline__: A baseline that is aligned at the actual baseline of the containing box.
	* __Subscript__: A baseline that is aligned at the subscript position of the containing box.
	* __Superscript__: A baseline that is aligned at the superscript position of the containing box.

* __Font__: The font for the inserted text, of type [FontBase](https://docs.telerik.com/devtools/document-processing/api/Telerik.Windows.Documents.Fixed.Model.Fonts.FontBase.html).

* __HorizontalAlignment__: The horizontal positioning of the inserted text in the text block. The property is of type [HorizontalAlignment](https://docs.telerik.com/devtools/document-processing/api/Telerik.Windows.Documents.Fixed.Model.Editing.Flow.HorizontalAlignment.html).

* __VerticalAlignment__: The vertical positioning of the inserted text in the text block. The property is of type [VerticalAlignment](https://docs.telerik.com/devtools/document-processing/api/Telerik.Windows.Documents.Fixed.Model.Editing.Flow.VerticalAlignment.html).
            
#### [C#] Example 2: Using TextProperties with Block

{{region radpdfprocessing-editing-text-and-graphic-properties_1}}

	block.TextProperties.CharacterSpacing = 5;
	block.TextProperties.Font = FontsRepository.TimesBold;
	block.TextProperties.FontSize = Unit.PointToDip(12);

	block.TextProperties.HighlightColor = new RgbColor(40, 60, 80);
	block.TextProperties.RenderingMode = Telerik.Windows.Documents.Fixed.Model.Text.RenderingMode.FillAndStroke;
	block.TextProperties.UnderlinePattern = Telerik.Windows.Documents.Fixed.Model.Editing.Flow.UnderlinePattern.Single;
	block.TextProperties.UnderlineColor = RgbColors.Black;;
{{endregion}}

The TextProperties also exposes the following methods, which can be used for changing the current font:
        

* __TextProperties.TrySetFont(FontFamily fontFamily);__

* __TextProperties.TrySetFont(fontFamily, fontStyle, fontWeight);__

## Preserving Current State

Both Text and Graphic properties contain methods that can preserve and restore the current state.
        

* __properties.Save();__

* __properties.Restore();__

>The Save() method returns __IDisposable__ object that will execute Restore() as soon as the dispose method is called and can be used in a using statement.
          

## See Also

 * [FixedContentEditor]({%slug radpdfprocessing-editing-fixedcontenteditor%})
 * [Block]({%slug radpdfprocessing-editing-block%})
 * [Changing Block's Text Color in PDF Documents Using RadPdfProcessing]({%slug change-text-color-pdf-radpdfprocessing%})
 * [How to Change Text Color Using PdfProcessing]({%slug pdfprocessing-text-color%})
