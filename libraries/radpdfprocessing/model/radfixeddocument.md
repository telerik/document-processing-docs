---
title: RadFixedDocument
page_title: RadFixedDocument
slug: radpdfprocessing-model-radfixeddocument
tags: radfixeddocument, pdf, merge, create, document, page
published: True
position: 1
---

# RadFixedDocument

__RadFixedDocument__ hosts fixed document content and is the root element in the document elements tree. It holds a collection of [RadFixedPage]({%slug radpdfprocessing-model-radfixedpage%})  elements. 

This article will get you familiar with the basics of __RadFixedDocument__. It contains the following sections:
      
* [What Is RadFixedDocument](#what-is-radfixeddocument)

* [Operating with RadFixedDocument](#operating-with-radfixeddocument)

* [Document Information](#document-information)

## What Is RadFixedDocument

__RadFixedDocument__ is the root that contains all other elements in the __RadPdfProcessing__ model. It exposes the following properties:

|Property Name|Description|
|----|----|
|__Pages__|The pages collection that contains all __RadFixedPages__ in the document.|
|__Annotations__|A read-only collection that contains all [Annotations]({%slug radpdfprocessing-model-annotations-overview%}) in the document.|
|__Destinations__|A collection that contains all [Destinations]({%slug radpdfprocessing-model-annotations-links%}#destination) in the document.|
|__DocumentInfo__|Contains additional meta information about the document like author, title, etc.|
|**Actions**|Gets the document [actions]({%slug radpdfprocessing-model-action-collections%}#documentactioncollection) collection. (introduced in Q4 2024)| 
|**HasLayers**|Gets whether the document has layers. (introduced in Q4 2024)|

>note A complete SDK example how to generate a document is available [here](https://github.com/telerik/document-processing-sdk/tree/master/PdfProcessing/GenerateDocument).
            
__Example 1__ shows how you can create a new __RadFixedDocument__ instance.
        
<a name="example1"><a/>

#### __[C#] Example 1: Create RadFixedDocument__

{{region cs-radpdfprocessing-model-radfixeddocument_0}}
	RadFixedDocument document = new RadFixedDocument();
{{endregion}}

## Operating with RadFixedDocument

There are different actions, which you can execute with the help of __RadFixedDocument__. For example, you can add a __RadFixedPage__ to an existing document.
        
__Example 2__ adds a page to the document created in [__Example 1__](#example1).
        
#### __[C#] Example 2: Add page to RadFixedDocument__

{{region cs-radpdfprocessing-model-radfixeddocument_1}}
	RadFixedPage page = document.Pages.AddPage();
{{endregion}}


Alternatively, you can create new __RadFixedPage__ and add it to the __Pages__ collection of a document.
        
__Example 3__ creates a page and adds it to the document created in [__Example 1__](#example1).
        

#### __[C#] Example 3: Create and add a page to RadFixedDocument__

{{region cs-radpdfprocessing-model-radfixeddocument_2}}
	RadFixedPage page = new RadFixedPage();
	document.Pages.Add(page);
{{endregion}}

**Example 4** shows you how you could obtain a copy of a RadFixedDocument.

#### __[C#] Example 4: Clone a document__

{{region cs-radpdfprocessing-model-radfixeddocument_5}}
	RadFixedDocument clonedDocument = document.Clone();
{{endregion}}


You can merge PDF documents out-of-the-box with the Merge() method of __RadFixedDocument__. This method clones the source document and appends it to the current instance of __RadFixedDocument__.

#### __[C#] Example 5: Merge documents__

{{region cs-radpdfprocessing-model-radfixeddocument_4}}
	document.Merge(source);
{{endregion}}

The code from __Example 5__ merges the document created in [__Example 1__](#example1) with another __RadFixedDocument__.

## Document Information

__RadFixedDocument__ exposes a __DocumentInfo__ property of type __RadFixedDocumentInfo__, intended to hold additional information about the document. The __RadFixedDocumentInfo__ class allows to set the following properties:

* __Author__: The author of the document.
* __Title__: The title of the document.
* __Description__: Text that describes the content of the document.

#### __[C#] Example 6: Set DocumentInfo__

{{region cs-radpdfprocessing-model-radfixeddocument_3}}
	document.DocumentInfo.Author = "Jane Doe";
	document.DocumentInfo.Title = "RadFixedDocument";
	document.DocumentInfo.Description = "This document is intended to explain the RadFixedDocument class from the RadPdfProcessing library";
{{endregion}}

>Currently the DocumentInfo property is for export purposes only and meta information about documents is stripped when importing.

## See Also

* [RadFixedDocument API Reference](https://docs.telerik.com/devtools/document-processing/api/Telerik.Windows.Documents.Fixed.Model.RadFixedDocument.html)
* [Model]({%slug radpdfprocessing-model-general-information%})
* [RadFixedPage]({%slug radpdfprocessing-model-radfixedpage%})
* [Annotations]({%slug radpdfprocessing-model-annotations-overview%})
* [Export to PDF]({%slug radpdfprocessing-formats-and-conversion-pdf-pdfformatprovider%})
* [Export to Image]({%slug radpdfprocessing-formats-and-conversion-image-using-skiaimageformatprovider%})