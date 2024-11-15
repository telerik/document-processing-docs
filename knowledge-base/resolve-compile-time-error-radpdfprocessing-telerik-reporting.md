---
title: Resolving Compile Time Error with Telerik.Documents.Fixed and Telerik.Reporting after Upgrading to Q4 2024
description: This article explains how to solve the compile time error caused by conflicting types between RadPdfProcessing and Telerik.Reporting when upgrading to Q4 2024.
type: how-to
page_title: Fixing Compile Time Error Between Telerik.Documents.Fixed and Telerik.Reporting after Upgrading to Q4 2024
slug: resolve-compile-time-error-radpdfprocessing-telerik-reporting-net-9
tags: radpdfprocessing, document processing, .net 9, compile time error, size conflict, extern alias
res_type: kb
ticketid: 1670534
---

## Environment

| Version | Product | Author | 
| --- | --- | ---- | 
| 18.3.24.1112| Telerik.Reporting|[Desislava Yordanova](https://www.telerik.com/blogs/author/desislava-yordanova)| 
|2024.4.1106|RadPdfProcessing (.NET Standard)||

## Description

If you have the **Telerik.Reporting** NuGet package (**18.3.24.1112**) installed simultaneously with the **Telerik.Documents.Fixed** NuGet package, a compile time error occurs:

The type 'Size' exists in both 'Telerik.Documents.Core, Version=2024.4.1106.20, Culture=neutral, PublicKeyToken=5803cfa389c90ce7' and 'Telerik.Reporting, Version=18.3.24.1112, Culture=neutral, PublicKeyToken=a9d7983dfcc261be'

>note This undesired behavior is not reproducible with the previous version of Telerik Reporting. It is caused due to the fact that Telerik.Documents.Primitives.Size is contained in both assemblies/packages with the same namespace.

## Solution

To resolve the compile time error caused by the conflicting 'Size' type in both  assemblies, use the C# **extern alias** feature. Follow these steps to implement the solution:

1. **Assign Aliases to the NuGet Packages**: Assign an alias to each conflicting NuGet package in your project. For Telerik.Documents.Fixed, use `DPLHelper`, and for Telerik.Reporting, use `ReportingHelper`.

2. **Use Extern Alias in Your Code**: At the top of your source file, add the `extern alias` directive for each alias you assigned. This differentiates the namespaces, allowing you to use types from both assemblies without conflict.

3. **Adjust Your Code to Use the Aliased Namespaces**:

```csharp
extern alias DPLHelper;
extern alias ReportingHelper;

using DPLHelper::Telerik.Windows.Documents.Fixed.Model.Editing;
using DPLHelper::Telerik.Windows.Documents.Fixed.Model;

namespace YourNamespace
{
    internal class Program
    {
        static void Main(string[] args)
        {
            RadFixedDocument fixedDocument = new RadFixedDocument();
            RadFixedPage fixedPage = fixedDocument.Pages.AddPage();
            fixedPage.Size = new Telerik.Documents.Primitives.Size(210,297);
            FixedContentEditor fixedEditor = new FixedContentEditor(fixedPage);
        }
    }
}
```

This approach allows you to explicitly specify which 'Size' class to use, thereby resolving the compile time error and allowing your project to build successfully.

## See Also

- [Telerik Document Processing Libraries Overview](https://docs.telerik.com/devtools/document-processing/introduction#available-assemblies)
- [Feedback Portal Entry for Compile Time Error in Q4 2024](https://feedback.telerik.com/reporting/1670554-compile-time-error-occurs-after-upgrading-to-q4-2024)
- [Extern Alias C# Documentation](https://docs.microsoft.com/en-us/dotnet/csharp/language-reference/keywords/extern-alias)
