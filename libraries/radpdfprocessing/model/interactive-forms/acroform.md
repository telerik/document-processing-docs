---
title: AcroForm 
page_title: AcroForm 
description: AcroForm 
slug: radpdfprocessing-model-interactive-forms-acroform 
tags: acroform
published: True
position: 1
---

# AcroForm 

Interactive forms in PDF format are also known as AcroForm. The AcroForm class in PdfProcessing represents the interactive form in a PDF document providing the collection of all FormFields in a RadFixedDocument instance. 

>The AcroForm class instance is unique for each RadFixedDocument instance and may be accessed through the **AcroForm property** of RadFixedDocument.

>note You can find complete examples for [Creating Interactive Forms](https://github.com/telerik/document-processing-sdk/tree/master/PdfProcessing/CreateInteractiveForms) and [Modifying Forms](https://github.com/telerik/document-processing-sdk/tree/master/PdfProcessing/ModifyForms) in our SDK repository.

## AcroForm properties

The AcroForm class provides the following properties:


* **FormFields**: This property is of type [FormFieldCollection]({%slug radpdfprocessing-model-interactive-forms-formfieldcollection%}) and represents the collection of all [FormField]({%slug radpdfprocessing-model-interactive-forms-form-fields %}) instances.  You can use the collection **indexer** to get a FormField instance by name. The **Add()**, **Remove()** and **Contains()** methods allow you to modify the FormFields collection. Additionally, the FormFieldCollection class implements  the **IEnumerable<FormField>** interface, allowing you to iterate all fields in the collection.
 
	>Each FormField has a **unique name** in this collection and you cannot add two fields with the same name.


* **ViewersShouldRecalculateWidgetAppearances**: A boolean value indicating whether the [Widget]({%slug radpdfprocessing-model-interactive-forms-widgets%}) appearances should be recalculated before visualizing them in a PDF viewer. If true, the PDF viewers should dynamically reconstruct all widgets content based on widget text properties and appearance characteristics. Otherwise, the PDF viewer should rely on the AnnotationContentSource instances provided by each [Widget]({%slug radpdfprocessing-model-interactive-forms-widgets%}) annotation in order to render its content in the UI.

## See Also

* [FormField]({%slug radpdfprocessing-model-interactive-forms-form-fields%})
* [FormFieldCollection class]({%slug radpdfprocessing-model-interactive-forms-formfieldcollection%})
* [Widgets]({%slug radpdfprocessing-model-interactive-forms-widgets%})

