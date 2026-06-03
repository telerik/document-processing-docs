---
title: RadFixedPage
description: Learn about the RadFixedPage class in RadPdfProcessing, which represents a single page within a RadFixedDocument PDF document.
page_title: RadFixedPage
slug: radpdfprocessing-model-radfixedpage
tags: radfixedpage, pdf, page, radpdfprocessing, size, rotation, content, layout
published: True
position: 2
---

# RadFixedPage

`RadFixedPage` is the main page unit that builds a PDF document ([RadFixedDocument]({%slug radpdfprocessing-model-radfixeddocument%})). It conforms to the `IContentRootElement` interface and is the root element of all fixed content elements in the document model. **Figure 1** in the [Model]({%slug radpdfprocessing-model-general-information%}) article demonstrates the structure of the document model in detail.

* [What Is RadFixedPage](#what-is-radfixedpage)
* [Operating with RadFixedPage](#operating-with-radfixedpage)

## What Is RadFixedPage

The root element in the document model tree is [RadFixedDocument]({%slug radpdfprocessing-model-radfixeddocument%}). The document consists of `RadFixedPage` instances that host all content elements. You can add a `RadFixedPage` to a document in several ways.

`RadFixedPage` exposes the following properties:

|Property Name|Description|
|----|----|
|`Content`|The content elements collection.|
|`Annotations`|Collection that contains all [Annotations]({%slug radpdfprocessing-model-annotations-overview%}) in the `RadFixedPage`.|
|`MediaBox`|Defines the boundaries of the physical medium on which the page is printed. Any content falling outside this boundary is discarded without affecting the meaning of the PDF file.|
|`CropBox`|Defines the region to which the contents of the page are clipped (cropped) when displayed or printed. This boundary determines the visible page content. The default value is the page media box.|
|`Size`|Property of type `Size` representing the page size. Its value is determined by the width and height of the `MediaBox` in points. It defines the physical dimensions of the page in PDF units where 1 point = 1/72 inch. For example, a page size of `Size(612, 792)` corresponds to 8.5 x 11 inches (standard US Letter size).|
|`Rotation`|Property of type [Rotation](https://docs.telerik.com/devtools/document-processing/api/Telerik.Windows.Documents.Fixed.Model.Data.Rotation.html) representing the page rotation.|
|`Actions`|Gets the page [actions]({%slug radpdfprocessing-model-action-collections%}#pageactioncollection) collection.|

`RadFixedPage` exposes the following methods:

|Method Name|Description|
|----|----|
|`Clone`|Deep clone this page, including all content elements, annotations, and associated form fields. The cloned page has no parent document. Add it to a `RadFixedDocument.Pages` collection to use it.|

`RadFixedPage` is typically used when:

* Creating a PDF document (and its pages) from scratch programmatically. A complete example is available in the [PdfProcessing Basic Usage demo](https://demos.telerik.com/document-processing/pdfprocessing).
* Loading page content from existing PDF documents. You cannot deserialize a `RadFixedPage` directly from a byte array (memory stream) because pages are part of the document structure. The [PdfFormatProvider]({%slug radpdfprocessing-formats-and-conversion-pdf-pdfformatprovider%}) handles the parsing and conversion from raw PDF bytes to the structured `RadFixedDocument` object. Once imported, you can manipulate individual pages as needed.
* Generating structured, fixed-layout documents with precise control over layout and formatting. [FixedContentEditor]({%slug radpdfprocessing-editing-fixedcontenteditor%}) and [RadFixedDocumentEditor]({%slug radpdfprocessing-editing-radfixeddocumenteditor%}) allow you to create a `RadFixedDocument` either by managing the position or in a flow-like manner and insert all desired elements one after another.

#### **Example 1: Create RadFixedPage and Add It to a Document**

<snippet id='add-radfixedpage'/>

## Operating with RadFixedPage

You can execute several operations directly over a `RadFixedPage` instance.

### Add Content

`RadFixedPage` is designed to hold any content element in the document model. There are several ways to achieve that.

**Example 2** shows how to add a previously created content element to a `RadFixedPage`.

#### **Example 2: Add Content Element to RadFixedPage**

<snippet id='add-link-annotation-in-radfixedpage'/>

You can also use the `Add[Element]()` methods of the `RadFixedPage` `Content` property. The respective methods—`AddPath()`, `AddTextFragment()`, `AddImage()`—create the element, add it to the page, and return it for your convenience.

### Add Annotation

You can add different annotations to a `RadFixedPage` with the `Annotations` collection.

**Example 3** shows how to add a previously created annotation to a `RadFixedPage`.

#### **Example 3: Add Annotation to RadFixedPage**

<snippet id='add-annotation-to-radfixedpage'/>

The other possible approach is to use the `AddLink()` method of the `Annotations` property. The method creates the link, adds it to the page, and returns it. More information on the topic is available in the [Annotation]({%slug radpdfprocessing-model-annotations-links%}) article.

### Modifying Properties

The `RadFixedPage` API provides you with the ability to modify its properties.

**Example 4** shows how to change the `Rotation` and `Size` properties of a `RadFixedPage`.

#### **Example 4: Change Properties of a RadFixedPage**

<snippet id='modify-radfixedpage-properties'/>

>note A complete SDK example on how to generate a document is available in the [GenerateDocument sample](https://github.com/telerik/document-processing-sdk/tree/master/PdfProcessing/GenerateDocument).

## See Also

* [Model]({%slug radpdfprocessing-model-general-information%})
* [RadFixedDocument]({%slug radpdfprocessing-model-radfixeddocument%})
* [Annotations]({%slug radpdfprocessing-model-annotations-overview%})
