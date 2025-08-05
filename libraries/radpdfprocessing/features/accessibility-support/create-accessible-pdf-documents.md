---
title: Creating Accessible PDF Documents
description: Learn how to generate an accessible PDF document using Telerik Document Processing Libraries.
page_title: How to Create Accessible PDF Documents with RadPdfProcessing
slug: create-accessible-pdf-documents
tags: marked, content, tag, pdf, accessibility
published: True
position: 1
---

# Creating Accessible PDF Documents

|Version|**Q3 2025** (or newer)|
|----|----|

This article aims to demonstrate how to generate an accessible PDF document using Telerik Document Processing. 

To take advantage of the accessibility feature, the document must be **PDF/A-1a**, **PDF/A-2a**, **PDF/A-3a**, or **PDF/UA-1** compliant. To achieve this, the [PdfComplianceLevel]({%slug radpdfprocessing-concepts-comply-with-pdfa-standard%}#accessibility-compliance) and [TaggingStrategy]({%slug radpdfprocessing-model-tagged-pdf%}) properties of the PdfFormatProvider's **PdfExportSettings** must be set accordingly.

RadFixedDocument offers a constructor allowing to specify the **AutoTag** property value which is *false* by default. This gives the developer the opportunity to choose whether to build the [StructureTree]({%slug radpdfprocessing-model-structure-tree%}) from scratch or leave the library auto-tag the elements.

##  Creating Accessible PDF Documents and Building the StructureTree

When exporting the document, specify the [TaggingStrategy]({%slug radpdfprocessing-model-tagged-pdf%}#tagging-strategy) so the document should not be tagged automatically and use the existing StructureTree:

<snippet id='libraries-pdf-features-accessible-pdf'/>

|PDF Accessibility Checker tool|Logical Structure|Properties|
|----|----|----|
|![Validate with PDF Accessibility Checker](images/accessible-pdf-validity.png)|![Logical Structure of PDF](images/accessible-pdf-logical-structure.png)|  ![Validate with PDF Accessibility Checker](images/accessible-pdf-logical-structure-properties.png)|

## Creating Accessible PDF Documents with Auto-Tagging

This example shows how to add content to a PDF doocument and leave the PdfProcessing's engine build the [StructureTree]({%slug radpdfprocessing-model-structure-tree%}) automatically:

<snippet id='libraries-pdf-features-accessible-pdf-with-auto-tagging'/>

## See Also

* [RadPdfProcessing]({%slug radpdfprocessing-overview%})
* [Tagged PDF]({%slug radpdfprocessing-model-tagged-pdf%})
* [Marked Content]({%slug radpdfprocessing-model-marked-content%})
* [StructureTree]({%slug radpdfprocessing-model-structure-tree%})
* [Export Settings]({%slug radpdfprocessing-formats-and-conversion-pdf-settings%}#export-settings)
