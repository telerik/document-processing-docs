---
title: FormField 
description: Learn about the form field types and the FormField base class in RadPdfProcessing for managing interactive PDF form data containers.
page_title: FormField 
slug: radpdfprocessing-model-interactive-forms-form-fields 
tags: formfield, pdf, interactive, radpdfprocessing, acroform, model, types, input
published: True
position: 0
---

# FormField

Form fields are the data containers responsible for preserving separate pieces of the interactive form data. Several types of form fields exist, each responsible for preserving a different type of data.

## FormField Class

The `FormField` class is the base class for all fields. You can find instances of this class by iterating the `FormFieldCollection` of [AcroForm]({%slug radpdfprocessing-model-interactive-forms-acroform%}).

>note You can find complete examples for [Creating Interactive Forms](https://github.com/telerik/document-processing-sdk/tree/master/PdfProcessing/CreateInteractiveForms) and [Modifying Forms](https://github.com/telerik/document-processing-sdk/tree/master/PdfProcessing/ModifyForms) in the SDK repository.

## FormField Properties

The `FormField` class provides the following properties:

| Property | Description |
|---|---|
| `FieldType` | Gets the `FormFieldType` of the specific field instance. Use this property to recognize the type of the concrete field and cast the instance to the concrete `FormField` class inheritor. |
| `Name` | Gets or sets the name of the field. Each field must have a unique name when added to a `FormFieldCollection` of an `AcroForm`. Setting the name is available starting with R2 2020. |
| `UserInterfaceName` | Gets the name used by the UI when referencing the field. Typically shown in a tooltip when hovering the field representation on the page. Also shown in error messages related to field error calculations. |
| `MappingName` | Gets the name used when exporting the field data from the document. |
| `IsReadOnly` | Gets or sets a Boolean value indicating whether the field is treated as read-only in a PDF viewer UI. |
| `IsRequired` | Gets or sets a Boolean value indicating whether the field is required for submitting the interactive form data. |
| `ShouldBeSkipped` | Gets or sets a Boolean value indicating whether the field is skipped when submitting the form. |
| `TextProperties` | Gets a `VariableTextProperties` instance used when creating a Widget for visualizing the concrete field. These properties dynamically construct the Widget appearance when it contains text content. |

## FormField Types

You can recognize each field type from the `FormField` base class by getting the value from its `FieldType` property. This allows you to convert the field to its inheritor type by casting to one of the `FormField` class inheritors.

**Example 1: Obtain fields from a document**

<snippet id='pdf-obtain-fields-from-document'/>

The following list shows all the inheritors of the `FormField` class:

* [CheckBoxField]({%slug radpdfprocessing-model-interactive-forms-form-fields-checkboxfield%})
* [ComboBoxField]({%slug radpdfprocessing-model-interactive-forms-form-fields-comboboxfield%})
* [CombTextBoxField]({%slug radpdfprocessing-model-interactive-forms-form-fields-combtextboxfield%})
* [ListBoxField]({%slug radpdfprocessing-model-interactive-forms-form-fields-listboxfield%})
* [PushButtonField]({%slug radpdfprocessing-model-interactive-forms-form-fields-pushbuttonfield%})
* [RadioButtonField]({%slug radpdfprocessing-model-interactive-forms-form-fields-radiobuttonfield%})
* [SignatureField]({%slug radpdfprocessing-model-interactive-forms-form-fields-signaturefield%})
* [TextBoxField]({%slug radpdfprocessing-model-interactive-forms-form-fields-textboxfield%})

## Rename Form Fields

Starting with R2 2020, the `Rename` method allows you to rename form fields. Pass the existing field name and the new name.

**Example 2: Rename form fields**

<snippet id='pdf-rename-form-field'/>

## Merging Documents with Form Fields

When merging documents that contain form fields, you must ensure that each field in the document has a unique name. Use the `MergedFieldNameResolving` event to achieve this. This event gives you access to all used field names and allows you to change the current field name if it is already in use.

**Example 3: Merge files with form fields**

<snippet id='pdf-fields-merge'/>

## See Also

* [Widgets]({%slug radpdfprocessing-model-annotations-widgets%})
* [AcroForm]({%slug radpdfprocessing-model-interactive-forms-acroform%})
* [Create Interactive Forms SDK example](https://github.com/telerik/document-processing-sdk/tree/master/PdfProcessing/CreateInteractiveForms)
* [Modifying Forms SDK example](https://github.com/telerik/document-processing-sdk/tree/master/PdfProcessing/ModifyForms)
* [Creating a PDF Table with Form Fields Inside the Cells]({%slug insert-form-xobject-elements-pdf-table-cell%})
* [Resetting Form Fields]({%slug radpdfprocessing-model-interactive-forms-resetting-form-fields%})
