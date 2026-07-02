---
title: SignatureField 
description: Learn about the SignatureField class in RadPdfProcessing, which represents a digital signature placeholder in interactive PDF forms.
page_title: SignatureField 
slug: radpdfprocessing-model-interactive-forms-form-fields-signaturefield
tags: signaturefield, pdf, form, fields, radpdfprocessing, digital, signature, acroform, interactive, model
---

# SignatureField

The `SignatureField` class corresponds to the `FormFieldType.Signature` enum value and represents a placeholder that preserves digital signature information. It represents a form field that stores digital signature data. Use it to sign PDF documents or validate existing signatures.

>important To use the signing functionality in RadPdfProcessing for .NET Standard/.NET Core, you must add a reference to the `System.Security.Cryptography.Pkcs` NuGet package, version {{site.cryptographypkcs}} or later. This functionality is available starting with R1 2022 SP1.

## Properties

The `SignatureField` class provides the following properties:

| Property | Description |
|---|---|
| `Signature` | Gets or sets the `Signature` value. Setting this property signs the document during export. Signing with multiple signatures is not supported. To validate a signature, use the `Validate()` and `TryValidate()` methods. Validation requires that the source stream is open and is performed against the document state at import time. See [Digital Signature]({%slug radpdfprocessing-features-digital-signature%}) for more details. |
| `Widgets` | The collection of Widget annotations representing the field on the PDF pages. Widgets can be added using `AddWidget()` and removed using `Remove()`. Implements `IEnumerable`. |

**Create a SignatureField and Add It to a Page**

<snippet id='pdf-signature-field'/>

## See Also

* [FormField]({%slug radpdfprocessing-model-interactive-forms-form-fields%})
* [Widgets]({%slug radpdfprocessing-model-annotations-widgets%})
* [Signature API Reference](https://docs.telerik.com/devtools/document-processing/api/Telerik.Windows.Documents.Fixed.Model.DigitalSignatures.Signature.html)
