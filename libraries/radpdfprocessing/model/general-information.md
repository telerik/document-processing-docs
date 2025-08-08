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

## Document Elements

[RadFixedDocument]({%slug radpdfprocessing-model-radfixeddocument%}) is the root element of all document elements. All document elements inherit from the __FixedDocumentElementBase__ abstract class. The diagram below describes the hierarchy in __RadPdfProcessing__:

* **FixedDocumentElementBase**
  * [RadFixedDocument]({%slug radpdfprocessing-model-radfixeddocument%})
  * [RadFixedPage]({%slug radpdfprocessing-model-radfixedpage%}): IContentRootElement
  * [Annotation]({%slug radpdfprocessing-model-annotations-overview%})
    * ContentAnnotationBase
      * [Widget]({%slug radpdfprocessing-model-annotations-widgets%})
        * [PushButtonWidget]({%slug radpdfprocessing-model-annotations-widgets%}#pushbuttonwidget-class)
        * [SignatureWidget]({%slug radpdfprocessing-model-annotations-widgets%}#signaturewidget-class)
        * [TwoStatesButtonWidget]({%slug radpdfprocessing-model-annotations-widgets%}#twostatesbuttonwidget-class)
          * [RadioButtonWidget]({%slug radpdfprocessing-model-annotations-widgets%}#radiobuttonwidget-class)
        * VariableContentWidget

      * ContentAnnotation
        * [MarkupAnnotation]({%slug radpdfprocessing-model-annotations-overview%})
          * [LineAnnotation]({%slug radpdfprocessing-model-annotations-line%})
          * [StampAnnotation]({%slug radpdfprocessing-model-annotations-stamp%})
          * [TextAnnotation]({%slug radpdfprocessing-model-annotations-text%})
          * [TextMarkupAnnotation]({%slug radpdfprocessing-model-annotations-text-markup%})

  * Destination
    * BoundingRectangleFit
    * BoundingRectangleHorizontalFit
    * BoundingRectangleVerticalFit
    * Location
    * PageFit
    * PageHorizontalFit
    * PageVerticalFit
    * RectangleFit
  * ContentElementBase
    * Clipping
    * PositionContentElement
      * [Form]({%slug radpdfprocessing-model-form%})
      * [Image]({%slug radpdfprocessing-model-image%})
      * [Path]({%slug radpdfprocessing-model-path%})
      * [TextFragment]({%slug radpdfprocessing-model-textfragment%})

<!-- ![Rad Pdf Processing Model 01](images/RadPdfProcessing_Model_01.png) -->

## Composition of Document Elements

__RadFixedDocument__ represents a tree of [RadFixedPage]({%slug radpdfprocessing-model-radfixedpage%}) where the fixed content is hosted. The diagram below describes the composition of the fixed content. The document elements are denoted in black and collections - in orange.

 * RadFixedDocument
   * [Pages]({%slug radpdfprocessing-model-radfixedpage%}) 
     * [Annotations]({%slug radpdfprocessing-model-annotations-overview%})
     * [Actions]({%slug radpdfprocessing-model-action-collections%}#pageactioncollection) (PageActionCollection)
   * [NamedDestinations]({%slug radpdfprocessing-model-named-destinations%})
   * [EmbeddedFiles]({%slug radpdfprocessing-embedded-file-streams-overview%})
   * [AcroForm]({%slug radpdfprocessing-model-interactive-forms-acroform%})
      * [FormFields]({%slug radpdfprocessing-model-interactive-forms-form-fields %})
   * [Bookmarks]({%slug radpdfprocessing-features-bookmarks%})
   * [Actions]({%slug radpdfprocessing-model-actions%}) (DocumentActionCollection)

<!-- ![Rad Pdf Processing Model 02](images/RadPdfProcessing_Model_02.png) -->

## Creating or Editing document content 

The RadPdfProcessing library provides API for editing existing or crating brand new documents. This is achieve via the following editors: 
* [RadFixedDocumentEditor]({%slug radpdfprocessing-editing-radfixeddocumenteditor%}): This editor is suitable for creating new documents or adding content to existing documents. It allows you to add elements in a flow-like manner without explicitly setting positions and sizes. The RadFixedDocumentEditor takes care to arrange the document elements automatically and separates the content on different pages when needed.


* [FixedContentEditor]({%slug radpdfprocessing-editing-fixedcontenteditor%}): This editor provides you with the great flexibility of the PDF format. It is suitable for adding content to existing pages. With it, you must specify the exact position of each new element and manually separate the content on different pages when needed.

## See Also

 * [RadFixedDocument]({%slug radpdfprocessing-model-radfixeddocument%})
 * [RadFixedPage]({%slug radpdfprocessing-model-radfixedpage%})
