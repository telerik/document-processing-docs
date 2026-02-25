---
title: Workbook Protection
page_title: Workbook Protection
slug: radspreadprocessing-features-protection-workbook
tags: workbook,protection
published: True
position: 0
---

# Workbook Protection



In certain cases when you present a workbook to the users, you may want to prevent them from adding, removing, renaming or reordering sheets. This is where workbook protection comes at hand. The feature allows you to lock the structure of your workbook with or without a password. You can always unprotect the workbook as needed, however, you can also let the user remove the protection by entering the correct password. Once protection is removed, the user can add, remove, rename and reorder sheets.


Note that workbook protection in the context of the document model is an entirely user-oriented feature. When a workbook is protected, the UI will not allow the user to add, delete, reorder or rename sheets. That said, you as a developer have full access to the sheets collection of the workbook and can perform any modifications using code behind.


## How to Protect a Workbook

To protect a workbook, use the __Protect(string)__ method of the __Workbook__ class. The method takes one string parameter that specifies the password used for enforcing protection.


__Example 1__ illustrates how to create a workbook from scratch and protect it using a password.

>The protection functionality protects the workbook structure from being edited. If you need to protect the document so that it can be opened only after providing a password for it, you should encrypt it. The encryption functionality is currently not supported in SpreadProcessing and you can vote for its implementation using the [public request](https://feedback.telerik.com/document-processing/1356022-spreadprocessing-implement-encryption-of-workbook) for it. 

#### __Example 1: Password-protect a Workbook__

```csharp
	Workbook workbook = new Workbook();
	workbook.Worksheets.Add();
	
	workbook.Protect("telerik");
```



## How to Unprotect a Workbook

Use the __Unprotect(string)__ method of the __Workbook__ class to remove the workbook protection. The method returns a Boolean value that indicates whether the workbook is successfully unprotected.


__Example 2__ demonstrates how to unprotect a workbook.


#### __Example 2: Unprotect a Workbook__

```csharp
	Workbook workbook = new Workbook();
	workbook.Worksheets.Add();
	
	workbook.Protect("telerik");
	
	workbook.Unprotect("telerik");
```



## See Also

 * [Whats is a Workbook?]({%slug radspreadprocessing-working-with-workbooks-what-is-workbook%})
 * [Worksheet Protection]({%slug radspreadprocessing-features-protection-worksheet%})
