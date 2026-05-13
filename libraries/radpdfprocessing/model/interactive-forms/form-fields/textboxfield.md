---
title: TextBoxField 
description: Learn about the TextBoxField class in RadPdfProcessing for working with text input form fields in interactive PDF forms.
page_title: TextBoxField 
slug: radpdfprocessing-model-interactive-forms-form-fields-textboxfield
tags: textboxfield, pdf, formfields, radpdfprocessing, acroform, interactive, textinput, model, text, box, field
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

| Property | Description |
|---|---|
| `Value` | Gets or sets the current text value of the field. |
| `DefaultValue` | Gets or sets the default value used when the [AcroForm]({%slug radpdfprocessing-model-interactive-forms-acroform %}) is reset to its default values. |
| `Widgets` | The collection of Widget annotations representing the field on the PDF pages. Widgets can be added using `AddWidget()` and removed using `Remove()`. Implements `IEnumerable`. |
| `IsMultiline` | Indicates whether the text box should support multiline text input. |
| `IsPassword` | Indicates whether the text input is a password field. When `true`, the viewer hides the inputted characters. |
| `IsFileSelect` | Indicates whether the field represents the path name of a file whose contents are to be submitted as the value of the field. |
| `ShouldSpellCheck` | Indicates whether the text should be spell checked during input. |
| `AllowScroll` | Indicates whether scrolling is allowed for larger text content. When `false`, the maximum text input is restricted to the Widget annotation rectangle. |
| `MaxLengthOfInputCharacters` | Specifies the maximum length of the inputted text. When `null`, the text length is unrestricted. |

#### **Example 1: Create a TextBoxField and add it to a page**
<snippet id='pdf-textbox-field'/>

>important In .NET Standard use __Telerik.Documents.Primitives.Rect__ instead of __System.Windows.Rect__.

## See Also

* [Form Field]({%slug radpdfprocessing-model-interactive-forms-form-fields %})
* [Widgets]({%slug radpdfprocessing-model-annotations-widgets %})
* [CombTextBoxField Class]({%slug radpdfprocessing-model-interactive-forms-form-fields-combtextboxfield%})
* [Create Interactive Forms SDK example](https://github.com/telerik/document-processing-sdk/tree/master/PdfProcessing/CreateInteractiveForms) 
* [Modifying Forms SDK example](https://github.com/telerik/document-processing-sdk/tree/master/PdfProcessing/ModifyForms) 
* [Customizing Text and Border Colors to Highlight a TextBoxField with RadPdfProcessing]({%slug radpdfprocessing-customize-textboxfield-colors%})
* [Adjusting Widgets' Font Size to Fit the Whole Content in Form Fields Using PdfProcessing]({%slug auto-font-size-form-fields-pdfprocessing%})
