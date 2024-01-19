---
title: RadioButtonField 
page_title: RadioButtonField 
slug: radpdfprocessing-model-interactive-forms-form-fields-radiobuttonfield
tags: radiobuttonfield
published: True
---


# RadioButtonField class

This article describes the following topics:

* [RadioButtonField Class Overview](#overview)

* [RadioButtonField Class Properties](#properties)


## Overview

The RadioButtonField class corresponds to FormFieldType.RadioButton enum value and represents a group of radio button options. The user can select at most one option from the group. 


## Properties

RadioButtonField provides the following properties:

* **Value**: Gets or sets single choice that is selected. This choice is represented by RadioOption class that has a single **Value** text property.

* **DefaultValue**: Gets or sets the default selected option used when the [AcroForm]({%slug radpdfprocessing-model-interactive-forms-acroform %}) is reset to its default values.

* **Widgets**: The collection of Widget annotations, which represent the field on the PDF pages. Each Widget is of type  [RadioButtonWidget]({%slug radpdfprocessing-model-annotations-widgets%}#radiobuttonwidget-class) and represents a single radio button option provided by the RadioButtonWidget’s **Option** property. The widgets are created using the collection **AddWidget()** method and can be removed by using the collection's **Remove()** method. As the widget collection implements  the IEnumerable interface, the available widget instances can be iterated.

* **Options**: A RadioOptionCollection instance containing all available options for this field. In order to modify this collection, you can use its indexer property and its **Add()**, **RemoveAt()** and **Clear()** methods. Each RadioOption instance can be added only once to such a collection. If you try adding the same instance more than once in the collection, an exception will be thrown.

* **AllowToggleOff**: Boolean value indicating whether radio buttons can be deselected by a mouse click on a selected radio button.

* **ShouldUpdateRadiosInUnison**: Boolean value indicating whether all radio buttons that have RadioOption with the same value should be selected in unison. If false, then at most on radio button will have selected state even if some other radio button has the same option value.


#### **[C#] Example 1: Create RadioButtonFields and add them to a page**
{{region radpdfprocessing-model-interactive-forms-form-fields-radiobuttonfield_0}}
	RadioButtonField radioButtonField = new RadioButtonField("SampleRadioButton");
	
	radioButtonField.Widgets.AddWidget(new RadioOption("True")).Rect = new Rect(0, 0, 20, 20);
	radioButtonField.Widgets.AddWidget(new RadioOption("False")).Rect = new Rect(25, 0, 20, 20);
	radioButtonField.Widgets.AddWidget(new RadioOption("False")).Rect = new Rect(50, 0, 20, 20);
	
	document.AcroForm.FormFields.Add(radioButtonField);
	
	foreach (RadioButtonWidget widget in radioButtonField.Widgets)
	{
	    document.Pages[0].Annotations.Add(widget);
		widget.RecalculateContent();
	}
{{endregion}}


## See Also


* [Form Field]({%slug radpdfprocessing-model-interactive-forms-form-fields %})
* [Widgets]({%slug radpdfprocessing-model-annotations-widgets %})
* [CheckBoxField Class]({%slug radpdfprocessing-model-interactive-forms-form-fields-checkboxfield%})
* [Create Interactive Forms SDK example](https://github.com/telerik/document-processing-sdk/tree/master/PdfProcessing/CreateInteractiveForms) 
* [Modifying Forms SDK example](https://github.com/telerik/document-processing-sdk/tree/master/PdfProcessing/ModifyForms) 
