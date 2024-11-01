---
title: Multiplying TextBoxField Values with JavaScript Actions and RadPdfProcessing
description: Learn how to multiply the values of two TextBoxField values using RadPdfProcessing.
type: how-to
page_title: How to Multiply the TextBoxField Values with JavaScript Actions and RadPdfProcessing
slug: multiply-form-field-with-javascript-action-radpdfprocessing
tags: pdf, multiply, value, action, js, javascript, field, textbox
res_type: kb 
---

## Environment

| Version | Product | Author | 
| --- | --- | ---- | 
| Q4 2024 | RadPdfProcessing |[Desislava Yordanova](https://www.telerik.com/blogs/author/desislava-yordanova)| 

## Description

The following example demonstrates how to create a PDF document with three [TextBoxFields]({%slug radpdfprocessing-model-annotations-widgets%}) where the third field multiplies the values in the first two widgets. 

## Solution

Such functionality is achieved with the [JavaScript Actions]({%slug radpdfprocessing-model-javascript-actions%}) introduced in Q4 2024 for the RadPdfProcessing library:

```csharp

   RadFixedDocument document = new RadFixedDocument();
   document.Pages.AddPage();

   TextBoxField priceField = new TextBoxField("Price");
   priceField.Value = "12";
   priceField.IsReadOnly = true;
   VariableContentWidget priceWidget = priceField.Widgets.AddWidget();
   priceWidget.Rect = new Rect(new Size(150, 30));

   TextBoxField amountField = new TextBoxField("Amount");
   VariableContentWidget amountWidget = amountField.Widgets.AddWidget();
   amountWidget.Rect = new Rect(new Point(0, 50), new Size(150, 30));

   TextBoxField totalField = new TextBoxField("Total");
   totalField.IsReadOnly = true;
   totalField.Actions.Calculate = new Telerik.Windows.Documents.Fixed.Model.Actions.JavaScriptAction
       ("AFSimple_Calculate(\"PRD\", new Array (\"Amount\", \"Price\"));");
   VariableContentWidget totalWidget = totalField.Widgets.AddWidget();
   totalWidget.Rect = new Rect(new Point(0, 100), new Size(150, 30));

   document.AcroForm.FormFields.Add(priceField);
   document.AcroForm.FormFields.Add(amountField);
   document.AcroForm.FormFields.Add(totalField);
   document.Pages[0].Annotations.Add(priceWidget);
   document.Pages[0].Annotations.Add(amountWidget);
   document.Pages[0].Annotations.Add(totalWidget);

```

The achieved result is illustrated below: 

![JS Action Multiply FormField](images/js-action-multiply-form-field.gif)   

## See Also

- [Interactive Forms]({%slug radpdfprocessing-model-interactive-forms-overview%})
- [JavaScript Actions]({%slug radpdfprocessing-model-javascript-actions%})
