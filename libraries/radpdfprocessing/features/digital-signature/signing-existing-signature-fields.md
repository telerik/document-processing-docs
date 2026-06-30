---
title: Signing Existing Signature Fields
description: Learn how to sign multiple pre-existing signature fields in a PDF document using incremental updates with the PdfStreamSigner class in RadPdfProcessing.
page_title: Signing Existing Signature Fields
slug: radpdfprocessing-features-signing-existing-signature-fields
tags: pdf, processing, digital, signature, signing, incremental, update, field
published: True
position: 5
---

# Signing Existing Signature Fields

|Minimum Version|Q2 2026|
|----|----|

**RadPdfProcessing** enables you to sign multiple pre-existing signature fields in a PDF document while preserving the validity of previously applied signatures. The `PdfStreamSigner` class applies each signature through an *incremental update*, which appends data to the original PDF instead of rewriting it. This approach ensures that each subsequent signature does not invalidate earlier ones. 

PDF documents often contain multiple unsigned signature fields, for example, a contract that requires approval from several parties. When you sign these fields one at a time, each signing operation must preserve the integrity of all previous signatures. The `SignExistingField` method of the `PdfStreamSigner` class addresses this requirement. It locates a pre-existing signature field by name, applies a digital signature, and writes the result as an incremental update to the output stream. You can chain multiple signing operations by feeding the output of one step as the input to the next.

## API Reference

The following table lists the `SignExistingField` method overloads available on the `PdfStreamSigner` class.

| Method signature | Description |
|---|---|
| `SignExistingField(Stream originalStream, string fieldName, Signature signature)` | Signs an existing signature field identified by `fieldName` in the PDF document from `originalStream`. Uses incremental update to preserve previously applied signatures. |
| `SignExistingField(Stream originalStream, string fieldName, Signature signature, FormSource appearance)` | Signs an existing signature field and replaces the widget visual appearance with the specified `FormSource` content. Pass `null` for `appearance` to preserve the existing appearance. |

The following table describes the parameters accepted by the `SignExistingField` method.

| Parameter | Type | Description |
|---|---|---|
| `originalStream` | `Stream` | The stream that contains the current PDF document. |
| `fieldName` | `string` | The name of the pre-existing signature field to sign. |
| `signature` | `Signature` | The digital signature to apply to the field. |
| `appearance` | `FormSource` | The visual appearance to set on the signature widget. Pass `null` to keep the existing appearance. Available only in the overload that accepts a `FormSource` parameter. |

## Signing Existing Fields

To sign multiple existing signature fields in a PDF document:

1. Import the PDF and identify the unsigned signature fields by name.
2. Create a `PdfStreamSigner` instance with an output stream.
3. Call `SignExistingField` for each field, passing the current document stream and the field name.
4. Use the output stream from each step as the input for the next signing operation.

### Example 1: Import a PDF and Sign All Signature Fields

The following example imports an existing PDF that contains unsigned signature fields and signs each field sequentially using incremental updates.

<snippet id='libraries-pdf-features-digital-signature-signing-existing-signature-fields-sign-all-signature-fields'/>

The code first imports the document to discover the names of all unsigned `SignatureField` instances. It then iterates over the field names and calls `SignExistingField` for each one. Because each call produces an incremental update, previously applied signatures remain valid in the final output.

## Signing with Custom Appearance

When a PDF contains empty (unsigned) signature fields, you can generate and apply a visual appearance during signing. Create a `FormSource`, draw content into it with `FixedContentEditor`, and pass it to the `SignExistingField` overload that accepts an `appearance` parameter. Each signing step produces an incremental update, so previously applied signatures remain valid.

### Example 2: Sign Existing Fields with Custom Appearance

The following example signs two signature fields and applies a custom visual appearance to each widget at signing time.

<snippet id='libraries-pdf-features-digital-signature-signing-existing-signature-fields-sign-signature-fields-with-appearance'/>

The helper method below builds a visual appearance that displays the signer name, role, and signing date:

<snippet id='libraries-pdf-features-digital-signature-signing-existing-signature-fields-build-appearance'/>

Each call to `SignExistingField` with a `FormSource` replaces the widget appearance of the target field. Pass `null` for the `appearance` parameter to preserve the existing widget appearance.

## See Also

* [Digital Signature in RadPdfProcessing]({%slug radpdfprocessing-features-digital-signature%})
* [Interactive Forms]({%slug radpdfprocessing-model-interactive-forms-form-fields%})
* [FixedContentEditor]({%slug radpdfprocessing-editing-fixedcontenteditor%})
