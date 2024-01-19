---
title: ListBoxField 
page_title: ListBoxField 
slug: radpdfprocessing-model-interactive-forms-form-fields-listboxfield
tags: listboxfield
published: True
---


# ListBoxField Class

This article describes the following topics:

* [ListBoxField Class Overview](#overview)

* [ListBoxField Class Properties](#properties)

## Overview

This class corresponds to FormFieldType.ListBox enum value and represents a list with choices that may be selected. 


## Properties

ListBoxField provides the following properties:

* **Value**: Gets or sets an array of selected choices. Each choice is represented by the ChoiceOption class that has a single Value and UserInterfaceValue properties. The UserInterfaceValue property is optional and, when null, the Value property is used to display the choice in the user interface.

* **DefaultValue**: Gets or sets the default selected choices, used when the [AcroForm]({%slug radpdfprocessing-model-interactive-forms-acroform %}) is reset to its default values.

* **Widgets**: A collection of Widget annotations, which represent the field on the PDF pages. The widgets are created by using the collection **AddWidget()** method and can be removed by using the collection's **Remove()** method. As the widget collection implements the **IEnumerable** interface, the available widget instances can be iterated.

* **Options**: A ChoiceOptionCollection instance containing all available choices for this field. In order to modify this collection, you can use its indexer property and its **Add()**, **RemoveAt()** and **Clear()** methods. Each ChoiceOption instance can be added only once to such a collection. If you try adding the same instance more than once in the collection, an exception will be thrown.

* **ShouldCommitOnSelectionChange**: Boolean value indicating whether to commit the selected value on selection change.

* **TopIndex**: Gets or sets integer value providing the index of the choice that should be visualized on top of the list box viewport rectangle.


#### **[C#] Example 1: Create a ListBoxField and add it to a page**
{{region radpdfprocessing-model-interactive-forms-form-fields-listboxfield_0}}

	ListBoxField listBoxField = new ListBoxField("SampleListBox");
	
	listBoxField.Options.Add(new ChoiceOption("First Value"));
	listBoxField.Options.Add(new ChoiceOption("Second Value"));
	listBoxField.Options.Add(new ChoiceOption("Third Value"));
	
	listBoxField.Value = new ChoiceOption[] { listBoxField.Options[1] };
	
	VariableContentWidget widget = listBoxField.Widgets.AddWidget();
	widget.Rect = new Rect(100, 100, 200, 200);
    widget.RecalculateContent();

	document.AcroForm.FormFields.Add(listBoxField);
	document.Pages[0].Annotations.Add(widget);
{{endregion}}

## See Also

* [Form Field]({%slug radpdfprocessing-model-interactive-forms-form-fields %})
* [Widgets]({%slug radpdfprocessing-model-annotations-widgets %})
* [Create Interactive Forms SDK example](https://github.com/telerik/document-processing-sdk/tree/master/PdfProcessing/CreateInteractiveForms) 
* [Modifying Forms SDK example](https://github.com/telerik/document-processing-sdk/tree/master/PdfProcessing/ModifyForms) 
