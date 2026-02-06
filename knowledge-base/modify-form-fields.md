---
title: Iterate and modify form fields in code
description: Learn how to iterate and modify form fields in code using PdfProcessing.
type: how-to 
page_title:  Iterate and modify form fields in code
slug: modify-form-fields
position: 0
tags: form, fields, modify
res_type: kb
---

|Product Version|Product|Author|
|----|----|----|
|2020.1.218|RadPdfProcessing|[Dimitar Karamfilov](https://www.telerik.com/blogs/author/dimitar-karamfilov)|

## Description

You have a document that has many form fields and you want to populate them with data in the code.  

## Solution

You can import the document and iterate all fields. This will allow you to set their value.

```csharp

    var provider = new PdfFormatProvider();

    var document = provider.Import(File.ReadAllBytes("form_doc.pdf"));

    foreach (RadFixedPage page in document.Pages)
    {
        
        foreach (Annotation annotation in page.Annotations)
        {
            if (annotation.Type == AnnotationType.Widget)
            {
                Widget widget = (Widget)annotation;
                var field = widget.Field as TextBoxField;
                if (field != null)
                {
                    if (field.Name == "Name")
                    {
                        field.Value = "John Doe";
                    }
                }
            }
        }
    }

    File.WriteAllBytes("result.pdf", provider.Export(document));

```

