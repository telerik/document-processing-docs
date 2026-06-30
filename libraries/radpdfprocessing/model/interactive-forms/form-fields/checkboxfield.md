---
title: CheckBoxField 
description: Learn about the CheckBoxField class in RadPdfProcessing for creating and working with checkbox form fields in interactive PDF forms.
page_title: CheckBoxField 
slug: radpdfprocessing-model-interactive-forms-form-fields-checkboxfield
tags: checkboxfield, pdf, formfields, radpdfprocessing, acroform, interactive, checkbox, model
published: True
---

# CheckBoxField Class

The `CheckBoxField` class corresponds to the `FormFieldType.CheckBox` enum value and represents a box that can be checked or unchecked.

## Properties

`CheckBoxField` provides the following properties:

| Property | Description |
|---|---|
| `IsChecked` | Gets or sets a value indicating whether the field is checked. |
| `IsCheckedByDefault` | Gets or sets the default field value used when the [AcroForm]({%slug radpdfprocessing-model-interactive-forms-acroform%}) is reset to its default values. |
| `Widgets` | The collection of Widget annotations representing the field on the PDF pages. You can add widgets with `AddWidget()` and remove them with `Remove()`. Implements `IEnumerable`. |
| `ExportValue` | Gets or sets the value of the field when exporting the interactive form. The default export value is `"Yes"`. |

**Example 1: Create a CheckBoxField and add it to a page**

<snippet id='libraries-pdf-model-interactive-forms-form-fields-checkboxfield'/>

## See Also

* [Form Field]({%slug radpdfprocessing-model-interactive-forms-form-fields%})
* [Widgets]({%slug radpdfprocessing-model-annotations-widgets%})
* [RadioButtonField Class]({%slug radpdfprocessing-model-interactive-forms-form-fields-radiobuttonfield%})
* [Create Interactive Forms SDK example](https://github.com/telerik/document-processing-sdk/tree/master/PdfProcessing/CreateInteractiveForms)
* [Modifying Forms SDK example](https://github.com/telerik/document-processing-sdk/tree/master/PdfProcessing/ModifyForms)
