---
title: RadFixedPage
page_title: RadFixedPage
slug: radpdfprocessing-model-radfixedpage
tags: radfixedpage
published: True
position: 2
---

# RadFixedPage

__RadFixedPage__ is the main page unit that builds a PDF document ([RadFixedDocument]({%slug radpdfprocessing-model-radfixeddocument%})). It conforms to the __IContentRootElement__ interface and is the root element of all fixed content elements in the document model. __Figure 1__ in the [Model]({%slug radpdfprocessing-model-general-information%}) article demonstrates in details the structure of the document model.   

This article covers the following topics:
      
* [What Is RadFixedPage](#what-is-radfixedpage)

* [Operating with RadFixedPage](#operating-with-radfixedpage)

## What Is RadFixedPage

The root element in the document model tree is [RadFixedDocument]({%slug radpdfprocessing-model-radfixeddocument%}). The document, on the other hand, consists of __RadFixedPages__ hosting all content elements. You can add a __RadFixedPage__ to a document in several ways.     

__RadFixedPage__ exposes the following properties:        

|Property Name|Description|
|----|----|
|__Content__|The content elements collection.|
|__Annotations__|Collection that contains all [Annotations]({%slug radpdfprocessing-model-annotations-overview%}) in the RadFixedPage.|
|__MediaBox__|Defines the boundaries of the physical medium on which the page will be printed. Any content falling outside this boundary is discarded without affecting the meaning of the PDF file. | 
|__CropBox__| Defines the region to which the contents of the page are clipped (cropped) when displayed or printed. This boundary determines the visible page content. The default value is the page’s media box. |
|__Size__|Property of type Size representing the size of the page. Its value is determined by the width and height of the **MediaBox**.|
|__Rotation__|Property of type [Rotation](https://docs.telerik.com/devtools/document-processing/api/Telerik.Windows.Documents.Fixed.Model.Data.Rotation.html) representing the page rotation.|
|**Actions**|Gets the page [actions]({%slug radpdfprocessing-model-action-collections%}#pageactioncollection) collection.|         

__Example 1__ demonstrates how to create a new __RadFixedPage__ instance and add it to the __Pages__ collection of __RadFixedDocument__.  

#### __[C#] Example 1: Create RadFixedPage and add it to a document__ 

<snippet id='add_radfixedpage'/>

## Operating with RadFixedPage

There are several operations, which you can execute directly over a __RadFixedPage__ instance.

### Add Content

__RadFixedPage__ is designed to hold any content element in the document model. There are several ways to achieve that.   

__Example 2__ shows how to add a previously created ContentElement in a __RadFixedPage__.
            
#### __[C#] Example 2: Add content element to RadFixedPage__

<snippet id='add_link_annotation_in_radfixedpage'/>

You can also use the __Add\[Element]()__ methods of RadFixedPages's __Content__ property. The respective methods - AddPath(), AddTextFragment(), AddImage(), create the element, add it to the page and return it for your convenience.            

### Add Annotation

You can add different annotations in __RadFixedPage__ by using the __Annotations__ collection.           

__Example 3__ shows how to add a previously created annotation in a __RadFixedPage__.
            

#### __[C#] Example 3: Add annotation to RadFixedPage__

<snippet id='add_annotation_to_radfixedpage'/>

The other possible approach is using the __AddLink()__ method of the __Annotations__ property. The method creates the link, adds it to the page and returns it. More information on the topic is available in the [Annotation]({%slug radpdfprocessing-model-annotations-links%}) article.          

### Modifying Properties

RadFixedPage's API provides you with the ability to modify its properties.
            
__Example 4__ shows how you can change the __Rotation__ and __Size__ properties of a __RadFixedPage__.
            

#### __[C#] Example 4: Change properties of a RadFixedPage__

<snippet id='modify_radfixedpage_properties'/>

>note A complete SDK example how to generate a document is available [here](https://github.com/telerik/document-processing-sdk/tree/master/PdfProcessing/GenerateDocument).

## See Also

 * [Model]({%slug radpdfprocessing-model-general-information%})
 * [RadFixedDocument]({%slug radpdfprocessing-model-radfixeddocument%})
 * [Annotations]({%slug radpdfprocessing-model-annotations-overview%})
