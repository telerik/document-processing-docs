---
title: Resolving Type Conflict in Document Processing Assemblies
description: Learn how to resolve the assembly conflict error stating the Type exists in two Document Processing assemblies.
type: troubleshooting
page_title: Resolving Type Conflict in Document Processing Assemblies
meta_title: Resolving Type Conflict in Document Processing Assemblies
slug: resolving-type-conflict-in-dpl-assemblies
tags: dpl, type, conflict, exist, both, document, processing, error
res_type: kb
ticketid: 1704853
---

## Environment

| Version | Product | Author | 
| ---- | ---- | ---- | 
| 2025.4.1104| Document Processing|[Desislava Yordanova](https://www.telerik.com/blogs/author/desislava-yordanova)| 

## Description

The end user encounters the following (or similar) error:

`The type 'CellValueType' exists in both 'Telerik.Documents.Spreadsheet, Version=2025.3.806.20, Culture=neutral, PublicKeyToken=5803cfa389c90ce7' and 'Telerik.Windows.Documents.Spreadsheet, Version=2025.4.1104.462, Culture=neutral, PublicKeyToken=5803cfa389c90ce7'`.

## Cause

This error occurs because both `Telerik.Documents.Spreadsheet` and `Telerik.Windows.Documents.Spreadsheet` assemblies define the type `CellValueType`. These libraries are distributed with different Telerik UI products and target different frameworks. 

- `Telerik.Documents.Spreadsheet` is for projects targeting .NET Standard or .NET (cross-platform).
- `Telerik.Windows.Documents.Spreadsheet` is for projects targeting .NET Framework or .NET (Windows-specific).

Blazor projects should use `Telerik.Documents.Spreadsheet` only.

>note Similar errors may occur with other types and other Document Processing assemblies.

## Solution

To resolve this issue, follow these steps:

1. Remove the `Telerik.Windows.Documents.Spreadsheet` NuGet package from your project.
2. Install only the `Telerik.Documents.Spreadsheet` NuGet package.

Ensure the correct package is used based on your project's target framework. For Blazor projects, always use `Telerik.Documents.Spreadsheet` to avoid conflicts.

## See Also

- [Distribute Telerik Document Processing Libraries](https://docs.telerik.com/devtools/document-processing/knowledge-base/distribute-telerik-document-processing-libraries-net-versions)
