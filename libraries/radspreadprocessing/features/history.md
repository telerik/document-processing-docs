---
title: History
description: Learn how to use the undo/redo history stack in RadSpreadProcessing to track and revert changes to workbook content.
page_title: History
slug: radspreadprocessing-features-history
tags: history, spreadsheet, radspreadprocessing, undo, redo, workbook, changes, stack, spread, xlsx
published: True
position: 7
---

# History



The document model provides the ability to maintain a history stack that tracks all changes to the content of the workbook. The history is implemented through the `WorkbookHistory` class and the `Workbook` exposes a property of this type. All changes introduced to the workbook are automatically recorded. The model also allows manual control over the history.
      
* [Enable / Disable History](#enable-/-disable-history)

* [Undo / Redo Actions](#undo-/-redo-actions)

* [Smart Undo](#smart-undo)

* [Clear History](#clear-history)

## Enable / Disable History

By default, the `WorkbookHistory` class does not record all changes introduced to the workbook, but there are scenarios that need the history feature. For example, if you construct an entire document from code behind, you do not need to record each action you perform. In such cases you do not need to enable the history for the workbook through the `IsEnabled` property of the `WorkbookHistory` class. However, if you want to undo one or several of the recent changes, you need to enable the history.
        

**Example 1** enables the history of a workbook.
        

**Example 1: Enable History**

<snippet id='libraries-spread-features-history-1'/>



## Undo / Redo Actions

Once the history is enabled you can invoke its `Undo()` and `Redo()` methods to perform undo and redo actions respectively. Both methods return a Boolean value that indicates whether the operations were successful. The `Workbook` class exposes the Boolean properties `CanUndo` and `CanRedo` that indicate whether the respective action is applicable.
        

**Example 2** creates a new workbook with a single worksheet and sets the value of cell *A1* twice. Further, the snippet performs the undo and redo actions.
        

**Example 2: Perform Undo and Redo**

<snippet id='libraries-spread-features-history-2'/>



## Smart Undo

The `Workbook` history offers a friendly API that allows grouping multiple changes into one undo step. For example, you may want to set the value of a cell and apply formatting to the same cell, and treat these two actions as a single undo operation. You can achieve this by enclosing the assignments with `BeginUndoGroup()` and `EndUndoGroup()` methods.
        

**Example 3** demonstrates how to create an undo group.
        

**Example 3: Create Undo Group**

<snippet id='libraries-spread-features-history-3'/>



## Clear History

To clear the history, call the `Clear()` method of the `WorkbookHistory` class. You cannot clear the history if you are recording an undo group. If you attempt to call the method after invoking `BeginUndoGroup()`, an exception is thrown. The following snippet illustrates how to clear the workbook history.
        

**Example 4** clears the history of a workbook.
        

**Example 4: Clear History**

<snippet id='libraries-spread-features-history-4'/>


