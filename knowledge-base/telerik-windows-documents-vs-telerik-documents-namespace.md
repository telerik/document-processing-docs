---
title: Telerik.Windows.Documents.* vs Telerik.Documents.*
description: Learn the key differences between Telerik.Windows.Documents.* and Telerik.Documents.* namespaces, including usage scenarios, frameworks, and compatibility.
type: how-to
page_title: Understanding the Difference Between Telerik.Windows.Documents.* and Telerik.Documents.* Namespaces
meta_title: Understanding the Difference Between Telerik.Windows.Documents.* and Telerik.Documents.* Namespaces
slug: telerik-windows-documents-vs-telerik-documents-namespace
tags: telerik, windows, document, processing, net, standard, compatibility
res_type: kb
ticketid: 1712509
---

## Environment

| Version | Product | Author | 
| ---- | ---- | ---- | 
| 2026.1.210| Telerik Document Processing|[Desislava Yordanova](https://www.telerik.com/blogs/author/desislava-yordanova)| 

## Description

This article explains the difference between the `Telerik.Windows.Documents.*` and `Telerik.Documents.*` assemblies/NuGet packages, when to use each, and how they relate to the supported frameworks.

## Solution

The `Telerik.Documents.*` assemblies/NuGet packages are designed to work across different operating systems and .NET versions. The `Telerik.Windows.Documents.*` packages target Windows environments and may include dependencies or features specific to Windows. This distinction is reflected in package references and compatibility. For .NET Framework (.NET Target OS: Windows) projects, you typically use `Telerik.Windows.Documents.*` assemblies/NuGet packages. For .NET Standard or .NET (Target OS: None) projects, you use `Telerik.Documents.*` packages. The features are consistent, but the underlying assemblies are tailored for their respective platforms and frameworks. This ensures best compatibility and support for modern .NET development scenarios.

### Telerik.Documents.*

This namespace contains Telerik’s pure document processing libraries, independent of any UI framework.

Use `Telerik.Documents.*` when:

* You need server-side document generation
* You are building APIs that export PDF/Word/Excel documents in cross-platform environments
* You do not need on-screen editing or viewing
* You want maximum portability

Recommended for new development, especially non-UI workloads.

### Telerik.Windows.Documents.* 

`Telerik.Windows.Documents.*` assemblies/NuGet packages require Windows because they are built on WPF, which is a Windows-only UI framework. They cannot run on Linux, macOS, or any non-Windows runtime. All `Telerik.Windows.Documents.*` assemblies/NuGet packages reference WPF assemblies, such as `PresentationCore` and `WindowsBase`. WPF itself uses Windows-specific graphics subsystems (DirectX, GDI, font services).

Use `Telerik.Windows.Documents.*` when:

* You are building a WPF/WinForms desktop application
* You need on-screen document editing
* You are using `RadPdfViewer`, `RadSpreadsheet`, and similar controls
* You need print preview, selection, scrolling, zoom, or UI formatting


## See Also

* [Available NuGet Packages]({%slug available-nuget-packages%}) 
