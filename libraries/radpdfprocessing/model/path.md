---
title: Path
description: Learn how to work with Path content elements in RadPdfProcessing to draw vector graphics defined by connected lines and curves.
page_title: Path
slug: radpdfprocessing-model-path
tags: path, pdf, vector, radpdfprocessing, geometry, graphics, lines, curves
published: True
position: 8
---

# Path

`Path` is a content element that represents a series of connected lines and curves. The [Geometry]({%slug radpdfprocessing-concepts-geometry%}) property specifies the shape of the path.

* [Inserting a Path](#inserting-a-path)
* [Modifying a Path](#modifying-a-path)

## Public API

| **Property**          | **Description**                                                                                 |
|-----------------------|-------------------------------------------------------------------------------------------------|
| `Fill`              | The color that fills the path. The default value is Black.                            |
| `Stroke`            | The color that strokes the path. The default value is Black.                          |
| `IsFilled`          | Specifies whether the path is filled.                                                   |
| `IsStroked`         | Specifies whether the path is stroked.                                                  |
| `StrokeThickness`   | The width of the stroke outline.                                                                |
| `StrokeLineCap`     | Specifies the shape used at the ends of open paths when they are stroked. It can have one of the following values: <table><tr><td>`Flat`</td><td>Flat line cap.</td></tr><tr><td>`Round`</td><td>Round line cap.</td></tr><tr><td>`Square`</td><td>Square line cap.</td></tr></table> |
| `StrokeLineJoin`    | Specifies the shape used at the corners of stroked paths. Join styles are significant only at points where consecutive segments connect at an angle. Available options: <table><tr><td>`Bevel`</td><td>Produces a diagonal corner.</td></tr><tr><td>`Miter`</td><td>Produces a sharp corner. If the segments meet at too sharp an angle, a bevel join is used instead.</td></tr><tr><td>`Round`</td><td>Produces a smooth, circular arc between the lines.</td></tr></table> |
| `StrokeDashArray`   | The pattern of dashes and gaps used to stroke paths.                                            |
| `StrokeDashOffset`  | The distance from the start of a line to the beginning of a dash pattern.                       |
| `AlphaConstant`     | Specifies the constant shape or constant opacity value for nonstroking operations.   |
| `StrokeAlphaConstant` | Specifies the constant shape or constant opacity value for stroking operations.    |
| `MiterLimit`        | The limit of the thickness of the join on a mitered corner.                                     |
| `Geometry`          | The shape to draw. For more information, see [Geometry]({%slug radpdfprocessing-concepts-geometry%}). |
| `Position`          | Specifies the position of the path.                                                             |

| **Method**            | **Description**                                                                                 |
|-----------------------|-------------------------------------------------------------------------------------------------|
| `Clone` (starting with Q2 2025)             | Creates a deep copy of this document element.                                                  |

### Inserting a Path

`Path` is a content element designed for the `Content` collection of an `IContainerElement` such as [RadFixedPage]({%slug radpdfprocessing-model-radfixedpage%}). You can use several approaches to add it.

**Example 1** shows how to create a `Path`, assign a predefined `Geometry` to it, and add it to a container.

**Example 1: Create Path and add it to container**

<snippet id='pdf-create-path'/>

**Example 2** demonstrates how to use one of the factory methods of the `ContentElementCollection` to create a new path and insert it into the document.

**Example 2: Add Path to container**

<snippet id='pdf-path-to-container'/>

> There are other methods that allow adding a path to a document. You can use them through the [FixedContentEditor]({%slug radpdfprocessing-editing-fixedcontenteditor%}) class.

### Modifying a Path

You can modify a `Path` element using the properties the class exposes. The properties are listed in the [Public API](#public-api) section.

**Example 3: Modifying Path properties**

<snippet id='pdf-modify-path'/>

## See Also

* [Geometry]({%slug radpdfprocessing-concepts-geometry%})
* [RadFixedPage]({%slug radpdfprocessing-model-radfixedpage%})
* [FixedContentEditor]({%slug radpdfprocessing-editing-fixedcontenteditor%})
* [How to Draw Figures in PDF Documents]({%slug pdf-processing-draw-figures-arcsegment%})
