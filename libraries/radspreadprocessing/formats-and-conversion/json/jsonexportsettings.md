---
title: Settings
page_title: Using JsonExportSettings
slug: radspreadprocessing-formats-and-conversion-json-jsonexportsettings
tags: json, export, settings, spread, processing, excel, xlsx, xls
published: True
position: 2
---

<style>
table, th, td {
	border: 1px solid;
}
table th:first-of-type { width: 25%; }
table th:nth-of-type(2) { width: 20%; }
table th:nth-of-type(3) { width: 15%; }
table th:nth-of-type(4) { width: 40%; }
</style>

# JsonExportSettings

The [JsonFormatProvider]({%slug radspreadprocessing-formats-and-conversion-json-jsonformatprovider%}) exposes an **ExportSettings** property of type **JsonExportSettings**. The settings control the behavior of the [JsonFormatProvider]({%slug radspreadprocessing-formats-and-conversion-json-jsonformatprovider%}) when exporting a [Workbook]({%slug radspreadprocessing-working-with-workbooks-what-is-workbook%}) to JSON. By adjusting the available properties you can tailor the size, richness and focus of the generated JSON payload.

## Properties

| Property | Type | Default | Description |
|----------|------|---------|-------------|
| **ExportWhat** | [ExportWhat]({%slug radspreadprocessing-formats-and-conversion-json-jsonexportsettings%}#enum-values) | EntireWorkbook | Portion of the workbook to export (entire workbook, active sheet, or selection). |
| **IncludeHiddenSheets** | bool | false | Include hidden worksheets when exporting the entire workbook. |
| **IncludeDefinedNames** | bool | true | Export defined names (named ranges / constants). |
| **IncludeNumberFormats** | bool | true | Emit number format codes for formatted cells. |
| **IncludeCharts** | bool | true | Serialize chart objects from exported sheets. |
| **ChartDataMode** | [ChartDataMode]({%slug radspreadprocessing-formats-and-conversion-json-jsonexportsettings%}#enum-values) | ReferencesOnly | Control chart data representation: only reference formulas, only resolved literal values, or both. |
| **PrettyPrint** | bool | false | Indent JSON output for readability. Disable to reduce size. |
| **ValueRenderMode** | [ValueRenderMode]({%slug radspreadprocessing-formats-and-conversion-json-jsonexportsettings%}#enum-values) | Display | Export raw underlying values, formatted display values, or both. |
| **IncludeBlankCells** | bool | false | Emit blank cells explicitly within the used range; otherwise they are skipped. |
| **IncludeWorkbookProtectionFlag** | bool | true | Include workbook protection state (Workbook.IsProtected). |
| **IncludeActiveSheet** | bool | true | Emit the name of the active worksheet in metadata. |
| **SelectedRanges** | List<CellRange> | empty | Ranges to export when ExportWhat is Selection. Empty collection falls back to active sheet. |
| **IncludeChartStats** | bool | true | Include min, max, average, sum, stdev and count aggregates for chart series. |
| **IncludeChartSummaries** | bool | true | Include natural language summary strings per chart. |
| **IncludeChartTrends** | bool | true | Include simple trend classification (increasing / decreasing / flat) for eligible series. |

### Enum Values

**ExportWhat**
* **ActiveSheet** - Exports only the currently active worksheet.
* EntireWorkbook** - Exports all worksheets in the workbook. (Default)
* **Selection** - Exports only the currently selected cell ranges.

**ChartDataMode**
* **ReferencesOnly** - Only formula / reference expressions are exported. (Default)
* **ResolvedValues** - Only resolved literal value arrays are exported.
* **Both** - Both references and resolved value arrays are exported.

**ValueRenderMode**
* **Raw** - Underlying raw cell value is exported.
* **Display** - Formatted display value is exported. (Default)
* **Both** - Both raw and display representations are exported.

## Basic Usage

The following example shows how you can create a **JsonExportSettings** instance with the desired settings while exporting a [Workbook]({%slug radspreadprocessing-working-with-workbooks-what-is-workbook%}) to JSON format:

<snippet id='libraries-spread-formats-and-conversion-json-jsonexportsettings-apply'/>

## See Also

* [JsonFormatProvider]({%slug radspreadprocessing-formats-and-conversion-json-jsonformatprovider%})
* [Timeout Mechanism]({%slug timeout-mechanism-in-dpl%})
