---
title: TextBoxField 
description: Learn about the TextBoxField class in RadPdfProcessing for working with text input form fields in interactive PDF forms.
page_title: TextBoxField 
slug: radpdfprocessing-model-interactive-forms-form-fields-textboxfield
tags: textboxfield, pdf, formfields, radpdfprocessing, acroform, interactive, textinput, model, text, box, field
published: True
---

# TextBoxField

The `TextBoxField` class corresponds to the `FormFieldType.TextBox` enum value and represents a text box data container. It represents a form field that accepts text input from users. It supports single-line and multiline text, password masking, and file selection.

## Properties

The `TextBoxField` class exposes the following properties:

| Property | Description |
|---|---|
| `Value` | Gets or sets the current text value of the field. |
| `DefaultValue` | Gets or sets the default value used when the [AcroForm]({%slug radpdfprocessing-model-interactive-forms-acroform %}) is reset to its default values. |
| `Widgets` | The collection of Widget annotations representing the field on the PDF pages. Widgets can be added using `AddWidget()` and removed using `Remove()`. Implements `IEnumerable`. |
| `IsMultiline` | Indicates whether the text box supports multiline text input. |
| `IsPassword` | Indicates whether the text input is a password field. When `true`, the viewer hides the entered characters. |
| `IsFileSelect` | Indicates whether the field represents the path name of a file whose contents are submitted as the value of the field. |
| `ShouldSpellCheck` | Indicates whether the text is spell checked during input. |
| `AllowScroll` | Indicates whether scrolling is allowed for larger text content. When `false`, the maximum text input is restricted to the Widget annotation rectangle. |
| `MaxLengthOfInputCharacters` | Gets or sets the maximum length of the entered text. When `null`, the text length is unrestricted. |

**Create a TextBoxField and Add It to a Page**

<snippet id='pdf-textbox-field'/>

>important In .NET Standard, use `Telerik.Documents.Primitives.Rect` instead of `System.Windows.Rect`.

## See Also

* [Form Field]({%slug radpdfprocessing-model-interactive-forms-form-fields %})
* [Widgets]({%slug radpdfprocessing-model-annotations-widgets %})
* [CombTextBoxField]({%slug radpdfprocessing-model-interactive-forms-form-fields-combtextboxfield%})
* [Create Interactive Forms SDK Example](https://github.com/telerik/document-processing-sdk/tree/master/PdfProcessing/CreateInteractiveForms) 
* [Modifying Forms SDK Example](https://github.com/telerik/document-processing-sdk/tree/master/PdfProcessing/ModifyForms) 
* [Customizing Text and Border Colors to Highlight a TextBoxField with RadPdfProcessing]({%slug radpdfprocessing-customize-textboxfield-colors%})
* [Adjusting Widget Font Size to Fit Content in Form Fields Using PdfProcessing]({%slug auto-font-size-form-fields-pdfprocessing%})
