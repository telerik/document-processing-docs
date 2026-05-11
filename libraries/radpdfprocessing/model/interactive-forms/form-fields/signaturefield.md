---
title: SignatureField 
description: Learn about the SignatureField class in RadPdfProcessing, which represents a digital signature placeholder in interactive PDF forms.
page_title: SignatureField 
slug: radpdfprocessing-model-interactive-forms-form-fields-signaturefield
tags: signaturefield, pdf, form, fields, radpdfprocessing, digital, signature, acroform, interactive, model
---


# SignatureField class

This article describes the following topics:

* [SignatureField Class Overview](#overview)

* [SignatureField Class Properties](#properties)


## Overview

This class corresponds to FormFieldType.Signature enum value and represents a placeholder which preserves the digital signature information. 

>To use the signing functionality in PdfProcessing for .NET Standard/.NET Core, you must add a reference to the System.Security.Cryptography.Pkcs NuGet package, version {{site.cryptographypkcs}} or newer (This functionality is available since R1 2022 SP1).

## Properties

SignatureField provides the following properties:

| Property | Description |
|---|---|
| `Signature` | Gets or sets the `Signature` value. Setting this property will sign the document during export. Signing with multiple signatures is not currently supported. To validate a signature, use the `Validate()` and `TryValidate()` methods. Validation requires that the source stream be open and is performed against the document state at import time. See [Digital Signature]({%slug radpdfprocessing-features-digital-signature%}) for more details. |
| `Widgets` | The collection of Widget annotations representing the field on the PDF pages. Widgets can be added using `AddWidget()` and removed using `Remove()`. Implements `IEnumerable`. |


#### **Example 1: Create a SignatureField and add it to a page**
<snippet id='pdf-signature-field'/>

## See Also

* [FormField]({%slug radpdfprocessing-model-interactive-forms-form-fields%})
* [Widgets]({%slug radpdfprocessing-model-annotations-widgets%})
* [Signature API Reference](https://docs.telerik.com/devtools/document-processing/api/Telerik.Windows.Documents.Fixed.Model.DigitalSignatures.Signature.html)
