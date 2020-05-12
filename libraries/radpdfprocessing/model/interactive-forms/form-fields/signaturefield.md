---
title: SignatureField 
page_title: SignatureField 
description: SignatureField 
slug: radpdfprocessing-model-interactive-forms-form-fields-signaturefield
tags: signaturefield
---


# SignatureField class

This article describes the following topics:

* [SignatureField Class Overview](#overview)

* [SignatureField Class Properties](#properties)


## Overview

This class corresponds to FormFieldType.Signature enum value and represents a placeholder which preserves the digital signature information. 

>In PdfProcessing for Xamarin you can add SignatureField but can not sign or import signed documents. The Signature property fo SignatureField is not available.

## Properties

SignatureField provides the following properties:

* **Signature**: Gets or sets the Signature value. 
	* Setting this property will sign the document during export. At this point, signing with multiple signatures is not supported.
	* To validate a signature, you can use the Validate() and TryValidate() methods. Note, that the validation requires that the stream, from which the document is imported, to be opened. The validation is performed for the current field, and against the state of the document in the moment of importing.

    > More information on how you can digitally sign a document is available in the [Digital Signature]({%slug radpdfprocessing-features-digital-signature%}) topic.

* **Widgets**: The collection of Widget annotations, which represent the field on the PDF pages. The widgets can be added and removed from the collection using the collection's **AddWidget()** and **Remove()** methods respectively. As the widget collection implements the **IEnumerable** interface, the available widget instances can be iterated.


#### **[C#] Example 1: Create a SignatureField and add it to a page**
{{region radpdfprocessing-model-interactive-forms-form-fields-signaturefield_0}}

	SignatureField signatureField = new SignatureField("SampleSignature");
	signatureField.Signature = new Signature(certificate); // The Signature property fo SignatureField is not available in PdfProcessing for .NET Standard.

	SignatureWidget widget = signatureField.Widgets.AddWidget();
	widget.Rect = new Rect(new Point(200, 600), new Size(100, 100));
	widget.Border = new AnnotationBorder(5, AnnotationBorderStyle.Solid, null);

	// Create a Form object to define the appearance you would like for the signature field.
	Form form = new Form();
	form.FormSource = new FormSource();
	form.FormSource.Size = new Size(120, 120);

	FixedContentEditor formEditor = new FixedContentEditor(form.FormSource);
	formEditor.DrawCircle(new Point(50, 50), 20);
	formEditor.DrawText("Sample Signature");

	// Add the FormSource object to the widget of the field.
	widget.Content.NormalContentSource = form.FormSource;
	widget.RecalculateContent();

	RadFixedPage page = document.Pages.Last();
	page.Annotations.Add(widget);
	document.AcroForm.FormFields.Add(signatureField);
{{endregion}}

## See Also

* [FormField]({%slug radpdfprocessing-model-interactive-forms-form-fields%})
* [Widgets]({%slug radpdfprocessing-model-interactive-forms-widgets%})
* [Signature API Reference](https://docs.telerik.com/devtools/document-processing/api/Telerik.Windows.Documents.Fixed.Model.DigitalSignatures.Signature.html)
