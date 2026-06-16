---
title: RadFixedDocumentInfo
description: Learn how to use the RadFixedDocumentInfo class to set document metadata such as author, title, and keywords in RadPdfProcessing.
page_title: RadFixedDocumentInfo
slug: radpdfprocessing-model-radfixeddocumentinfo
tags: fixed, document, info, pdf, metadata, radpdfprocessing, author, title, creator, producer
published: True
position: 1
---

# RadFixedDocumentInfo

The `RadFixedDocumentInfo` class holds additional metadata about a PDF document. You can access it through the `DocumentInfo` property of [RadFixedDocument]({%slug radpdfprocessing-model-radfixeddocument%}).

The following table lists the available properties:

|Property|Description|
|----|----|
|**Author**|The author of the document.|
|**Title**|The title of the document.|
|**Description**|Text that describes the content of the document.|
|**Keywords**|Gets or sets the keywords associated with the document. (*Introduced in Q3 2025*)|
|**Creator**|Gets or sets the name of the creator of the document. If the document was converted to PDF from another format, this is the name of the application that created the original document. (*Introduced in Q3 2025*)|
|**Producer**|Gets or sets the name of the producer associated with the item. If the document was converted to PDF from another format, this is the name of the application that converted it to PDF. (*Introduced in Q3 2025*)|
|**CreationDate**|Gets the date and time when the entity was created. (*Introduced in Q3 2025*)|
|**ModificationDate**|Gets the date and time when the object was last modified. (*Introduced in Q3 2025*)|

<snippet id='libraries-pdf-model-radfixeddocumentinfo'/>

>caution If the document information is stored in the **XMP metadata** of a PDF document, the `DocumentInfo` property values are lost when importing.

## See Also

* [RadFixedDocument]({%slug radpdfprocessing-model-radfixeddocument%})
* [Model]({%slug radpdfprocessing-model-general-information%})