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

This class corresponds to FormFieldType.PushButton enum value and represents a simple button that may be clicked with the mouse. This is the only field that does not preserve any data. It is usually used to execute some action on mouse click such as the action for submitting the form data. 

## Properties

PushButtonField provides a single property called **Widgets**. It represents the collection of Widget annotations, which visualize the field on the PDF pages. The widgets can be added and removed from the collection using the collection's **AddWidget()** and **Remove()** methods respectively. As the widget collection implements the **IEnumerable** interface, the available widget instances can be iterated.


#### **[C#] Example 1: Create a PushButtonField and add it to a page**
{{region radpdfprocessing-model-interactive-forms-form-fields-pushbuttonfield_0}}
	
	PushButtonField pushButtonField = new PushButtonField("SamplePushButton");
	
	PushButtonWidget widget = pushButtonField.Widgets.AddWidget();
	widget.Rect = new Rect(new Size(250, 50));
	widget.HighlightingMode = HighlightingMode.InvertBorderOfAnnotationRectangle;
	
	widget.AppearanceCharacteristics.Background = new RgbColor(123, 165, 134);
	widget.AppearanceCharacteristics.NormalCaption = "Click here";
	
	widget.TextProperties.FontSize = 20;
	widget.TextProperties.Fill = new RgbColor(0, 0, 0);
    widget.RecalculateContent();

	document.AcroForm.FormFields.Add(pushButtonField);
	document.Pages[0].Annotations.Add(widget);
{{endregion}}

## See Also

* [FormField]({%slug radpdfprocessing-model-interactive-forms-form-fields%})
* [Widgets]({%slug radpdfprocessing-model-interactive-forms-widgets%})
* [Create Interactive Forms SDK example](https://github.com/telerik/document-processing-sdk/tree/master/PdfProcessing/CreateInteractiveForms) 
* [Modifying Forms SDK example](https://github.com/telerik/document-processing-sdk/tree/master/PdfProcessing/ModifyForms) 
