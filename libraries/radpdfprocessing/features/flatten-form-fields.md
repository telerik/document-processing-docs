---
title: Flatten Form Fields
description: Learn how to flatten form fields in PDF documents using RadPdfProcessing, preserving content while making the document non-editable.
page_title: Flatten Form Fields
slug: radpdfprocessing-flatten-form-fields
tags: flatten, form, fields, pdf, acroform, radpdfprocessing, readonly, interactive, forms
position: 5
---

# Flatten Form Fields

The form field flattening feature removes all fields but preserves their content in the document. After this operation, the document can no longer be edited. This feature is available starting with the R2 2021 release.

Two methods are available for flattening. One flattens all fields and the other flattens a single field. The following examples demonstrate how to use them.

## Using the FlattenFormFields Method

The `FlattenFormFields` method does not take any parameters and flattens all fields inside the document.

**Flatten All Fields**

<snippet id='pdf-flatten-all-fields'/>

## Using the FlattenFormField Method

The `FlattenFormField` method takes the field that you want to flatten as a parameter. The field must belong to the same document.

**Flatten a Single Field**

<snippet id='pdf-flatten-single-field'/>

## See Also

* [RadFixedDocument]({%slug radpdfprocessing-model-radfixeddocument%})
* [AcroForm]({%slug radpdfprocessing-model-interactive-forms-acroform%})
