---
title: Custom Functions
description: Learn how to create custom formula functions in RadSpreadProcessing to extend the built-in function library.
page_title: Custom Functions
slug: radspreadprocessing-features-formulas-custom-functions
tags: custom, functions, formulas, spreadsheet, radspreadprocessing, extension, plugin, calculation, spread, xlsx
published: True
position: 5
---

# Custom Functions



The following sections describe the possible approaches for creating a custom function:

* [Inheriting FunctionBase Abstract Class](#inheriting-functionbase-abstract-class)

* [Functions Inheritance Tree](#functions-inheritance-tree)

* [ArgumentConversionRules](#argumentconversionrules)

* [FunctionInfo](#functioninfo)

* [Custom Function Examples](#custom-function-examples)

* [Array Lifting](#array-lifting)

## Inheriting FunctionBase Abstract Class

The document model provides a powerful API for creating custom functions. All functions must inherit from the abstract `FunctionBase` class, which provides basic methods and properties for each function instance.

The following are the basic `FunctionBase` members:

* `Name`: Property of type `String` that defines the name of the function. The property is used for registering the function, so the name must be unique (case insensitive). If a function with a repeating name is registered, it overrides the previous function registered with this name.

* `FunctionInfo`: Property of type `FunctionInfo` that provides a description of the function and its arguments. For more information, see [FunctionInfo](#functioninfo).

* `ArgumentConversionRules`: Property describing how different argument types are interpreted. The functions API works with five argument types (Logical, Number, Text, Reference, and Array) and each function may interpret each of these argument types differently. For more information, see [ArgumentConversionRules](#argumentconversionrules).

* `Evaluate` and `EvaluateOverride` methods: The methods where the function calculations take place. To define a custom function, override the `EvaluateOverride` method so that you can later obtain the function calculation value through the `Evaluate` method.

* `LiftsOverArrays`: Virtual property of type `bool`. When `true`, `FunctionBase` automatically evaluates the function **element-wise** over any multi-element array argument and returns a spilled array result. Override and return `true` for pure scalar functions where pointwise lifting matches dynamic-array behavior. For more information, see [Custom Functions and Array Lifting](#custom-functions-and-array-lifting).

* `IsSpillingArgument(int argumentIndex, RadExpression argument)`: Virtual method that determines whether the argument at `argumentIndex` can cause the function to return a multi-element array and therefore spill. The default implementation returns `true` only when the argument itself can return a multi-element array. Override this method to restrict spilling to specific argument positions. For more information, see [Custom Functions and Array Lifting](#custom-functions-and-array-lifting).

Additionally, each custom function needs to be registered through the `FunctionManager` class. Pass an instance of the function class to the static `Register()` method.

**Example 1** shows how to register a function class `ArgumentsFunction`, an inheritor of `FunctionBase`.

**Example 1: Register a custom function with FunctionManager**

<snippet id='codeblock-cms'/>



## Functions Inheritance Tree

The document model provides an inheritance tree of classes that offer ready-to-use features for different function types, depending on the function arguments and the desired result.

**Figure 1** shows the base abstract function classes.

**Figure 1: Custom function inheritance hierarchy for FunctionBase and typed function helpers**

![Telerik Document Processing RadSpreadProcessing custom function inheritance diagram showing FunctionBase, FunctionWithArguments, FunctionWithSameTypeArguments<T>, StringsInFunction, NumbersInFunction, and BooleansInFunction](images/RadSpreadProcessing_Features_Formulas_Custom_Functions_01.png)

* `FunctionBase`: Provides the base function properties (`Name`, `FunctionInfo`, `ArgumentConversionRules`). Also provides the logic of the `IsArgumentNumberValid()` method which handles the scenario when an invalid arguments count is passed by the user. By inheriting `FunctionBase` you must override the `EvaluateOverride(FunctionEvaluationContext<RadExpression> context)` method, so you need to handle the full logic of converting `RadExpression` arguments to function arguments. Arguments are accessed via `context.Arguments`.

* `FunctionWithArguments`: Handles the basic logic of converting a `RadExpression` value to another value type corresponding to the `ArgumentType` defined in the `FunctionInfo` property. By inheriting from this class, you need to override the `EvaluateOverride(object[] arguments)` method and handle an array of already converted function argument values.

* `FunctionWithSameTypeArguments<T>`: By inheriting this class, you need to override the `EvaluateOverride(T[] arguments)` method and handle an array of arguments with the same type T.

* `StringInFunctions`, `NumbersInFunction`, `BooleansInFunction`: These classes inherit directly from `FunctionWithSameTypeArguments<String>`, `FunctionWithSameTypeArguments<double>`, and `FunctionWithSameTypeArguments<bool>`. Use them when the function requires the respective argument type (String, double, or Boolean).
            

## ArgumentConversionRules

The `ArgumentConversionRules` class provides properties that describe how different function argument types are interpreted. The functions API works with five argument types (Logical, Number, Text, Reference, and Array) and each function may interpret each of these argument types differently. Additionally, RadSpreadProcessing differentiates between **direct arguments** (values passed directly into the formula) and **indirect arguments** (values that depend on some other cells referencing).

`ArgumentConversionRules` has the following properties:

* `EmptyDirectArgument`: The `ArgumentInterpretation` of an Empty cell value, passed as a direct argument.

* `NumberDirectArgument`: The `ArgumentInterpretation` of a Number cell value, passed as a direct argument.

* `BoolDirectArgument`: The `ArgumentInterpretation` of a Boolean cell value, passed as a direct argument.

* `TextNumberDirectArgument`: The `ArgumentInterpretation` of a String cell value that can be parsed to a number, passed as a direct argument.

* `NonTextNumberDirectArgument`: The `ArgumentInterpretation` of a String cell value that cannot be parsed to a number, passed as a direct argument.

* `EmptyIndirectArgument`: The `ArgumentInterpretation` of an Empty cell value, passed as an indirect argument.

* `NumberIndirectArgument`: The `ArgumentInterpretation` of a Number cell value, passed as an indirect argument.

* `BoolIndirectArgument`: The `ArgumentInterpretation` of a Boolean cell value, passed as an indirect argument.

* `TextNumberIndirectArgument`: The `ArgumentInterpretation` of a String cell value that can be parsed to a number, passed as an indirect argument.

* `NonTextNumberIndirectArgument`: The `ArgumentInterpretation` of a String cell value that cannot be parsed to a number, passed as an indirect argument.

* `ArrayArgument`: The `ArrayArgumentInterpretation`.

The values of these properties come from the [ArgumentInterpretation](https://docs.telerik.com/devtools/document-processing/api/Telerik.Windows.Documents.Spreadsheet.Expressions.Functions.ArgumentInterpretation.html) and [ArrayArgumentInterpretation](https://docs.telerik.com/devtools/document-processing/api/Telerik.Windows.Documents.Spreadsheet.Expressions.Functions.ArrayArgumentInterpretation.html) enumerations and are set through the constructor of `ArgumentConversionRules`. The default values of these interpretations in the constructor are `ArgumentInterpretation.UseAsIs` and `ArrayArgumentInterpretation.UseFirstElement`.

**Example 2** creates an instance of `ArgumentConversionRules`:

**Example 2: Create ArgumentConversionRules for custom function inputs**

<snippet id='codeblock-cmt'/>



## FunctionInfo

The `FunctionInfo` class provides properties that describe the purpose of the function and each of its arguments.

`FunctionInfo` has the following properties:

* `Category`: The `FunctionCategory` to which the function belongs.

* `Description`: Description of the function as a string value.

* `RequiredArgumentsCount`: Returns the number of required arguments of the function. If the user passes fewer arguments than the `RequiredArgumentsCount`, an error is raised.

* `OptionalArgumentsCount`: Returns the count of the optional arguments group.

* `OptionalArgumentsRepetitionCount`: Returns the number of repetitions of the optional group. The valid count of all arguments depends on this value by satisfying the following conditions:

* When `OptionalArgumentsRepetitionCount <= 1`:

* `ValidArgumentsCount >= RequiredArgumentsCount`

* `ValidArgumentsCount <= RequiredArgumentsCount + OptionalArgumentsCount`

* When `OptionalArgumentsRepetitionsCount > 1`:

* `ValidArgumentsCount = RequiredArgumentsCount + i * OptionalArgumentsCount`

* `i >= 0`

* `i <= OptionalArgumentsRepetitionsCount`

* `i is integer number`

* `IsDefaultValueFunction`: Returns a Boolean value that indicates whether the function is a default value function.

* When `true`: The function returns some default value when all passed values have `ArgumentInterpretation.Ignore` in `ArgumentConversionRules` of the function.

* When `false`: The function returns `ErrorExpressions.ValueError` when all passed values are not valid, even if they have `ArgumentInterpretation.Ignore` in `ArgumentConversionRules` of the function.

* `Format`: Returns the `CellValueFormat` of the function result, if the result needs specific formatting (for example, DateTime or Currency).

**Example 3** shows how to create an instance of the `FunctionInfo` class.

**Example 3: Create FunctionInfo metadata for a custom function**

<snippet id='codeblock-cmu'/>



## Custom Function Examples

The following example defines a custom function named "ARGUMENTS" that inherits from the `FunctionBase` class. In the `FunctionInfo` definition, the function has three required arguments and three optional arguments with `optionalArgumentsRepeatsCount` equal to 3.

The result of the function calculations is the number of arguments passed to the function, as shown in the `EvaluateOverride()` method.

**Example 4** shows how to create the "ARGUMENTS" function.

**Example 4: Create the ARGUMENTS custom function**

<snippet id='codeblock-cmv'/>



The following example defines a custom function named "E" that inherits from the `FunctionBase` class. The function takes no arguments and always returns the Napier constant.

**Example 5** shows how to create the "E" function.

**Example 5: Create a custom function that returns Napier's constant**

<snippet id='codeblock-cmw'/>



>tip You can download a runnable project with the previous and several other custom function examples from the [SDK repository on GitHub](https://github.com/telerik/xaml-sdk/tree/master/Spreadsheet/WPF/CustomFunctions).
          

## Array Lifting

You can control how your custom function interacts with dynamic array formulas through two `FunctionBase` members: `LiftsOverArrays` and `IsSpillingArgument`.

### LiftsOverArrays

Override `LiftsOverArrays` and return `true` to make the `FunctionBase` infrastructure automatically evaluate your function **element-wise** over any multi-element array argument. The results are collected into a result array that the formula engine then spills into the worksheet.

Use this for pure scalar functions where applying the function to each element individually produces the correct result. For example, a custom `DOUBLE` function that doubles a number would naturally lift: `=DOUBLE({1;2;3})` returns `{2;4;6}` and spills into three cells.

**Example 6: Implementing a custom function with array lifting**

```csharp
public class DoubleFunction : FunctionBase
{
    public static readonly string FunctionName = "DOUBLE";
    private static readonly FunctionInfo DoubleInfo;

    static DoubleFunction()
    {
        string description = "Returns the number multiplied by two.";
        IEnumerable<ArgumentInfo> requiredArguments = new[]
        {
            new ArgumentInfo("number", "The number to multiply by two.", ArgumentType.Number)
        };
        DoubleInfo = new FunctionInfo(FunctionName, FunctionCategory.MathTrig, description, requiredArguments);
    }

    public override string Name => FunctionName;
    public override FunctionInfo FunctionInfo => DoubleInfo;
    public override bool LiftsOverArrays => true;

    protected override RadExpression EvaluateOverride(FunctionEvaluationContext<RadExpression> context)
    {
        double value = ((NumberExpression)context.Arguments[0]).Value;
        return new NumberExpression(value * 2);
    }
}
```

Register the function as usual:

```csharp
FunctionManager.RegisterFunction(new DoubleFunction());
```

Entering `=DOUBLE({1;2;3})` in a cell now spills the values 2, 4, and 6 into three cells.

### IsSpillingArgument

Override `IsSpillingArgument(int argumentIndex, RadExpression argument)` to restrict which arguments can drive the function to produce a multi-element result. The default implementation returns `true` for arguments that can potentially produce a multi-element array (such as range references), and `false` for scalar constants. Override this when only specific argument positions should trigger element-wise evaluation:

```csharp
public override bool IsSpillingArgument(int argumentIndex, RadExpression argument)
{
    // Only the first argument (index 0) can cause the function to return an array.
    return argumentIndex == 0;
}
```

### Access the first range in a custom function

To access the first range, use the public `CellReferenceRanges` collection and convert the first `CellReferenceRange` to a `CellRange`:

```csharp
CellReferenceRangeExpression referenceExpression = context.Arguments[0] as CellReferenceRangeExpression;
if (referenceExpression == null || referenceExpression.CellReferenceRanges.Count == 0)
{
    return ErrorExpressions.ValueError;
}

CellReferenceRange firstRange = referenceExpression.CellReferenceRanges[0];
CellRange cellRange = firstRange.ToCellRange();
```

If you need the evaluated values instead of the range coordinates, evaluate the expression and inspect the first nested `ArrayExpression`:

```csharp
ArrayExpression rangesValue = referenceExpression.GetValue() as ArrayExpression;
if (rangesValue == null || rangesValue.RowCount == 0 || rangesValue.ColumnCount == 0)
{
    return ErrorExpressions.ValueError;
}

ArrayExpression firstRangeArray = rangesValue[0, 0] as ArrayExpression;
```

`ArrayExpression` exposes `RowCount`, `ColumnCount`, and an indexer for reading the evaluated expressions.

For the full description of spill behavior and the dynamic array model, see [Dynamic Array Formulas]({%slug radspreadprocessing-features-formulas-dynamic-array-formulas%}).

## See Also

* [Dynamic Array Formulas]({%slug radspreadprocessing-features-formulas-dynamic-array-formulas%})
* [Cell Value Types]({%slug radspreadprocessing-working-with-cells-cell-value-types%})
* [ArgumentInterpretation](https://docs.telerik.com/devtools/document-processing/api/Telerik.Windows.Documents.Spreadsheet.Expressions.Functions.ArgumentInterpretation.html)
* [ArrayArgumentInterpretation](https://docs.telerik.com/devtools/document-processing/api/Telerik.Windows.Documents.Spreadsheet.Expressions.Functions.ArrayArgumentInterpretation.html)
* [CustomFunctions SDK](https://github.com/telerik/xaml-sdk/tree/master/Spreadsheet/WPF/CustomFunctions)
* [Implementing SUMPRODUCT Function in SpreadProcessing]({%slug sumproduct-function-nested-array-formulas-telerik-spreadprocessing%})
* [Implementing TRANSPOSE(cells range) Function in SpreadProcessing]({%slug implementing-transpose-array-function-in-spreadprocessing%})
* [Implementing Custom Functions with a Cells Range as an Argument in SpreadProcessing]({%slug implementing-concat-array-function-in-spreadprocessing%})
