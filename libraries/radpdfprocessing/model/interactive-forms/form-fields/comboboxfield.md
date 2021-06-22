---
title: ComboBoxField 
page_title: ComboBoxField 
slug: radpdfprocessing-model-interactive-forms-form-fields-comboboxfield
tags: comboboxfield
published: True
---


# ComboBoxField Class


This article describes the following topics:

* [ComboBoxField Class Overview](#overview)

* [ComboBoxField Class Properties](#properties)

## Overview

This class corresponds to the FormFieldType.ComboBox enum value and represents a drop down control with choices that can be selected. 


## Properties

ComboBoxField provides the following properties:

* **Value**: Gets or sets single choice that is selected. This choice is represented by the ChoiceOption class that has a single **Value** and **UserInterfaceValue** properties. The UserInterfaceValue property is optional and when null, the Value property is used to display the choice in the user interface.

* **DefaultValue**: Gets or sets the default selected choice used when the [AcroForm]({%slug radpdfprocessing-model-interactive-forms-acroform %}) is reset to its default values.

* **Widgets**: The collection of Widget annotations, which represent the field on the PDF pages. The widgets are created by using the collection's **AddWidget()** method and can be removed by using the **Remove()** method. As the widget collection implements the **IEnumerable** interface, the available widget instances can be iterated.

* **Options**: A ChoiceOptionCollection instance containing all available choices for this field. In order to modify this collection, you can use its indexer property and its **Add()**, **RemoveAt()** and **Clear()** methods. Each ChoiceOption instance can be added only once to such a collection. If you try adding the same instance more than once in the collection, an exception will be thrown.

* **ShouldCommitOnSelectionChange**: Boolean value indicating whether to commit the selected value on selection change.

* **HasEditableTextBox**: Boolean value indicating whether the drop down should provide additional text box input, allowing the user to input value that may be different from the provided choices.

* **ShouldSpellCheck**: Boolean value indicating whether the text should be spell checked during its input.

#### **[C#] Example 1: Create a ComboBoxField and add it to a page**
{{region radpdfprocessing-model-interactive-forms-form-fields-comboboxfield_0}}

	ComboBoxField comboBoxField = new ComboBoxField("SampleComboBox");
	
	comboBoxField.Options.Add(new ChoiceOption("First Value"));
	comboBoxField.Options.Add(new ChoiceOption("Second Value"));
	comboBoxField.Options.Add(new ChoiceOption("Third Value"));
	
	comboBoxField.Value = comboBoxField.Options[1];
	
	VariableContentWidget widget = comboBoxField.Widgets.AddWidget();
	widget.Rect = new Rect(100, 100, 200, 30);
	widget.RecalculateContent();
		
	document.AcroForm.FormFields.Add(comboBoxField);
	document.Pages[0].Annotations.Add(widget);
{{endregion}}

## See Also

* [Form Field]({%slug radpdfprocessing-model-interactive-forms-form-fields %})
* [Widgets]({%slug radpdfprocessing-model-interactive-forms-widgets %})
* [CombTexBoxField]({%slug radpdfprocessing-model-interactive-forms-form-fields-combtextboxfield%})
* [Create Interactive Forms SDK example](https://github.com/telerik/document-processing-sdk/tree/master/PdfProcessing/CreateInteractiveForms) 
* [Modifying Forms SDK example](https://github.com/telerik/document-processing-sdk/tree/master/PdfProcessing/ModifyForms) 
