---
title: Conditional Formatting
page_title: Conditional Formatting
slug: radspreadprocessing-features-conditional-formatting
tags: conditional, format, values
published: True
position: 7
---

# Conditional Formatting


The conditional formatting in spreadsheet documents helps you visualize the data inside in a user-friendly manner, making it easy to analyze data, find critical issues, patterns and trends.

A conditional format changes the appearance of cells based on conditions that you specify. If the conditions are true, the cell range is formatted; if the conditions are false, the cell range is not formatted. There are many built-in conditions, and you can also create your own (including by using a formula that evaluates to True or False).

This article describes the supported formatting rules, how to create and how to use them.

## Rules

SpreadProcessing supports many different types of formatting rules. Each rule implements the base **ConditionalFormattingRule** class. All of them are listed in **Table 1**.

#### Table 1: Supported formatting rules

| Rule | Description |
|---|---|
| ColorScaleRule | Specificies a gradient range of colors that is used to give additional meaning to data by assigning certain values to colors in the gradient spectrum. |
| DataBarRule | A graphical representation of the cells’ content. |
| IconSetRule | Specifies a collection of icons that can be used to comment and classify data into categories. |
| BetweenRule | This conditional formatting rule determines whether a cell value is inside a specified range. |
| NotBetweenRule | This conditional formatting rule determines whether a cell value is outside a specified range. |
| EqualsRule | Determines whether a cell value matches a specified value. |
| NotEqualsRule | Determines whether a cell value doesn't match a specified value. |
| GreaterThanOrEqualsRule | Determines whether a cell value matches specified value or it is greater. |
| GreaterThanRule | Determines whether a cell value is greater than the specified value. |
| LessThanOrEqualsRule | Determines whether a cell value matches specified value or it is smaller. |
| LessThanRule | Determines whether a cell value is smaller than the specified value. |
| HasErrorRule | Matches cell values that contain errors. |
| HasNoErrorRule | Matches cell values that do not contain errors. |
| BeginsWithRule | Matches cells whose values begin with a specified string. |
| EndsWith | Matches cells whose values end with a specified string. |
| ContainsBlanks | Matches blank cells. |
| NotContainsBlanks | Matches non-empty cells. |
| ContainsRule | This conditional formatting rule highlights cells containing given text. |
| NotContainsRule | This conditional formatting rule highlights cells that do not contain given text. |
| TopRule | This conditional formatting rule highlights cells whose values fall in the top N bracket. It can also work for N % instead of N items. It has two Boolean configuration properties: Items and Percent, which act like switches for these behaviors. |
| BottomRule | This conditional formatting rule highlights cells whose values fall in the bottom N bracket. It can also work for N % instead of N items. It has two Boolean configuration properties: Items and Percent, which act like switches for these behaviors. |
| DuplicateValuesRule | Matches values that are duplicate inside a specified range. |
| UniqueValuesRule | Matches values that are unique inside a specified range. |
| ValueDistributionRule | This conditional formatting rule highlights cells that are above or below the average for all values in the range. It has four Boolean configuration properties – AboveAverage, AboveOrEqualToAverage, BelowAverage, BelowOrEqualToAverage. |

## Create Formatting for a Rule

The **ConditionalFormattingRule** base class and all of its inheritors, expose the `Formatting` property. This property is of type `DifferentialFormatting` and holds the formatting that will be applied to all cells inside the range that fit the rule requirement. You can set the following properties:

- Font size
- Font family
- Fore color
- Bold
- Italic
- Underline
- Fill


#### [C#] Example: Create formatting

{{region}}

    GreaterThanOrEqualsRule rule = new GreaterThanOrEqualsRule(10);
    rule.Formatting.FontSize = 22;
    rule.Formatting.FontFamily = new ThemableFontFamily("Times New Roman");
    rule.Formatting.ForeColor = new ThemableColor(Colors.Red);
    rule.Formatting.IsBold = true;
    rule.Formatting.IsItalic= true;
    rule.Formatting.Fill = new PatternFill(PatternType.Solid, Color.FromArgb(255, 46, 204, 113), Colors.Transparent);
{{endregion}}


## Create and Apply Conditional Formatting Rule

Each of the classes listed in **Table 1** above expose constructors enabling you to instantiate the specific rule. The constructors of these classes take a `string` parameter allowing you to specify the values and conditions the rule must work with. You can pass any cell value for the parameter, inlcuding formulas.

#### [C#] Example: Create Between rule

{{region}}



{{endregion}}

#### [C#] Example: Create GreaterThanOrEqualsRule rule

{{region}}



{{endregion}}

#### [C#] Example: Create ColorScale rule

{{region}}



{{endregion}}

#### [C#] Example: Create DataBar rule

{{region}}



{{endregion}}

*Add many examples for creating rule + images*

## Get the Conditional Formatting from a CellRange

Any previously applied formatting can be obtained through the GetConditionalFormattings method of CellSelection. This method returns a collection of **ConditionalFormattingRange** object representing the formattings applied to the selection and the CellRange each formatting is applied on.

#### [C#] Example: Get formatting

{{region}}

    IEnumerable<ConditionalFormattingRange> formattingRanges = worksheet.Cells[0, 0, 10, 10].GetConditionalFormattings();
{{endregion}}

## Remove Conditional Formatting

Through the CellSelection, you can also remove the formatting from the selected cells.

#### [C#] Example: Remove formatting

{{region}}

    IEnumerable<ConditionalFormattingRange> formattingRanges = worksheet.Cells[0, 0, 10, 10].GetConditionalFormattings();
    
    foreach (ConditionalFormattingRange range in formattingRanges)
    {
        foreach (ConditionalFormatting format in range.Formattings)
        {
            worksheet.Cells[range.CellRange].RemoveConditionalFormattingRule(format);
        }
    }
{{endregion}}

## Resolve Conditional Formatting

Each of the formatting rule classes gives you the ability to evaluate the rule and obtain its result through the `Resolve` method.

For the rules that apply on all the values in the range, the return value is **between 0 and 1**, depending on where that value is positioned in the range of all values. Such rules are `ColorScaleRule`, `DataBarRule` and `IconSetRule`. For all other rules, the result of `Resolve` is **0 or 1**, depending on whether the specific cell value meets the rule requirements.

#### [C#] Example: Resolve conditional formatting rule

{{region}}

    ICellValue cellValue = worksheet.Cells[0, 0, 10, 10].GetValue().Value;
    bool isFormattingRuleApplied = rule.ResolveRule(cellValue) > 0;
{{endregion}}