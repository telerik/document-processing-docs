---
title: Overview
description: Learn how to add content, SVG FormSource images or FormSource barcodes into a PDF document using RadPdfProcessing.
page_title: Form Source Overview
slug: radpdfprocessing-model-formsource-overview
tags: formsource, pdfprocessing, document, processing, pdf
published: True
position: 0
---

# FormSource

With **FormSource** you can add content to a [Form]({%slug radpdfprocessing-model-form%}) object, which will be inserted in the PDF document. This article explains the following topics:

* [Creating a FormSource](#creating-a-formsource)
* [FormSource Properties](#properties)
* [Adding Content to a FormSource Object](#adding-content-to-a-formsource-object)
* [Inserting a FormSource into a Document](#inserting-a-formsource-into-a-document)
      
>note The **FormSource** content can also be an [SVG]({%slug radpdfprocessing-model-formsource-svg%}) image or a [Barcode]({%slug radpdfprocessing-model-formsource-barcode%}). 

## Creating a FormSource

The FormSource class exposes a default constructor which you can use to create an empty instance.      

#### __[C#] Example 1: Create FormSource__

<snippet id='pdf-create-form-source'/>

The snippet from **Example 1** will create an empty FormSource object. To fill this object with content you can use [FixedContentEditor]({%slug radpdfprocessing-editing-fixedcontenteditor%}) as described later in this article.

The properties exposed by the **FormSource** class are as follows:

| Property | Description |
| ---- | ---- |
| **Size** | Allows getting or setting the size of the form. |
| **Content** | Gets the contents of the form. | 

## Adding Content to a FormSource Object

The FormSource class inherits from the IContentRootElement interface. This inheritance allows you to use the [FixedContentEditor]({%slug radpdfprocessing-editing-fixedcontenteditor%}) class for filling the content of the form.

**Example 2** shows you how you can insert a content into a FormSource object using FixedContentEditor.

>There’s no nesting limit for [Form XObjects]({%slug radpdfprocessing-model-form%}), but PDF viewers may restrict depth to avoid memory or performance issues and improve responsiveness, which can affect rendering depending on the viewer.

#### __[C#] Example 2: Add content to a FormSource__

<snippet id='pdf-add-content-to-form-source'/>

## Inserting a FormSource into a Document

After generating the FormSource object and filling it with content, you should insert it in the document. The API provides you with convenient approaches that might be useful to easily insert the form in different scenarios.

>You can reuse a single FormSource object among the document by setting it to different [Form]({%slug radpdfprocessing-model-form%}) instances.

* In addition to the ability to fill a form source, the FixedContentEditor allows you to add this form to a container. 


    #### __[C#] Example 3: Add a FormSource to a document using FixedContentEditor__
    
    <snippet id='pdf-fixed-editor-add-content-to-form-source'/>

    There are several overloads of the DrawForm() method that enables you to specify the size of the form.

* A FormSource object can be inserted using the methods of **RadFixedDocumentEditor**. The InsertFormInline() method is described in the [RadFixedDocumentEditor]({%slug radpdfprocessing-editing-radfixeddocumenteditor%}) topic.

* When editing a Block, you can insert a FormSource object directly into it. For more information, check [this topic]({%slug radpdfprocessing-editing-block%}).

## See Also

 * [SVG FormSource]({%slug radpdfprocessing-model-formsource-svg%})
 * [Barcode FormSource]({%slug radpdfprocessing-model-formsource-barcode%})