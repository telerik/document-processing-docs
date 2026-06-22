---
title: AutoFilter
description: Learn how to export and import AutoFilters in XLSX documents using RadSpreadStreamProcessing to show or hide rows based on column values.
page_title: AutoFilter
slug: radspreadstreamprocessing-features-autofilter
tags: autofilter, filter, spread, stream, processing, spreadsheet, export, import, columns, xlsx, values, custom, dynamic
published: True
position: 4
---

# AutoFilter

*AutoFilter* lets users show or hide rows based on the values in one or more columns. You can export a plain AutoFilter range to activate the drop-down arrows, or attach filter rules to specific columns so that non-matching rows are hidden in the output document.

## AutoFilter Model

An AutoFilter is represented by the `SpreadAutoFilter` class. It covers a rectangular cell range and optionally holds per-column filter definitions.

The following table describes the properties of `SpreadAutoFilter`.

| Property | Type | Description |
|---|---|---|
| `FromRowIndex` | `int` | The zero-based index of the first row in the filter range (the header row). |
| `FromColumnIndex` | `int` | The zero-based index of the first column in the filter range. |
| `ToRowIndex` | `int` | The zero-based index of the last row in the filter range. |
| `ToColumnIndex` | `int` | The zero-based index of the last column in the filter range. |
| `FilterColumns` | `IList<SpreadFilterColumn>` | The filter definitions applied to individual columns within the range. |

`SpreadAutoFilter` provides two constructors:

```csharp
// Range only — no filter definitions.
SpreadAutoFilter autoFilter = new SpreadAutoFilter(fromRowIndex, fromColumnIndex, toRowIndex, toColumnIndex);

// Range with filter column definitions.
SpreadAutoFilter autoFilter = new SpreadAutoFilter(fromRowIndex, fromColumnIndex, toRowIndex, toColumnIndex, filterColumns);
```

>note Each column in a `SpreadAutoFilter` must have a unique `RelativeColumnIndex`. Passing duplicate values causes the constructor to throw an `ArgumentException`.

Each `SpreadFilterColumn` pairs a column offset with a filter rule:

| Property | Type | Description |
|---|---|---|
| `RelativeColumnIndex` | `int` | The zero-based column offset relative to `FromColumnIndex` of the parent `SpreadAutoFilter`. |
| `Filter` | `ISpreadFilter` | The filter rule for the column. |

```csharp
SpreadFilterColumn column = new SpreadFilterColumn(relativeColumnIndex, filter);
```

## Filter Types

All filter types implement the `ISpreadFilter` interface. The following subsections describe each type.

### Values Filter

`SpreadValuesFilter` keeps rows whose cell value matches one of a set of string values, belongs to a date group, or is blank.

| Property | Type | Description |
|---|---|---|
| `StringValues` | `IList<string>` | String values that a cell must equal. |
| `DateItems` | `IList<SpreadDateGroupItem>` | Hierarchical date criteria. No entry in the list may be `null`. |
| `Blank` | `bool` | When `true`, blank cells are also matched. |

`SpreadValuesFilter` provides several constructors:

```csharp
// String values only.
new SpreadValuesFilter(new string[] { "Apple", "Banana" })

// String values and blank flag.
new SpreadValuesFilter(new string[] { "Apple" }, blank: true)

// Date group items only.
new SpreadValuesFilter(new SpreadDateGroupItem[] { new SpreadDateGroupItem(2024, 6) })

// All three (pass null for any unused parameter).
new SpreadValuesFilter(
    new string[] { "Active" },
    new SpreadDateGroupItem[] { new SpreadDateGroupItem(2023, 11, 15) },
    blank: false)
```

A `SpreadDateGroupItem` defines a date criterion at a specific granularity. The constructor overloads determine the granularity automatically:

| Constructor | Granularity (`DateTimeGroupingType`) |
|---|---|
| `new SpreadDateGroupItem(year)` | `Year` |
| `new SpreadDateGroupItem(year, month)` | `Month` |
| `new SpreadDateGroupItem(year, month, day)` | `Day` |
| `new SpreadDateGroupItem(year, month, day, hour, minute, second, groupingType)` | As specified |

>note `SpreadDateGroupItem` throws `ArgumentOutOfRangeException` if the `Year`, `Month`, `Day` combination does not form a valid calendar date when `Day` granularity or finer is used.

### Custom Filter

`SpreadCustomFilter` applies one or two comparison criteria joined by a logical operator.

| Property | Type | Description |
|---|---|---|
| `Criteria1` | `SpreadCustomFilterCriteria` | The first comparison criterion. |
| `Criteria2` | `SpreadCustomFilterCriteria` | An optional second criterion. |
| `LogicalOperator` | `SpreadLogicalOperator` | Combines the two criteria: `And` or `Or`. |

```csharp
// Single criterion.
new SpreadCustomFilter(new SpreadCustomFilterCriteria(SpreadComparisonOperator.GreaterThan, "100"))

// Two criteria with logical operator.
new SpreadCustomFilter(
    new SpreadCustomFilterCriteria(SpreadComparisonOperator.GreaterThanOrEqualsTo, "10"),
    SpreadLogicalOperator.And,
    new SpreadCustomFilterCriteria(SpreadComparisonOperator.LessThan, "500"))
```

`SpreadCustomFilterCriteria` defines a single comparison:

| Property | Type | Description |
|---|---|---|
| `ComparisonOperator` | `SpreadComparisonOperator` | `EqualsTo`, `NotEqualsTo`, `GreaterThan`, `GreaterThanOrEqualsTo`, `LessThan`, or `LessThanOrEqualsTo`. |
| `FilterValue` | `string` | The value to compare against. Empty strings are allowed. Use `*` (any character sequence) and `?` (single character) as wildcards. Prefix a literal asterisk, question mark, or tilde with `~`. |

>note `SpreadCustomFilterCriteria` throws `ArgumentNullException` if `filterValue` is `null`.

### Top 10 Filter

`SpreadTop10Filter` keeps the top or bottom N rows by count or percentage.

| Property | Type | Description |
|---|---|---|
| `FilterType` | `SpreadTop10FilterType` | `TopNumber`, `BottomNumber`, `TopPercent`, or `BottomPercent`. |
| `Value` | `double` | The count or percentage threshold. Must be a finite number greater than zero. |

```csharp
new SpreadTop10Filter(SpreadTop10FilterType.TopNumber, 10)
```

>note `SpreadTop10Filter` throws `ArgumentException` when `Value` is `NaN` or `Infinity`, and `ArgumentOutOfRangeException` when `Value` is less than or equal to zero.

### Dynamic Filter

`SpreadDynamicFilter` selects rows based on date/time periods or statistical measures relative to the current date.

| Property | Type | Description |
|---|---|---|
| `DynamicFilterType` | `SpreadDynamicFilterType` | The type of dynamic filter. |

```csharp
new SpreadDynamicFilter(SpreadDynamicFilterType.ThisMonth)
```

The following table lists the available `SpreadDynamicFilterType` values.

| Value | Description |
|---|---|
| `None` | No filter applied. |
| `AboveAverage` / `BelowAverage` | Rows with values above or below the column average. |
| `Today` / `Yesterday` / `Tomorrow` | Rows whose date falls on today's, yesterday's, or tomorrow's date. |
| `ThisWeek` / `LastWeek` / `NextWeek` | Rows falling in the current, previous, or next calendar week (Sunday start). |
| `ThisMonth` / `LastMonth` / `NextMonth` | Rows falling in the current, previous, or next calendar month. |
| `ThisQuarter` / `LastQuarter` / `NextQuarter` | Rows falling in the current, previous, or next calendar quarter (year-agnostic). |
| `ThisYear` / `LastYear` / `NextYear` | Rows falling in the current, previous, or next calendar year. |
| `YearToDate` | Rows from January 1 of the current year through today. |
| `Quarter1` – `Quarter4` | Rows whose date falls in Q1–Q4, regardless of year. |
| `January` – `December` | Rows whose date falls in the specified month, regardless of year. |

## Exporting AutoFilter

### Setting an AutoFilter Range

To add AutoFilter drop-down arrows to a header row without defining filter rules, call `SetAutoFilter` with the row and column indices. You must call this method after all rows in the worksheet have been exported.

#### __Example 1: Set an AutoFilter Range__

```csharp
using (Telerik.Documents.SpreadsheetStreaming.IWorkbookExporter workbookExporter =
    SpreadExporter.CreateWorkbookExporter(SpreadDocumentFormat.Xlsx, stream))
{
    using (IWorksheetExporter worksheetExporter =
        workbookExporter.CreateWorksheetExporter("Sheet 1"))
    {
        using (IRowExporter headerRow = worksheetExporter.CreateRowExporter())
        {
            using (ICellExporter cell = headerRow.CreateCellExporter()) { cell.SetValue("Name"); }
            using (ICellExporter cell = headerRow.CreateCellExporter()) { cell.SetValue("Department"); }
            using (ICellExporter cell = headerRow.CreateCellExporter()) { cell.SetValue("Salary"); }
        }

        // Export data rows...

        // Apply AutoFilter to the range A1:C11 after all rows are written.
        worksheetExporter.SetAutoFilter(0, 0, 10, 2);
    }
}
```

The AutoFilter drop-down arrows appear on the header row when you open the file in Excel, but all rows remain visible.

>important `SetAutoFilter` must be called after all rows have been exported. Calling it before rows are written, or calling it more than once per worksheet, throws `InvalidOperationException`.

### Setting an AutoFilter with Filter Definitions

To control which rows are visible, create a `SpreadAutoFilter` with one or more `SpreadFilterColumn` entries and pass it to the `SetAutoFilter` overload that accepts a `SpreadAutoFilter`. Call this method after all rows have been exported.

#### __Example 2: Set an AutoFilter with a Values Filter__

```csharp
List<SpreadFilterColumn> filterColumns = new List<SpreadFilterColumn>(1)
{
    new SpreadFilterColumn(1, new SpreadValuesFilter(new string[] { "Engineering", "Marketing" }))
};

SpreadAutoFilter autoFilter = new SpreadAutoFilter(0, 0, 10, 2, filterColumns);

using (IWorksheetExporter worksheetExporter = workbookExporter.CreateWorksheetExporter("Sheet 1"))
{
    // Export rows...

    worksheetExporter.SetAutoFilter(autoFilter);
}
```

When the document is opened in Excel, the Department column (offset 1 relative to column 0) shows only the "Engineering" and "Marketing" rows.

#### __Example 3: Set an AutoFilter with a Custom Filter__

```csharp
SpreadCustomFilterCriteria criteria1 =
    new SpreadCustomFilterCriteria(SpreadComparisonOperator.GreaterThanOrEqualsTo, "30000");
SpreadCustomFilterCriteria criteria2 =
    new SpreadCustomFilterCriteria(SpreadComparisonOperator.LessThan, "80000");

List<SpreadFilterColumn> filterColumns = new List<SpreadFilterColumn>(1)
{
    new SpreadFilterColumn(2, new SpreadCustomFilter(criteria1, SpreadLogicalOperator.And, criteria2))
};

SpreadAutoFilter autoFilter = new SpreadAutoFilter(0, 0, 10, 2, filterColumns);

using (IWorksheetExporter worksheetExporter = workbookExporter.CreateWorksheetExporter("Sheet 1"))
{
    // Export rows...

    worksheetExporter.SetAutoFilter(autoFilter);
}
```

Only rows where the Salary column value is at least 30000 and less than 80000 are visible in Excel.

### Filtering with Automatic Row Hiding

Use `BeginFiltering` and `EndFiltering` to let `RadSpreadStreamProcessing` evaluate the filter rules and hide non-matching rows automatically as you write them. 

**Call sequence:**
1. Export the header row.
2. Call `BeginFiltering` with the `SpreadAutoFilter` whose `FromRowIndex` equals the header row index.
3. Export the data rows. Non-matching rows are hidden automatically.
4. Call `EndFiltering`.

>important `BeginFiltering` must be called immediately after the header row. Calling it when data rows already exist after the header row throws `InvalidOperationException`. Calling `BeginFiltering` after `SetAutoFilter`, or calling `BeginFiltering` twice without `EndFiltering`, also throws `InvalidOperationException`.

>note When the `SpreadAutoFilter` passed to `BeginFiltering` has `ToRowIndex` equal to `FromRowIndex` (header-only range), the range automatically extends to the last data row written before `EndFiltering`.

>tip If you dispose the worksheet exporter without calling `EndFiltering`, the filtering block completes automatically. The filter definition and hidden row states are still written to the file.

>caution `SpreadTop10Filter` and `SpreadDynamicFilter` require the full dataset to evaluate. When used inside a `BeginFiltering` block, no rows are hidden (all rows remain visible), but the filter definition is still written to the file so Excel can apply it when the user opens the document.

#### __Example 4: Export with Automatic Row Hiding (Values Filter)__

```csharp
List<SpreadFilterColumn> filterColumns = new List<SpreadFilterColumn>(1)
{
    // RelativeColumnIndex = 1 targets the Department column (FromColumnIndex 0 + offset 1).
    new SpreadFilterColumn(1, new SpreadValuesFilter(new string[] { "Engineering" }))
};

// Pass FromRowIndex = 0 (the header row) and ToRowIndex = 0.
// The range auto-extends to the last data row on EndFiltering.
SpreadAutoFilter autoFilter = new SpreadAutoFilter(0, 0, 0, 1, filterColumns);

using (IWorksheetExporter worksheetExporter = workbookExporter.CreateWorksheetExporter("Sheet 1"))
{
    // Step 1: Write the header row.
    using (IRowExporter headerRow = worksheetExporter.CreateRowExporter())
    {
        using (ICellExporter cell = headerRow.CreateCellExporter()) { cell.SetValue("Name"); }
        using (ICellExporter cell = headerRow.CreateCellExporter()) { cell.SetValue("Department"); }
    }

    // Step 2: Begin filtering immediately after the header row.
    worksheetExporter.BeginFiltering(autoFilter);

    // Step 3: Write data rows. Rows where Department (column 0) is not "Engineering"
    // are automatically hidden in the output document.
    string[][] data = new string[][]
    {
        new string[] { "Alice", "Engineering" },
        new string[] { "Bob", "Marketing" },
        new string[] { "Carol", "Engineering" },
        new string[] { "Dave", "Sales" }
    };

    foreach (string[] record in data)
    {
        using (IRowExporter row = worksheetExporter.CreateRowExporter())
        {
            using (ICellExporter cell = row.CreateCellExporter()) { cell.SetValue(record[0]); }
            using (ICellExporter cell = row.CreateCellExporter()) { cell.SetValue(record[1]); }
        }
    }

    // Step 4: End filtering.
    worksheetExporter.EndFiltering();
}
```

The "Bob" (Marketing) and "Dave" (Sales) rows are hidden in the exported file. The AutoFilter drop-down on the Department column reflects the active filter.

#### __Example 5: Filtering Multiple Columns (AND Logic)__

When multiple `SpreadFilterColumn` entries are present in the `SpreadAutoFilter`, a row must satisfy all column filters to remain visible.

```csharp
List<SpreadFilterColumn> filterColumns = new List<SpreadFilterColumn>(2)
{
    new SpreadFilterColumn(0, new SpreadValuesFilter(new string[] { "East" })),
    new SpreadFilterColumn(1, new SpreadValuesFilter(new string[] { "Apple" }))
};

SpreadAutoFilter autoFilter = new SpreadAutoFilter(0, 0, 0, 1, filterColumns);

using (IWorksheetExporter worksheetExporter = workbookExporter.CreateWorksheetExporter("Sheet 1"))
{
    using (IRowExporter headerRow = worksheetExporter.CreateRowExporter())
    {
        using (ICellExporter cell = headerRow.CreateCellExporter()) { cell.SetValue("Region"); }
        using (ICellExporter cell = headerRow.CreateCellExporter()) { cell.SetValue("Product"); }
    }

    worksheetExporter.BeginFiltering(autoFilter);

    string[][] rows = new string[][]
    {
        new string[] { "East", "Apple" },   // visible
        new string[] { "East", "Banana" },  // hidden (Product does not match)
        new string[] { "West", "Apple" },   // hidden (Region does not match)
        new string[] { "West", "Cherry" }   // hidden (neither matches)
    };

    foreach (string[] record in rows)
    {
        using (IRowExporter row = worksheetExporter.CreateRowExporter())
        {
            using (ICellExporter cell = row.CreateCellExporter()) { cell.SetValue(record[0]); }
            using (ICellExporter cell = row.CreateCellExporter()) { cell.SetValue(record[1]); }
        }
    }

    worksheetExporter.EndFiltering();
}
```

Only the "East / Apple" row is visible. All other rows are hidden because they fail at least one column filter.

#### __Example 6: Using Formulas with Cached Values__

When a filtered cell contains a formula, pass the pre-computed result as the second argument to `SetFormula`. The cached value is used for filter evaluation. A formula cell without a cached value always keeps the row visible.

```csharp
List<SpreadFilterColumn> filterColumns = new List<SpreadFilterColumn>(1)
{
    new SpreadFilterColumn(0, new SpreadCustomFilter(
        new SpreadCustomFilterCriteria(SpreadComparisonOperator.GreaterThan, "100")))
};

SpreadAutoFilter autoFilter = new SpreadAutoFilter(0, 0, 0, 0, filterColumns);

using (IWorksheetExporter worksheetExporter = workbookExporter.CreateWorksheetExporter("Sheet 1"))
{
    using (IRowExporter headerRow = worksheetExporter.CreateRowExporter())
    using (ICellExporter cell = headerRow.CreateCellExporter())
    {
        cell.SetValue("Total");
    }

    worksheetExporter.BeginFiltering(autoFilter);

    // Cached value "50" is used for evaluation: 50 is not > 100, so this row is hidden.
    using (IRowExporter row = worksheetExporter.CreateRowExporter())
    using (ICellExporter cell = row.CreateCellExporter())
    {
        cell.SetFormula("1+1", "50");
    }

    // Cached value "150" is used for evaluation: 150 > 100, so this row is visible.
    using (IRowExporter row = worksheetExporter.CreateRowExporter())
    using (ICellExporter cell = row.CreateCellExporter())
    {
        cell.SetFormula("100+50", "150");
    }

    worksheetExporter.EndFiltering();
}
```

For more details on the `SetFormula` overload, see [Cells]({%slug radspreadstreamprocessing-model-cells%}#set-a-formula-with-a-cached-value).

## Importing AutoFilter

After iterating all rows of an imported worksheet, read the `AutoFilter` property of `IWorksheetImporter` to retrieve the `SpreadAutoFilter` applied to that worksheet.

>important Access the `AutoFilter` property only after all rows of the worksheet have been consumed. The property returns `null` when no AutoFilter is defined.

#### __Example 7: Read AutoFilter on Import__

```csharp
using (Telerik.Documents.SpreadsheetStreaming.IWorkbookImporter workbookImporter =
    SpreadImporter.CreateWorkbookImporter(SpreadDocumentFormat.Xlsx, stream))
{
    foreach (IWorksheetImporter worksheetImporter in workbookImporter.WorksheetImporters)
    {
        // Consume all rows first.
        foreach (IRowImporter rowImporter in worksheetImporter.Rows)
        {
            foreach (ICellImporter cellImporter in rowImporter.Cells)
            {
                // Process cell data.
            }
        }

        // Access AutoFilter only after all rows have been consumed.
        SpreadAutoFilter autoFilter = worksheetImporter.AutoFilter;
        if (autoFilter != null)
        {
            System.Console.WriteLine(
                "AutoFilter: rows {0}–{1}, columns {2}–{3}",
                autoFilter.FromRowIndex, autoFilter.ToRowIndex,
                autoFilter.FromColumnIndex, autoFilter.ToColumnIndex);

            foreach (SpreadFilterColumn col in autoFilter.FilterColumns)
            {
                System.Console.WriteLine(
                    "  Column offset {0}: {1}",
                    col.RelativeColumnIndex,
                    col.Filter.GetType().Name);
            }
        }
    }
}
```

## See Also

* [Worksheet]({%slug radspreadstreamprocessing-model-worksheet%})
* [Cells]({%slug radspreadstreamprocessing-model-cells%})
* [Rows]({%slug radspreadstreamprocessing-model-rows%})
* [Worksheet View Exporter]({%slug radspreadstreamprocessing-features-worksheetviewexporter%})
