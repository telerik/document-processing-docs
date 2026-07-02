---
title: Overview
description: Learn how to add content, SVG FormSource images, or FormSource barcodes into a PDF document using the FormSource class in RadPdfProcessing.
page_title: Form Source Overview
slug: radpdfprocessing-model-formsource-overview
tags: formsource, pdf, svg, radpdfprocessing, barcode, content, model, overview
published: True
position: 0
---

# FormSource

With `FormSource` you can add content to a [Form]({%slug radpdfprocessing-model-form%}) object and insert it in the PDF document. The following sections are covered:

* [Creating a FormSource](#creating-a-formsource)
* [FormSource Properties](#properties)
* [Adding Content to a FormSource Object](#adding-content-to-a-formsource-object)
* [Inserting a FormSource into a Document](#inserting-a-formsource-into-a-document)

>note The `FormSource` content can also be an [SVG]({%slug radpdfprocessing-model-formsource-svg%}) image or a [Barcode]({%slug radpdfprocessing-model-formsource-barcode%}).

## Creating a FormSource

The `FormSource` class exposes a default constructor that you can use to create an empty instance.

**Example 1: Create FormSource**

<snippet id='pdf-create-form-source'/>

The snippet from **Example 1** creates an empty `FormSource` object. To fill this object with content, use [FixedContentEditor]({%slug radpdfprocessing-editing-fixedcontenteditor%}) as described later in this article.

The `FormSource` class exposes the following properties:

| Property | Description |
| ---- | ---- |
| `Size` | Gets or sets the size of the form. |
| `Content` | Gets the contents of the form. |

## Adding Content to a FormSource Object

The `FormSource` class inherits from the `IContentRootElement` interface. This inheritance allows you to use the [FixedContentEditor]({%slug radpdfprocessing-editing-fixedcontenteditor%}) class to fill the content of the form.

**Example 2** shows how to insert content into a `FormSource` object by using `FixedContentEditor`.

> There is no nesting limit for [Form XObjects]({%slug radpdfprocessing-model-form%}), but PDF viewers may restrict depth to avoid memory or performance issues and improve responsiveness. This restriction can affect rendering depending on the viewer.

**Example 2: Add content to a FormSource**

<snippet id='pdf-add-content-to-form-source'/>

## Inserting a FormSource into a Document

After you generate the `FormSource` object and fill it with content, insert it in the document. The API provides you with several approaches to insert the form in different scenarios.

> You can reuse a single `FormSource` object across the document by setting it to different [Form]({%slug radpdfprocessing-model-form%}) instances.

* The `FixedContentEditor` allows you to add a form to a container.

    **Add a FormSource to a document using FixedContentEditor**

    <snippet id='pdf-fixed-editor-add-content-to-form-source'/>

    There are several overloads of the `DrawForm()` method that let you specify the size of the form.

* You can insert a `FormSource` object by using the methods of `RadFixedDocumentEditor`. The `InsertFormInline()` method is described in the [RadFixedDocumentEditor]({%slug radpdfprocessing-editing-radfixeddocumenteditor%}) article.

* When editing a `Block`, you can insert a `FormSource` object directly into it. For more information, see the [Block]({%slug radpdfprocessing-editing-block%}) article.

## See Also

* [SVG FormSource]({%slug radpdfprocessing-model-formsource-svg%})
* [Barcode FormSource]({%slug radpdfprocessing-model-formsource-barcode%})
