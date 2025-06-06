---
title: Annotations Overview
page_title: Annotations Overview
description: Learn what annotation types are supported in the PdfProcessing library offered by the Telerik Document Processing. 
slug: radpdfprocessing-model-annotations-overview
tags: annotations,overview,pdfprocessing
published: True
position: 0
---

# Annotations Overview

An *annotation* associates an object such as a note, sound, or movie with a location on a page of a PDF document, or provides a way to interact with the user by
means of the mouse and keyboard. PDF includes a wide variety of standard [annotation types](https://docs.telerik.com/devtools/document-processing/api/Telerik.Windows.Documents.Fixed.Model.Annotations.AnnotationType.html). Many of the standard annotation types may be displayed in either the open or the closed state. When closed, they appear on the page in some distinctive form, such as an icon, a box, or a rubber stamp, depending on the specific annotation type. When the user activates the annotation by clicking it, it exhibits its associated object, such as by opening a pop-up window displaying a text note or by playing a sound or a movie. 

>note RadPdfProcessing provides an [Exception Handling]({%slug radpdfprocessing-handling-exceptions%}) mechanism which allows detecting cases with invalid or not supported annotations being imported in the document.

The abstract **Annotation** element associates an object with a location on a [RadFixedPage]({%slug radpdfprocessing-model-radfixedpage%}). Annotation exposes the following properties:
      
* **Rect**: The rectangle, which defines the location of the annotation on the page.
          
* **Type**: Property of type [AnnotationType](https://docs.telerik.com/devtools/document-processing/api/Telerik.Windows.Documents.Fixed.Model.Annotations.AnnotationType.html), which determines the type of the annotation. The supported types are listed in the following table:

|Annotation Type|Description|
|----|----|
|[Link]({%slug radpdfprocessing-model-annotations-links%})|A link annotation represents either a hypertext link to a destination elsewhere in the document or an action to be performed.|
|[Widget]({%slug radpdfprocessing-model-annotations-widgets%})|Interactive forms use widget annotations to represent the appearance of fields and to manage user interactions.|
|[Text]({%slug radpdfprocessing-model-annotations-text%})|A text annotation represents a *sticky note* attached to a point in the PDF document.|
|[Line]({%slug radpdfprocessing-model-annotations-line%})|Line annotations display a single straight line on the page.|
|[Stamp]({%slug radpdfprocessing-model-annotations-stamp%})|Stamp annotations display text or graphics intended to look as if they were stamped on the page with a rubber stamp.|
|[TextMarkup]({%slug radpdfprocessing-model-annotations-text-markup%})| Text markup annotations appear as **Highlights**, **Underlines**, **Strikeouts** or **Squiggly** underlines in the text of a document. When opened, they display a pop-up window containing the text of the associated note.|
|[Popup]({%slug radpdfprocessing-model-annotations-popup%})|A popup annotation is associated with another [markup annotation]({%slug radpdfprocessing-model-annotations-overview%}) and displays its content in a pop-up window for entry and editing. It typically appears as a pop-up note.|  
   
* **Border**: Represents the annotation borders. This property is of type [AnnotationBorder](https://docs.telerik.com/devtools/document-processing/api/Telerik.Windows.Documents.Fixed.Model.Annotations.AnnotationBorder.html).

* **IsPrintable**: A boolean value that indicates whether the annotation instance should be visualized when printing the document. When set to *false*, the annotation won't appear when the document is printed. 

## See Also

 * [RadFixedPage]({%slug radpdfprocessing-model-radfixedpage%})
 * [TextMarkup]({%slug radpdfprocessing-model-annotations-text-markup%})
 * [Text]({%slug radpdfprocessing-model-annotations-text%})
 * [Link]({%slug radpdfprocessing-model-annotations-links%})
 * [Handling Exceptions]({%slug radpdfprocessing-handling-exceptions%})
