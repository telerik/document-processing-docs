---
title: Settings
page_title: Settings
description: Learn how to configure the import and export settings for the DocxFormatProvider to control DOCX document handling in RadWordsProcessing.
slug: radwordsprocessing-formats-and-conversion-docx-settings
tags: docx, format, provider, settings, flow, import, export, configuration, word
published: True
position: 2
---

# Settings

`DocxFormatProvider` allows you to import DOCX documents and export a `RadFlowDocument` to DOCX. The import/export settings provide modification options. This article outlines the available settings.

## Export Settings

You can specify the following export settings:

### InvalidDocumentAction

This setting defines the action to take when the exported `RadFlowDocument` does not comply with the Office Open XML standard. The possible values for the enumeration are:

* `None`: The provider exports the `RadFlowDocument` as is without running validation. This can result in a document that is not valid and may not open correctly.

* `ThrowAnException`: `DocxFormatProvider` validates the document before export. If the document is not valid, the provider throws an `InvalidDocumentException` that contains the list of validation errors. This is useful when you want to verify that you build valid DOCX documents.

* `Repair`: `DocxFormatProvider` validates the document before export. If validation fails, the provider tries to repair the document. The result is a valid DOCX document, but the method changes the structure of the input document.

### AutoUpdateFields

The `AutoUpdateFields` setting indicates whether fields update automatically when a user opens the exported document. The default value is `false`.

The following code shows how to create and specify particular export settings for `DocxFormatProvider`.

**Example 1: Create DocxExportSettings**

<snippet id='codeblock-cv'/>

