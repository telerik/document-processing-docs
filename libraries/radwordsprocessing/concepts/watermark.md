---
title: Watermark
page_title: Watermark
slug: radwordsprocessing-concepts-watermark
tags: watermark
published: True
position: 6
---

# Watermark


Watermarks are text or pictures that appear behind document content and often identify the document status, for example by marking it as Draft. 


## Watermark Overview


The class representing a watermark is __Watermark__ and exposes the following properties:

* __WatermarkType:__ The type of the watermark, described with the [WatermarkType](https://docs.telerik.com/devtools/document-processing/api/Telerik.Windows.Documents.Flow.Model.Watermarks.WatermarkType.html) enumeration.
	* __Image:__ Watermark containing an image.
	* __Text:__ Watermark containing text.
	
* __ImageSettings:__ Determines the settings of the watermark if it is of type __Image__. Derives from __WatermarkSettingsBase__ and exposes a property of type __ImageSource__ specifying the source of the image.

* __TextSettings:__ Determines the settings of the watermark if it is of type __Text__. Derives from __WatermarkSettingsBase__ and exposes additional properties __Text__, __FontFamily__ and __Color__ specifying the appearance of the text.


__WatermarkSettingsBase__ is the base class for text and image watermark settings and defines the appearance of the watermark on a page. It exposes the following properties:

* __Width:__ The width of the watermark.
* __Height:__ The height of the watermark.
* __Angle:__ The angle of the watermark towards the horizontal direction.


## Create a Watermark

Creating a watermark through the constructor of the class requires to pass as a parameter an object of type __TextWatermarkSettings__ or __ImageWatermarkSettings__, depending on the type of watermark you want to create.

__Example 1__ demonstrates the creation of a text watermark.


#### __Example 1: Create text watermark__

<snippet id='codeblock-iia'/>


Creating image watermark is very similar to creating a text one. __Example 2__ shows how to create an image watermark.


#### __Example 2: Create image watermark__

<snippet id='codeblock-jja'/>


## Set Watermark 


Watermarks are preserved in the header of the section to which the watermark is applied. More information on __Header__ elements and how you can use them is available in the [Headers and Footers]({%slug radwordsprocessing-model-headers-footers%}) article.


__Example 3__ demonstrates how you can add the watermark created in __Example 1__ to a __RadFlowDocument__ by creating a __Header__ for its first __Section__.

#### __Example 3: Add watermark to header__

<snippet id='codeblock-kka'/>

>tip By default, if header is omitted for a __Section__ other than the first one, it is inherited from the previous __Section__. The watermark set in __Example 3__ will be implicitly inherited by all sections following the first one since watermarks are preserved in the header.


There is another way to set a watermark in a document - through the [RadFlowDocumentEditor]({%slug radwordsprocessing-editing-radflowdocumenteditor%}) class. __RadFlowDocumentEditor__ exposes two overloads of the __SetWatermark()__ method that provide a simplified way to set a watermark. 

__Example 4__ demonstrates how to set the watermark created in __Example 2__ through __RadFlowDocumentEditor__ to the first page of a section. The method will create the __Header__ element for you, and you only need to specify its type.


#### __Example 4: Set watermark with RadFlowDocumentEditor__

<snippet id='codeblock-lla'/>


## See Also

 * [Headers and Footers]({%slug radwordsprocessing-model-headers-footers%})
 * [RadFlowDocumentEditor]({%slug radwordsprocessing-editing-radflowdocumenteditor%})