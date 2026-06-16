---
title: Watermark
description: Learn how to add text or image watermarks behind document content in RadWordsProcessing to identify the document status.
page_title: Watermark
slug: radwordsprocessing-concepts-watermark
tags: watermark, word, flow, docx, document, image, text, section, background, header
published: True
position: 6
---

# Watermark

Watermarks are text or pictures that appear behind document content and often identify the document status, for example, by marking it as Draft.


## Watermark Overview

The class representing a watermark is `Watermark` and exposes the following properties:

* `WatermarkType`: The type of the watermark, described with the [`WatermarkType`](https://docs.telerik.com/devtools/document-processing/api/Telerik.Windows.Documents.Flow.Model.Watermarks.WatermarkType.html) enumeration.
	* `Image`: Watermark containing an image.
	* `Text`: Watermark containing text.

* `ImageSettings`: Determines the settings of the watermark if it is of type `Image`. Derives from `WatermarkSettingsBase` and exposes a property of type `ImageSource` specifying the source of the image.

* `TextSettings`: Determines the settings of the watermark if it is of type `Text`. Derives from `WatermarkSettingsBase` and exposes additional properties `Text`, `FontFamily`, and `Color` specifying the appearance of the text.


`WatermarkSettingsBase` is the base class for text and image watermark settings and defines the appearance of the watermark on a page. It exposes the following properties:

* `Width`: The width of the watermark.
* `Height`: The height of the watermark.
* `Angle`: The angle of the watermark towards the horizontal direction.


## Create a Watermark

To create a watermark through the constructor of the class, pass an object of type `TextWatermarkSettings` or `ImageWatermarkSettings` as a parameter, depending on the type of watermark you want to create.

**Example 1** demonstrates the creation of a text watermark.


**Example 1: Create text watermark**

<snippet id='codeblock-iia'/>


Creating an image watermark is similar to creating a text one. **Example 2** shows how to create an image watermark.

**Example 2: Create image watermark**

<snippet id='codeblock-jja'/>


## Set Watermark

Watermarks are preserved in the header of the section to which the watermark is applied. More information on `Header` elements and how you can use them is available in the [Headers and Footers]({%slug radwordsprocessing-model-headers-footers%}) article.


**Example 3** demonstrates how you can add the watermark created in **Example 1** to a `RadFlowDocument` by creating a `Header` for its first `Section`.

**Example 3: Add watermark to header**

<snippet id='codeblock-kka'/>

>tip By default, if a header is omitted for a `Section` other than the first one, it is inherited from the previous `Section`. The watermark set in **Example 3** is implicitly inherited by all sections following the first one because watermarks are preserved in the header.


You can also set a watermark in a document through the [`RadFlowDocumentEditor`]({%slug radwordsprocessing-editing-radflowdocumenteditor%}) class. `RadFlowDocumentEditor` exposes two overloads of the `SetWatermark()` method that provide a simplified way to set a watermark.

**Example 4** demonstrates how to set the watermark created in **Example 2** through `RadFlowDocumentEditor` to the first page of a section. The method creates the `Header` element for you, and you only need to specify its type.


**Example 4: Set watermark with RadFlowDocumentEditor**

<snippet id='codeblock-lla'/>


## See Also

* [Headers and Footers]({%slug radwordsprocessing-model-headers-footers%})
* [RadFlowDocumentEditor]({%slug radwordsprocessing-editing-radflowdocumenteditor%})