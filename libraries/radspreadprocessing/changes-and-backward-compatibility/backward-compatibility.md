---
title: Backwards Compatibility
description: Breaking changes and migration guidance for upgrading RadSpreadProcessing between versions.
page_title: Backwards Compatibility
slug: radspreadprocessing-backwards-compatibility
tags: migration, compatibility, radspreadprocessing, breaking, spreadsheet, excel, versions, upgrade
published: True
position: 1
---

# Backward Compatibility

The following list describes breaking changes introduced in each version and the steps to resolve them when you upgrade.

## What Is Different in 2023 R1

### Changed

Removed method `void Add(T)` of `SeriesCollectionOfT`.

### What to Do Now

Use the other overrides of the `SeriesCollectionOfT.Add()` method.

### Changed

The `ShapeCollection` of the Worksheet is now `ChartCollection`.

### What to Do Now

Use the single `ChartCollection.Add()` method for adding entries.

## What Is Different in 2022 R3

### Changed

The parameterless constructors of the following classes are obsolete:

* `TwoColorScaleValueContext`
* `ThreeColorScaleValueContext`
* `FiveIconSetValueContext`
* `FourIconSetValueContext`
* `ThreeIconSetValueContext`

### What to Do Now

Use the constructor with parameters instead.

### Changed

The `UpdateConditionalFormattingCellRanges` method is marked obsolete.

### What to Do Now

Use the combination of `RemoveConditionalFormatting` and `AddConditionalFormatting` instead.

## What Is Different in 2022 R2

### Changed

The following types are now moved to the namespace `Telerik.Windows.Documents.Spreadsheet.Model.ConditionalFormattings`:

* `Telerik.Windows.Documents.Spreadsheet.Model.ConditionalFormatting`
* `Telerik.Windows.Documents.Spreadsheet.Model.DataBarAxisPosition`
* `Telerik.Windows.Documents.Spreadsheet.Model.PresetIconSet`
* `Telerik.Windows.Documents.Spreadsheet.Model.IconDefinition`

### What to Do Now

Change the full name of the types:

* `Telerik.Windows.Documents.Spreadsheet.Model.ConditionalFormattings.ConditionalFormatting`
* `Telerik.Windows.Documents.Spreadsheet.Model.ConditionalFormattings.DataBarAxisPosition`
* `Telerik.Windows.Documents.Spreadsheet.Model.ConditionalFormattings.PresetIconSet`
* `Telerik.Windows.Documents.Spreadsheet.Model.ConditionalFormattings.IconDefinition`

### Changed

`IconSetRule.IsReversed` is now read-only.

### What to Do Now

Set the `IsReversed` property through the constructor of `IconSetRule`.

### Changed

The `Telerik.Windows.Documents.Spreadsheet.Model.FilteredShapeCollection.Changing` event arguments type changed from `ShapeCollectionChangedEventArgs` to `ShapeCollectionChangingEventArgs`.

### What to Do Now

Replace the old event arguments type with the new one.

## What Is Different in 2019 R2

### Changed

The `Values` and `Categories` properties moved from `SeriesBase` to `CategorySeriesBase`.

### What to Do Now

Use the properties exposed in `CategorySeriesBase`.

## What Is Different in 2019 R1 SP1

### Changed

`IPdfChartRenderer` now uses `FloatingChartShape` instead of `DocumentChart`. `FloatingChartShape` contains UI information for the chart such as Width, Height, Outline, and Fill.

### Changed

The method `GetBitmapSourceFromChartModel()` in `ChartModelToImageConverter` is deleted.

### What to Do Now

Use the `GetBitmapSourceFromFloatingChartShape` methods, which accept `FloatingChartShape` instead of `DocumentChart`. The [Export Chart](https://github.com/telerik/document-processing-sdk/tree/master/SpreadProcessing/ExportChart) example in the SDK repository shows a possible approach.

## What Is Different in 2018 R2

### Changed

The default value of `Telerik.Windows.Documents.Spreadsheet.Model.Printing.SheetPageSetupBase.PaperType` changed from `A4` to `Letter`.

### What to Do Now

If you need to keep the document with A4 `PaperType`, apply this setting before exporting:

**Set PaperType**

<snippet id='libraries-spread-changes-and-backward-compatibility-backward-compatibility'/>

## What Is Different in 2016 R3

### Changed

Assemblies with a version number ending with .45 suffix are not distributed.

### What to Do Now

Use the assemblies with a version number ending with .40 suffix. The library does not contain code specific for .NET Framework 4.5, so an additional version is not needed.

## What Is Different in 2016 Q1

### Changed

`Telerik.Windows.Maths.dll` is removed and integrated in `Telerik.Windows.Documents.Spreadsheet`.

### Changed

`Telerik.Windows.Maths.InterpolationExtensions` is now internal.

### Changed

`Telerik.Windows.Maths.RVector` is now internal.

### Changed

`Telerik.Windows.Documents.Spreadsheet.Expressions.Functions.FunctionBase.Evaluate(RadExpression[] arguments)` method is obsolete.

### What to Do Now

Use `Telerik.Windows.Documents.Spreadsheet.Expressions.Functions.FunctionBase.Evaluate(FunctionEvaluationContext context)` instead.

### Changed

`Telerik.Windows.Documents.Spreadsheet.Expressions.Functions.FunctionBase.EvaluateOverride(RadExpression[] arguments)` is obsolete.

### What to Do Now

Use `Telerik.Windows.Documents.Spreadsheet.Expressions.Functions.FunctionBase.EvaluateOverride(FunctionEvaluationContext context)` instead.

### Changed

`Telerik.Windows.Documents.Spreadsheet.Expressions.Functions.FunctionWithArguments.EvaluateOverride(object[] arguments)` is obsolete.

### What to Do Now

Use `Telerik.Windows.Documents.Spreadsheet.Expressions.Functions.FunctionWithArguments.EvaluateOverride(FunctionEvaluationContext<object> context)` instead.

### Changed

`Telerik.Windows.Documents.Spreadsheet.Expressions.Functions.FunctionWithSameTypeArguments<T>.EvaluateOverride(T[] arguments)` is obsolete.

### What to Do Now

Use `Telerik.Windows.Documents.Spreadsheet.Expressions.Functions.FunctionWithSameTypeArguments<T>.EvaluateOverride(FunctionEvaluationContext<T> context)` instead.

## What Is Different in 2015 Q2

### Changed

`Telerik.Windows.Documents.Spreadsheet.Layout.Layers.WorksheetRenderUpdateContext.ViewportPaneTypeToVisibleCellBoxes` property is removed.

### What to Do Now

Use `Telerik.Windows.Documents.Spreadsheet.Layout.Layers.WorksheetRenderUpdateContext.VisibleCellLayoutBoxes` property instead.

### Changed

`Telerik.Windows.Documents.Spreadsheet.Measurement.FontManager` is removed.

### What to Do Now

Use the `Telerik.Windows.Documents.Core.Fonts.SystemFontsManager` class instead.

### Changed

`Telerik.Windows.Documents.Spreadsheet.Model.SpreadsheetNameCollectionScope.Name` property is removed.

### Changed

`Telerik.Windows.Documents.Spreadsheet.Model.SelectionState.SelectionState(IEnumerable selectedRanges, CellIndex activeCellIndex)` constructor is removed.

### Changed

Use `Telerik.Windows.Documents.Spreadsheet.Model.SelectionState.SelectionState(IEnumerable selectedRanges, CellIndex activeCellIndex, ViewportPaneType pane)` constructor instead.

### Changed

`Telerik.Windows.Documents.Spreadsheet.Utilities.UnitHelper.EMUsToDIP(int value)` is removed.

### What to Do Now

Use `EmuToDip(double value)` method instead.

## What Is Different in 2014 Q3

### Changed

The default value of the `IsEnabled` property of the `WorkbookHistory` class changed to `false`.

### What to Do Now

Enable the history of a Workbook by setting the property to `true`.

### Changed

The `Width`, `Height`, and `RotationAngle` properties of the `FloatingShapeBase` class no longer update the `CellIndex`, `OffsetX`, and `OffsetY` properties.

### What to Do Now

If you need these properties to update automatically, use the `SetWidth`, `SetHeight`, and `SetRotationAngle` methods with the `adjustCellIndex` parameter set to `true`.

### Changed

The `String Name` property of `SpreadsheetNameCollectionScope` is marked obsolete.

### What to Do Now

The property is related to the `RadSpreadsheet` UI control and is not used in the processing library.
