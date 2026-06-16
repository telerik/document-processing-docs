---
title: AcroForm 
description: Learn how to use the AcroForm class in RadPdfProcessing to manage interactive form fields and their collections in PDF documents.
page_title: AcroForm 
slug: radpdfprocessing-model-interactive-forms-acroform 
tags: acroform, pdf, formfields, radpdfprocessing, interactive, model, forms, widgets
published: True
position: 1
---

# AcroForm 

Interactive forms in PDF format are also known as AcroForm. The `AcroForm` class in RadPdfProcessing represents the interactive form in a PDF document and provides the collection of all form fields in a `RadFixedDocument` instance.

> The `AcroForm` class instance is unique for each `RadFixedDocument` instance and can be accessed through the `AcroForm` property of `RadFixedDocument`.

>note You can find complete examples for [Creating Interactive Forms](https://github.com/telerik/document-processing-sdk/tree/master/PdfProcessing/CreateInteractiveForms) and [Modifying Forms](https://github.com/telerik/document-processing-sdk/tree/master/PdfProcessing/ModifyForms) in the SDK repository.

## AcroForm Properties

The `AcroForm` class provides the following properties:

| Property | Description |
|---|---|
| `FormFields` | This property is of type [FormFieldCollection]({%slug radpdfprocessing-model-interactive-forms-formfieldcollection%}) and represents the collection of all [FormField]({%slug radpdfprocessing-model-interactive-forms-form-fields %}) instances. You can use the collection indexer to get a `FormField` instance by name. The `Add()`, `Remove()`, and `Contains()` methods allow you to modify the `FormFields` collection. The `FormFieldCollection` class implements the `IEnumerable<FormField>` interface, which allows you to iterate all fields in the collection. Each `FormField` has a unique name in this collection and you cannot add two fields with the same name. |
| `ViewersShouldRecalculateWidgetAppearances` | A Boolean value that indicates whether the [Widget]({%slug radpdfprocessing-model-annotations-widgets%}) appearances must be recalculated before displaying them in a PDF viewer. If `true`, PDF viewers dynamically reconstruct all widget content based on widget text properties and appearance characteristics. Otherwise, the PDF viewer relies on the `AnnotationContentSource` instances provided by each [Widget]({%slug radpdfprocessing-model-annotations-widgets%}) annotation to render its content in the UI. |
| `XfaForms` | Gets a collection of XFA (XML Forms Architecture) forms, which allows you to store and manage form data as a collection of name and byte array pairs. The `XfaCollection` offers the public `Clear` method, which removes all form entries from the collection. (Starting with Q1 2025) |

## See Also

* [FormField]({%slug radpdfprocessing-model-interactive-forms-form-fields%})
* [FormFieldCollection]({%slug radpdfprocessing-model-interactive-forms-formfieldcollection%})
* [Widgets]({%slug radpdfprocessing-model-annotations-widgets%})
* [Extracting Data from PDF Form Fields Using RadPdfProcessing]({%slug extract-pdf-form-fields-data-radpdfprocessing%}) 
* [Resolving Apostrophe Character Being Replaced with Copyright Symbol in Filled PDF AcroForm]({%slug apostrophe-character-replaced-copyright-symbol-acroform%})

