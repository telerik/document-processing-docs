---
title: FormFieldCollection 
description: Learn how to use the FormFieldCollection class in RadPdfProcessing to access, add, and remove interactive form fields in a PDF document.
page_title: FormFieldCollection 
slug: radpdfprocessing-model-interactive-forms-formfieldcollection
tags: formfieldcollection, pdf, formfields, radpdfprocessing, acroform, collection, interactive, api, form, fieldc, ollection
published: True
position: 2
---

# FormFieldCollection

The `FormFieldCollection` class holds a collection of [FormField]({%slug radpdfprocessing-model-interactive-forms-form-fields%}) instances, assigned to the [AcroForm]({%slug radpdfprocessing-model-interactive-forms-acroform %}) of the document. The collection exposes useful [properties](#properties) and [methods](#methods) that allow you to access, add, or remove the form fields in a document.

## Properties

The `FormFieldCollection` class exposes an indexer and a `Count` property. Use the indexer to get a [FormField]({%slug radpdfprocessing-model-interactive-forms-form-fields%}) instance by its name, or use `Count` to get the number of all form fields in the document.

## Methods

The following methods allow you to construct a form field and add it to the collection. Each method accepts a string parameter representing the unique name of the form field. The generated field is returned from the method so you can customize it.

* `AddPushButton()`: Creates a [PushButton]({%slug radpdfprocessing-model-interactive-forms-form-fields-pushbuttonfield%}) field and adds it to the collection. Returns the created field.

* `AddCheckBox()`: Creates a [CheckBox]({%slug radpdfprocessing-model-interactive-forms-form-fields-checkboxfield%}) field and adds it to the collection. Returns the created field.

* `AddRadioButton()`: Creates a [RadioButton]({%slug radpdfprocessing-model-interactive-forms-form-fields-radiobuttonfield%}) field and adds it to the collection. Returns the created field.

* `AddCombTextBox()`: Creates a [CombTextBox]({%slug radpdfprocessing-model-interactive-forms-form-fields-combtextboxfield%}) field and adds it to the collection. Returns the created field.

* `AddTextBox()`: Creates a [TextBox]({%slug radpdfprocessing-model-interactive-forms-form-fields-textboxfield%}) field and adds it to the collection. Returns the created field.

* `AddComboBox()`: Creates a [ComboBox]({%slug radpdfprocessing-model-interactive-forms-form-fields-comboboxfield%}) field and adds it to the collection. Returns the created field.

* `AddListBox()`: Creates a [ListBox]({%slug radpdfprocessing-model-interactive-forms-form-fields-listboxfield%}) field and adds it to the collection. Returns the created field.

* `AddSignature()`: Creates a [Signature]({%slug radpdfprocessing-model-interactive-forms-form-fields-signaturefield%}) field and adds it to the collection. Returns the created field.

**Example 1** shows how to use the previous methods to generate a form field and add it to the collection.

**Example 1: Create a Form Field**

<snippet id='pdf-form-field-creation'/>

You can also use the following methods to modify the collection of form fields in the document [AcroForm]({%slug radpdfprocessing-model-interactive-forms-acroform %}):

* `Add()`: Accepts a parameter of type [FormField]({%slug radpdfprocessing-model-interactive-forms-form-fields%}) and inserts it to the collection.

* `Remove()`: Accepts a parameter of type [FormField]({%slug radpdfprocessing-model-interactive-forms-form-fields%}) and removes it from the collection.

* `Contains()`: Accepts a string representing the form field name. Returns `true` when a field with such a name is present in the collection, otherwise `false`.

**Example 2: Use the Methods of FormFieldCollection**

<snippet id='pdf-form-field-collection-methods'/>

## See Also

* [FormField]({%slug radpdfprocessing-model-interactive-forms-form-fields%})
* [Widgets]({%slug radpdfprocessing-model-annotations-widgets%})
* [AcroForm]({%slug radpdfprocessing-model-interactive-forms-acroform %})
* [Extracting Data from PDF Form Fields Using RadPdfProcessing]({%slug extract-pdf-form-fields-data-radpdfprocessing%})
