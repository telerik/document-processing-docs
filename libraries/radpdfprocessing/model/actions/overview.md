---
title: Actions Overview
page_title: Actions Overview
description: Learn what Action types are supported in the PdfProcessing library offered by the Telerik Document Processing. 
slug: radpdfprocessing-model-actions
tags: actions, pdf, radpdfprocessing, overview, model, types, javascript, navigation
published: True
position: 0
---

# Actions Overview

The abstract `Action` class defines a behavior for an [annotation]({%slug radpdfprocessing-model-annotations-overview%}). The following classes inherit from `Action`:

|Action Type|Description|
|----|----|
|[GoToAction]({%slug radpdfprocessing-model-annotations-links%})|Associates the action with a `Destination`. The `GoToAction` class exposes the following properties: <br>`Destination`: The associated destination. <br> `NamedDestination`: The associated named destination.|
|[UriAction]({%slug radpdfprocessing-model-annotations-links%})|Associates the action with a URI. The `UriAction` class exposes the following properties: <br> `Uri`: The associated URI. <br>`IncludeMouseCoordinates`: Specifies whether to include the mouse coordinates as query parameters in the URI.|
|[JavaScriptAction]({%slug radpdfprocessing-model-javascript-actions%})|Represents a JavaScript action that exposes the following property: <br> `Script`: Gets or sets the script.|
|[NamedAction]({%slug radpdfprocessing-model-actions-named-actions%})|Represents a named action that exposes the following property: <br>`NamedActionType`: The type of the action representing the menu item to execute.|
|[ResetFormAction]({%slug radpdfprocessing-model-interactive-forms-resetting-form-fields%})|Represents an action that resets the specified [form fields]({%slug radpdfprocessing-model-interactive-forms-form-fields%}) in a document.|
|[LaunchAction]({%slug radpdfprocessing-model-actions-launch%})|Represents an action that launches an application, usually to open a file.|
|[GoToRAction]({%slug radpdfprocessing-model-actions-gotor%})|("Go-to remote") Goes to a destination in another document.|

## See Also

* [Link]({%slug radpdfprocessing-model-annotations-links%})
* [JavaScript Actions]({%slug radpdfprocessing-model-javascript-actions%})
* [Named Actions]({%slug radpdfprocessing-model-actions-named-actions%})
* [Creating TableCells with GoToAction and UriAction]({%slug kb-create-table-cells%})
* [Resetting Form Fields]({%slug radpdfprocessing-model-interactive-forms-resetting-form-fields%})