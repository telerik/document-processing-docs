---
title: FormField 
page_title: FormField 
slug: radpdfprocessing-model-interactive-forms-form-fields 
tags: formfield
published: True
position: 0
---
# Form Fields concept

The form fields are the data containers responsible for preserving separate pieces of the interactive form data. There are several types of form fields responsible for preserving different type of data.

## FormField Class

FormField class is the base class for all fields. Instances of this class may be found by iterating in the FormFieldCollection of [AcroForm]({%slug radpdfprocessing-model-interactive-forms-acroform%}). 

>note You can find complete examples for [Creating Interactive Forms](https://github.com/telerik/document-processing-sdk/tree/master/PdfProcessing/CreateInteractiveForms) and [Modifying Forms](https://github.com/telerik/document-processing-sdk/tree/master/PdfProcessing/ModifyForms) in our SDK repository.

## FormField Properties

The FormField class provides the following properties:

|Property|Description|
|----|----|
|**FieldType**|Provides the FormFieldType of the specifying field instance. This property can be used to easily recognize the type of the concrete field and easily cast the instance to the concrete FormField class inheritor.|
|**Name**|Provides the name of the field. Each field should have a unique name when added to a FormFieldCollection of an AcroForm. Since R2 2020 you can set the Name as well.|
|**UserInterfaceName**|Provides name used by the UI when referencing the field. Usually shown in a tooltip when hovering the field representation on the page. Also shown in error messages related to field error calculations.|
|**MappingName**|Name used when exporting the field data from the document.|
|**IsReadOnly**|Boolean value indicating whether the field should be threated as read-only in a PDF viewer UI.|
|**IsRequired**|Boolean value indicating whether the field is required for submitting the interactive form data.|
|**ShouldBeSkipped**|Boolean value indicating whether the field should be skipped when submitting the form.|
|**TextProperties**|Represents a VariableTextProperties instance used when creating Widget for visualizing the concrete field. These properties are used to dynamically construct the Widget appearance when it contains some text content.|

## FormField Types

Each field type can be recognized from the FormField base class by getting the value from its **FieldType** property. This way you can convert the field to its inheritor type by doing a cast to some of the FormField class inheritors.

#### **[C#] Example 1: Obtain fields from a document**

<snippet id='codeblock_158'/>

The following list shows all the inheritors of the FormField class:

* [CheckBoxField]({%slug radpdfprocessing-model-interactive-forms-form-fields-checkboxfield%})

* [ComboBoxField]({%slug radpdfprocessing-model-interactive-forms-form-fields-comboboxfield%})

* [CombTexBoxField]({%slug radpdfprocessing-model-interactive-forms-form-fields-combtextboxfield%})

* [ListBoxField]({%slug radpdfprocessing-model-interactive-forms-form-fields-listboxfield%})

* [PushButtonField]({%slug radpdfprocessing-model-interactive-forms-form-fields-pushbuttonfield%})

* [RadioButtonField]({%slug radpdfprocessing-model-interactive-forms-form-fields-radiobuttonfield%})

* [SignatureField]({%slug radpdfprocessing-model-interactive-forms-form-fields-signaturefield%})

* [TexBoxField]({%slug radpdfprocessing-model-interactive-forms-form-fields-textboxfield%})


## Rename Form Fields

In R2 2020 we introduced the __Rename__ method which allows you to rename the Form Fields. You need to pass the existing field name and the new name.  

#### **[C#] Example 2: Rename Form Fields**

<snippet id='codeblock_159'/>

## Merging Documents with Form Fields

When merging documents that contain FormFields, you need to ensure that each field in the document will have a unique name. This can be achieved by using the __MergedFieldNameResolving__ event. This event gives you access to all used field names and allows you to change the current field, if it is already used. 

#### **[C#] Example 2: Merge files with Form Fields**

<snippet id='codeblock_160'/>


## See Also

* [Widgets]({%slug radpdfprocessing-model-annotations-widgets %})
* [AcroForm]({%slug radpdfprocessing-model-interactive-forms-acroform %})
* [Create Interactive Forms SDK example](https://github.com/telerik/document-processing-sdk/tree/master/PdfProcessing/CreateInteractiveForms) 
* [Modifying Forms SDK example](https://github.com/telerik/document-processing-sdk/tree/master/PdfProcessing/ModifyForms) 
* [Creating a PDF Table with Form Fields Inside the Cells]({%slug insert-form-xobject-elements-pdf-table-cell%})
* [Resetting Form Fields]({%slug radpdfprocessing-model-interactive-forms-resetting-form-fields%})
