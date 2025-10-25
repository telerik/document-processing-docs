---
title: Using JsonFormatProvider
page_title: Using JsonFormatProvider
slug: radspreadprocessing-formats-and-conversion-json-jsonformatprovider
tags: json, export, settings, spread, processing, excel, xlsx, xls, settings
published: True
position: 1
---

# JsonFormatProvider

The __JsonFormatProvider__ (introduced in **Q4 2025**) makes it easy to export [Workbook]({%slug radspreadprocessing-working-with-workbooks-what-is-workbook%}) data to a structured JSON representation. Unlike the other text-based providers (CSV / TXT), the JSON export can include richer metadata such as number formats, named ranges, chart data and workbook level flags. Currently the provider is **Export-only**. 

The provider also exposes an [ExportSettings]({%slug radspreadprocessing-formats-and-conversion-json-jsonexportsettings%}) property, that allows you to control the export behavior.

## Prerequisites

To use the __JsonFormatProvider__ class you need to reference the following NuGet package:
* Telerik.Windows.Documents.Spreadsheet.FormatProviders.Json 

## Export

The following example demonstrates how to import an existing [Workbook]({%slug radspreadprocessing-working-with-workbooks-what-is-workbook%}) and export it to a JSON file using the default settings.

<snippet id='libraries-spread-formats-and-conversion-json-jsonformatprovider'/>

## See Also

* [JsonFormatProvider Settings]({%slug radspreadprocessing-formats-and-conversion-json-jsonexportsettings%})
* [Timeout Mechanism]({%slug timeout-mechanism-in-dpl%})
