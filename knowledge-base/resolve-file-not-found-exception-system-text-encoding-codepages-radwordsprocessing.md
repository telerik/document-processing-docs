---
title: Resolving FileNotFoundException for System.Text.Encoding.CodePages in RadWordsProcessing
description: How to fix the FileNotFoundException for 'System.Text.Encoding.CodePages' when using RadWordsProcessing in a .NET 6.0 project.
type: how-to
page_title: How to Solve FileNotFoundException for Encoding.CodePages in RadWordsProcessing
slug: resolve-file-not-found-exception-system-text-encoding-codepages-radwordsprocessing
tags: radwordsprocessing, exception, encoding, dotnet, netstandard, document, processing, codepages
res_type: kb
ticketid: 1655041
---

## Environment

| Version | Product | Author | 
| --- | --- | ---- | 
| 2024.2.426| RadWordsProcessing |[Desislava Yordanova](https://www.telerik.com/blogs/author/desislava-yordanova)| 

## Description

When you use [RadWordsProcessing]({%slug radwordsprocessing-overview%}) in a WPF/WinForms project that targets .NET 6.0, a `System.IO.FileNotFoundException` error occurs. The error states that the file for assembly `System.Text.Encoding.CodePages, Version=7.0.0.0` cannot be found. This issue arises when you use the `Telerik.Windows.Documents.Flow.FormatProviders.Html.HtmlFormatProvider`.

![WPF project Net6](images/wpf-net6-project.png)   

![Encoding CodePages Error](images/codepages-error.png)   

## Solution

To resolve the `FileNotFoundException` for `System.Text.Encoding.CodePages` in a .NET 6.0 project that uses RadWordsProcessing, follow these steps:

1. Right-click your project and edit the `.csproj` file.

![Edit proj file](images/edit-wpf-net6-project.png)    

2. Add the `PackageReference` entry for `System.Text.Encoding.CodePages` and a `FunctionsPreservedDependencies` entry for it:

```xml
<ItemGroup>
  <PackageReference Include="Telerik.Windows.Documents.Flow" Version="2024.2.426" />
  <PackageReference Include="System.Text.Encoding.CodePages" Version="7.0.0" />
</ItemGroup>
<ItemGroup>
  <FunctionsPreservedDependencies Include="System.Text.Encoding.CodePages.dll" />
</ItemGroup>
```
![Add PackageReference](images/codepages-package-reference-net6-project.png)   

These entries include the required package references in your project and resolve the `FileNotFoundException`.

>note Ensure that your project targets .NET 6.0 and that all NuGet package versions are compatible with your project setup.

## See Also
* [RadWordsProcessing]({%slug radwordsprocessing-overview%}) 
