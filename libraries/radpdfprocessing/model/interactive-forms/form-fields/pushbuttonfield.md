---
title: PushButtonField 
description: Learn about the PushButtonField class in RadPdfProcessing for creating clickable button form fields in interactive PDF forms.
page_title: PushButtonField 
slug: radpdfprocessing-model-interactive-forms-form-fields-pushbuttonfield
tags: pushbuttonfield, pdf, formfields, radpdfprocessing, acroform, interactive, button, model
published: True
---

# PushButtonField Class

The `PushButtonField` class corresponds to the `FormFieldType.PushButton` enum value and represents a simple button that you can click with the mouse. This is the only field that does not preserve any data. It is typically used to execute an action on mouse click. For the actions supported by RadPdfProcessing, see the [Links]({%slug radpdfprocessing-model-annotations-links%}#action) article.

## Properties

`PushButtonField` provides a single property called `Widgets`. It represents the collection of Widget annotations, which visualize the field on the PDF pages. You can add and remove widgets from the collection with the `AddWidget()` and `Remove()` methods. The widget collection implements the `IEnumerable` interface, so you can iterate the available widget instances.

**Example 1: Create a PushButtonField and add it to a page**

<snippet id='pdf-push-button-field'/>

>important In **.NET Standard/.NET (Target OS: None)** environments, fonts beyond the [14 standard ones]({%slug radpdfprocessing-concepts-fonts%}#standard-fonts) require a [FontsProvider implementation]({%slug pdfprocessing-implement-fontsprovider%}) to be resolved correctly.

## See Also

* [FormField]({%slug radpdfprocessing-model-interactive-forms-form-fields%})
* [Widgets]({%slug radpdfprocessing-model-annotations-widgets%})
* [Create Interactive Forms SDK example](https://github.com/telerik/document-processing-sdk/tree/master/PdfProcessing/CreateInteractiveForms)
* [Modifying Forms SDK example](https://github.com/telerik/document-processing-sdk/tree/master/PdfProcessing/ModifyForms)
