---
title: Resetting Form Fields 
description: RadPdfProcessing provides support for ResetFormAction.
page_title: Resetting Form Fields  
slug: radpdfprocessing-model-interactive-forms-resetting-form-fields 
tags: pdf, form, field, reset, action, document, processing, acroform
published: True
position: 9
---
# ResetFormAction

[RadPdfProcessing]({%slug radpdfprocessing-overview%}) provides functionality for resetting the form fields (*introduced in Q1 2025*). The **ResetFormAction** class represents an action that resets specific form fields in a document. The **Fields** property represents the list of field names that are *included* in the reset operation or *excluded* from it.

The **ResetFormType** property represents the type of the reset form behavior. The available options are:

* **Include**: Specifies that the reset form should include the specified form fields.

* **Exclude**: Specifies that the reset form should exclude the specified form fields.

## Creating a PushButtonWidget with a ResetFormAction 

The following example demonstrates how to create a document from scratch, add a form field (e.g. CheckBoxField) and a push button which is expected to trigger the reset action for the checkbox when the button is clicked.

<snippet id='reset-form-fields-actions'/>

## Updating an Existing document with a field

If the document already contains form fields and a PushButtonWidget, it is possible access the existing button and add the ResetFormAction.

<snippet id='assign-reset-form-fields-action'/>

## See Also

* [Widgets]({%slug radpdfprocessing-model-annotations-widgets %})
* [AcroForm]({%slug radpdfprocessing-model-interactive-forms-acroform %})
* [Create Interactive Forms SDK example](https://github.com/telerik/document-processing-sdk/tree/master/PdfProcessing/CreateInteractiveForms) 
* [Modifying Forms SDK example](https://github.com/telerik/document-processing-sdk/tree/master/PdfProcessing/ModifyForms) 
* [Creating a PDF Table with Form Fields Inside the Cells]({%slug insert-form-xobject-elements-pdf-table-cell%})
