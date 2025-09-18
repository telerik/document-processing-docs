---
title: Setting List DataValidation Rule to Reference Cell Range in SpreadProcessing
description: Learn how to set up List Data Validation rules in Telerik Document Processing's SpreadProcessing library to reference a cell range instead of using a comma-delimited list.
type: how-to
page_title: Creating List Data Validation Rules Using Cell Ranges in SpreadProcessing
meta_title: Creating List Data Validation Rules Using Cell Ranges in SpreadProcessing
slug: spreadprocessing-list-data-validation-cell-range
tags: spreadprocessing, list, data, validation, rule, cell, range, telerik, document, processing, libraries
res_type: kb
ticketid: 1695747
---

# Environment
| Version | Product | Author | 
| --- | --- | ---- | 
| 2025.3.806 | RadSpreadProcessing |[Yoan Karamanov](https://www.telerik.com/blogs/author/yoan-karamanov)| 

## Description

This article describes how to set a [List Data Validation]({%slug radspreadprocessing-features-data-validation%}#list-rule) rule in the [SpreadProcessing]({%slug radspreadprocessing-overview%}) library that uses a cell range as the validation source instead of a comma-delimited list of values. This avoids the 256-character limit imposed by Excel for comma-separated values.

This knowledge base article also answers the following questions:
- How to define validation rules with a cell range in SpreadProcessing?
- How to bypass the character limit in validation rules by using cell ranges?
- How to set up list validation using cell ranges in Telerik's SpreadProcessing?

## Solution

To set a [List Data Validation]({%slug radspreadprocessing-features-data-validation%}#list-rule) rule that references a cell range, use the **ListDataValidationRule** and specify the cell range as the **Argument1**. Follow the steps below:

1. Import the workbook using the [XlsxFormatProvider]({%slug radspreadprocessing-formats-and-conversion-xlsx-xlsxformatprovider%}).
2. Specify the cell where the validation rule will apply using [CellIndex]({%slug radspreadprocessing-working-with-cells-accessing-cells-of-worksheet%}#accessing-cells-of-a-worksheet).
3. Define the validation parameters, including the cell range for allowed values.
4. Create and assign the [ListDataValidationRule]({%slug radspreadprocessing-features-data-validation%}#list-rule) to the target cell.
5. Export the updated workbook using the [XlsxFormatProvider]({%slug radspreadprocessing-formats-and-conversion-xlsx-xlsxformatprovider%}).

Here is an example:

```csharp
// Import the workbook
Workbook workbook;
IWorkbookFormatProvider xlsxFormatProvider = new XlsxFormatProvider();

using (Stream input = new FileStream("input.xlsx", FileMode.Open))
{
    workbook = xlsxFormatProvider.Import(input, TimeSpan.FromSeconds(10));
}

// Access the worksheet
var worksheet = workbook.Worksheets[0];

// Define the cell to apply validation
CellIndex dataValidationRuleCellIndex = new CellIndex(4, 4);

// Configure the validation rule context
ListDataValidationRuleContext context = new ListDataValidationRuleContext(worksheet, dataValidationRuleCellIndex);
context.InputMessageTitle = "Restricted input";
context.InputMessageContent = "The input is restricted to the week days.";
context.ErrorStyle = ErrorStyle.Stop;
context.ErrorAlertTitle = "Wrong value";
context.ErrorAlertContent = "The entered value is not valid. Allowed values are the week days!";
context.InCellDropdown = true;

// Set the cell range as the validation source
context.Argument1 = "=$A$1:$A$26";

// Create and apply the validation rule
ListDataValidationRule rule = new ListDataValidationRule(context);
worksheet.Cells[dataValidationRuleCellIndex].SetDataValidationRule(rule);

// Export the workbook
string xlsxOutputPath = "output.xlsx";
using (Stream output = new FileStream(xlsxOutputPath, FileMode.Create))
{
    xlsxFormatProvider.Export(workbook, output, TimeSpan.FromSeconds(10));
}
```

# See Also

* [Data Validation]({%slug radspreadprocessing-features-data-validation%}#data-validation)
* [List Rule]({%slug radspreadprocessing-features-data-validation%}#list-rule)
* [SpreadProcessing Overview]({%slug radspreadprocessing-overview%})
