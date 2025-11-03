---
title: Simulating a Checkbox with Conditional Formatting in Telerik SpreadProcessing
description: Learn how to simulate a checkbox using conditional formatting with Telerik SpreadProcessing.
type: how-to
page_title: Simulating a Checkbox Using Conditional Formatting with Telerik SpreadProcessing
meta_title: Simulating a Checkbox Using Conditional Formatting with Telerik SpreadProcessing
slug: spreadprocessing-simulating-checkbox-conditional-formatting
tags: spread, processing, conditional, formatting, check, box, telerik, document, xlsx
res_type: kb
ticketid: 1667088
---

## Environment

|Product Version|Product|Author|
|----|----|----|
|2025.3.806|[SpreadProcessing]({%slug radspreadprocessing-overview%})|[Yoan Karamanov](https://www.telerik.com/blogs/author/yoan-karamanov)|

## Description

This article describes how to use the [SpreadProcessing]({%slug radspreadprocessing-overview%}) library to simulate a checkbox by using conditional formatting rules. The goal is to display a checked symbol (☑) when the cell value is **1** and an unchecked symbol (☐) when the cell value is **0**. 

This knowledge base article also answers the following questions:
- How to simulate checkbox behavior in Telerik SpreadProcessing?
- How to use conditional formatting for representing checkboxes?
- How to display different symbols based on cell values in Telerik SpreadProcessing?

## Solution

To simulate a checkbox using conditional formatting in Telerik SpreadProcessing, apply two separate conditional formatting rules: one for the `checked` state and one for the `unchecked` state.

1. Create a [Workbook]({%slug radspreadprocessing-working-with-workbooks-what-is-workbook%}) and add a worksheet.
2. Define a [DifferentialFormatting]({%slug radspreadprocessing-features-conditional-formatting%}) for the checked state with a format that displays "☑".
3. Create an **EqualToRule** for the checked state, matching cells with a value of **1**.
4. Apply the conditional formatting rule to the cell.
5. Define another **DifferentialFormatting** for the unchecked state with a format that displays "☐".
6. Create an **EqualToRule** for the unchecked state, matching cells with a value of **0**.
7. Apply the second conditional formatting rule to the cell.
8. Set the cell value to **1** or **0** to test the checkbox simulation.
9. Export the workbook to an XLSX file.

![Conditional Formatting CheckBox](images/conditional-formatting-checkbox.png) 

Here’s an example implementation:

```csharp
Workbook workbook = new Workbook();
Worksheet worksheet = workbook.Worksheets.Add();

// Define formatting for checked state
DifferentialFormatting checkedFormatting = new DifferentialFormatting();
checkedFormatting.CellValueFormat = new CellValueFormat("☑");
EqualToRule checkedRule = new EqualToRule("1", checkedFormatting);
ConditionalFormatting checkedConditionalFormatting = new ConditionalFormatting(checkedRule);
worksheet.Cells[0, 0].AddConditionalFormatting(checkedConditionalFormatting);

// Define formatting for unchecked state
DifferentialFormatting uncheckedFormatting = new DifferentialFormatting();
uncheckedFormatting.CellValueFormat = new CellValueFormat("☐");
EqualToRule uncheckedRule = new EqualToRule("0", uncheckedFormatting);
ConditionalFormatting uncheckedConditionalFormatting = new ConditionalFormatting(uncheckedRule);
worksheet.Cells[0, 0].AddConditionalFormatting(uncheckedConditionalFormatting);

// Set initial value to simulate checkbox
worksheet.Cells[0, 0].SetValue(1);

// Export workbook to XLSX file
string xlsxOutputPath = "output.xlsx";
IWorkbookFormatProvider xlsxFormatProvider = new XlsxFormatProvider();

using (Stream output = new FileStream(xlsxOutputPath, FileMode.Create))
{
    xlsxFormatProvider.Export(workbook, output, TimeSpan.FromSeconds(10));
}
```

## See Also

* [Conditional Formatting]({%slug radspreadprocessing-features-conditional-formatting%})
* [Workbook]({%slug radspreadprocessing-working-with-workbooks-what-is-workbook%})
* [Using XlsxFormatProvider]({%slug radspreadprocessing-formats-and-conversion-xlsx-xlsxformatprovider%})
