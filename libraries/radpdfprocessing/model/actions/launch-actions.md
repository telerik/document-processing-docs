---
title: Launch Actions   
description: Learn how to use Launch actions in RadPdfProcessing to open external applications or documents from a PDF file through link annotations.
page_title: Launch Actions    
slug: radpdfprocessing-model-actions-launch
tags: launchactions, pdf, actions, radpdfprocessing, model, execution, commands, launch
published: True
position: 3
---

# Launch Actions

|Minimum Version|Q2 2025|
|----|----|

RadPdfProcessing supports **Launch actions** that PDF viewer applications are expected to support. A launch action launches an application or opens or prints a document. The `LaunchAction` class offers the following public properties:

|Property|Description|
|----|----|
|`File`|Gets or sets the remote file for the action.|
|`OpenInNewWindow`|Gets or sets a value indicating whether to open the destination document in a new window. Set to `true` to open in a new window, or `false` otherwise.|

### Adding a Launch Action to a Document

The following example shows how to create a PDF document and add a `LaunchAction` to a [Link annotation]({%slug radpdfprocessing-model-annotations-links%}) that opens another PDF document in a new window:

<snippet id='libraries-pdf-model-actions-launch'/>

![Create LaunchAction result showing a link that opens an external PDF](images/pdf-processing-create-launch-action.png)

## See Also

* [Links]({%slug radpdfprocessing-model-annotations-links%})
* [Actions]({%slug radpdfprocessing-model-actions%})
* [Annotations]({%slug radpdfprocessing-model-annotations-overview%})
* [GoToRAction]({%slug radpdfprocessing-model-actions-gotor%})
