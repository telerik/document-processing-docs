---
title: Path
page_title: Path
slug: radpdfprocessing-model-path
tags: path
published: True
position: 8
---

# Path



__Path__ is a content element that represents series of connected lines and curves. The shape of the path is specified by its [Geometry]({%slug radpdfprocessing-concepts-geometry%}) property.
      

* [Inserting a Path](#inserting-a-path)

* [Modifying a Path](#modifying-a-path)

## Inserting a Path

__Path__ is a content element that is designed to be added in the __Content__ collection of an __IContainerElement__ such [RadFixedPage]({%slug radpdfprocessing-model-radfixedpage%}). There are several approaches, which you can adopt to achieve that.
        

__Example 1__ shows how you can create a Path, assign a predefined Geometry to it and add it to a container.
        

#### __[C#] Example 1: Create Path and add it to container__

{{region cs-radpdfprocessing-model-path_0}}
	Path path = new Path();
	path.Geometry = geometry;
	container.Content.Add(path);
{{endregion}}



__Example 2__ demonstrates how to use one of the factory methods of the __ContentElementCollection__ that create a new path and insert it into the document.
        

#### __[C#] Example 2: Add Path to container__

{{region cs-radpdfprocessing-model-path_1}}
	Path path = container.Content.AddPath();
	path.Geometry = geometry;
{{endregion}}



>There are other methods that allow adding a path to a document. They could be used through the [FixedContentEditor class]({%slug radpdfprocessing-editing-fixedcontenteditor%}).
          

## Modifying a Path

You can modify a __Path__ element using the properties the class exposes. The properties are listed below.
        

* __Fill__: The color that is used to fill the path. The default value is Black.
            

* __Stroke__: The color that is used to stroke the path. The default value is Black.
            

* __IsFilled__: Specifies whether the path should be filled.
            

* __IsStroked__: Specifies whether the path should be stroked.
            

* __StrokeThickness__: The width of the stroke outline.
            

* __StrokeLineCap__: Specifies the shape, which is used at the ends of open paths when they are stroked.
            

	* __Flat__: Flat line cap.
	
	* __Round__: Round line cap.

	* __Square__: Square line cap.
                

* __StrokeLineJoin__: Specifies the shape to be used at the corners of paths that are stroked. Join styles are significant only at the points where consecutive segments of a path connect at an angle.
            

	* __Bevel__: Produces a diagonal corner.
	            
	
	* __Miter__: Produces a sharp corner. If the segments meet at too sharp angle, a bevel join is used instead.
	            
	
	* __Round__: Produces a smooth, circular arc between the lines.
                

* __StrokeDashArray__: The pattern of dashes and gaps used to stroke paths.
            

* __StrokeDashOffset__: The distance from the start of a line to the beginning of a dash pattern.


* __AlphaConstant__: Specifying the constant shape or constant opacity value to be used for nonstroking operations.


* __StrokeAlphaConstant__: Specifying the constant shape or constant opacity value to be used for nonstroking operations.
            

* __MiterLimit__: The limit of the thickness of the join on a mitered corner.
            

* __Geometry__: The shape to be drawn. More information about geometries is available [here]({%slug radpdfprocessing-concepts-geometry%}).
            
#### __[C#] Example 3: Modifying Path properties__

{{region cs-radpdfprocessing-model-path_2}}
	RadFixedDocument document = new RadFixedDocument();
	RadFixedPage page = document.Pages.AddPage();
	FixedContentEditor editor = new FixedContentEditor(page);

	RectangleGeometry rectangleGeometry = new RectangleGeometry();
	rectangleGeometry.Rect = new Rect(10, 5, 400, 300);

	Telerik.Windows.Documents.Fixed.Model.Graphics.Path path = new Telerik.Windows.Documents.Fixed.Model.Graphics.Path();
	path.Geometry = rectangleGeometry;

	SimplePosition simplePosition = new SimplePosition();
	simplePosition.Translate(20, 20);

	path.Fill = new RgbColor(255, 0, 255);
	path.Stroke = new RgbColor(0, 0, 255);
	path.IsFilled = true;
	path.IsStroked = true;
	path.StrokeThickness = 1;
	path.StrokeLineCap = Telerik.Windows.Documents.Fixed.Model.Graphics.LineCap.Flat;
	path.StrokeLineJoin = Telerik.Windows.Documents.Fixed.Model.Graphics.LineJoin.Round;
	path.StrokeDashArray = new double[] { 1 };
	path.StrokeDashOffset = 2;
	path.AlphaConstant = 0.5;
	path.StrokeAlphaConstant = 0.1;
	path.MiterLimit = 2;
	path.Position = simplePosition;

	page.Content.Add(path);
{{endregion}}

## See Also

 * [Geometry]({%slug radpdfprocessing-concepts-geometry%})
 * [RadFixedPage]({%slug radpdfprocessing-model-radfixedpage%})
 * [FixedContentEditor]({%slug radpdfprocessing-editing-fixedcontenteditor%})
 * [How to Draw Figures in PDF documents]({%slug pdf-processing-draw-figures-arcsegment%})
