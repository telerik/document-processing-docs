---
title: FormFieldCollection 
page_title: FormFieldCollection 
description: FormFieldCollection 
slug: radpdfprocessing-model-interactive-forms-formfieldcollection
tags: FormFieldCollection
published: True
position: 2
---

# FormFieldCollection

This class holds a collection of [FormField]({%slug radpdfprocessing-model-interactive-forms-form-fields%}) instances, assigned to the [AcroForm]({%slug radpdfprocessing-model-interactive-forms-acroform %}) of the document. The collection exposes useful properties and methods allowing you to access, add or remove the form fields in a document.

This article contains the following sections:

* [FormFieldCollection Properties](#properties)
* [FormFieldCollection Methods](#methods)


## FormFieldCollection Properties

The FormFieldCollection class exposes an **indexer** and a **Count** property allowing you to respectively get a [FormField]({%slug radpdfprocessing-model-interactive-forms-form-fields%}) instance by its name or get the number of all form fields in the document. 

## FormFieldCollection Methods

There are methods allowing you to easily construct a form field and add it to the collection. Any of those methods accepts a string parameter representing the **unique name** of the form field. The generated field is then returned from the method so you can customize it if needed. Here is a list of all the methods:

* **AddPushButton()**: Creates a [PushButton]({%slug radpdfprocessing-model-interactive-forms-form-fields-pushbuttonfield%}) field and adds it to the collection. The created field is returned as a result from the method.

* **AddCheckBox()**: Creates a [CheckBox]({%slug radpdfprocessing-model-interactive-forms-form-fields-checkboxfield%}) field and adds it to the collection. The created field is returned as a result from the method.

* **AddRadioButton()**: Creates a [RadioButton]({%slug radpdfprocessing-model-interactive-forms-form-fields-radiobuttonfield%}) field and adds it to the collection. The created field is returned as a result from the method.

* **AddCombTextBox()**: Creates a [CombTextBox]({%slug radpdfprocessing-model-interactive-forms-form-fields-combtextboxfield%}) field and adds it to the collection. The created field is returned as a result from the method.

* **AddTextBox()**: Creates a [TextBox]({%slug radpdfprocessing-model-interactive-forms-form-fields-textboxfield%}) field and adds it to the collection. The created field is returned as a result from the method.

* **AddComboBox()**: Creates a [ComboBox]({%slug radpdfprocessing-model-interactive-forms-form-fields-comboboxfield%}) field and adds it to the collection. The created field is returned as a result from the method.

* **AddListBox()**: Creates a [ListBox]({%slug radpdfprocessing-model-interactive-forms-form-fields-listboxfield%}) field and adds it to the collection. The created field is returned as a result from the method.

* **AddSignature()**: Creates a [Signature]({%slug radpdfprocessing-model-interactive-forms-form-fields-signaturefield%}) field and adds it to the collection. The created field is returned as a result from the method.


**Example 1** shows how you can use the listed above methods to generate a form field and add it to the collection. 

#### **[C#] Example 1: Creating a form field**
{{region radpdfprocessing-model-interactive-forms-formfieldcollection_0}}

	CombTextBoxField comb = document.AcroForm.FormFields.AddCombTextBox("comb");
	comb.MaxLengthOfInputCharacters = 10;
	comb.Value = "0123456789";
{{endregion}}


You can also use several more methods of the class to modify the collection of form fields in the document's [AcroForm]({%slug radpdfprocessing-model-interactive-forms-acroform %}).

* **Add()**: Accepts parameter of type [FormField]({%slug radpdfprocessing-model-interactive-forms-form-fields%}) and inserts it to the collection.

* **Remove()**: Accepts parameter of type [FormField]({%slug radpdfprocessing-model-interactive-forms-form-fields%}) and removes it from the collection.

* **Contains()**: Accepts a string representing the form field name. Returns *true* when a field with such a name is present in the collection, otherwise *false*.
 
#### **[C#] Example 2: Using the methods of FormFieldCollection**
{{region radpdfprocessing-model-interactive-forms-formfieldcollection_1}}

	if (document.AcroForm.FormFields.Contains(fieldName))
	{
	    document.AcroForm.FormFields.Remove(document.AcroForm.FormFields[fieldName]);
	}
{{endregion}}

## See Also

* [FormField]({%slug radpdfprocessing-model-interactive-forms-form-fields%})
* [Widgets]({%slug radpdfprocessing-model-interactive-forms-widgets%})
* [AcroForm]({%slug radpdfprocessing-model-interactive-forms-acroform %})