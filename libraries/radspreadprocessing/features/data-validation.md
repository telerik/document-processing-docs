---
title: Data Validation
description: Learn how to use data validation in RadSpreadProcessing to control the type and range of data users enter into spreadsheet cells.
page_title: Data Validation
slug: radspreadprocessing-features-data-validation
tags: data, validation, spreadsheet, radspreadprocessing, cells, rules, input, worksheet, excel, xlsx
published: True
position: 18
---

# Data Validation

*Data validation* controls the type of data or the values that users enter into a cell. Compared to [Protection]({%slug radspreadprocessing-features-protection-workbook%}), data validation does not restrict user input but ensures that the entered data complies with certain rules. For example, you can restrict input to a certain range of dates, whole numbers, decimal numbers, or a list of predefined values.

## Data Validation Rules

The data validation rules help you restrict user input. You can also set a message that appears when the cell containing the rule is selected in a spreadsheet UI control.

You can specify how the user is notified if the rule is not satisfied. There are three types of notifications:

* `Error`: If the user enters not valid data, a message box offers the following choices:
	* Retry: Try again.
	* Cancel the change.
* `Cancel`: If the user enters not valid data, a message box offers the following choices:
	* Yes: Override the warning and apply the change.
	* No: Try again. 
	* Cancel: Revert the change.
* `Information`: If the user enters not valid data, a message box offers the following choices:
	* OK: Override the warning and apply the change. 
	* Cancel: Revert the change.

## Data Validation Rule Types

The following data validation rule types are available: 

* Any value
* Whole number
* Decimal
* List
* Date
* Time
* Text length
* Custom

To create data validation rules, pass parameters to the rule through data validation rule contexts. There are several context types with different parameters for the different types of data validation rules.

### AnyValueDataValidationRuleContext 

The `AnyValueDataValidationRuleContext` class exposes the following properties:

* `ShowInputMessage`: Specifies whether to show the input message.
* `InputMessageTitle`: The title of the input message.
* `InputMessageContent`: The content of the input message.
* `ShowErrorMessage`: Specifies whether to show the error message.
* `ErrorStyle`: Specifies the style of the error message. The possible choices are *Error*, *Warning*, and *Information*. 

### SingleArgumentDataValidationRuleContext

`SingleArgumentDataValidationRuleContext` exposes the properties of the `AnyValueDataValidationRuleContext` class and extends them with the following:

* `IgnoreBlank`: Specifies if the validation ignores blank values, considering them as valid values.
* `Argument1`: The argument needed for the validation.
* `CellIndex`: The cell index of the cell based on which the validation rule is created.
* `Worksheet`: The worksheet in which the data validation rule is created.

### NumberDataValidationRuleContext  

`NumberDataValidationRuleContext` exposes the properties of the `SingleArgumentDataValidationRuleContext` class and extends them with the following:

* `ComparisonOperator`: The comparison operator used by the data validation rule.
* `Argument2`: The second argument needed by the data validation rule.

### ListDataValidationRuleContext

`ListDataValidationRuleContext` exposes the properties of the `SingleArgumentDataValidationRuleContext` class and extends them with the following:

* `InCellDropdown`: Specifies if a dropdown containing the list values of the data validation rule is shown.


## Any Value Rule

The any value data validation rule is the default rule. It applies to all cells and does not perform any data validation. You can specify an input message. The error message is never shown because all values are considered valid input in this rule.

**Example 1** shows how to create an any value validation rule and set it to a cell.

#### __Example 1: Apply Any Value Rule__

<snippet id='codeblock-chb'/>

The result from the code snippet in **Example 1** is shown in **Figure 1**.

#### Figure 1: Any value rule

![Any Value Rule Result](images/RadSpreadProcessing_Features_Data_Validation_01.png)

## Whole Number Rule

The whole number data validation rule allows you to restrict user input to whole numbers in a certain range. The range is specified using two arguments and a comparison operator. In some cases (for example, when restricting input to the range between 0 and 100) both arguments are used. In other cases (for example, restricting input to numbers greater than 100) only one argument is used. An option to ignore blank values is turned on by default.

The code snippet in **Example 2** shows how to create a whole number data validation rule that restricts user input to the range between 0 and 100 and considers blank values as not valid.

#### __Example 2: Apply Whole Number Rule with Two Arguments__

<snippet id='codeblock-chc'/>

The result from **Example 2** is shown in **Figure 2**.

#### Figure 2: Whole number rule

![Whole Number Rule](images/RadSpreadProcessing_Features_Data_Validation_02.png)

The result from entering value *"test"* in the cell containing the data validation rule is shown in **Figure 3**.

#### Figure 3: Whole number rule not valid result

![Whole Number Rule Invalid Result](images/RadSpreadProcessing_Features_Data_Validation_03.png)

The code snippet in **Example 3** shows how to create a whole number data validation rule that restricts user input with one argument to numbers greater than 100.

#### __Example 3: Apply Whole Number Rule with One Argument__

<snippet id='codeblock-chd'/>

You can enter any valid [formula]({%slug radspreadprocessing-features-formulas-general-information%}) as a rule argument that returns a number. **Example 4** shows how to restrict user input to the values less than the sum of the values in cells A1 and B1.

#### __Example 4: Apply Whole Number Rule with Formula__

<snippet id='codeblock-che'/>


#### Figure 4: Whole number rule based on formula

![Whole Number Rule Invalid Result](images/RadSpreadProcessing_Features_Data_Validation_04.png)

>Note that the cell index passed to the constructor of the `NumberDataValidationRuleContext` is the cell for which the rule is created. Consider the case in which an area from A2 to C5 is selected through the UI and the active cell is A2. You create the same rule as in **Example 4** but apply it for the cell range A2:C5. The formula "=SUM(A1+B1)" contains two relative cell references – A1 and B1. If you select the cell C5 and open the data validation dialog box, the formula that specifies the minimum value is "=SUM(C4+D4)" instead of "=SUM(A1+B1)". The relative references in the formula are translated relatively to the cell passed in the constructor of the data validation rule context.

## Decimal Rule

The decimal data validation rule allows you to restrict user input to decimal numbers in a certain range specified using two arguments and a comparison operator. The difference from the whole number rule is that the decimal rule allows both whole and decimal numbers in the cells.

**Example 5** demonstrates how to create a decimal data validation rule that restricts user input to values outside the range between 0 and 100.


#### __Example 5: Apply Decimal Rule__

<snippet id='codeblock-chf'/>

## List Rule

The list data validation rule allows you to restrict user input to a predefined set of values. Use the `InCellDropdown` property to specify if a dropdown list containing the values is shown next to the cell.

**Example 6** shows the creation of a list data validation rule that restricts user input to a day of the week.

#### __Example 6: Apply List Rule__

<snippet id='codeblock-chg'/>

**Figure 5** shows the result from **Example 6**.

#### Figure 5: List rule

![List Rule Result](images/RadSpreadProcessing_Features_Data_Validation_05.png)

## Date Rule

The date rule allows you to restrict user input to a certain range of dates specified using two arguments and a comparison operator.

**Example 7** shows how to restrict user input to the dates in the range between 12 February 2013 and 22 May 2017.

#### __Example 7: Apply Date Rule__

<snippet id='codeblock-chh'/>

## Time Rule

The time rule allows you to restrict user input to a certain range of times specified using two arguments and a comparison operator.

The code snippet in **Example 8** shows how to restrict user input to the range between 10:25 AM and 3:45 PM:

#### __Example 8: Apply Time Rule__

<snippet id='codeblock-chi'/>

## Text Length Rule

The text length rule allows you to restrict user input to text with a length in a certain range specified using two arguments and a comparison operator.

**Example 9** shows how to restrict user input to text with a length between 5 and 10 symbols.

#### __Example 9: Apply Text Length Rule__

<snippet id='codeblock-chj'/>

## Custom Rule

The custom rule allows you to restrict user input with a custom condition specified through a formula that results in a Boolean value.

The code snippet in **Example 10** shows how to restrict user input to values greater than or equal to the sum of the values in cells A1 and B1.

#### __Example 10: Apply Custom Rule__

<snippet id='codeblock-chk'/>

## Evaluate Rules

To check if a cell value satisfies a rule, evaluate the rule using the desired cell value. Each data validation rule implements the `IDataValidationRule` interface, which exposes the `Evaluate()` method. The method receives as parameters the worksheet in which the value is located, the cell index in which the value is placed or contained, and the value itself.

**Example 11** demonstrates how to evaluate a rule using the `Evaluate()` method.

#### __Example 11: Evaluate Rule__
<snippet id='codeblock-chl'/>


## See Also

* [Protection]({%slug radspreadprocessing-features-protection-workbook%})
* [Formulas]({%slug radspreadprocessing-features-formulas-general-information%})
* [Adding a ComboBox to an Excel File Using RadSpreadProcessing]({%slug adding-combobox-to-excel-file-radspreadprocessing%})
* [Setting List DataValidation Rule to Reference Cell Range in SpreadProcessing]({%slug spreadprocessing-list-data-validation-cell-range%})