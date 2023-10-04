---
title: TextFragment
page_title: TextFragment
slug: radpdfprocessing-model-textfragment
tags: textfragment
published: True
position: 3
---

# TextFragment



__TextFragment__ is content element that represents а single-line text object.
      

* [Inserting a TextFragment](#inserting-a-textfragment)

* [Modifying a TextFragment](#modifying-a-textfragment)


## Inserting a TextFragment

__TextFragment__ is a content element that can be added in the __Content__ collection of a __IContainerElement__ such as [RadFixedPage]({%slug radpdfprocessing-model-radfixedpage%}). There are several approaches that can be adopted.
        

__Example 1__ shows how you can initialize a TextFragment object and add it to a previously defined container.
        

#### __[C#] Example 1: Create TextFragment and add it to container__

{{region cs-radpdfprocessing-model-textfragment_0}}
	TextFragment fragment = new TextFragment();
	container.Content.Add(fragment);
{{endregion}}



__Example 2__ demonstrates how to use one of the factory methods of the __ContentElementCollection__, which create new text fragment and insert it into the respective container. Both methods return the actual TextFragment instance so you can modify it.
        

#### __[C#] Example 2: Add TextFragment to container__

{{region cs-radpdfprocessing-model-textfragment_1}}
	TextFragment textFragment = container.Content.AddTextFragment();
	TextFragment textFragmentWithText = container.Content.AddTextFragment("Text");
{{endregion}}



>tip__TextFragment__ represents a single line of text. In order to make your text "flows" in a document you should make sure all fragments you add can fit in a line or you can use [FixedContentEditor]({%slug radpdfprocessing-editing-fixedcontenteditor%}).
          
>The '\r' and '\n' characters don't have the usual meaning of "go to next line" when they are inserted into a PDF document and you cannot simply insert text containing these characters to produce multiline text. Instead, you should split the text and insert it line by line. 


## Modifying a TextFragment

TextFragment exposes the following properties that can modify the look of the represented text:
        

* __CharacterSpacing__: The spacing between the characters in the text.
            

* __WordSpacing__: The spacing between the words in the text.
            

	>Only space character (Unicode 0x32) is considered a word break in RadPdfProcessing's document model.
              

* __HorizontalScaling__: The horizontal scaling that is applied to the characters.
            

* __Font__: The font that is used to draw the text.
            

* __FontSize__: The font size. The measurement unit used for font size is [Device Independent Pixels]({%slug device-independent-pixels%})(DIPs). You can convert it to points or other units using the [Unit](https://docs.telerik.com/devtools/document-processing/api/Telerik.Windows.Documents.Media.Unit.html) class.
            

* __RenderingMode__: Enumeration representing the way the text should be rendered. It can have one of the following values:
            

	* __Fill__: Fill text (the default value).
	            
	
	* __Stroke__: Stroke text.
	            
	
	* __FillAndStroke__: Fill, then stroke text.
	            
	
	* __None__: Neither fill nor stroke text (invisible).
	            
	
	* __FillAndAddToClippingPath__: Fill text and add to path for clipping (see above).
	            
	
	* __StrokeAndAddToClippingPath__: Stroke text and add to path for clipping.
	           
	
	* __FillStrokeAndAddToClippingPath__: Fill, then stroke text and add to path for clipping
	            
	
	* __AddToClippingPath__: Add text to path for clipping.
            

* __TextRise__: Specifies the distance, in unscaled text space units, to move the baseline up or down from its default location.
            

* __Fill__: The color that is used to fill the text. The default value is Black.
            

* __Stroke__: The color that is used to stroke text. The default value is Black.
                        

* __StrokeThickness__: The width of the stroke line.
            

* __StrokeLineCap__: Specifies the shape, which is used at the ends of open paths, used to draw a letter, when they are stroked.
            

	* __Flat__: Flat line cap.
	
	* __Round__: Round line cap.

	* __Square__: Square line cap.
                

* __StrokeLineJoin__: Specifies the shape to be used at the corners of paths that are stroked. Join styles are significant only at the points where consecutive segments of a path connect at an angle.
            

	* __Bevel__: Produces a diagonal corner.
	            
	
	* __Miter__: Produces a sharp corner. If the segments meet at too sharp angle, a bevel join is used instead.
	            
	
	* __Round__: Produces a smooth, circular arc between the lines.
                

* __StrokeDashArray__: The pattern of dashes and gaps used to stroke paths.
            

* __StrokeDashOffset__: The distance from the start of a line to the beginning of a dash pattern.
            

* __MiterLimit__: The limit of the thickness of the join on a mitered corner.


* __Text__: Represents the text that is drawn.
            

* __Position__: The [Position]({%slug radpdfprocessing-concepts-position%}) where the text element is drawn.
            

## See Also

 * [RadFixedPage]({%slug radpdfprocessing-model-radfixedpage%})
 * [FixedContentEditor]({%slug radpdfprocessing-editing-fixedcontenteditor%})
 * [Position]({%slug radpdfprocessing-concepts-position%})
