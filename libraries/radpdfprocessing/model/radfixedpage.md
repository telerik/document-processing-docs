---
title: RadFixedPage
description: Learn how RadFixedPage represents a PDF page in RadPdfProcessing and how to create pages, add content and annotations, and change page settings.
page_title: RadFixedPage in RadPdfProcessing
slug: radpdfprocessing-model-radfixedpage
tags: radfixedpage, pdf, page, radpdfprocessing, size, rotation, content, layout
published: True
position: 2
---

# RadFixedPage

`RadFixedPage` represents a single page in a [RadFixedDocument]({%slug radpdfprocessing-model-radfixeddocument%}). It is the root container for the fixed content, annotations, page settings, and page-level actions that make up one PDF page.

Use this article to understand what `RadFixedPage` controls, when to work with it directly, and how to create pages, add content, add annotations, and change page properties.

## What Is RadFixedPage

Every PDF document in the RadPdfProcessing model starts with a [RadFixedDocument]({%slug radpdfprocessing-model-radfixeddocument%}). That document contains one or more `RadFixedPage` instances, and each page hosts the visible content and interactive elements for a single page in the final PDF.

`RadFixedPage` implements `IContentRootElement`, which makes it the content root for all fixed content elements placed on the page. For a broader view of how pages fit into the document model, see the [RadPdfProcessing model overview]({%slug radpdfprocessing-model-general-information%}).

## When to Use RadFixedPage

Work with `RadFixedPage` directly when you need to:

* Create a PDF page from scratch and add it to a document.
* Access or change the content of a page after you import a document.
* Add page-level [annotations]({%slug radpdfprocessing-model-annotations-overview%}) such as links.
* Control page geometry, including the media box, crop box, size, and rotation.
* Clone an existing page before reusing it in another document.

If you load an existing file, import the PDF through [PdfFormatProvider]({%slug radpdfprocessing-formats-and-conversion-pdf-pdfformatprovider%}) first. You cannot deserialize a `RadFixedPage` directly from raw PDF bytes because pages are part of the full `RadFixedDocument` structure.

## Key RadFixedPage Members

The following properties and methods define most page-level tasks:

| Member | Description |
|---|---|
| `Content` | Holds the collection of fixed content elements that belong to the page. |
| `Annotations` | Holds the collection of page [annotations]({%slug radpdfprocessing-model-annotations-overview%}). |
| `MediaBox` | Defines the physical page boundaries. Content outside this box is not part of the printable page area. |
| `CropBox` | Defines the visible or printable region of the page. By default, it matches the `MediaBox`. |
| `Size` | Gets the page size in points, based on the `MediaBox` width and height. For example, `Size(612, 792)` corresponds to US Letter size, which is `8.5 x 11` inches. |
| `Rotation` | Gets or sets the page [rotation](https://docs.telerik.com/devtools/document-processing/api/Telerik.Windows.Documents.Fixed.Model.Data.Rotation.html). |
| `Actions` | Gets the page [actions]({%slug radpdfprocessing-model-action-collections%}#pageactioncollection) collection. |
| `Clone()` | Creates a deep copy of the page, including its content, annotations, and associated form fields. |

## Operating with RadFixedPage

There are several operations, which you can execute directly over a RadFixedPage instance.

### How to Create and Add a RadFixedPage

Create a `RadFixedPage` when you build a document programmatically and need to add a page to the `RadFixedDocument.Pages` collection.

The following example creates a new page and adds it to a document:

#### Example: Create RadFixedPage and add it to a document

<snippet id='add-radfixedpage'/>

### Add Content

Use the `Content` collection when you want to place fixed elements on a specific page. You can add existing content elements or create new ones through the collection helper methods.

The following example adds a previously created content element to a page:

#### Example: Add a content element to RadFixedPage

<snippet id='add-link-annotation-in-radfixedpage'/>

For simpler scenarios, use the `Add[Element]()` methods on the `Content` collection. Methods such as `AddPath()`, `AddTextFragment()`, and `AddImage()` create the element, add it to the page, and return it for further configuration.

When you need higher-level content creation APIs, use [FixedContentEditor]({%slug radpdfprocessing-editing-fixedcontenteditor%}) for positioned content or [RadFixedDocumentEditor]({%slug radpdfprocessing-editing-radfixeddocumenteditor%}) for a more flow-based editing model.

### Add Annotation

Use the `Annotations` collection when you need to attach interactive elements such as links to a page.

The following example adds a previously created annotation to a page:

#### Example: Add an annotation to RadFixedPage

<snippet id='add-annotation-to-radfixedpage'/>

You can also call `AddLink()` on the `Annotations` collection. That method creates the link annotation, adds it to the page, and returns it so you can configure it immediately. For more detail, see [link annotations in RadPdfProcessing]({%slug radpdfprocessing-model-annotations-links%}).

### Modifying Properties

Change page properties when you need to adjust layout, orientation, or the visible page area after the page is created.

The following example changes the `Rotation` and `Size` properties of a page:

#### Example: Change RadFixedPage properties

<snippet id='modify-radfixedpage-properties'/>

Changing `Size`, `MediaBox`, `CropBox`, or `Rotation` affects how PDF viewers display and print the page. Apply those settings before final export whenever possible so layout decisions remain predictable.

## How RadFixedPage Fits into Common Workflows

`RadFixedPage` is the page-level object you use regardless of whether you create a document from scratch or edit an imported file:

* In document generation workflows, create the page first, then populate it with content and annotations.
* In document editing workflows, import the file, get the target page from `RadFixedDocument.Pages`, and then modify its content or settings.
* In reuse scenarios, clone a page and add the cloned instance to another document.

>note A complete SDK example that generates a PDF document is available in the [Generate Document sample](https://github.com/telerik/document-processing-sdk/tree/master/PdfProcessing/GenerateDocument).

## See Also

* [RadPdfProcessing model overview]({%slug radpdfprocessing-model-general-information%})
* [RadFixedDocument]({%slug radpdfprocessing-model-radfixeddocument%})
* [Annotations overview]({%slug radpdfprocessing-model-annotations-overview%})
* [FixedContentEditor]({%slug radpdfprocessing-editing-fixedcontenteditor%})
* [RadFixedDocumentEditor]({%slug radpdfprocessing-editing-radfixeddocumenteditor%})
