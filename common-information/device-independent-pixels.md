---
title: Device Independent Pixels
description: Device Independent Pixels (DIPs) measurement unit.
page_title:  Device Independent Pixels
slug: device-independent-pixels
position: 0
published: True
tags: dip, pixels, measurement, unit, radspreadprocessing, radpdfprocessing, radwordsprocessing, fonts
---
# Device Independent Pixels

[Device Independent Pixels](https://en.wikipedia.org/wiki/Device-independent_pixel) (DIPs) is a unit type used in the [Document Processing libraries]({%slug introduction%}) in the following cases:

* [RadSpreadProcessing]({%slug radspreadprocessing-overview%})&mdash;setting the width of the columns and the height of the rows.
* [RadPdfProcessing]({%slug radpdfprocessing-overview%})&mdash;setting the `FontSize` of `TextFragment` or `TextProperties`.
* [RadWordsProcessing]({%slug radwordsprocessing-overview%})&mdash;setting the `FontSize` of a `Run`.

## UnitHelper Class

The [UnitHelper](https://docs.telerik.com/devtools/document-processing/api/telerik.windows.documents.spreadsheet.utilities.unithelper) class provides several methods for converting from DIPs to other measurement units and vice versa (for example, points, picas, centimeters, and inches).

### Convert from DIP to Unit

| Method | Description |
|---|---|
| `DipToPoint` | Converts DIPs to points. |
| `DipToPointI` | Converts DIPs to points. |
| `DipToPica` | Converts DIPs to picas. |
| `DipToCm` | Converts DIPs to centimeters. |
| `DipToMm` | Converts DIPs to millimeters. |
| `DipToInch` | Converts DIPs to inches. |
| `DipToTwip` | Converts DIPs to twips. |
| `DipToEmu` | Converts DIPs to EMUs. |
| `DipToTwipI` | Converts DIPs to twips. |
| `DipToTwipF` | Converts DIPs to twips. |
| `DipToUnit` | Converts DIPs to units. |

### Convert from Unit to DIP

| Method | Description |
|---|---|
| `PointToDip` | Converts points to DIPs. |
| `PicaToDip` | Converts picas to DIPs. |
| `EmuToDip` | Converts EMUs to DIPs. |
| `CmToDip` | Converts centimeters to DIPs. |
| `MmToDip` | Converts millimeters to DIPs. |
| `InchToDip` | Converts inches to DIPs. |
| `TwipToDip` | Converts twips to DIPs. |
| `TwipToDipF` | Converts twips to DIPs. |
| `TwipToDipI` | Converts twips to DIPs. |
| `UnitToDip` | Converts units to DIPs. |

Most of the methods follow the same pattern for converting units.

The following example shows how to obtain row height as DIPs and convert it to points.

**Convert row height from DIPs to points**

```csharp
	var rowHeightInDips = worksheet.Rows[0].GetHeight().Value.Value;
	var rowHeightInPoints = UnitHelper.DipToPoint(rowHeightInDips);
```

The `DipToUnit` and `UnitToDip` methods accept not only the units but also the [UnitType](https://docs.telerik.com/devtools/document-processing/api/telerik.windows.documents.media.unittype) as a parameter:

The following example shows how to convert from points to DIPs and set the row height.

**Convert points to DIPs and set the row height**

```csharp
	double dips = UnitHelper.UnitToDip(60, UnitType.Point);
	RowHeight newRowHeight = new RowHeight(dips, isCustom: true);
	worksheet.Rows[0].SetHeight(newRowHeight);
```
