---
title: Position
description: Learn how to use the Position property in RadPdfProcessing to manipulate the placement of content elements in PDF documents.
page_title: Position
slug: radpdfprocessing-concepts-position
tags: position, pdf, matrix, transformation, coordinates, radpdfprocessing, rotation, scaling
published: True
position: 8
---

# Position

The `Position` property exposed by the `PositionContentElement` abstract class is used for manipulating the position of elements.

>tip You can find a diagram representing the structure in **RadPdfProcessing** in the [Model]({%slug radpdfprocessing-model-general-information%}) article.
        
The position is represented by the `IPosition` interface which provides the following methods:      

* `void Scale(double scaleX, double scaleY)`: Applies the specified scale.

* `void ScaleAt(double scaleX, double scaleY, double centerX, double centerY)`: Applies the specified scale about the specified coordinates.

* `void Rotate(double angle)`: Applies the specified rotation.

* `void RotateAt(double angle, double centerX, double centerY)`: Applies the specified rotation about the specified coordinates.

* `void Translate(double offsetX, double offsetY)`: Applies the specified translation.

* `void Clear()`: Clears the position, restoring it to its initial state.

* `IPosition Clone()`: Clones the position.

The `IPosition` interface exposes a `Matrix` property which represents the matrix constructed from the applied transformations.

The `IPosition` interface is implemented by the following classes:

* [MatrixPosition](#matrixposition)

* [SimplePosition](#simpleposition)

By default, `PositionContentElement` objects use `MatrixPosition`, whereas [FixedContentEditor]({%slug radpdfprocessing-editing-fixedcontenteditor%}) uses `SimplePosition`.
      
## MatrixPosition

Each applied transformation is appended to all the previously applied ones. When the `Matrix` property is calculated, the order of the applied transformations is the same as the order of the invocation of the transform methods.

The `MatrixPosition` class exposes a static `Default` property, which represents the default `MatrixPosition`. The default Matrix of the default `MatrixPosition` is the **Identity matrix**.

**Example 1** shows how transformations can be appended.

#### __Example 1: Transform MatrixPosition__

<snippet id='pdf-matrix-position'/>

The resulting matrix position is translated both horizontally and vertically by 50.
        
## SimplePosition

Each applied transformation overwrites the previous transformations of the same type. When the value of the `Matrix` property is calculated, the order of the transformations is the following:
        
1. Scale
1. Rotate    
1. Translate

The `SimplePosition` class exposes a static `Default` property which represents the default `SimplePosition`.

**Example 2** shows how transformations overwrite the previous transformations of the same type.
        
#### __Example 2: Transform SimplePosition__

<snippet id='pdf-simple-position'/>

The resulting simple position is translated both horizontally and vertically by 30, because of the transformation overwriting.
        
## See Also

 * [Model]({%slug radpdfprocessing-model-general-information%})
 * [FixedContentEditor]({%slug radpdfprocessing-editing-fixedcontenteditor%})
