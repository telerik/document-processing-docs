---
title: Names (Named Ranges)
description: Learn how to create, use, and manage named ranges in RadSpreadProcessing spreadsheet documents.
page_title: Names (Named Ranges)
slug: radspreadprocessing-features-named-ranges
tags: named, ranges, spreadsheet, radspreadprocessing, cells, names, references, workbook, formulas, spread, xlsx
published: True
position: 10
---

# Names (Named Ranges)



The following sections introduce the concept of Names (Named Ranges) in the document model and demonstrate how to add, use, and remove names:
      

* [What is a Name?](#what-is-a-name)

* [Types of Names](#types-of-names)

* [Add and Use Defined Names](#add-and-use-a-defined-name)

* [Remove Defined Names](#remove-defined-names)

## What Is a Name

Names in the context of the document model serve as variables. Each name can be assigned any value that can be stored in a cell: a number or text constant, a formula, or a cell reference. Also, names add meaning to the value they contain. For example, a name object called *CorporateTax* with value 0.16 is more informative than a cell containing the 16 percent constant. In the same way, using a name called *Income* provides relevant information about its contents compared to the range G11:K27.
        

All names conform to the `ISpreadsheetName` interface. The interface exposes the following properties:
        

* `Name`: String property that determines the name of the spreadsheet name.
            

* `Scope`: Property of type `SpreadsheetNameCollectionScope` that indicates the scope of the name. More information about the name scope is available in the [Name Scope subsection](#name-scope).
            

* `Comment`: String property that contains the comment of the name.
            

* `RefersTo`: String property that contains the raw string value of the name. When you create a new name, the `RefersTo` string is parsed and stored as the value of the name.
            

* `Value`: String property that determines how the result value of the name appears.
            

### Names Syntax Rules

There are several syntax rules for the name object `Name` property:
            

* Each name must be unique in its scope. Names are case insensitive, so two name objects with names 'range1' and 'RANGE1' cannot reside within the same scope.
                

* The first letter of a name can be a letter, an underscore character (_), or a backslash (\\).
                

* The names cannot be cell references such as A1, D$2.
                

* Spaces are not valid characters.
                

### Name Scope

Both `Workbook` and `Worksheet` classes expose a `Names` property of type `NameCollection` that allows you to add and remove names. Adding a name to any of these collections positions the newly added name in a given scope – this can be either the workbook or any of the worksheets.
            

The scope of a name refers to the location within which the name is recognized without qualification. For example, if you create the name *Tax* with scope Sheet1, you can use it within the sheet without a qualifier. If you want to use it in the other worksheets, you need to add a qualification: *Sheet1!Tax*. If the scope of the Tax name is the workbook, you can access it without qualification throughout the workbook.
            

A qualifier for a workbook name is required only if the current worksheet contains a name object with the same name property. For example, if both the workbook and sheet2 contain a name called Tax, and you access the name without a qualifier in sheet2, by default the local name object is referred. To access the workbook Tax from sheet2, use the name with a qualifier: *Book1!Tax*.
            

## Types of Names

The document model has support only for Defined Names.
        

**Defined name**: A name that can contain any value that can be stored in a cell: a number or text constant, a formula, or a cell reference. You can create your own defined names. You can edit the name, value, and comment of the already created defined name. However, you cannot change its scope.
        

## Add and Use a Defined Name

**Example 1** demonstrates how to add and use defined names. The code creates a workbook with one worksheet containing four values. Further, the example adds one global name called CorporateTax containing a constant value of 16 percent and a local GrossProfit name referring to the four values stored in Sheet1. Also, the cell A5 is assigned a value that uses both GrossProfit and CorporateTax names.
        

**Example 1: Add and Use Names**

<snippet id='libraries-spread-features-named-ranges-1'/>

> Other than the name, the `RefersTo` value and the comment parameter, the `Add` method requires a cell index. The reason for this is that with some defined names, the cell index associated with their creation is relevant to the resulting value. More specifically, this is the case when the `RefersTo` property includes a relative cell reference. For example, in the case of a name where the `RefersTo` field is "=C3" (as opposed to "=$C$3") and the cell index is CellIndex(0,0), that is A1, the defined name always points two rows lower and two columns to the right of the current cell it is used in: if you enter =Name in A1, A1 has the value of C3 and if you enter the same in B2, it has the value of D4.
>
The `RefersTo` parameter is of type string and thus provides great flexibility in specifying the value of the defined name. It can be a cell range or a number, as it is in the example, or a text value or a function. Any string which can successfully be parsed to a formula can be passed for this parameter.


## Remove Defined Names

The `NameCollection` class exposes a `Remove()` method that takes a string parameter specifying the name which can be used to delete names. After you delete the names, all names that contain them in their values return the `#NAME?` error.
        

**Example 2** shows how to remove one of the names added in **Example 1**.
        

**Example 2: Remove Name**

<snippet id='libraries-spread-features-named-ranges-2'/>


## See Also

* [Data Validation]({%slug radspreadprocessing-features-data-validation%})
* [Sorting]({%slug radspreadprocessing-features-sorting%})
* [Filtering]({%slug radspreadprocessing-features-filtering%})