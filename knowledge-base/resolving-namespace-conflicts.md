---
title: Resolving Namespace Conflicts in RadSpreadProcessing for Document Processing
description: This article demonstrates how to resolve namespace conflicts when using RadSpreadProcessing in a .NET Core project with both .NET Standard and .NET Framework versions installed.
type: how-to
page_title: How to Fix Namespace Conflicts in RadSpreadProcessing for Document Processing
slug: radspreadprocessing-resolving-namespace-conflicts
tags: radspreadprocessing, document processing, namespace, extern alias, .net core, .net standard
res_type: kb
ticketid: 1673450
---

## Environment

<table>
<tbody>
<tr>
<td>Product</td>
<td>RadSpreadProcessing for Document Processing</td>
</tr>
</tbody>
</table>

## Description

When working on a .NET Core project that utilizes both `Telerik.Documents.Spreadsheet` and `Telerik.Windows.Documents.Spreadsheet` packages, a namespace conflict arises due to the `Workbook` class existing in both packages. This conflict results in a compiler error, preventing successful compilation.

This knowledge base article also answers the following questions:
- How can I resolve type conflicts in .NET Core projects using Telerik Document Processing libraries?
- What is the correct way to handle namespace conflicts when using Telerik Document Processing in mixed .NET environments?
- How do I use the C# extern alias feature to differentiate between similar types in different assemblies?

## Solution

To resolve the compile-time error caused by the conflicting `Workbook` type in both assemblies, utilize the C# `extern alias` feature. This approach allows you to differentiate between assemblies and use types from both without conflict. Follow the steps below:

1. **Assign Alias to NuGet Packages**
   - For the `Telerik.Documents.Spreadsheet` NuGet package, set its alias to `StandardHelper` (or any preferred alias).
   - For the `Telerik.Windows.Documents.Spreadsheet` NuGet package, set its alias to `FrameworkHelper` (or any preferred alias).

2. **Use Extern Alias in Your Code**
   - At the top of your source file where you intend to use the conflicting types, add the `extern alias` directive for each alias you assigned. This directive differentiates the assemblies, allowing you to reference each type explicitly.

```csharp
extern alias StandardHelper;
//extern alias FrameworkHelper;

using StandardHelper::Telerik.Windows.Documents.Spreadsheet.Model;
//using FrameworkHelper::Telerik.Windows.Documents.Spreadsheet.Model;

namespace YourNamespace
{
    internal class Program
    {
        static void Main(string[] args)
        {
           Workbook workbook;
        }
    }
}
```

By following these steps, you can successfully resolve the namespace conflict and use the `Workbook` class from both Telerik Document Processing libraries in your .NET Core project.

## See Also

- [Installation: NuGet Packages for Document Processing](https://docs.telerik.com/devtools/document-processing/getting-started/installation/nuget-packages)
- [C# Language Reference: extern alias](https://learn.microsoft.com/en-us/dotnet/csharp/language-reference/keywords/extern-alias)
- [What Versions of Document Processing Libraries are Distributed with the Telerik Products](https://docs.telerik.com/devtools/document-processing/knowledge-base/distribute-telerik-document-processing-libraries-net-versions)
