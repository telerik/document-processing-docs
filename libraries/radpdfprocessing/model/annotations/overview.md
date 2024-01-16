---
title: Annotations Overview
page_title: Annotations Overview
slug: radpdfprocessing-model-annotations-overview
tags: annotations,overview,pdfprocessing
published: True
position: 0
---

# Annotations Overview

The abstract __Annotation__ element associates an object with a location on a [RadFixedPage]({%slug radpdfprocessing-model-radfixedpage%}). Annotation exposes the following properties:
      
* __Rect__: The rectangle, which defines the location of the annotation on the page.
          
* __Type__: Property of type [AnnotationType](https://docs.telerik.com/devtools/document-processing/api/Telerik.Windows.Documents.Fixed.Model.Annotations.AnnotationType.html), which determines the type of the annotation. The only supported types are [Link]({%radpdfprocessing-model-annotations-links%}) and [Widget]({%radpdfprocessing-model-annotations-widgets%}).
          
* **Border**: Represents the annotation borders. This property is of type [AnnotationBorder](https://docs.telerik.com/devtools/document-processing/api/Telerik.Windows.Documents.Fixed.Model.Annotations.AnnotationBorder.html).

* **IsPrintable**: A boolean value that indicates whether the annotation instance should be visualized when printing the document. When set to *false*, the annotation won't appear when the document is printed. 

## See Also

 * [RadFixedPage]({%slug radpdfprocessing-model-radfixedpage%})
 * [AnnotationType API Reference](https://docs.telerik.com/devtools/document-processing/api/Telerik.Windows.Documents.Fixed.Model.Annotations.AnnotationType.html)
 * [Link API Reference](https://docs.telerik.com/devtools/document-processing/api/Telerik.Windows.Documents.Fixed.Model.Annotations.Link.html)
