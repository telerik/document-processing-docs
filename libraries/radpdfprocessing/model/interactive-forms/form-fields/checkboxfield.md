---
title: CheckBoxField 
page_title: CheckBoxField 
description: CheckBoxField 
slug: radpdfprocessing-model-interactive-forms-form-fields-checkboxfield
tags: checkboxfield
published: True
---


# CheckBoxField Class


This article describes the following topics:

* [CheckBoxField Class Overview](#overview)

* [CheckBoxField Class Properties](#properties)

## Overview

This class corresponds to FormFieldType.CheckBox enum value and represents a box that can be checked or unchecked. 


## Properties

CheckBoxField provides the following properties:

* **IsChecked**: Gets or sets Boolean value indicating whether the field is checked.

* **IsCheckedByDefault**: Gets or sets the default field value used when the [AcroForm]({%slug radpdfprocessing-model-interactive-forms-acroform %}) is reset to its default values.

* **Widgets**: The collection of Widget annotations, which represent the field on the PDF pages. The widgets can be added and removed from the collection using the collection's **AddWidget()** and **Remove()** methods respectively. As the widget collection implements the **IEnumerable** interface, the available widget instances can be iterated.


* **ExportValue**: Gets or sets the value of the field when exporting the interactive form. The default export value is “Yes”.

#### **[C#] Example 1: Create a CheckBoxField and add it to a page**
{{region radpdfprocessing-model-interactive-forms-form-fields-checkboxfield_0}}
	CheckBoxField checkBoxField = new CheckBoxField("SampleCheckBox");
	checkBoxField.IsChecked = true;
	
	TwoStatesButtonWidget widget = checkBoxField.Widgets.AddWidget();
	widget.Rect = new Rect(100, 100, 20, 20);
	widget.RecalculateContent();

	document.AcroForm.FormFields.Add(checkBoxField);
	document.Pages[0].Annotations.Add(widget);
{{endregion}}


## See Also

* [Form Field]({%slug radpdfprocessing-model-interactive-forms-form-fields %})
* [Widgets]({%slug radpdfprocessing-model-interactive-forms-widgets %})
* [RadioButtonField Class]({%slug radpdfprocessing-model-interactive-forms-form-fields-radiobuttonfield%})
