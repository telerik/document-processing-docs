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


* **GoToAction**: Associates the action with a __Destination__. The GoToAction class exposes the following properties:

	* __Destination__: The associated destination.
	* __NamedDestination__: The associated named destination.
	                

* **UriAction**: Associates the action with an Uri. The UriAction class exposes the following properties:     

	* __Uri__: The associated Uri.    
	* __IncludeMouseCoordinates__: Specifies whether to include the mouse coordinates as query parameters in the Uri.

* **JavaScriptAction**: Represents a [JavaScript action]({%slug radpdfprocessing-model-javascript-actions%}) which exposes the following property:

	* **Script**: Gets or sets the script.

* **NamedAction**: Represents a [named action]({%slug radpdfprocessing-model-named-actions%}) which exposes the following property:

	* **NamedActionType**: The type of the action representing the menu item to be executed.
 
## See Also

 * [Link]({%slug radpdfprocessing-model-annotations-links%})
 * [JavaScript action]({%slug radpdfprocessing-model-javascript-actions%}) 
 * [Named Actions]({%slug radpdfprocessing-model-named-actions%}) 
