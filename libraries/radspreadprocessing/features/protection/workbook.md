---
title: Workbook Protection
description: Learn how to protect the structure of a workbook in RadSpreadProcessing to prevent users from adding, removing, renaming, or reordering sheets.
page_title: Workbook Protection
slug: radspreadprocessing-features-protection-workbook
tags: workbook, protection, spreadsheet, radspreadprocessing, password, security, sheets
published: True
position: 0
components: [spreadprocessing]
---

# Workbook Protection

Workbook protection in RadSpreadProcessing prevents users from adding, removing, renaming, or reordering worksheets. You can protect the workbook with or without a password and remove the protection when needed.

Workbook protection affects the user interface only. When a workbook is protected, the user interface does not allow users to add, delete, reorder, or rename worksheets. As a developer, you retain full access to the workbook's sheets collection and can modify it in code.


## How to Protect a Workbook

To protect a workbook, call the `Protect(string)` method of the `Workbook` class. The method accepts a password string.

**Example 1** illustrates how to create a workbook from scratch and protect it with a password.

>important Workbook protection protects the workbook structure from editing. To require a password before users can open the document, you must encrypt it. SpreadProcessing does not support encryption yet. You can vote for this feature in the [workbook encryption public request](https://feedback.telerik.com/document-processing/1356022-spreadprocessing-implement-encryption-of-workbook).

**Example 1: Password-Protect a Workbook**

<snippet id='codeblock-cnb'/>



## How to Unprotect a Workbook

To remove workbook protection, call the `Unprotect(string)` method of the `Workbook` class. The method returns a `Boolean` value that indicates whether the workbook is successfully unprotected.

**Example 2** demonstrates how to unprotect a workbook.

**Example 2: Remove workbook protection by supplying the current password**

<snippet id='codeblock-cnc'/>



## See Also

* [What is a Workbook?]({%slug radspreadprocessing-working-with-workbooks-what-is-workbook%})
* [Worksheet Protection]({%slug radspreadprocessing-features-protection-worksheet%})
