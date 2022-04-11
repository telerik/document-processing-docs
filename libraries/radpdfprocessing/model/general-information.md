---
title: General Information
page_title: General Information
slug: radpdfprocessing-model-general-information
tags: model
published: True
position: 0
---

# General Information

This article explains the structure of __RadPdfProcessing__'s document model and how you can add content to it.

## DocumentElements

[RadFixedDocument]({%slug radpdfprocessing-model-radfixeddocument%}) is the root element of all document elements. All document elements inherit from the __FixedDocumentElementBase__ abstract class. The diagram below describes the hierarchy in __RadPdfProcessing__.
        ![Rad Pdf Processing Model 01](images/RadPdfProcessing_Model_01.png)

## Composition of Document Elements

__RadFixedDocument__ represents a tree of [RadFixedPage]({%slug radpdfprocessing-model-radfixedpage%}) where the fixed content is hosted. The diagram below describes the composition of the fixed content. The document elements are denoted in black and collections - in orange.
        ![Rad Pdf Processing Model 02](images/RadPdfProcessing_Model_02.png)

## Creating or Editing document content 

The RadPdfProcessing library provides API for editing existing or crating brand new documents. This is achieve via the following editors: 
* [RadFixedDocumentEditor]({%slug radpdfprocessing-editing-radfixeddocumenteditor%}): This editor is suitable for creating new documents or adding entire pages to an existing documents. It allows you to add element in a flow like manner without setting explicit positions. 

* [FixedContentEditor]({%slug radpdfprocessing-editing-fixedcontenteditor%}): This editor is suitable for adding content to existing pages. With it you must specify the exact position of each new element. 

## See Also

 * [RadFixedDocument]({%slug radpdfprocessing-model-radfixeddocument%})
 * [RadFixedPage]({%slug radpdfprocessing-model-radfixedpage%})
