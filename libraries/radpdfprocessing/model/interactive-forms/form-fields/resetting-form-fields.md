---
title: Resetting Form Fields 
description: Learn how to use the ResetFormAction class in RadPdfProcessing to reset specific form fields in a PDF document to their default values.
page_title: Resetting Form Fields  
slug: radpdfprocessing-model-interactive-forms-resetting-form-fields 
tags: resetformaction, pdf, form, fields, radpdfprocessing, acroform, interactive, reset, action
published: True
position: 9
---
# Resetting Form Fields

[RadPdfProcessing]({%slug radpdfprocessing-overview%}) supports resetting form fields starting with Q1 2025. The `ResetFormAction` class represents an action that resets specific form fields in a document. The `Fields` property contains the list of field names that are *included* in the reset operation or *excluded* from it.

The `ResetFormType` property defines the type of the reset form behavior. The available options are:

| Value | Description |
|---|---|
| `Include` | Specifies that the reset form includes the specified form fields. |
| `Exclude` | Specifies that the reset form excludes the specified form fields. |

## Creating a PushButtonWidget with a ResetFormAction

The following example shows how to create a document from scratch, add a form field (for example, `CheckBoxField`), and a push button that triggers the reset action for the checkbox when you click the button.

<snippet id='libraries-pdf-model-interactiveforms-formfields-resettingformfields-create-pushbuttonwidget-with-resetformaction'/>

>important In **.NET Standard/.NET (Target OS: None)** environments, fonts beyond the [14 standard ones]({%slug radpdfprocessing-concepts-fonts%}#standard-fonts) require a [FontsProvider implementation]({%slug pdfprocessing-implement-fontsprovider%}) to be resolved correctly.

## Updating an Existing Document with a Field

If the document already contains form fields and a `PushButtonWidget`, you can access the existing button and add the `ResetFormAction`.

<snippet id='libraries-pdf-model-interactiveforms-formfields-resettingformfields-update-existing-pushbuttonwidget-field'/>

## See Also

* [Widgets]({%slug radpdfprocessing-model-annotations-widgets%})
* [AcroForm]({%slug radpdfprocessing-model-interactive-forms-acroform%})
* [Create Interactive Forms SDK example](https://github.com/telerik/document-processing-sdk/tree/master/PdfProcessing/CreateInteractiveForms)
* [Modifying Forms SDK example](https://github.com/telerik/document-processing-sdk/tree/master/PdfProcessing/ModifyForms)
* [Creating a PDF Table with Form Fields Inside the Cells]({%slug insert-form-xobject-elements-pdf-table-cell%})
