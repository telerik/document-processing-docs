---
title: Settings
description: Learn about the import and export settings available for the TxtFormatProvider in RadSpreadProcessing.
page_title: Settings
slug: radspreadprocessing-formats-and-conversion-txt-settings
tags: txt, format, provider, settings, spreadsheet, radspreadprocessing, import, export, configuration
published: True
position: 2
---

# Settings



`TxtFormatProvider` allows you to import and export TXT documents. Additionally, several settings allow you to modify the import and export behavior.

## TxtSettings Properties

`TxtFormatProvider` exposes a `Settings` property of type `TxtSettings`. This allows you to specify the following:

* `Delimiter`: Gets or sets the list separator. By default, the `TxtFormatProvider` class imports and exports files using the list separator specified by the current culture of the system.

* `ShouldExportEmptyValues`: Gets or sets a value indicating whether the empty values are exported.

* `Encoding`: Gets or sets the encoding.

* `Quote`: Gets or sets the quote symbol.

* `HasHeaderRow`: Specifies whether the document has a header row. The default value is `false`.

**Example 1** shows how to create and specify a particular setting to a `TxtFormatProvider`.

**Example 1: Configure TxtSettings with a custom delimiter, quote, and header row**

<snippet id='codeblock-cpe'/>


