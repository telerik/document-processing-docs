---
title: Migrating to Platform-Agnostic Namespaces
description: Learn how the Telerik Document Processing Libraries namespaces changed to remove the word "Windows" and how to update your code after upgrading.
type: how-to
page_title: How to Migrate to the New Platform-Agnostic Namespaces in Document Processing
slug: platform-agnostic-namespaces-migration
tags: namespace, migration, windows, platform, netstandard, netframework, breaking, change, telerik, document, processing, net, framework, standard
res_type: kb
---

## Environment

| Version | Product | Author |
| --- | --- | --- |
| Q3 2026 | Document Processing Libraries | [Yoan Karamanov](https://www.telerik.com/blogs/author/yoan-karamanov) |

## Description

Starting with the **Q3 2026** release, the Telerik Document Processing Libraries use platform-agnostic namespaces in both the .NET Framework and .NET Standard package variants. All namespaces no longer contain the word `Windows`. This is a breaking change that affects any project that references the old `Telerik.Windows.Documents.*` or `Telerik.Windows.Zip` namespaces.

This article also answers the following questions:

* Why do my `using Telerik.Windows.Documents.*` directives no longer resolve after upgrading?
* How do I update my code to use the new namespaces in the Telerik Document Processing Libraries?
* What is the difference between the old and the new namespace naming convention?

## Previous State

The Telerik Document Processing Libraries have always been distributed in two package variants:

* **.NET Framework packages**: These packages target Windows and have the word `Windows` in their assembly and NuGet package names (for example, `Telerik.Windows.Documents.Core`, `Telerik.Windows.Documents.Fixed`).
* **.NET Standard packages**: These packages are cross-platform and do not contain `Windows` in their names (for example, `Telerik.Documents.Core`, `Telerik.Documents.Fixed`).

Despite this naming difference, both package variants used the same `Telerik.Windows.Documents.*` namespace hierarchy in most of the classes. This meant that regardless of the package you referenced, all `using` directives and fully qualified type names had to include the word `Windows`. For example:

```csharp
using Telerik.Windows.Documents.Fixed.Model;
using Telerik.Windows.Documents.Flow.Model;
using Telerik.Windows.Documents.Spreadsheet.Model;
```

For more details about the two package variants and their differences, see [Telerik.Windows.Documents.* vs. Telerik.Documents.*]({%slug telerik-windows-documents-vs-telerik-documents-namespace%}).

## Current Change

Starting with Q3 2026, all namespaces in both package variants are now platform-agnostic. The word `Windows` has been removed from every namespace. The new namespaces align with the naming convention of the .NET Standard packages.

The following table shows examples of how namespaces have changed:

| Old namespace | New namespace |
| --- | --- |
| `Telerik.Windows.Documents.Fixed.Model` | `Telerik.Documents.Fixed.Model` |
| `Telerik.Windows.Documents.Flow.Model` | `Telerik.Documents.Flow.Model` |
| `Telerik.Windows.Documents.Spreadsheet.Model` | `Telerik.Documents.Spreadsheet.Model` |
| `Telerik.Windows.Documents.Core` | `Telerik.Documents.Core` |
| `Telerik.Windows.Documents.Fixed.FormatProviders.Pdf` | `Telerik.Documents.Fixed.FormatProviders.Pdf` |
| `Telerik.Windows.Documents.Flow.FormatProviders.Docx` | `Telerik.Documents.Flow.FormatProviders.Docx` |
| `Telerik.Windows.Documents.Spreadsheet.FormatProviders.OpenXml.Xlsx` | `Telerik.Documents.Spreadsheet.FormatProviders.OpenXml.Xlsx` |
| `Telerik.Windows.Zip` | `Telerik.Zip` |

>note The package and assembly names remain unchanged. Only the namespaces have changed. The .NET Framework packages still have `Windows` in their names (for example, `Telerik.Windows.Documents.Core`), and the .NET Standard packages still do not (for example, `Telerik.Documents.Core`).

## How This Affects Your Project

Any code that uses the old `Telerik.Windows.Documents.*` namespaces will produce compiler errors after you upgrade. The errors typically look like this:

```
error CS0246: The type or namespace name 'Telerik' could not be found
error CS0234: The type or namespace name 'Windows' does not exist in the namespace 'Telerik'
```

The impact covers:

* All `using` directives that reference `Telerik.Windows.Documents.*` and `Telerik.Windows.Zip`.
* All fully qualified type names in code, such as `Telerik.Windows.Documents.Fixed.Model.RadFixedDocument`.
* Any string-based type references, such as those in XML configuration or reflection calls.

## Solution

To resolve the compiler errors, replace all occurrences of `Telerik.Windows.Documents.` or `Telerik.Windows.Zip` with `Telerik.Documents.` and `Telerik.Zip` respectively in your source code.

### Using Find and Replace

The fastest approach is a project-wide find-and-replace operation:

1. Open your IDE's **Find and Replace** dialog (`Ctrl+H` in Visual Studio).
2. Set the search scope to your entire solution or project.
3. Search for `Telerik.Windows.Documents.` and replace it with `Telerik.Documents.`.
4. Apply the replacement and rebuild the solution.

### Updating Using Directives

The following example shows what the updated `using` directives look like for the most common libraries.

#### __Example 1: Updated Using Directives__

```csharp
// RadPdfProcessing
using Telerik.Documents.Fixed.Model;
using Telerik.Documents.Fixed.FormatProviders.Pdf;

// RadWordsProcessing
using Telerik.Documents.Flow.Model;
using Telerik.Documents.Flow.FormatProviders.Docx;

// RadSpreadProcessing
using Telerik.Documents.Spreadsheet.Model;
using Telerik.Documents.Spreadsheet.FormatProviders.OpenXml.Xlsx;
```

After the replacement, all type references resolve correctly against both the .NET Framework and .NET Standard package variants.

>tip If your project uses both the .NET Framework and .NET Standard package variants simultaneously, see [Resolving Namespace Conflicts in Telerik Document Processing Libraries]({%slug radspreadprocessing-resolving-namespace-conflicts%}) for guidance on using the `extern alias` directive.

## See Also

* [Telerik.Windows.Documents.* vs. Telerik.Documents.* Namespaces]({%slug telerik-windows-documents-vs-telerik-documents-namespace%})
* [What Versions of Document Processing Libraries Are Distributed with the Telerik Products]({%slug distribute-telerik-document-processing-libraries-net-versions%})
* [Resolving Namespace Conflicts in Telerik Document Processing Libraries]({%slug radspreadprocessing-resolving-namespace-conflicts%})
* [Cross-Platform Support for RadPdfProcessing]({%slug radpdfprocessing-cross-platform%})
* [Cross-Platform Support for RadWordsProcessing]({%slug radwordsprocessing-cross-platform%})
* [Cross-Platform Support for RadSpreadProcessing]({%slug radspreadprocessing-cross-platform%})
* [Available NuGet Packages]({%slug available-nuget-packages%})
