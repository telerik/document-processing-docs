---
title: Selecting DOCX Export Validation, Repair, or No Validation
description: Choose how DocxFormatProvider validates, repairs, or skips checks for RadFlowDocument exports by setting InvalidDocumentAction on DocxExportSettings.
type: how-to
page_title: Selecting DOCX Export Validation Options | Telerik Document Processing
slug: wordsprocessing-selecting-docx-export-validation-repair-or-no-validation
tags: radwordsprocessing, docx, export, validation, repair
res_type: kb
---

## Environment

| Version | Product | Author |
| --- | --- | --- |
| 2026.3.1027 | RadWordsProcessing | <a href="https://www.telerik.com/blogs/author/yoan-karamanov" target="_blank">Yoan Karamanov</a> |

## Description

In **RadWordsProcessing**, the `DocxExportSettings.InvalidDocumentAction` property controls validation and repair before `DocxFormatProvider` exports a `RadFlowDocument`. The default action is `Repair`, which can change the document structure.

This knowledge base article also answers the following questions:

* How do I choose DOCX export validation behavior?
* When can `Repair` change a `RadFlowDocument`?
* How can I read validation errors from `DocxFormatProvider`?

## Solution

Choose an action based on whether you want the provider to repair the document, reject validation errors, or skip validation:

| Action | Behavior | Use it when |
| --- | --- | --- |
| `Repair` | This is the default. The provider attempts to repair the document before export and can change its structure. | You want the provider to attempt repairs before export. |
| `ThrowException` | The provider validates the document and throws `InvalidDocumentException` when validation finds errors. | Your application must reject documents that do not pass validation. |
| `None` | The provider skips validation and repair. | Another process checks the document, or you accept the risk of non-compliant DOCX output. |

When you use `ThrowException`, catch `InvalidDocumentException` from `Telerik.Documents.Flow.FormatProviders.Docx.Validation` and inspect `ValidationErrors` to identify structures that fail validation.

The following example enables strict validation and prints any validation errors that the provider finds:

```csharp
using System;
using System.IO;
using Telerik.Documents.Flow.FormatProviders.Docx;
using Telerik.Documents.Flow.FormatProviders.Docx.Validation;

class Program
{
    static void Main()
    {
        Telerik.Documents.Flow.Model.RadFlowDocument document =
            new Telerik.Documents.Flow.Model.RadFlowDocument();
        document.Sections.AddSection()
            .Blocks.AddParagraph()
            .Inlines.AddRun("Ready to export.");

        Telerik.Documents.Flow.FormatProviders.Docx.DocxFormatProvider provider =
            new Telerik.Documents.Flow.FormatProviders.Docx.DocxFormatProvider();
        provider.ExportSettings.InvalidDocumentAction =
            InvalidDocumentAction.ThrowException;

        try
        {
            using (Stream output = File.OpenWrite("validated-temp.docx"))
            {
                provider.Export(document, output, TimeSpan.FromSeconds(10));
            }
        }
        catch (InvalidDocumentException exception)
        {
            foreach (ValidationError error in exception.ValidationErrors)
            {
                Console.WriteLine(error.Message);
            }
        }
    }
}
```

Set `InvalidDocumentAction.Repair` when you want the provider to attempt repairs, or set `InvalidDocumentAction.None` to skip validation and repair.

>important The provider clears seekable output streams before validation. If validation fails, the output file can remain empty. Export to a temporary file, then replace the existing destination only after export succeeds.

## See Also

* [DOCX import and export configuration options]({%slug radwordsprocessing-formats-and-conversion-docx-settings%})
* [DOCX import and export with `DocxFormatProvider`]({%slug radwordsprocessing-formats-and-conversion-docx-docxformatprovider%})
* [output stream behavior during export]({%slug common-export-output-stream-clearing%})
