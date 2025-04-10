---
title: Resolving Ambiguous references
description: This article describes how to resolve ambiguous references due to cross-platform project references.
type: how-to
page_title: How to Resolve Ambiguous References
slug: dpl-resolve
tags: radspreadprocessing, document processing, wpf, ambiguous reference, extern alias
res_type: kb
ticketid: 1684241
---

## Environment

| Version | Product | Author | 
| ---- | ---- | ---- | 
| 2025.1.205| Telerik Document Processing|[Desislava Yordanova](https://www.telerik.com/blogs/author/desislava-yordanova)| 

## Description

When developing a WPF application that utilizes RadSpreadProcessing for Document Processing to set a font in a spreadsheet, and the solution includes a cross-platform project referencing `Telerik.Documents.Core`, an ambiguous reference error may occur. The issue arises due to identical namespaces in both assemblies when both platform-specific projects and cross-platform projects are part of the solution. This knowledge base article also answers the following questions:
- How to resolve ambiguous reference errors in a WPF project using RadSpreadProcessing?
- How to use RadSpreadProcessing in a WPF application with cross-platform project references?
- How to set a spreadsheet font in WPF using RadSpreadProcessing without ambiguous references?

## Solution

To resolve the ambiguous reference error in a WPF application using RadSpreadProcessing alongside a cross-platform project, use the `extern alias` directive. This approach allows differentiating between assemblies that have the same namespace but are intended for different platforms. Follow the steps below to apply this solution:

1. **Assign an alias to the conflicting assembly in the WPF project**. Right-click on the referenced assembly (`Telerik.Documents.Core` in the cross-platform project) in the Solution Explorer and select `Properties`. In the `Aliases` field, enter a unique alias (e.g., `NetFramework`).

2. **Use the `extern alias` directive in your WPF project code**. At the top of your C# file where you are facing the ambiguous reference, declare the alias defined in step 1. This explicitly specifies which assembly to use for the conflicting types.

```csharp
extern alias NetFramework;
using NetFramework::Telerik.Documents.Common.Model;
```

3. **Reference the `ThemableFontFamily` using the alias**. After specifying the extern alias, use it to qualify the namespace of the `ThemableFontFamily` class or any other ambiguous type. This disambiguates the reference and allows your code to compile successfully.

```csharp
namespace YourNamespace
{
    public class YourClass
    {
        public void YourMethod()
        {
            // Use the ThemableFontFamily from the aliased assembly
            ThemableFontFamily fontFamily = new ThemableFontFamily("Courier New");
        }
    }
}
```

By following these steps, you can successfully resolve the ambiguous reference error and set the spreadsheet font in a WPF application using RadSpreadProcessing, even when your solution includes cross-platform projects.

## See Also

- [Telerik Document Processing Introduction](https://docs.telerik.com/devtools/document-processing/introduction)
- [What Versions of Document Processing Libraries are Distributed with the Telerik Products](https://docs.telerik.com/devtools/document-processing/knowledge-base/distribute-telerik-document-processing-libraries-net-versions)
- [Resolve Compile-Time Error Between RadPdfProcessing and Telerik Reporting](https://docs.telerik.com/devtools/document-processing/knowledge-base/resolve-compile-time-error-radpdfprocessing-telerik-reporting)
- [C# Extern Alias - Microsoft Documentation](https://learn.microsoft.com/en-us/dotnet/csharp/language-reference/keywords/extern-alias)
