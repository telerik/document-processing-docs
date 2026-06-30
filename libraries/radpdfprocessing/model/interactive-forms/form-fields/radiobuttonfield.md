---
title: RadioButtonField 
description: Learn about the RadioButtonField class in RadPdfProcessing for creating and working with radio button form fields in interactive PDF forms.
page_title: RadioButtonField 
slug: radpdfprocessing-model-interactive-forms-form-fields-radiobuttonfield
tags: radiobuttonfield, pdf, formfields, radpdfprocessing, acroform, interactive, radiobutton, model
published: True
---

# RadioButtonField Class

The `RadioButtonField` class corresponds to the `FormFieldType.RadioButton` enum value and represents a group of radio button options. You can select at most one option from the group.

## Properties

`RadioButtonField` provides the following properties:

| Property | Description |
|---|---|
| `Value` | Gets or sets the single choice that is selected. `RadioOption` has a single `Value` text property. |
| `DefaultValue` | Gets or sets the default selected option used when the [AcroForm]({%slug radpdfprocessing-model-interactive-forms-acroform%}) is reset to its default values. |
| `Widgets` | The collection of [RadioButtonWidget]({%slug radpdfprocessing-model-annotations-widgets%}#radiobuttonwidget-class) annotations representing the field. Each widget represents a single radio button option through its `Option` property. Widgets are created with `AddWidget()` and removed with `Remove()`. Implements `IEnumerable`. |
| `Options` | A `RadioOptionCollection` containing all available options for this field. Modify through the indexer, `Add()`, `RemoveAt()`, and `Clear()`. Each `RadioOption` instance can be added only once. |
| `AllowToggleOff` | Indicates whether radio buttons can be deselected by clicking an already-selected radio button. |
| `ShouldUpdateRadiosInUnison` | Indicates whether all radio buttons sharing the same `RadioOption` value are selected in unison. When `false`, at most one radio button is selected even if multiple share the same option value. |

**Example 1: Create RadioButtonFields and add them to a page**

<snippet id='libraries-pdf-model-interactive-forms-form-fields-radiobuttonfield'/>

## See Also

* [Form Field]({%slug radpdfprocessing-model-interactive-forms-form-fields%})
* [Widgets]({%slug radpdfprocessing-model-annotations-widgets%})
* [CheckBoxField Class]({%slug radpdfprocessing-model-interactive-forms-form-fields-checkboxfield%})
* [Create Interactive Forms SDK example](https://github.com/telerik/document-processing-sdk/tree/master/PdfProcessing/CreateInteractiveForms)
* [Modifying Forms SDK example](https://github.com/telerik/document-processing-sdk/tree/master/PdfProcessing/ModifyForms)
