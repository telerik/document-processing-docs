---
title: Iterating and Modifying Form Fields in Code
description: Learn how to iterate and change form field values in code by using RadPdfProcessing to import a PDF and set field data.
type: how-to
page_title: Iterating and Modifying Form Fields in Code
slug: modify-form-fields
position: 0
tags: radpdfprocessing, pdf, form, fields, acroform, document, processing, fixed
res_type: kb
---

## Environment

| Version | Product | Author |
| --- | --- | --- |
| 2020.1.218 | RadPdfProcessing |[Dimitar Karamfilov](https://www.telerik.com/blogs/author/dimitar-karamfilov)|

## Description

You have a PDF document with many form fields and you want to fill them with data programmatically.

## Solution

Import the document and iterate all fields to set their values:

**Example 1: Iterate and Set Form Field Values**

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

## See Also

* [RadPdfProcessing Overview]({%slug radpdfprocessing-overview%})
* [Interactive Forms]({%slug radpdfprocessing-model-interactive-forms-overview%})

