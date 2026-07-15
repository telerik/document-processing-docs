---
title: Number Formatting
description: Learn how to apply predefined number formats to cells in RadSpreadProcessing to control how numeric values, dates, currencies, and percentages are displayed.
page_title: Number Formatting
slug: radspreadprocessing-features-number-formats
tags: number, formats, spreadsheet, radspreadprocessing, cells, formatting, numeric, display, codes, spread, xlsx, formatting
published: True
position: 11
---


# Number Formatting

Applying different formats to a number changes the appearance of the number. A format does not change the value it is applied to. It only changes the way the value appears in the cell. The following sections explain how to use the predefined number formats.

>note For more information on how to create your own number format or modify one of the predefined types, see the [Format Codes]({%slug radspreadprocessing-features-format-codes%}) article.


## Available Number Formats

The document model exposes the following categories of predefined formats:

* **General format**: The default number format applied to a number. Typically, numbers formatted with this format are displayed exactly as they are typed. If the number has 12 or more digits, the General number format applies scientific notation.

* **Number format**: Used for the general display of numbers. The format specifies the number of decimal places and indicates whether a thousands separator is used. Additionally, the Number format specifies how negative numbers are displayed.

* **Currency format**: Used for general monetary values. Numbers in this format are displayed with the default currency symbol. The format specifies the number of decimal places and indicates whether a thousands separator is used. Additionally, the Currency format specifies how negative numbers are displayed.

* **Accounting format**: Used for monetary values. Unlike the Currency format, it aligns the currency symbols and the values in a column. The format specifies the number of decimal places used.

* **Date format**: Treats a number as date and time serial number and displays it as a date value.

* **Time format**: Treats a number as date and time serial number and displays it as a time value.

* **Percentage format**: Displays the cell value multiplied by 100 and followed by a percent (%) symbol. The format specifies the number of decimal places used.

* **Fraction format**: Displays a cell value as a fraction.

* **Scientific format**: Displays a number in scientific notation. The number is transformed into a real number followed by E+n, where E (which stands for Exponent) multiplies the real number by 10 to the nth power. For example, a 2-decimal scientific format displays 12345678901 as 1.23E+10, which is 1.23 times 10 to the 10th power. The format specifies the number of decimal places used.

* **Text format**: Treats the content of a cell as text and displays the content exactly as it is typed.

* **Special format**: Designed to display numbers as postal codes (ZIP Code), phone numbers, or Social Security numbers.

* **Custom format**: Allows modifying any of the predefined formats. The format also allows creating a new custom number format that is added to the list of number format codes. For more information, see the [Format Codes]({%slug radspreadprocessing-features-format-codes%}) article.

> The Date, Time, and Currency formats are influenced by your OS regional settings. For more information, see [Localization](https://docs.telerik.com/devtools/document-processing/libraries/radspreadprocessing/features/format-codes.html#localization).

## Applying a Number Format

The number format is represented by the `CellValueFormat` class. You can set it to a given `CellSelection` object through its `SetFormat()` method.

> When working with `CellValueFormat`, keep in mind that its constructor accepts a culture-dependent format and converts it to culture-independent format using the current thread format settings (for example, in Bulgarian culture a format passed as 0,00 is converted to 0.00).

The following examples demonstrate how to apply a predefined format to a `CellSelection`:

**Example 1: Apply the General number format**

<snippet id='codeblock-cjy'/>

**Example 1** produces the following result:
![Telerik Document Processing RadSpreadProcessing worksheet cell displaying a value with the General number format](images/RadSpreadProcessing_Features_Number_Formatting_00.jpg)

**Example 2: Apply a Number format**

<snippet id='codeblock-cjz'/>

**Example 2** produces the following result:
![Telerik Document Processing RadSpreadProcessing worksheet cell displaying a numeric value with decimal places in the Number format](images/RadSpreadProcessing_Features_Number_Formatting_01.jpg)

**Example 3: Apply a Currency format**

<snippet id='codeblock-cka'/>

**Example 3** produces the following result:
![Telerik Document Processing RadSpreadProcessing worksheet cell displaying a currency value with a dollar symbol](images/RadSpreadProcessing_Features_Number_Formatting_02.jpg)

**Example 4: Apply an Accounting format**

<snippet id='codeblock-ckb'/>

**Example 4** produces the following result:
![Telerik Document Processing RadSpreadProcessing worksheet cell displaying an accounting value with an aligned currency symbol](images/RadSpreadProcessing_Features_Number_Formatting_03.jpg)

**Example 5: Apply a Date format**

<snippet id='codeblock-ckc'/>

**Example 5** produces the following result:
![Telerik Document Processing RadSpreadProcessing worksheet cell displaying a serial value formatted as a date](images/RadSpreadProcessing_Features_Number_Formatting_04.jpg)

To show **milliseconds** in **Date Format**, modify the predefined format as follows: _"m/d/yyyy HH:mm:ss.SSS"_. For more information on how to create your own number format or modify one of the predefined types, see the [Format Codes]({%slug radspreadprocessing-features-format-codes%}) article.

**Example 6: Apply a Time format**

<snippet id='codeblock-ckd'/>

**Example 6** produces the following result:
![Telerik Document Processing RadSpreadProcessing worksheet cell displaying a serial value formatted as a time](images/RadSpreadProcessing_Features_Number_Formatting_05.jpg)

To show **milliseconds** in **Time Format**, modify the predefined format as follows: _"HH:mm:ss.SSS"_. For more information on how to create your own number format or modify one of the predefined types, see the [Format Codes]({%slug radspreadprocessing-features-format-codes%}) article.

**Example 7: Apply a Percentage format**

<snippet id='codeblock-cke'/>

**Example 7** produces the following result:
![Telerik Document Processing RadSpreadProcessing worksheet cell displaying a percentage value](images/RadSpreadProcessing_Features_Number_Formatting_06.jpg)

**Example 8: Apply a Fraction format**

<snippet id='codeblock-ckf'/>

**Example 8** produces the following result:
![Telerik Document Processing RadSpreadProcessing worksheet cell displaying a decimal value formatted as a fraction](images/RadSpreadProcessing_Features_Number_Formatting_07.jpg)

**Example 9: Apply a Scientific format**

<snippet id='codeblock-ckg'/>

**Example 9** produces the following result:
![Telerik Document Processing RadSpreadProcessing worksheet cell displaying a number in scientific notation](images/RadSpreadProcessing_Features_Number_Formatting_08.jpg)

**Example 10: Apply a Text format**

<snippet id='codeblock-ckh'/>

**Example 10** produces the following result:
![Telerik Document Processing RadSpreadProcessing worksheet cell displaying content preserved with the Text format](images/RadSpreadProcessing_Features_Number_Formatting_09.jpg)

**Example 11: Apply a Special format**

<snippet id='codeblock-cki'/>

**Example 11** produces the following result:
![Telerik Document Processing RadSpreadProcessing worksheet cell displaying a value formatted as a postal code with the Special format](images/RadSpreadProcessing_Features_Number_Formatting_10.jpg)

**Example 12: Apply a Custom format**

<snippet id='codeblock-ckj'/>

**Example 12** produces the following result:
![Telerik Document Processing RadSpreadProcessing worksheet cell displaying a value with a custom number format](images/RadSpreadProcessing_Features_Number_Formatting_11.jpg)

For more information on how to create your own number format or modify one of the predefined types, see the [Format Codes]({%slug radspreadprocessing-features-format-codes%}) article.

## Retrieving a Number Format

You can retrieve the number format of any cell selection through the `GetFormat()` method of the `CellSelection` class. The method returns an object of type `RangePropertyValue<CellValueFormat>`, which exposes two properties:

* `IsIndeterminate`: Determines if the `CellValueFormat` is consistent among all cells in the specified `CellSelection`. If the `CellValueFormat` is one and the same for all cells, `IsIndeterminate` is set to false. If the `CellValueFormat` varies throughout the cells in the `CellSelection`, the `IsIndeterminate` property is set to true and the `Value` property of the `RangePropertyValue<T>` object is set to its default value.

* `Value`: Holds the `CellValueFormat` for the cells. If the `IsIndeterminate` property is set to false, `Value` contains the `CellValueFormat` of the whole `CellSelection` region. If the `IsIndeterminate` property is set to true, the `CellValueFormat` is not the same for all cells in the `CellSelection` and the `Value` property is set to the default `CellValueFormat`.

**Example 13** demonstrates how to get the number format of cell *A1*:

**Example 13: Get the number format from a cell selection**

<snippet id='codeblock-ckk'/>


