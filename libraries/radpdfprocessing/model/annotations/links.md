---
title: Links
page_title: Links
description: Link annotations represent either a hypertext link to a destination elsewhere in the document or an action to be performed. 
slug: radpdfprocessing-model-annotations-links
tags: annotations,overview,pdfprocessing,link,links
published: True
position: 1
---

## Link

The __Link__ class inherits the abstract __Annotation__ class. Link annotations represent either a hypertext link to a destination elsewhere in the document or an action to be performed. For this reason, there are two separate constructors in the [Link class](https://docs.telerik.com/devtools/document-processing/api/Telerik.Windows.Documents.Fixed.Model.Annotations.Link.html) - one requiring a __Destination__ object and one requiring an __Action__ object.
        

__Link__ exposes the following properties:
        

* __Destination__: A destination to be displayed when the annotation is activated. __Example 1__ demonstrates how you can create a Link using a previously created __Destination__ and add the Link in RadFixedPage's Annotations collection.
            

	#### __[C#] Example 1: Add link to destination__
	
	{{region cs-radpdfprocessing-model-annotations-links_0}}
		Link linkWithDestination = new Link(destination);
		page.Annotations.Add(linkWithDestination);
	{{endregion}}

* **NamedDestination**: A named destination associated with the link.


* __Action__: An [action]({%slug radpdfprocessing-model-actions%}) to be performed when the annotation is activated. __Example 2__ demonstrates how you can create a Link using a previously created __Action__ and add the Link in RadFixedPage's Annotations collection.
            


	#### __[C#] Example 2: Add link with action__
	
	{{region cs-radpdfprocessing-model-annotations-links_1}}
		Link linkWithAction = new Link(action);
		page.Annotations.Add(linkWithAction);
	{{endregion}}



>importantIn __Example 2__, the *action* object should be from the Telerik.Windows.Documents.Fixed.Model.Actions.Action type.
              

## Destination

The abstract __Destination__ class defines a particular view of a document, consisting of the following items:
        

* The page, which needs to be displayed.  
* The location on that page.
* The magnification (zoom) factor, which should be used when displaying the page.
            

The __Destination__ class itself only exposes a __Page__ property specifying the page of the destination. The other properties of the view are determined by the classes that inherit __Destination__.
        

* __Location__: Exposes __Left__, __Top__ and __Zoom__ properties. Displays the specified page, positioned with the (Left, Top) position at the upper-left corner of the window and the contents of the page magnified by the factor Zoom.
            

* __PageFit__: Displays the specified page with its contents magnified just enough to fit the entire page within the window both horizontally and vertically.
            

* __PageHorizontalFit__: Exposes __Top__ property. Displays the specified page with the vertical coordinate Top positioned at the top edge of the window and the contents of the page magnified just enough to fit the entire width of the page within the window.
            

* __PageVerticalFit__: Exposes __Left__ property. Displays the specified page with the horizontal coordinate Left positioned at the left edge of the window and the contents of the page magnified just enough to fit the entire height of the page within the window.
            

* __RectangleFit__: Exposes __Left__, __Top__, __Right__ and __Bottom__ properties. Displays the specified page with its contents magnified just enough to fit the rectangle specified by the coordinates Left, Bottom, Right and Top entirely within the window both horizontally and vertically.
            

* __BoundingRectangleFit__: Displays the specified page with its contents magnified just enough to fit its bounding box entirely within the window both horizontally and vertically.
            

* __BoundingRectangleHorizontalFit__: Exposes __Top__ property. Displays the specified page with the vertical coordinate Top positioned at the top edge of the window and the contents of the page magnified just enough to fit the entire width of its bounding box within the window.
            

* __BoundingRectangleVerticalFit__: Exposes __Left__ property. Displays the specified page with the horizontal coordinate Left positioned at the left edge of the window and the contents of the page magnified just enough the fit the entire height of its bounding box within the window.
            

__Example 3__ shows how you can create a Location object, associate it with a Link and add it to a RadFixedPage.
        

#### __[C#] Example 3: Add link with location__

{{region cs-radpdfprocessing-model-annotations-links_2}}
	Location location = new Location();
	location.Left = 225;
	location.Top = 500;
	location.Zoom = 4;
	location.Page = secondPage;
	
	var link = firstPage.Annotations.AddLink(location);
	link.Rect = new Rect(10, 10, 50, 50);
{{endregion}}



## Action              

__Example 4__ demonstrates how to create an action of type __GoToAction__, associate it with a Link and add it to a RadFixedPage. The *location* object can be of type Location like the one in __Example 3__.
        

#### __[C#] Example 4: Add link with action__

{{region cs-radpdfprocessing-model-annotations-links_3}}
	GoToAction goToAction = new GoToAction();
	goToAction.Destination = location;
	
	var goToLink = firstPage.Annotations.AddLink(goToAction);
	goToLink.Rect = new Rect(10, 10, 50, 50);
	
	UriAction uriAction = new UriAction();
	uriAction.Uri = new Uri(@"http://www.telerik.com");
	
	var uriLink = firstPage.Annotations.AddLink(uriAction);
	uriLink.Rect = new Rect(70, 10, 50, 50);
{{endregion}}

## See Also

 * [RadFixedPage]({%slug radpdfprocessing-model-radfixedpage%})
 * [AnnotationType API Reference](https://docs.telerik.com/devtools/document-processing/api/Telerik.Windows.Documents.Fixed.Model.Annotations.AnnotationType.html)
 * [Link API Reference](https://docs.telerik.com/devtools/document-processing/api/Telerik.Windows.Documents.Fixed.Model.Annotations.Link.html)
 * [JavaScript Actions]({%slug radpdfprocessing-model-javascript-actions%})

