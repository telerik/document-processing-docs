---
title: SignatureField 
page_title: SignatureField 
slug: radpdfprocessing-model-interactive-forms-form-fields-signaturefield
tags: signaturefield
---


# SignatureField class

This article describes the following topics:

* [SignatureField Class Overview](#overview)

* [SignatureField Class Properties](#properties)


## Overview

This class corresponds to FormFieldType.Signature enum value and represents a placeholder which preserves the digital signature information. 

>To use the signing functionality in PdfProcessing for .NET Standard/.NET Core, you must add a reference to the System.Security.Cryptography.Pkcs NuGet package, version 6 or newer (This functionality is available since R1 2022 SP1).

## Properties

SignatureField provides the following properties:

* **Signature**: Gets or sets the Signature value. 
	* Setting this property will sign the document during export. At this point, signing with multiple signatures is not supported.
	* To validate a signature, you can use the Validate() and TryValidate() methods. Note, that the validation requires that the stream, from which the document is imported, to be opened. The validation is performed for the current field, and against the state of the document in the moment of importing.

    > More information on how you can digitally sign a document is available in the [Digital Signature]({%slug radpdfprocessing-features-digital-signature%}) topic.

* **Widgets**: The collection of Widget annotations, which represent the field on the PDF pages. The widgets can be added and removed from the collection using the collection's **AddWidget()** and **Remove()** methods respectively. As the widget collection implements the **IEnumerable** interface, the available widget instances can be iterated.


#### **[C#] Example 1: Create a SignatureField and add it to a page**
<snippet id='pdf-signature-field'/>

## See Also

* [FormField]({%slug radpdfprocessing-model-interactive-forms-form-fields%})
* [Widgets]({%slug radpdfprocessing-model-annotations-widgets%})
* [Signature API Reference](https://docs.telerik.com/devtools/document-processing/api/Telerik.Windows.Documents.Fixed.Model.DigitalSignatures.Signature.html)
