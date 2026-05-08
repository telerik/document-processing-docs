---
title: ComboBoxField 
description: Learn about the ComboBoxField class in RadPdfProcessing for creating and working with combo box form fields in interactive PDF forms.
page_title: ComboBoxField 
slug: radpdfprocessing-model-interactive-forms-form-fields-comboboxfield
tags: comboboxfield, pdf, formfields, radpdfprocessing, acroform, interactive, dropdown, model
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

| Property | Description |
|---|---|
| `Value` | Gets or sets the single choice that is selected. `ChoiceOption` has `Value` and `UserInterfaceValue` properties. `UserInterfaceValue` is optional; when `null`, `Value` is used to display the choice in the UI. |
| `DefaultValue` | Gets or sets the default selected choice used when the [AcroForm]({%slug radpdfprocessing-model-interactive-forms-acroform %}) is reset to its default values. |
| `Widgets` | The collection of Widget annotations representing the field on the PDF pages. Widgets are created using `AddWidget()` and can be removed using `Remove()`. Implements `IEnumerable`. |
| `Options` | A `ChoiceOptionCollection` containing all available choices for this field. Modify via the indexer, `Add()`, `RemoveAt()`, and `Clear()`. Each `ChoiceOption` instance can be added only once. |
| `ShouldCommitOnSelectionChange` | Indicates whether to commit the selected value on selection change. |
| `HasEditableTextBox` | Indicates whether the drop-down provides an additional text box input, allowing the user to enter a value different from the provided choices. |
| `ShouldSpellCheck` | Indicates whether the text should be spell checked during input. |

#### **Example 1: Create a ComboBoxField and add it to a page**
<snippet id='pdf-combobox-field'/>

## See Also

* [Form Field]({%slug radpdfprocessing-model-interactive-forms-form-fields %})
* [Widgets]({%slug radpdfprocessing-model-annotations-widgets %})
* [CombTexBoxField]({%slug radpdfprocessing-model-interactive-forms-form-fields-combtextboxfield%})
* [Create Interactive Forms SDK example](https://github.com/telerik/document-processing-sdk/tree/master/PdfProcessing/CreateInteractiveForms) 
* [Modifying Forms SDK example](https://github.com/telerik/document-processing-sdk/tree/master/PdfProcessing/ModifyForms) 
