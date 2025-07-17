---
title: RadFixedDocumentInfo
description: RadFixedDocument is the main document unit of the PdfProcessing library offered by Telerik Document Processing libraries.
page_title: RadFixedDocument
slug: radpdfprocessing-model-radfixeddocumentinfo
tags: radfixeddocument, pdf, merge, create, document, page, fixed, info, dictionary
published: True
position: 1
---

# RadFixedDocumentInfo

The **RadFixedDocumentInfo** class allows setting the following properties:

|Property|Description|
|----|----|
|**Author**|The author of the document|
|**Title**|The title of the document|
|**Description**|Text that describes the content of the document.|
|**Keywords**|Gets or sets the keywords associated with the document. (*Introduced in Q3 2025*)|
|**Creator**|Gets or sets the name of the creator of the document. If the document was converted to PDF from another format, the name of the application that created the original document from which it was converted. (*Introduced in Q3 2025*)|
|**Producer**|Gets or sets the name of the producer associated with the item. If the document was converted to PDF from another format, the name of the application that converted it to PDF. (*Introduced in Q3 2025*)|
|**CreationDate**|Gets the date and time when the entity was created. (*Introduced in Q3 2025*)|
|**ModificationDate**|Gets the date and time when the object was last modified. (*Introduced in Q3 2025*)|
 
<snippet id='libraries-pdf-model-radfixeddocumentinfo'/>

>caution If the document information is stored in the **XMP metadata** of a PDF document, the DocumentInfo property values will be lost when importing. 