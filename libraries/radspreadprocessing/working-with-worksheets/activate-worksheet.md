---
title: Activate a Worksheet
description: Learn how to set the active worksheet in a RadSpreadProcessing workbook and handle the ActiveSheetChanged event when the selection changes.
page_title: Activate a Worksheet
slug: radspreadprocessing-working-with-worksheets-activate-worksheet
tags: worksheet, spreadsheet, radspreadprocessing, activate, workbook, active, selection, tab, xlsx, spread
published: True
position: 2
---

# Activate a Worksheet

Typically, a single workbook in the document model contains several worksheets. However, only one worksheet can be active at a time. When you open a workbook through a spreadsheet UI, the control visualizes the cells of the active worksheet. Any changes you make through the UI, such as data entry or formatting, affect the active worksheet.

## Changing the Active Worksheet

The `Workbook` class exposes an `ActiveWorksheet` property that gets and sets the active worksheet. Additionally, the workbook has an `ActiveSheetChanged` event that fires whenever the `ActiveWorksheet` changes. The first worksheet added to the workbook becomes the active worksheet by default. Each worksheet added afterwards does not become the active one.

**Example 1** creates a new workbook from scratch and subscribes to its `ActiveSheetChanged` event. Further, the code adds two worksheets. When the first worksheet is added, it is automatically selected as the active worksheet because it is the only worksheet in the workbook. Adding the first worksheet also fires the `ActiveSheetChanged` event. When the second worksheet is added, the active worksheet does not change. The event does not fire. Later, the snippet sets the second worksheet to be the active one, which fires the `ActiveSheetChanged` event.

**Example 1: Change Active Sheet**

<snippet id='libraries-spread-working-with-worksheets-activate-worksheet'/>


