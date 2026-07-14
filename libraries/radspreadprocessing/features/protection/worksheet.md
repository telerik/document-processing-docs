---
title: Worksheet Protection
description: Learn how to apply worksheet protection in RadSpreadProcessing to restrict user modifications to cell content and structure.
page_title: Worksheet Protection
slug: radspreadprocessing-features-protection-worksheet
tags: worksheet, protection, spreadsheet, radspreadprocessing, password, cells, security, xlsx, spread
published: True
position: 1
---

# Worksheet Protection

`Worksheet` protection restricts the user from modifying the content and structure of the worksheet. When a worksheet is protected, the user can edit only the cells that were explicitly marked as unlocked. Additionally, the model offers protection options that let you choose a set of commands available to the user when protection is enabled.

You can enforce worksheet protection with or without a password and you can always unprotect the workbook as needed. You can also let the user remove the protection by entering the correct password.

The protection functionality protects the worksheet content from editing. If you need to protect the document so that it can be opened only after providing a password, you must encrypt it. The encryption functionality is not yet supported in SpreadProcessing and you can vote for its implementation through the [public request](https://feedback.telerik.com/document-processing/1356022-spreadprocessing-implement-encryption-of-workbook).

## How to Protect and Unprotect a Worksheet

The `Worksheet` class exposes a `Protect()` method that takes two parameters: the password string and the worksheet protection options.

**Example 1** sets the `IsLocked` property of cell A1 to false and protects the worksheet with a password and the default protection options. By default all cells are locked. After the sheet is protected, the user can edit the value only in cell A1 as it is explicitly marked as unlocked.

**Example 1: Unlock cell A1 and protect the worksheet with the default options**

<snippet id='codeblock-cnd'/>



Use the `Unprotect(string)` method of the `Worksheet` class to remove the protection. The method returns a Boolean value that indicates whether the sheet is successfully unprotected.

**Example 2** demonstrates how to unprotect a worksheet.

**Example 2: Remove worksheet protection by passing the existing password**

<snippet id='codeblock-cne'/>



## Protection Options

The worksheet protection feature lets you specify a set of options available to the user when protection is enforced. For example, you may want to allow the user to insert and delete rows, but restrict the insertion and deletion of columns.

To achieve that, pass a `WorksheetProtectionOptions` instance as the second argument of the `Protect()` method.

**Example 3** demonstrates how to protect a worksheet with `WorksheetProtectionOptions`.

**Example 3: Allow row insertion and deletion while protecting the worksheet**

<snippet id='codeblock-cnf'/>



The `WorksheetProtectionOptions` class exposes the following properties so you can control what actions the users can perform:

| Property | Description |
|---|---|
| `AllowInsertColumns` | Gets a value indicating whether the user can insert columns when the worksheet is protected. |
| `AllowInsertRows` | Gets a value indicating whether the user can insert rows when the worksheet is protected. |
| `AllowDeleteColumns` | Gets a value indicating whether the user can delete columns when the worksheet is protected. |
| `AllowDeleteRows` | Gets a value indicating whether the user can delete rows when the worksheet is protected. |
| `AllowFormatCells` | Gets a value indicating whether the user can format cells when the worksheet is protected. |
| `AllowFormatColumns` | Gets a value indicating whether the user can format columns when the worksheet is protected. |
| `AllowFormatRows` | Gets a value indicating whether the user can format rows when the worksheet is protected. |
| `AllowFiltering` | Gets a value indicating whether the user can use autofilter when the worksheet is protected. |
| `AllowSorting` | Gets a value indicating whether the user can sort when the worksheet is protected. |


## See Also

* [What is a Worksheet?]({%slug radspreadprocessing-working-with-worksheets-what-is-worksheet%})
* [Workbook Protection]({%slug radspreadprocessing-features-protection-workbook%})
* [Protect Specific Worksheet Cells Using RadSpreadProcessing]({%slug radspreadprocessing-protect-specific-worksheet-cells%})
