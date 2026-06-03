---
title: Links
page_title: Links
description: Link annotations represent either a hypertext link to a destination elsewhere in the document or an action to be performed. 
slug: radpdfprocessing-model-annotations-links
tags: links, pdf, annotations, radpdfprocessing, hyperlinks, destinations, actions, navigation
published: True
position: 1
---

# Links

The `Link` class inherits the abstract `Annotation` class. Link annotations represent either a hypertext link to a destination elsewhere in the document or an action to be performed. The [Link class](https://docs.telerik.com/devtools/document-processing/api/Telerik.Windows.Documents.Fixed.Model.Annotations.Link.html) has two separate constructors—one that requires a `Destination` object and one that requires an `Action` object.

`Link` exposes the following properties:

| Property | Description |
|---|---|
| `Destination` | A destination to display when the annotation is activated. See **Example 1**. |
| `NamedDestination` | A named destination associated with the link. |
| `Action` | An [action]({%slug radpdfprocessing-model-actions%}) to perform when the annotation is activated. See **Example 2**. |

**Example 1: Add link to destination**

<snippet id='pdf-add-link-to-destination'/>

**Example 2: Add link with action**

<snippet id='pdf-link-with-action'/>

>important In **Example 2**, the *action* object must be from the `Telerik.Windows.Documents.Fixed.Model.Actions.Action` type.

## Destination

The abstract `Destination` class defines a particular view of a document, consisting of the following items:

* The page to display.
* The location on that page.
* The magnification (zoom) factor to use when displaying the page.

The `Destination` class itself only exposes a `Page` property specifying the page of the destination. The other properties of the view are determined by the classes that inherit `Destination`:

| Class | Description |
|---|---|
| `Location` | Exposes `Left`, `Top`, and `Zoom` properties. Displays the specified page positioned with `(Left, Top)` at the upper-left corner of the window, magnified by `Zoom`. |
| `PageFit` | Displays the specified page magnified just enough to fit the entire page within the window both horizontally and vertically. |
| `PageHorizontalFit` | Exposes `Top` property. Displays the specified page with `Top` positioned at the top edge of the window, magnified to fit the entire page width. |
| `PageVerticalFit` | Exposes `Left` property. Displays the specified page with `Left` at the left edge of the window, magnified to fit the entire page height. |
| `RectangleFit` | Exposes `Left`, `Top`, `Right`, and `Bottom` properties. Displays the specified page magnified to fit the rectangle defined by those coordinates. |
| `BoundingRectangleFit` | Displays the specified page magnified to fit its bounding box within the window. |
| `BoundingRectangleHorizontalFit` | Exposes `Top` property. Displays the specified page with `Top` at the top edge, magnified to fit the entire width of its bounding box. |
| `BoundingRectangleVerticalFit` | Exposes `Left` property. Displays the specified page with `Left` at the left edge, magnified to fit the entire height of its bounding box. |

**Example 3** shows how to create a `Location` object, associate it with a `Link`, and add it to a `RadFixedPage`.

**Example 3: Add link with location**

<snippet id='pdf-link-with-location'/>

## Action

**Example 4** demonstrates how to create an action of type `GoToAction`, associate it with a `Link`, and add it to a `RadFixedPage`. The *location* object can be of type `Location` like the one in **Example 3**.

**Example 4: Add link with action**

<snippet id='pdf-add-link-with-action'/>

## See Also

* [RadFixedPage]({%slug radpdfprocessing-model-radfixedpage%})
* [AnnotationType API Reference](https://docs.telerik.com/devtools/document-processing/api/Telerik.Windows.Documents.Fixed.Model.Annotations.AnnotationType.html)
* [Link API Reference](https://docs.telerik.com/devtools/document-processing/api/Telerik.Windows.Documents.Fixed.Model.Annotations.Link.html)
* [JavaScript Actions]({%slug radpdfprocessing-model-javascript-actions%})
* [Creating TableCells with GoToAction and UriAction]({%slug kb-create-table-cells%})
* [LaunchAction]({%slug radpdfprocessing-model-actions-launch%})
* [GoToRAction]({%slug radpdfprocessing-model-actions-gotor%})

