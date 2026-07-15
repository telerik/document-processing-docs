---
title: Settings
description: Learn about the import and export settings available for the CsvFormatProvider in RadSpreadProcessing.
page_title: Settings
slug: radspreadprocessing-formats-and-conversion-csv-settings
tags: csv, format, provider, settings, spreadsheet, radspreadprocessing, csv, import, export, configuration, spread
published: True
position: 2
---

# Settings

`CsvFormatProvider` allows you to import and export CSV documents. Additionally, several settings allow you to modify the import and export behavior. The following sections outline the available settings.

## Settings Properties

`CsvFormatProvider` exposes a `Settings` property of type `CsvSettings`. This allows you to specify the following:

* `Delimiter`: Gets or sets the list separator. By default the `CsvFormatProvider` class imports and exports files using the list separator specified by the current culture of the system.

* `Quote`: Gets or sets the quote symbol.

* `HasHeaderRow`: Specifies whether the document has a header row. The default value is `false`.

* `Encoding`: Gets or sets the character encoding that is used when importing or exporting a file. The default value is UTF8 with BOM.

* `ShouldExportEmptyValues`: Gets or sets a value indicating whether the empty values are exported.

**Example 1** shows how to create and specify a particular setting to a `CsvFormatProvider`.

**Example 1: Configure CsvSettings with a custom delimiter, quote, header row, and UTF-8 encoding**

<snippet id='codeblock-cok'/>
