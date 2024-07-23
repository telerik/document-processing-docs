---
title: Extracting Data from PDF Form Fields Using RadPdfProcessing
description: Learn how to iterate over form fields in a PDF document and extract input values using RadPdfProcessing.
type: how-to
page_title: How to Extract Input Values from PDF Form Fields with RadPdfProcessing
slug: extract-pdf-form-fields-data-radpdfprocessing
tags: pdfprocessing, document, pdf, form, input, fields, extract, data
res_type: kb
ticketid: 1658908
---

## Environment

| Version | Product | Author | 
| --- | --- | ---- | 
| 2024.2.426| RadPdfProcessing |[Desislava Yordanova](https://www.telerik.com/blogs/author/desislava-yordanova)| 

## Description

Learn how to [import a PDF document]({%slug radpdfprocessing-formats-and-conversion-pdf-pdfformatprovider%}) and read the data from the input fields within the [AcroForm]({%slug radpdfprocessing-model-interactive-forms-acroform%}). The use-case is to iterate the form fields in a PDF document, extract the input values, and use these values to populate a data object.  

## Solution

Here is a sample code snippet demonstrating how to iterate over the form fields in a PDF document and extract the input values:

```csharp
using Telerik.Windows.Documents.Fixed.FormatProviders.Pdf;
using Telerik.Windows.Documents.Fixed.Model;
using Telerik.Windows.Documents.Fixed.Model.InteractiveForms;
using System.IO;
using System.Diagnostics;
using System.Collections.Generic;

PdfFormatProvider provider = new PdfFormatProvider();
RadFixedDocument fixedDocument;
using (Stream stream = File.OpenRead("your_pdf_file.pdf"))
{
    fixedDocument = provider.Import(stream);
}

if (fixedDocument.AcroForm.FormFields.Count == 0)
{
    return;
}

foreach (RadFixedPage page in fixedDocument.Pages)
{
    foreach (Annotation annotation in page.Annotations)
    {
        if (annotation.Type == AnnotationType.Widget)
        {
            Widget widget = (Widget)annotation;
            TextBoxField textBoxField = widget.Field as TextBoxField;
            CheckBoxField checkBoxField = widget.Field as CheckBoxField;
            ComboBoxField comboBoxField = widget.Field as ComboBoxField;
            if (textBoxField != null)
            {
                Debug.WriteLine(textBoxField.Name + " " + textBoxField.Value);
            }
            else if (checkBoxField != null)
            {
                bool toogleState = checkBoxField.IsChecked;
                Debug.WriteLine(checkBoxField.Name + " " + toogleState.ToString());
            }
            else if (comboBoxField != null)
            {
                Debug.WriteLine(comboBoxField.Name + " " + comboBoxField.Value);
            }
            else
            { 
                // TODO: Handle other field types
            }
        }
    }
}
```

Replace `"your_pdf_file.pdf"` with the path to your PDF file. This code iterates through each page of the PDF document, checks for form fields, and prints the field name and value to the debug output.

## Notes

Depending on the [type of form fields](https://docs.telerik.com/devtools/document-processing/libraries/radpdfprocessing/model/interactive-forms/form-fields/formfields#formfield-types) present in your PDF, you may need to handle additional field types apart from TextBox, CheckBox, and ComboBox.

## See Also

- [Interactive Forms]({%slug radpdfprocessing-model-interactive-forms-overview%})
- [Import and Export PDF Documents]({%slug radpdfprocessing-formats-and-conversion-pdf-pdfformatprovider%})
