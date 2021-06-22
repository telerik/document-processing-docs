---
title: Flatten Form Fields
page_title: Flatten Form Fields
slug: radpdfprocessing-flatten-form-fields
tags: flatten, form, field
position: 5
---

# Flatten Form Fields

The form field flattening feature removes all fields but preserves their content in the document. After this operation the document no longer can be edited. This functionality was added in R2 2021 version. 

There are two methods that you can use for this. One to flatten all fields and one to flatten a single field. The bellow examples demonstrate how to use them. 

### Using the FlattenFormFields method 

The __FlattenFormFields__ method does not take any parameters and will flatten all fields inside the document. 

#### __[C#] Example 1:  Flatten all fields__

{{region cs-pdfprocessing-features-flatten-form-fields_0}}

	RadFixedDocument document = GetFixedDocument();
	document.AcroForm.FlattenFormFields();

{{endregion}}
### Using the FlattenFormField method

The __FlattenFormField__ method takes the field that should be flattened as a parameter. The field must belong to the same document.

#### __[C#] Example 2:  Flatten single field__

{{region cs-pdfprocessing-features-flatten-form-fields_1}}

	RadFixedDocument document = GetFixedDocument();
	string fieldName = "TextBoxField";
	
	FormField field = document.AcroForm.FormFields.Where(n => n.Name == fieldName).FirstOrDefault();
	if (field != null)
	{
	    document.AcroForm.FlattenFormField(field);
	}

{{endregion}}


