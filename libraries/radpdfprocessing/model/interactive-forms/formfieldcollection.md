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

This class holds a collection of [FormField]({%slug radpdfprocessing-model-interactive-forms-form-fields%}) instances, assigned to the [AcroForm]({%slug radpdfprocessing-model-interactive-forms-acroform %}) of the document. The collection exposes useful [properties](#properties) and [methods](#methods) allowing you to access, add or remove the form fields in a document.

## Properties

The FormFieldCollection class exposes an **indexer** and a **Count** property allowing you to respectively get a [FormField]({%slug radpdfprocessing-model-interactive-forms-form-fields%}) instance by its name or get the number of all form fields in the document. 

## Methods

You can also use several methods of the class to modify the collection of form fields in the document's [AcroForm]({%slug radpdfprocessing-model-interactive-forms-acroform %}).

* **Add()**: Accepts parameter of type [FormField]({%slug radpdfprocessing-model-interactive-forms-form-fields%}) and inserts it to the collection.

* **Remove()**: Accepts parameter of type [FormField]({%slug radpdfprocessing-model-interactive-forms-form-fields%}) and removes it from the collection.

* **Contains()**: Accepts a string representing the form field name. Returns *true* when a field with such a name is present in the collection, otherwise *false*.
 
#### **[C#] Example 1: Using the methods of FormFieldCollection**
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
