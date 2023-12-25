---
title: Device Independent Pixels
description: Device Independent Pixels (DIPs) measuremnt unit.
page_title:  Device Independent Pixels
slug: device-independent-pixels
position: 0
published: True
tags: dip, dips, device, independent, pixels, measurement, unit, SpreadProcessing, WordsProcessing, PdfProcessing  
---
# Device Independent Pixels

[Device Independent Pixels](https://en.wikipedia.org/wiki/Device-independent_pixel) (DIPs) is a unit type used in the Document Processing libraries in the following cases:

* SpreadProcessing - setting the width of the columns and the height of the rows.
* PdfProcessing - setting the FontSize of TextFragment or TextProperties.
* WordsProcessing - setting the FontSize of a Run.

### UnitHelper class

The [UnitHelper](https://docs.telerik.com/devtools/document-processing/api/telerik.windows.documents.spreadsheet.utilities.unithelper) class provides a bunch of methods for converting from DIPs to other measurement units and vice versa (e.g. points, picas, centimeters, inches, etc.).

#### Convert From Dip to Unit:
* **DipToPoint**: Converts dips to points.
* **DipToPointI**: Converts dips to points.
* **DipToPica**: Converts dips to picas.
* **DipToCm**: Converts dips to centimeters.
* **DipToMm**: Converts dips to millimeters.
* **DipToInch**: Converts dips to inches.
* **DipToTwip**: Converts dips to twips.
* **DipToEmu**: Converts dips to EMUs.
* **DipToTwipI**: Converts dips to twips.
* **DipToTwipF**: Converts dips to twips.
* **DipToUnit**: Converts DIPs to units.

#### Convert From Unit to Dip:
* **PointToDip**: Converts points to dips.
* **PicaToDip**: Converts to points dips.
* **EmuToDip**: Converts EMUs to dips.
* **CmToDip**: Converts centimeters to dips.
* **MmToDip**: Converts millimeters to dips.
* **InchToDip**: Converts inches to dips.
* **TwipToDip**: Converts twips to dips.
* **TwipToDipF**: Converts twips to dips.
* **TwipToDipI**: Converts twips to dips.
* **UnitToDip**: Converts Units to dips.

Most of the methods follow the same pattern for converting units:

__Example 1__ shows how to convert from DIP to Point and set the row height.    

#### __[C#] Example 1: Convert from DIP to Point__

{{region dips_1}}

	double points = UnitHelper.DipToPoint(80);
	RowHeight newRowHeight = new RowHeight(points, isCustom: true);
	worksheet.Rows[0].SetHeight(newRowHeight);
{{endregion}}

except the **DipToUnit** and **UnitToDip** methods which accepts not only the units but the [UnitType](https://docs.telerik.com/devtools/document-processing/api/telerik.windows.documents.media.unittype) as well as a parameter:

__Example 2__ shows how to convert from Point to DIP and set the row height.    

#### __[C#] Example 2: Convert from Point to DIP__

{{region dips_2}}

	double dips = UnitHelper.UnitToDip(60, UnitType.Point);
	RowHeight newRowHeight = new RowHeight(dips, isCustom: true);
	worksheet.Rows[0].SetHeight(newRowHeight);
{{endregion}}
