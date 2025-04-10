---
title: Actions Overview
page_title: Actions Overview
description: Learn what Action types are supported in the PdfProcessing library offered by the Telerik Document Processing. 
slug: radpdfprocessing-model-actions
tags: action, overview, pdfprocessing
published: True
position: 0
---

# Actions Overview

The abstract **Action** class defines a behavior for an [annotation]({%slug radpdfprocessing-model-annotations-overview%}). Action is inherited from the following classes:        

|Action Type|Description|
|----|----|
|[GoToAction]({%slug radpdfprocessing-model-annotations-links%})|Associates the action with a __Destination__. The GoToAction class exposes the following properties: <br>__Destination__: The associated destination. <br> __NamedDestination__: The associated named destination.|
|[UriAction]({%slug radpdfprocessing-model-annotations-links%})|Associates the action with an Uri. The UriAction class exposes the following properties: <br> __Uri__: The associated Uri. <br>__IncludeMouseCoordinates__: Specifies whether to include the mouse coordinates as query parameters in the Uri. |
|[JavaScriptAction]({%slug radpdfprocessing-model-javascript-actions%})|Represents a JavaScript action which exposes the following property: <br> **Script**: Gets or sets the script.|
|[NamedAction]({%slug radpdfprocessing-model-actions-named-actions%})|Represents a named action which exposes the following property: <br>**NamedActionType**: The type of the action representing the menu item to be executed.|
|[ResetFormAction]({%slug radpdfprocessing-model-interactive-forms-resetting-form-fields%})|Represents an action that resets the specified [form fields]({%slug radpdfprocessing-model-interactive-forms-form-fields%}) in a document. |
|[LaunchAction]({%slug radpdfprocessing-model-actions-launch%})|Represents an action which launches an application, usually to open a file. |
 
## See Also

 * [Link]({%slug radpdfprocessing-model-annotations-links%})
 * [JavaScript action]({%slug radpdfprocessing-model-javascript-actions%}) 
 * [Named Actions]({%slug radpdfprocessing-model-actions-named-actions%}) 
 * [Creating TableCells with GoToAction and UriAction]({%slug kb-create-table-cells%})
 * [Resetting Form Fields]({%slug radpdfprocessing-model-interactive-forms-resetting-form-fields%})