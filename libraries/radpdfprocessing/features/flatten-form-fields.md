---
title: Flatten Form Fields
page_title: Flatten Form Fields
description: Handling Exceptions
slug: radpdfprocessing-flatten-form-fields
tags: flatten, form, field
position: 5
---

# Flatten Form Fields

The form field flattening feature removes all fields but preserves their content in the document. After this operation the document no longer can be edited. This functionality is added in R2 2021 version. 

There are two methods that are available. One to flatten all fields and one to flatten a single field. The bellow examples demonstrate how to use them. 

### Using the FlattenFormFields method 

The FlattenAllFields method does not take any parameter and will flatten all fields inside the document. 

#### __C# Example 1: Flatten all fields__

{{region cs-pdfprocessing-features-flatten-form-fields_0}}

	RadFixedDocument document = GetFixedDocument();
	document.AcroForm.FlattenFormFields();

{{endregion}}
### Using the FlattenFormField method

The FlattenFieldMethod takes as parameter the field that that should be flattened.  

#### __C# Example 2: Flatten single field__

{{region cs-pdfprocessing-features-flatten-form-fields_1}}
	RadFixedDocument document = GetFixedDocument();
    string fieldName = "TextBoxField";

    FormField field = document.AcroForm.FormFields.Where(n => n.Name == fieldName).FirstOrDefault();
    if (field != null)
    {
        document.AcroForm.FlattenFormField(field);
    }

{{endregion}}


