---
title: RadFixedDocument
description: RadFixedDocument is the main document unit of the PdfProcessing library offered by Telerik Document Processing libraries.
page_title: RadFixedDocument
slug: radpdfprocessing-model-radfixeddocument
tags: radfixeddocument, pdf, document, radpdfprocessing, pages, merge, create, root
published: True
position: 1
---

# RadFixedDocument

`RadFixedDocument` is a core class in the Telerik Document Processing libraries, specifically within the PdfProcessing model.

* [What Is RadFixedDocument](#what-is-radfixeddocument)
* [Operating with RadFixedDocument](#operating-with-radfixeddocument)
* [Document Information](#document-information)

## What Is RadFixedDocument

`RadFixedDocument` is the main document unit of the PdfProcessing model. It represents the root element of a fixed-layout PDF document and serves as the container for all other document elements. `RadFixedDocument` holds a collection of [RadFixedPage]({%slug radpdfprocessing-model-radfixedpage%}) elements. It exposes the following public API:

|Property Name|Description|
|----|----|
|`Pages`|The pages collection that contains all `RadFixedPage` instances in the document.|
|`Annotations`|A read-only collection that contains all [Annotations]({%slug radpdfprocessing-model-annotations-overview%}) in the document.|
|`Destinations`|A collection that contains all [Destinations]({%slug radpdfprocessing-model-annotations-links%}#destination) in the document.|
|`DocumentInfo`|Contains additional meta information about the document such as author and title.|
|`Actions`|Gets the document [actions]({%slug radpdfprocessing-model-action-collections%}#documentactioncollection) collection. (*Introduced in Q4 2024*)|
|`NamedDestinations`|Gets the collection of named destinations that provide bookmark-like navigation points within the document.|
|`EmbeddedFiles`|Gets the collection of files embedded within this document as attachments.|
|`AcroForm`|Gets the interactive form (AcroForm) that manages form field elements within the document.|
|`Bookmarks`|Gets the hierarchical collection of bookmarks (outline items) that provide structured navigation through the document.|
|`PageMode`|Gets or sets the page display mode that determines how the document appears when first opened in a PDF viewer.|
|`HasLayers`|Gets whether the document has layers. (*Introduced in Q4 2024*)|
|`Language`|Gets or sets the language of the document. (*Introduced in Q3 2025*)|
|`StructureTree`|Gets or sets the structure tree of the document. (*Introduced in Q3 2025*)|
|`AutoTag`|Gets a value indicating whether the document is set to automatically tag elements. If `true`, the document automatically tags elements with structure tags when they are added. (*Introduced in Q3 2025*)|
|`ViewerPreferences`|Gets the viewer preferences controlling the way the document is presented on the screen or in print. If no such dictionary is specified, viewing and printing applications behave in accordance with their own current user preference settings. (*Introduced in Q3 2025*)|
|`Portfolio`|Gets the PDF Portfolio/Collection settings for enhanced presentation of embedded files. Set `IsEnabled` to `true` to enable portfolio mode. (*Introduced in Q1 2026*)|

|Method|Description|
|----|----|
|`Merge`|Merge pages, form fields, destinations, actions, scripts, files, and bookmarks from the specified source document.|
|`Clone`|Deep clone the document (pages, form fields, annotations, destinations, files, scripts, and bookmarks) into a new instance.|
|`Clone(int startPageIndex, int pageCount)`|Creates a new `RadFixedDocument` containing deep copies of the pages in the specified range. Form fields with widgets on included pages, named destinations pointing to included pages, embedded files, JavaScript actions, and bookmarks are also cloned into the new document.|
|`ToSimpleTextDocument`|Converts the current document to a plain text document.|

|Event|Description|
|----|----|
|`MergedFieldNameResolving`|Occurs when trying to resolve conflicts between the field names while merging `RadFixedDocument` instances.|
|`MergedEmbeddedFileNameResolving`|Occurs when trying to resolve conflicts between the embedded file names while merging `RadFixedDocument` instances.|
|`MergedJavaScriptNameResolving`|Occurs when trying to resolve conflicts between the JavaScript names while merging `RadFixedDocument` instances.|


`RadFixedDocument` is typically used when:

* Creating a PDF document from scratch programmatically. A complete example is available in the [PdfProcessing Basic Usage demo](https://demos.telerik.com/document-processing/pdfprocessing).
* Extracting or manipulating content from existing PDF documents. First import any existing PDF documents with the help of the [PdfFormatProvider]({%slug radpdfprocessing-formats-and-conversion-pdf-pdfformatprovider%}).
* Generating structured, fixed-layout documents with precise control over layout and formatting. [FixedContentEditor]({%slug radpdfprocessing-editing-fixedcontenteditor%}) and [RadFixedDocumentEditor]({%slug radpdfprocessing-editing-radfixeddocumenteditor%}) allow you to create a `RadFixedDocument` either by managing the position or in a flow-like manner and insert all desired elements one after another.

>note A complete SDK example on how to generate a document is available in the [GenerateDocument sample](https://github.com/telerik/document-processing-sdk/tree/master/PdfProcessing/GenerateDocument).

**Example 1** shows how to create a new `RadFixedDocument` instance.

<a name="example1"><a/>

#### **Example 1: Create RadFixedDocument**

<snippet id='libraries-pdf-model-radfixeddocument-create-fixed-document'/>

## Operating with RadFixedDocument

You can execute different actions with the help of `RadFixedDocument`. For example, you can add a `RadFixedPage` to an existing document.

**Example 2** adds a page to the document created in [**Example 1**](#example1).

#### **Example 2: Add Page to RadFixedDocument**

<snippet id='libraries-pdf-model-radfixeddocument-create-fixed-page'/>


Alternatively, you can create a new `RadFixedPage` and add it to the `Pages` collection of a document.

**Example 3** creates a page and adds it to the document created in [**Example 1**](#example1).

#### **Example 3: Create and Add a Page to RadFixedDocument**

<snippet id='libraries-pdf-model-radfixeddocument-add-fixed-page'/>

**Example 4** shows how to obtain a copy of a `RadFixedDocument`.

#### **Example 4: Clone a Document**

<snippet id='libraries-pdf-model-radfixeddocument-clone-document'/>


You can merge PDF documents with the `Merge()` method of `RadFixedDocument`. This method clones the source document and appends it to the current instance of `RadFixedDocument`.

#### **Example 5: Merge Documents**

<snippet id='libraries-pdf-model-radfixeddocument-merge-fixed-documents'/>

The code from **Example 5** merges the document created in [**Example 1**](#example1) with another `RadFixedDocument`.

## Document Information

`RadFixedDocument` exposes a `DocumentInfo` property of type [RadFixedDocumentInfo]({%slug radpdfprocessing-model-radfixeddocumentinfo%}), intended to hold additional information about the document.

## See Also

* [RadFixedDocument API Reference](https://docs.telerik.com/devtools/document-processing/api/Telerik.Windows.Documents.Fixed.Model.RadFixedDocument.html)
* [Model]({%slug radpdfprocessing-model-general-information%})
* [RadFixedPage]({%slug radpdfprocessing-model-radfixedpage%})
* [Annotations]({%slug radpdfprocessing-model-annotations-overview%})
* [Export to PDF]({%slug radpdfprocessing-formats-and-conversion-pdf-pdfformatprovider%})
* [Export to Image]({%slug radpdfprocessing-formats-and-conversion-image-using-skiaimageformatprovider%})
* [Merge PDF Documents]({%slug merge-pdf-documents%})
* [PDF Portfolio]({%slug radpdfprocessing-pdf-portfolio-overview%})
* [Accessibility Support]({%slug create-accessible-pdf-documents%})