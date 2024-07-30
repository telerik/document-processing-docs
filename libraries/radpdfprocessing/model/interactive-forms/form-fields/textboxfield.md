---
title: TextBoxField 
page_title: TextBoxField 
slug: radpdfprocessing-model-interactive-forms-form-fields-textboxfield
tags: textboxfield
published: True
---

# TextBoxField Class

This article describes the following topics:

* [TextBoxField Class Overview](#overview)

* [TextBoxField Class Properties](#properties)


## Overview

This class corresponds to FormFieldType.TextBox enum value and represents a TextBox data container. 

## Properties

TextBoxField exposes the following properties:

* **Value**: Gets or sets the current text value of the field.

* **DefaultValue**: Gets or sets the default value used when the [AcroForm]({%slug radpdfprocessing-model-interactive-forms-acroform %}) is reset to its default values.

* **Widgets**: The collection of Widget annotations, which represent the field on the PDF pages. The widgets can be added and removed from the collection using the collection's **AddWidget()** and **Remove()** methods respectively. As the widget collection implements the **IEnumerable** interface, the available widget instances can be iterated.

* **IsMultiline**: Boolean value indicating whether the text box should support multiline text input.

* **IsPassword**: Boolean value indicating whether the text input is password. Setting this property to *true* will force the viewer to display the password input by hiding the inputted characters.

* **IsFileSelect**: Boolean value indicating whether the field represents path name of a file whose contents are to be submitted as the value of the field.

* **ShouldSpellCheck**: Boolean value indicating whether the text should be spell checked during its input.

* **AllowScroll**: Boolean value indicating whether to allow scrolling for bigger text content. If the scrolling is not allowed, then the maximum text input is restricted to the Widget annotation rectangle.

* **MaxLengthOfInputCharacters**: Nullable integer value specifying the maximal length of the inputted text. When null, the text is not restricted to any specified length.

#### **[C#] Example 1: Create a TextBoxField and add it to a page**
{{region radpdfprocessing-model-interactive-forms-form-fields-textboxfield_0}}
	
	using Telerik.Windows.Documents.Fixed.Model.Annotations;
	using Telerik.Windows.Documents.Fixed.Model.InteractiveForms;
	using Telerik.Windows.Documents.Fixed.Model;
	using System.Windows;

	namespace ConsoleNetFramework
	{
		internal class Program
		{
			static void Main(string[] args)
			{
				RadFixedDocument fixedDocument = new RadFixedDocument();
				fixedDocument.Pages.AddPage();

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
				widget.RecalculateContent();

				fixedDocument.AcroForm.FormFields.Add(textField);
				fixedDocument.Pages[0].Annotations.Add(widget);
			}
		}
	}

{{endregion}}

>important In .NET Standard use __Telerik.Documents.Primitives.Rect__ instead of __System.Windows.Rect__.

## See Also

* [Form Field]({%slug radpdfprocessing-model-interactive-forms-form-fields %})
* [Widgets]({%slug radpdfprocessing-model-annotations-widgets %})
* [CombTextBoxField Class]({%slug radpdfprocessing-model-interactive-forms-form-fields-combtextboxfield%})
* [Create Interactive Forms SDK example](https://github.com/telerik/document-processing-sdk/tree/master/PdfProcessing/CreateInteractiveForms) 
* [Modifying Forms SDK example](https://github.com/telerik/document-processing-sdk/tree/master/PdfProcessing/ModifyForms) 
