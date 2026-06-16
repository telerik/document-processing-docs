---
title: Rename a Worksheet
description: Learn how to rename worksheets within a workbook in RadSpreadProcessing, including validation rules for worksheet names.
page_title: Rename a Worksheet
slug: radspreadprocessing-working-with-worksheets-rename-worksheet
tags: worksheet, spreadsheet, radspreadprocessing, rename, workbook, name, tab, organization
published: True
position: 3
---

# Rename a Worksheet

Workbooks hold multiple worksheets to allow efficient organization and consolidation of data. Often, workbooks contain worksheets with related data. In such cases, naming the worksheets appropriately helps you find and retrieve information from the workbook.

## Setting the Worksheet Name

When you add a new worksheet to a workbook collection, it is automatically assigned the first available name in the sequence Sheet1, Sheet2, Sheet3, Sheet4, and so on. Once the worksheet is added to the workbook, you can access it and change its name through the `Name` property.

The following constraints apply to the worksheet name:

<table><tr><th>

Worksheet validation rules

</th></tr><tr><td>

Each worksheet must have a unique name in the workbook. The comparison of the worksheet names is case-insensitive. That said, sheets with names "Sheet1" and "sheet1" cannot reside within the same workbook. If you attempt to set a name that already appears in the collection, an exception is raised.

</td></tr><tr><td>

The name of the worksheet cannot contain the following symbols: <b>\ / ? * [ ] :</b></td></tr><tr><td>

The name of the worksheet must not start or end with a single quote ('). However, the symbol may appear inside the worksheet name. For example, "Sam's Worksheet" is a correct name and "Sam'" is not valid.

</td></tr><tr><td>

The name of the worksheet cannot be an empty string.

</td></tr><tr><td>

The name of the worksheet cannot exceed 31 characters.

</td></tr></table>

**Example 1** creates a new workbook, adds a single worksheet to it, and renames the newly added worksheet.

**Example 1: Create and Rename a Worksheet**

<snippet id='codeblock-csn'/>



**Example 2** creates a new workbook and adds two worksheets to it. The snippet illustrates how to rename the worksheet with index 0 to "July's Worksheet". To ensure name uniqueness, the sample code checks if the workbook already contains a worksheet with the desired name.

**Example 2: Rename a Worksheet**

<snippet id='codeblock-cso'/>


