---
title: FormField 
page_title: FormField 
description: FormField 
slug: radpdfprocessing-model-interactive-forms-form-fields 
tags: formfield
published: True
position: 0
---
# Form Fields concept

The form fields are the data containers responsible for preserving separate pieces of the interactive form data. There are several types of form fields responsible for preserving different type of data.

## FormField Class

FormField class is the base class for all fields. Instances of this class may be found by iterating in the FormFieldCollection of[AcroForm]({%slug radpdfprocessing-model-interactive-forms-acroform%}). 


## FormField Properties

The FormField class provides the following properties:

* **FieldType**: Provides the FormFieldType of the specifying field instance. This property may be used to easily recognize the type of the concrete field and this way easily cast the instance to the concrete FormField class inheritor.

* **Name**: provides the name of the field. Each field should have a unique name when added to a FormFieldCollection of an AcroForm.

* **UserInterfaceName**: Provides name used by the UI when referencing the field. Usually shown in a tooltip when hovering the field representation on the page. Also shown in error messages related to field error calculations.

* **MappingName**: name used when exporting the field data from the document.

* **IsReadOnly**: Boolean value indicating whether the field should be threated as read-only in a PDF viewer UI.

* **IsRequired**: Boolean value indicating whether the field is required for submitting the interactive form data.

* **ShouldBeSkipped**: Boolean value indicating whether the field should be skipped when submitting the form.

* **TextProperties**: represents a VariableTextProperties instance used when creating Widget for visualizing the concrete field. These properties are used to dynamically construct the Widget appearance when it contains some text content.


## FormField Types

Each field type can be recognized from the FormField base class by getting the value from its **FieldType** property. This way you can convert the field to its inheritor type by doing a cast to some of the FormField class inheritors.

#### **[C#] Example 1: Obtain fields from a document**
{{region radpdfprocessing-model-interactive-forms-form-fields_0}}

	using (Stream stream = FileHelper.GetSampleResourceStream("InteractiveForms.pdf"))
	{
	    RadFixedDocument document = new PdfFormatProvider().Import(stream);
	    foreach (FormField field in document.AcroForm.FormFields)
	    {
	        switch (field.FieldType)
	        {
	            case FormFieldType.TextBox:
	                this.ProcessTextBox((TextBoxField)field);
	                break;
	            case FormFieldType.ListBox:
	                this.ProcessListBox((ListBoxField)field);
	                break;
	            case FormFieldType.RadioButton:
	                this.ProcessRadioButtons((RadioButtonField)field);
	
	                break;
	            case FormFieldType.CheckBox:
	                this.ProcessCheckBoxes((CheckBoxField)field);
	                break;
	        }
	    }
	}
{{endregion}}

The following list shows all the inheritors of the FormField class:

* [CheckBoxField]({%slug radpdfprocessing-model-interactive-forms-form-fields-checkboxfield%})

* [ComboBoxField]({%slug radpdfprocessing-model-interactive-forms-form-fields-comboboxfield%})

* [CombTexBoxField]({%slug radpdfprocessing-model-interactive-forms-form-fields-combtextboxfield%})

* [ListBoxField]({%slug radpdfprocessing-model-interactive-forms-form-fields-listboxfield%})

* [PushButtonField]({%slug radpdfprocessing-model-interactive-forms-form-fields-pushbuttonfield%})

* [RadioButtonField]({%slug radpdfprocessing-model-interactive-forms-form-fields-radiobuttonfield%})

* [SignatureField]({%slug radpdfprocessing-model-interactive-forms-form-fields-signaturefield%})

* [TexBoxField]({%slug radpdfprocessing-model-interactive-forms-form-fields-textboxfield%})

## See Also

* [Widgets]({%slug radpdfprocessing-model-interactive-forms-widgets %})
* [AcroForm]({%slug radpdfprocessing-model-interactive-forms-acroform %})