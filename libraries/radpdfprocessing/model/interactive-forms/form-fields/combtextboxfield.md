---
title: CombTextBoxField 
description: Learn about the CombTextBoxField class in RadPdfProcessing for working with comb text box form fields that equally distribute characters across a fixed-length field.
page_title: CombTextBoxField 
slug: radpdfprocessing-model-interactive-forms-form-fields-combtextboxfield
tags: combtextboxfield, pdf, formfields, radpdfprocessing, acroform, interactive, comb, model
published: True
---

# CombTextBoxField Class

The `CombTextBoxField` class corresponds to the `FormFieldType.CombTextBox` enum value and represents a text input data container. It restricts text to a specific maximum length and distributes characters equally across the field appearance.

## Properties

`CombTextBoxField` provides the following properties:

| Property | Description |
|---|---|
| `Value` | Gets or sets the current text value of the field. |
| `DefaultValue` | Gets or sets the default value used when the [AcroForm]({%slug radpdfprocessing-model-interactive-forms-acroform%}) is reset to its default values. |
| `Widgets` | The collection of Widget annotations representing the field on the PDF pages. Widgets are created with `AddWidget()` and can be removed with `Remove()`. Implements `IEnumerable`. |
| `MaxLengthOfInputCharacters` | Specifies the number of characters that can be entered. |

**Create a CombTextBoxField and add it to a page**

<snippet id='pdf-combtetbox-field'/>

## See Also

* [Form Field]({%slug radpdfprocessing-model-interactive-forms-form-fields%})
* [Widgets]({%slug radpdfprocessing-model-annotations-widgets%})
* [Create Interactive Forms SDK example](https://github.com/telerik/document-processing-sdk/tree/master/PdfProcessing/CreateInteractiveForms)
* [Modifying Forms SDK example](https://github.com/telerik/document-processing-sdk/tree/master/PdfProcessing/ModifyForms)
