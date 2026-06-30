---
title: Clipping
description: Learn how to use the Clipping content element in RadPdfProcessing to define the outline of images and paths in PDF documents.
page_title: Clipping
slug: radpdfprocessing-concepts-clipping
tags: clipping, pdf, geometry, image, path, radpdfprocessing, outline, rectangle
published: True
position: 3
---

# Clipping

`Clipping` is a content element that defines the outline of other content elements like [Image]({%slug radpdfprocessing-model-image%}) and [Path]({%slug radpdfprocessing-model-path%}).

## Creating a Clipping

The `Clipping` element exposes a single property:

* `Clip`: Property of type `GeometryBase` representing the [Geometry]({%slug radpdfprocessing-concepts-geometry%}) used to clip the content element.

**Example 1** demonstrates how to create a `Clipping` element and assign a `RectangleGeometry` to its `Clip` property.

#### __Example 1: Create Clipping__

<snippet id='libraries-pdf-concepts-clipping-geometry'/>

## Using Clipping

All inheritors of the `ContentElementBase` class expose a `Clipping` property. Setting it clips the respective content element with the specified clipping. 

**Example 2** demonstrates how to clip an image using the `Clipping` created in **Example 1**.

#### __Example 2: Use Clipping__

<snippet id='libraries-pdf-concepts-clipping-image-clipping'/>



## See Also

 * [Geometry]({%slug radpdfprocessing-concepts-geometry%})
