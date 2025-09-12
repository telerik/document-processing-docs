---
title: Text Markup
page_title: Text Markup Annotation  
description: Text markup annotations appear as highlights, underlines, strikeouts, or squiggly underlines in the text of a document. 
slug: radpdfprocessing-model-annotations-text-markup 
tags: annotation, overview, pdfprocessing, text, markup 
published: True
position: 4
---

# TextMarkup 

**Text Markup annotations** appear as highlights, underlines, strikeouts, or jagged ("squiggly") underlines in the text of a document. When opened, they display a pop-up window containing the text of the associated note. 

![Text Markup Annotation](images/pdf-processing-create-text-markup-annotation.png)    

The **TextMarkupAnnotation** class is a derivative of the **MarkupAnnotation** (descendent of **ContentAnnotation**) and it exposes the following properties:

|Property|Description|
|---|---|
|**TextMarkupType**|Gets the type of the annotation. The **TextMarkupAnnotationType** enum offers *Highlight*, *StrikeOut*, *Underline*, *Squiggly* options.|
|**Opacity**|Gets or sets the opacity of the annotation.|
|**Contents**|Gets or sets the text that shall be displayed for the annotation.|
|**Color**|Gets or sets the color of the annotation.|
|**Content**|Gets the source defining the visual content of the annotation. This content is with bigger priority compared to the annotation appearance characteristics and text properties and it is visualized by default when opening the exported document in some PDF viewer.|

Depending on the TextMarkupAnnotationType the respective type of the TextMarkup annotation can be added to the PDF document using the below examples:

## Highlight

### Creating a Highlight Annotation

<snippet id='pdf-highlight-annotation'/>

![Create Highlight Annotation](images/pdf-processing-create-highlight-annotation.png)   

### Creating a Highlight Annotation with Appearance


<snippet id='pdf-appearance-highlight-annotation'/>

![Create Highlight Annotation with Appearance](images/pdf-processing-create-highlight-annotation-with-appearance.gif)    

>important In **.NET Standard/.NET (Target OS: None)** environments, fonts beyond the [14 standard ones]({%slug radpdfprocessing-concepts-fonts%}#standard-fonts) require a [FontsProvider implementation]({%slug pdfprocessing-implement-fontsprovider%}) to be resolved correctly.

## Underline

<snippet id='pdf-text-markup-underline'/>

![Create Underline Annotation](images/pdf-processing-create-underline-annotation.png)     

## Squiggly

<snippet id='pdf-text-markup-squiggly'/>

![Create Squiggly Annotation](images/pdf-processing-create-squiggly-annotation.png)    

## StrikeOut

<snippet id='pdf-text-markup-strikeout'/>

![Create StrikeOut Annotation](images/pdf-processing-create-strikeOut-annotation.png)      



## See Also

* [AcroForm]({%slug radpdfprocessing-model-interactive-forms-acroform %})
* [FormField]({%slug radpdfprocessing-model-interactive-forms-form-fields%})
* [Annotations Overview]({%slug radpdfprocessing-model-annotations-overview%})
* [FormSource]({%slug radpdfprocessing-model-formsource-overview%})
