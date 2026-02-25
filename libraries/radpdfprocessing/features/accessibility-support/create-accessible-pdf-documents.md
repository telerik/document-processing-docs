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

|Minimum Version|Q3 2025|
|----|----|
|Related Feature:|[Accessibility Support]({%slug pdfprocessing-feature-accessibility-support%})|

This article aims to demonstrate how to generate an accessible PDF document using Telerik Document Processing. 

To take advantage of the accessibility feature, the document must be **PDF/A-1a**, **PDF/A-2a**, **PDF/A-3a**, or **PDF/UA-1** compliant. To achieve this, the [PdfComplianceLevel]({%slug radpdfprocessing-concepts-comply-with-pdfa-standard%}#accessibility-compliance) and [TaggingStrategy]({%slug radpdfprocessing-model-tagged-pdf%}) properties of the PdfFormatProvider's **PdfExportSettings** must be set accordingly.

RadFixedDocument offers a constructor allowing to specify the **AutoTag** property value which is *false* by default. This gives the developer the opportunity to choose whether to build the [StructureTree]({%slug radpdfprocessing-model-structure-tree%}) from scratch or leave the library auto-tag the elements.

>note Please refer to the [PdfProcessing Accessibility Demo](https://demos.telerik.com/document-processing/pdfprocessing/accessibility) which demonstrates how to create accessible PDF documents programmatically, ensuring compliance with standards such as PDF/UA by supporting features like tagged content, document structure, and metadata. Downloaded documents will adhere to the selected compliance level.

>important In **.NET Standard/.NET (Target OS: None)** environments, fonts beyond the [14 standard ones]({%slug radpdfprocessing-concepts-fonts%}#standard-fonts) require a [FontsProvider implementation]({%slug pdfprocessing-implement-fontsprovider%}) to be resolved correctly.

##  Creating Accessible PDF Documents and Building the StructureTree

When exporting the document, specify the [TaggingStrategy]({%slug radpdfprocessing-model-tagged-pdf%}#tagging-strategy) so the document should not be tagged automatically and use the existing StructureTree:

<snippet id='libraries-pdf-features-accessible-pdf'/>

<table style="width:100%;">
<th width=45%>PDF Accessibility Checker tool</th><th>Logical Structure</th>
<tr>
    <td rowspan="2"><img src="images/accessible-pdf-validity.png" alt="Validate with PDF Accessibility Checker"/></td>
    <td><img src="images/accessible-pdf-logical-structure.png" alt="Logical Structure of PDF"/></td>
</tr>
<tr><td><img src="images/accessible-pdf-logical-structure-properties.png" alt="Properties"/></td></tr>
</table>

## Creating Accessible PDF Documents with Auto-Tagging

This example shows how to add content to a PDF document and leave the PdfProcessing's engine build the [StructureTree]({%slug radpdfprocessing-model-structure-tree%}) automatically:

<snippet id='libraries-pdf-features-accessible-pdf-with-auto-tagging'/>

## See Also

* [RadPdfProcessing]({%slug radpdfprocessing-overview%})
* [Tagged PDF]({%slug radpdfprocessing-model-tagged-pdf%})
* [Marked Content]({%slug radpdfprocessing-model-marked-content%})
* [StructureTree]({%slug radpdfprocessing-model-structure-tree%})
* [Export Settings]({%slug radpdfprocessing-formats-and-conversion-pdf-settings%}#export-settings)
* [PdfProcessing Accessibility Demo](https://demos.telerik.com/document-processing/pdfprocessing/accessibility)
