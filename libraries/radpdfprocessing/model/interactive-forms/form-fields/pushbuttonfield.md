---
title: PushButtonField 
page_title: PushButtonField 
slug: radpdfprocessing-model-interactive-forms-form-fields-pushbuttonfield
tags: pushbuttonfield
published: True
---


# PushButtonField class

This article describes the following topics:

* [PushButtonField Class Overview](#overview)

* [PushButtonField Class Properties](#properties)

## Overview

This class corresponds to FormFieldType.PushButton enum value and represents a simple button that may be clicked with the mouse. This is the only field that does not preserve any data. It is usually used to execute some action on mouse click. For the supported by PdfProcessing actions, check the [Links]({%slug radpdfprocessing-model-annotations-links%}#action) help topic.

## Properties

PushButtonField provides a single property called **Widgets**. It represents the collection of Widget annotations, which visualize the field on the PDF pages. The widgets can be added and removed from the collection using the collection's **AddWidget()** and **Remove()** methods respectively. As the widget collection implements the **IEnumerable** interface, the available widget instances can be iterated.


#### **[C#] Example 1: Create a PushButtonField and add it to a page**
<snippet id='codeblock_162'/>

>important In **.NET Standard/.NET (Target OS: None)** environments, fonts beyond the [14 standard ones]({%slug radpdfprocessing-concepts-fonts%}#standard-fonts) require a [FontsProvider implementation]({%slug pdfprocessing-implement-fontsprovider%}) to be resolved correctly.

## See Also

* [FormField]({%slug radpdfprocessing-model-interactive-forms-form-fields%})
* [Widgets]({%slug radpdfprocessing-model-annotations-widgets%})
* [Create Interactive Forms SDK example](https://github.com/telerik/document-processing-sdk/tree/master/PdfProcessing/CreateInteractiveForms) 
* [Modifying Forms SDK example](https://github.com/telerik/document-processing-sdk/tree/master/PdfProcessing/ModifyForms) 
