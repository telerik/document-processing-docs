---
title: Form
description: Learn how to use Form XObjects in RadPdfProcessing to define reusable content elements within a PDF document.
page_title: Form
slug: radpdfprocessing-model-form
tags: formxobject, pdf, reusable, radpdfprocessing, content, model, xobject, composite
published: True
position: 6
---

# Form

`Form` is a content element that contains a form source and represents a Form XObject. Form XObjects allow you to describe objects (text, images, vector elements, and so on) within a PDF file and reuse this content throughout the document.

* [Creating and Inserting a Form](#creating-and-inserting-a-form)
* [Form Properties](#form-properties)

## Public API

| **Property**          | **Description**                                                                                 |
|-----------------------|-------------------------------------------------------------------------------------------------|
| `FormSource`        | Specifies the content that the Form object visualizes. It is of type [FormSource]({%slug radpdfprocessing-model-formsource-overview%}). |
| `Clipping`          | Gets or sets the clipping of the form object.                                                  |
| `Width`             | The width of the form.                                                                          |
| `Height`            | The height of the form.                                                                         |
| `AlphaConstant`     | Specifies the constant shape or constant opacity value for nonstroking operations.   |
| `StrokeAlphaConstant` | Specifies the constant shape or constant opacity value for stroking operations.      |
| `Position`          | The [Position]({%slug radpdfprocessing-concepts-position%}) of the form inside the `IContainerElement`. |
| `Parent`            | Gets the parent page of the form.                                               |

| **Method**            | **Description**                                                                                 |
|-----------------------|-------------------------------------------------------------------------------------------------|
| `Clone` (starting with Q2 2025) | Creates a deep copy of this document element.                                                  |


### Creating and Inserting a Form

The `Form` class exposes a default public constructor that allows you to create instances of it. `Form` is a content element and you can add such an object to the `Content` collection of an `IContainerElement` such as [RadFixedPage]({%slug radpdfprocessing-model-radfixedpage%}).

**Example 1** shows how to initialize a `Form` object and add it to a previously defined container.

#### **Example 1: Create a form and add it to an IContainerElement**

<snippet id='libraries-pdf-model-form-create-form'/>


**Example 2** demonstrates how to use one of the factory methods of the `ContentElementCollection` to create a new form and insert it into the respective container.

#### **Example 2: Add a form to a container**

<snippet id='libraries-pdf-model-form-to-container'/>


>tip There are other methods that allow adding a form to a document by passing its size and source. You can use them through the [FixedContentEditor]({%slug radpdfprocessing-editing-fixedcontenteditor%}) class.

> You can add content to the form by setting its `FormSource` property. The API also allows you to directly pass the `FormSource` to a method that automatically generates a form in the document content. For more information, see the [FormSource]({%slug radpdfprocessing-model-formsource-overview%}) article.

> There is no nesting limit for [Form XObjects]({%slug radpdfprocessing-model-form%}), but PDF viewers may restrict depth to avoid memory or performance issues and improve responsiveness. This can affect rendering depending on the viewer.


### Modifying Form Properties

You can modify a `Form` element using the properties the class exposes. The properties are listed in the [Public API](#public-api) section.

#### **Example 3: Modify Form properties**

<snippet id='libraries-pdf-model-form-modify-form'/>

![PdfProcessing Modify Form Properties](images/pdf-processing-modify-form-properties.png)

## See Also

* [FormSource]({%slug radpdfprocessing-model-formsource-overview%})
* [RadFixedPage]({%slug radpdfprocessing-model-radfixedpage%})
* [FixedContentEditor]({%slug radpdfprocessing-editing-fixedcontenteditor%})
* [Position]({%slug radpdfprocessing-concepts-position%})
