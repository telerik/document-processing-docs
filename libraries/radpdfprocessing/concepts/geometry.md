---
title: Geometry
description: Learn about the geometry classes in RadPdfProcessing that describe 2D shapes used for clipping and drawing in PDF documents.
page_title: Geometry
slug: radpdfprocessing-concepts-geometry
tags: geometry, pdf, shapes, path, clipping, radpdfprocessing, rectangle, bezier
published: True
position: 6
---

# Geometry

The `GeometryBase` class and the classes that derive from it enable you to describe the geometry of a 2D shape. You can use these geometric descriptions for clipping and drawing.

This article covers the supported geometry types:

* [RectangleGeometry](#rectanglegeometry)

* [PathGeometry](#pathgeometry)

* [PathFigure](#pathfigure)

* [PathSegment](#pathsegment)

* [LineSegment](#linesegment)

* [BezierSegment](#beziersegment)

* [QuadraticBezierSegment](#quadraticbeziersegment)

* [ArcSegment](#arcsegment)


## RectangleGeometry

`RectangleGeometry` represents a two-dimensional rectangle. The class exposes the following properties:

* `Rect`: The dimensions of the rectangle.

**Example 1** shows how to create a `RectangleGeometry`.

**Example 1: Create RectangleGeometry**

<snippet id='pdf-create-rectangle-geometry'/>



## PathGeometry

`PathGeometry` represents a complex shape that may be composed of curves and lines. The class exposes the following properties:

* `Figures`: A collection of `PathFigure` objects that describe the contents of the `PathGeometry`.

* `FillRule`: Specifies how the intersecting areas contained in the `PathGeometry` are combined.
	 * `EvenOdd`: Determines whether a point is inside a path by drawing a ray from that point in any direction and counting the number of path segments that cross the ray. If the number is odd, the point is inside. If even, the point is outside.
	 
	 * `Nonzero`: Determines whether a given point is inside a path by conceptually drawing a ray from that point to infinity in any direction and then examining the places where a segment of the path crosses the ray. Starting with a count of zero, the rule adds one each time a path segment crosses the ray from left to right and subtracts one each time a segment crosses from right to left. After counting all the crossings, if the result is zero, the point is outside the path. Otherwise, it is inside.

**Example 2** shows how to create a `PathGeometry` that consists of line segments and Bezier segments.

**Example 2: Create PathGeometry**

<snippet id='pdf-create-path-geometry'/>



## PathFigure

`PathFigure` represents a subsection of a `PathGeometry`. The class exposes the following properties:

* `Segments`: A collection of `PathSegment` objects that define the shape of this `PathFigure`.

* `StartPoint`: The point where the `PathFigure` begins.

* `IsClosed`: Specifies whether the first and the last segments are connected.

## PathSegment

`PathSegment` represents a segment of a `PathFigure` object. This abstract class is inherited by:

* `LineSegment`

* `BezierSegment`

* `QuadraticBezierSegment`


## LineSegment

Represents a segment that creates a line between two points. The `LineSegment` class exposes the following properties:

* `Point`: The end point of the line segment.

## BezierSegment

Represents a cubic Bezier curve drawn between two points.

* `Point1`: The first control point of the curve.            

* `Point2`: The second control point of the curve.

* `Point3`: The end point of the curve.

## QuadraticBezierSegment

Represents a quadratic Bezier curve between two points. The `QuadraticBezierSegment` class exposes the following properties:

* `Point1`: The control point of the curve.

* `Point2`: The end point of the `QuadraticBezierSegment`.

## ArcSegment

Represents an elliptical arc between two points. The `ArcSegment` class exposes the following properties:

* `Point`: The endpoint of the elliptical arc.

* `RadiusX`: The X radius of the arc.

* `RadiusY`: The Y radius of the arc.

* `IsLargeArc`: Specifies whether the arc is greater than 180 degrees.

* `SweepDirection`: Specifies whether the arc is drawn in the Clockwise or Counterclockwise direction.

* `RotationAngle`: Specifies the amount (in degrees) by which the ellipse is rotated about the x-axis.
            
## See Also

 * [Path]({%slug radpdfprocessing-model-path%})
 * [FixedContentEditor]({%slug radpdfprocessing-editing-fixedcontenteditor%})
 * [How to Draw Figures in PDF documents]({%slug pdf-processing-draw-figures-arcsegment%})
 * [Draw a PDF Page Background Using RadPdfProcessing]({%slug radpdfprocessing-draw-pdf-page-background%})
