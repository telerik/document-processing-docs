---
title: TextBoxField 
page_title: TextBoxField 
description: TextBoxField 
slug: radpdfprocessing-model-interactive-forms-form-fields-textboxfield
tags: textboxfield
published: True
---

# TextBoxField Class

This article describes the following topics:

* [SignatureField Class Overview](#overview)

* [SignatureField Class Properties](#properties)


## Overview

This class corresponds to FormFieldType.TextBox enum value and represents a TextBox data container. 

## Properties

TextBoxField provides the following properties:

* **Value**: gets or sets the current text value of the field.

* **DefaultValue**: gets or sets the default value used when the [AcroForm]({%slug radpdfprocessing-model-interactive-forms-acroform %}) is reset to its default values.

* **Widgets**: the collection of Widget annotations which represent the field on the PDF pages. The widgets are created by using the collection AddWidget method and may be removed by using the collection Remove method. As the widget collection implements IEnumerable interface the available widget instances may be iterated.

* **IsMultiline**: Boolean value indicating whether the text box should support multiline text input.

* **IsPassword**: Boolean value indicating whether the text input is password which would force the viewer application to display the password input by hiding the inputted characters.

* **IsFileSelect**: Boolean value indicating whether the field represents pathname of a file whose contents are to be submitted as the value of the field.

* **ShouldSpellCheck**: Boolean value indicating whether the text should be spell checked during its input.

* **AllowScroll**: Boolean value indicating whether to allow scrolling for bigger text content. If the scrolling is not allowed, then the maximum text input is restricted to the Widget annotation rectangle.

* **MaxLengthOfInputCharacters**: Nullable integer value specifying the maximal length of the inputted text. In null then the text is not restricted to any specified length.

#### **[C#] Example 1: Create a TextBoxField and add it to a page**
{{region radpdfprocessing-model-interactive-forms-form-fields-textboxfield_0}}
	TextBoxField textField = new TextBoxField("SampleTextBox")
	{
	    MaxLengthOfInputCharacters = 500,
	    IsMultiline = true,
	    IsPassword = false,
	    IsFileSelect = false,
	    ShouldSpellCheck = true,
	    AllowScroll = true,
	    Value = "Sample content",
	};
	
	VariableContentWidget widget = textField.Widgets.AddWidget();
	widget.Rect = new Rect(new Size(250, 50));
	
	document.AcroForm.FormFields.Add(textField);
	document.Pages[0].Annotations.Add(widget);

{{endregion}}

## See Also

* [Form Field]({%slug radpdfprocessing-model-interactive-forms-form-fields %})
* [Widgets]({%slug radpdfprocessing-model-interactive-forms-widgets %})
