---
title: Workbook Protection
description: Learn how to protect the structure of a workbook in RadSpreadProcessing to prevent users from adding, removing, renaming, or reordering sheets.
page_title: Workbook Protection
slug: radspreadprocessing-features-protection-workbook
tags: workbook, protection, spreadsheet, radspreadprocessing, password, security, sheets
published: True
position: 0
---

# Workbook Protection

In certain cases when you present a workbook to the users, you may want to prevent them from adding, removing, renaming, or reordering sheets. This is where workbook protection comes in. The feature allows you to lock the structure of your workbook with or without a password. You can always unprotect the workbook as needed. You can also let the user remove the protection by entering the correct password. Once protection is removed, the user can add, remove, rename, and reorder sheets.

Workbook protection in the context of the document model is an entirely user-oriented feature. When a workbook is protected, the UI does not allow the user to add, delete, reorder, or rename sheets. You as a developer have full access to the sheets collection of the workbook and can perform any modifications through code behind.


## How to Protect a Workbook

To protect a workbook, use the `Protect(string)` method of the `Workbook` class. The method takes one string parameter that specifies the password used for enforcing protection.

**Example 1** illustrates how to create a workbook from scratch and protect it with a password.

>The protection functionality protects the workbook structure from editing. If you need to protect the document so that it can be opened only after providing a password, you must encrypt it. The encryption functionality is not yet supported in SpreadProcessing and you can vote for its implementation through the [public request](https://feedback.telerik.com/document-processing/1356022-spreadprocessing-implement-encryption-of-workbook).

**Example 1: Password-Protect a Workbook**

<snippet id='libraries-spread-features-protection-workbook-1'/>



## How to Unprotect a Workbook

Use the `Unprotect(string)` method of the `Workbook` class to remove the workbook protection. The method returns a Boolean value that indicates whether the workbook is successfully unprotected.

**Example 2** demonstrates how to unprotect a workbook.

**Example 2: Unprotect a Workbook**

<snippet id='libraries-spread-features-protection-workbook-2'/>



## See Also

* [What is a Workbook?]({%slug radspreadprocessing-working-with-workbooks-what-is-workbook%})
* [Worksheet Protection]({%slug radspreadprocessing-features-protection-worksheet%})
