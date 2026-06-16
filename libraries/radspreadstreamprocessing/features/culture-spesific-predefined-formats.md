---
title: Culture Specific Predefined Formats 
page_title: Culture Specific Predefined Formats
description: Learn how to use the predefined culture-specific format strings in RadSpreadStreamProcessing to apply localized number, currency, and date formats.
slug: radspreadstreamprocessing-features-culture-spesific-predefined-formats
tags: culture, formats, spread, stream, processing, spreadsheet, number, currency, localization, predefined
published: True
position: 4
---

# Culture Specific Predefined Formats 

Starting with R3 2021, `SpreadStreamProcessing` exposes the `BuiltInNumberFormats` static class. This class contains several methods that allow you to get a set of predefined formats. These formats are culture-specific and depend on the current culture of the operating system. For example, if you set a currency format, you get the currency symbol for the current culture. The following methods are available:

|Method|Format in en-US culture|Description|
|---|---|---|
|`GetGeneral`|General|Generates the General number format string.|
|`GetNumber`|0|Generates a Number number format string.|
|`GetNumber1`|0.00|Generates a Number number format string with 2 decimal places and no thousand separator.|
|`GetNumber2`|#,##0|Generates a Number number format string with zero decimal places and a thousand separator.|
|`GetNumber3`|#,##0.00|Generates a Number number format string with 2 decimal places and a thousand separator.|
|`GetCurrency`|$#,##0_);($#,##0)|Generates a Currency number format string with no decimal places, and positive and negative format patterns and alignment.|
|`GetCurrency1`|$#,##0_);\[Red]($#,##0)|Generates a Currency number format string with no decimal places, and positive and negative format with red digits patterns and alignment.|
|`GetCurrency2`|$#,##0.00_);($#,##0.00)|Generates a Currency number format string with two decimal places, and positive and negative format patterns and alignment.|
|`GetCurrency3`|$#,##0.00_);\[Red]($#,##0.00)|Generates a Currency number format string with two decimal places, and positive and negative format with red digits patterns and alignment.|
|`GetPercent`|0%|Generates a Percent number format string.|
|`GetPercent1`|0.00%|Generates a Percent number format string with 2 decimal places and no thousand separator.|
|`GetScientific`|0.00E+00|Generates a culture-dependent Scientific number format string.|
|`GetFraction`|# ?/?|Generates a Fraction number format for up to one digit.|
|`GetFraction1`|# ??/??|Generates a Fraction number format for up to two digits.|
|`GetShortDate`|m/d/yyyy|Generates a Date number format for short date.|
|`GetDayMonthYear`|d-mmm-yy|Generates a Date number format with day, month, and year.|
|`GetDayMonth`|d-mmm|Generates a Date number format with day and month.|
|`GetMonthYear`|mmm-yy|Generates a Date number format with month and year.|
|`GetHourMinuteAMPM`|h:mm AM/PM|Generates a Time number format with hours, minutes, and AM/PM.|
|`GetHourMinuteSecondAMPM`|h:mm:ss AM/PM|Generates a Time number format with hours, minutes, seconds, and AM/PM.|
|`GetHourMinute`|h:mm|Generates a Time number format with hours and minutes.|
|`GetHourMinuteSecond`|h:mm:ss|Generates a Time number format with hours, minutes, and seconds.|
|`GetShortDateHourMinute`|m/d/yyyy h:mm|Generates a Time number format with short date, hours, and minutes.|
|`GetDayMonthLongYear`|m/d/yyyy|Generates a Date number format with day, month, and year.|
|`GetNumber4`|#,##0_);(#,##0)|Generates a Currency number format string with no decimal places, a thousand separator, and positive and negative format pattern and alignment.|
|`GetNumber5`|#,##0_);\[Red](#,##0)|Generates a Currency number format string with no decimal places, a thousand separator, and positive and negative format with red digits patterns and alignment.|
|`GetNumber6`|#,##0.00_);(#,##0.00)|Generates a Currency number format string with two decimal places, a thousand separator, and positive and negative format pattern and alignment.|
|`GetNumber7`|#,##0.00_);\[Red](#,##0.00)|Generates a Currency number format string with two decimal places, a thousand separator, and positive and negative format with red digits patterns and alignment.|
|`GetCurrency4`|_(*#,##0_);_(*(#,##0);_(* "-"_);_(@_)||
|`GetCurrency5`|_($*#,##0_);_($*(#,##0);_($* "-"_);_(@_)||
|`GetCurrency6`|_(*#,##0.00_);_(*(#,##0.00);_(*"-"??_);_(@_)||
|`GetCurrency7`|_($*#,##0.00_);_($*(#,##0.00);_($*\"-\"??_);_(@_)||
|`GetScientific2`|##0.0E+0||


## Working with the BuiltInNumberFormats Class

The following example demonstrates how you can get a specific format and set it when exporting a cell.

**Example 1: Using the BuiltInNumberFormats Class**

<snippet id='codeblock-dkt'/>

## See Also

* [Cells]({%slug radspreadstreamprocessing-model-cells%})
* [Workbook]({%slug radspreadstreamprocessing-model-workbook%})
