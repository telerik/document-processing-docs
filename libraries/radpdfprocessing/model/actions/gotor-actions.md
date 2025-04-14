---
title: GoToR Actions   
description: RadPdfProcessing provides support for GoToR actions.
page_title: GoToR Actions    
slug: radpdfprocessing-model-actions-gotor
tags: gotor, go to r, action, pdf, processing
published: True
position: 4
---

# GoToR Actions  

As of **Q2 2025** RadPdfProcessing provides support for **GoToR actions**. A remote go-to action is similar to an ordinary go-to action but jumps to a destination in another PDF file instead of the current file. The **GoToRAction** class offers the following public properties: 

|Property|Description|
|----|----|
|**File**| Gets or sets the remote File for the action.|
|**OpenInNewWindow**|Gets or sets a value indicating whether to open the destination document in a new window. True if the document should be open in a new window, otherwise false.|
|**Destination**|Gets or sets the named destination for the action.|

>caution Currently, RadPdfProcessing provides support **only** for preserving the GoToR actions during import/export operations.

>note Remote go-to actions cannot be used with embedded files.

### Adding a GoToR Action to a Document

The following example shows how to create a PDF document and add a **GoToRAction** to a [Link annotation]({%slug radpdfprocessing-model-annotations-links%}) that opens another PDF document in a new window:
 
 <snippet id='libraries-pdf-model-actions-gotor'/>

 >note Navigating to a specific destination is not supported with the current implementation.

## See Also

* [Links]({%slug radpdfprocessing-model-annotations-links%}) 
* [Actions]({%slug radpdfprocessing-model-actions%}) 
* [Annotations]({%slug radpdfprocessing-model-annotations-overview%})
* [LaunchAction]({%slug radpdfprocessing-model-actions-launch%})
