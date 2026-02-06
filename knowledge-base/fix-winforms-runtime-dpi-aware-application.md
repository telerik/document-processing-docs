---
title: Resolving Unexpected Per-Monitor DPI Awareness in WinForms Apps
description: Fix a WinForms application that unexpectedly becomes (per‑monitor) DPI aware and changes size when using controls depending on the Telerik Document Processing libraries.
type: how-to 
page_title: Why Your WinForms App Resizes - DPI Awareness and Telerik Document Processing Explained
slug: fix-winforms-runtime-dpi-aware-application
position: 0
tags: winforms,windows, forms, dpi, scaling, document, processing, pdf, viewer, rich, text, editor, spreadsheet, control, aware, shrink, scale
res_type: kb
---

## Environment

|Product Version|Product|Author|
|----|----|----|
|All|Document Processing Libraries|[Yoan Karamanov](https://www.telerik.com/blogs/author/yoan-karamanov)|

## Description

A WinForms application may appear smaller (or larger) at runtime after using [Document Processing Libraries]({%slug introduction%}) (**DPL**) functionality or [DPL-dependent Telerik controls](https://docs.telerik.com/devtools/winforms/integration-with-other-telerik-products/document-processing-libraries#telerik-ui-for-winforms-integration) (e. g. **RadPdfViewer**, **RadSpreadsheet**). This can occur, for example, when **exporting data**, loading a document, or instantiating types from assemblies used by:

These dependencies internally rely on WPF assemblies where DPI awareness is enabled at the assembly level. The moment a type from such an assembly is initialized, the hosting WinForms process can become DPI-aware.

## Solution

You can choose between two approaches:

### 1. Make the application explicitly DPI-aware

With this approach your app will look smaller when started. It will not look blurry on HDPI displays. Detailed information is available in the [DPI Support](https://docs.telerik.com/devtools/winforms/telerik-presentation-framework/dpi-support) article.

### 2. Keep (or force) the application DPI-unaware (Windows 10 only)

This approach works only on Windows 10. If you intend to use your application on machines where the DPI scaling is larger than 100 percent, you should explicitly set the application to be DPI-unaware

#### Force process DPI unaware before using a Document Processing type

```csharp
private void workbookTestButton_Click(object sender, EventArgs e)
{
    SetProcessDpiAwareness(_Process_DPI_Awareness.Process_DPI_Unaware);
    Workbook wb = new Workbook();
}

[DllImport("shcore.dll")]
static extern int SetProcessDpiAwareness(_Process_DPI_Awareness value);

enum _Process_DPI_Awareness
{
    Process_DPI_Unaware = 0,
    Process_System_DPI_Aware = 1,
    Process_Per_Monitor_DPI_Aware = 2
}
```

>note None of the above approaches affect the application when the scaling is set to 100%.

## See Also

* [DPI Support](https://docs.telerik.com/devtools/winforms/telerik-presentation-framework/dpi-support)