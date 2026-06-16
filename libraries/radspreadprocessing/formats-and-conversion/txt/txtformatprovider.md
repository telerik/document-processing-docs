---
title: Using TxtFormatProvider
description: Learn how to import and export TXT files using the TxtFormatProvider in RadSpreadProcessing.
page_title: Using TxtFormatProvider
slug: radspreadprocessing-formats-and-conversion-txt-txtformatprovider
tags: txt, format, provider, spreadsheet, radspreadprocessing, plaintext, import, export, workbook
published: True
position: 1
---

# Using TxtFormatProvider



`TxtFormatProvider` makes it easy to import and export TXT files. TXT is a plain text format and holds only the contents of the worksheet without its formatting. Export to this format strips all styling and saves only the cell result value with the applied format, using tab as a delimiter. The provider exports only the contents of the active worksheet. Import from TXT creates a new workbook with a single worksheet named *Sheet1*.

To import and export TXT files, you need an instance of `TxtFormatProvider`, which is contained in the `Telerik.Windows.Documents.Spreadsheet.FormatProviders.TextBased.Txt` namespace. The `TxtFormatProvider` implements the `IWorkbookFormatProvider` interface that appears in the `Telerik.Windows.Documents.Spreadsheet.FormatProviders` namespace.

>note For more examples and application scenarios of importing and exporting a Workbook to various formats using a FormatProvider, check out the [Import/Load and Export/Save RadSpreadProcessing Workbook]({%slug import-export-save-load-workbook%}) knowledge base article.
  

## Import

**Example 1** shows how to import a TXT file using a FileStream. The sample creates a `TxtFormatProvider` instance and passes a FileStream to its `Import()` method:

**Example 1: Import TXT File**

<snippet id='codeblock-cpf'/>

## Export

**Example 2** demonstrates how to export an existing Workbook to a TXT file. The snippet creates a new workbook with a single worksheet, creates a `TxtFormatProvider`, and invokes its `Export()` method:

**Example 2: Export TXT File**

<snippet id='codeblock-cpg'/>

## See Also

* [Import/Load and Export/Save RadSpreadProcessing Workbook]({%slug import-export-save-load-workbook%})
* [Timeout Mechanism]({%slug timeout-mechanism-in-dpl%})

