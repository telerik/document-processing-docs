---
title: Resolving FileNotFoundException for System.Text.Encoding.CodePages in RadWordsProcessing
description: How to fix the FileNotFoundException for 'System.Text.Encoding.CodePages' when using RadWordsProcessing in a .NET 6.0 project.
type: how-to
page_title: How to Solve FileNotFoundException for Encoding.CodePages in RadWordsProcessing
slug: resolve-file-not-found-exception-system-text-encoding-codepages-radwordsprocessing
tags: radwordsprocessing, document-processing, filenotfoundexception, system.text.encoding.codepages, .net6, workaround
res_type: kb
ticketid: 1655041
---

| Version | Product | Author | 
| --- | --- | ---- | 
| 2024.2.426| RadWordsProcessing |[Desislava Yordanova](https://www.telerik.com/blogs/author/desislava-yordanova)| 

## Description
When using the [RadWordsProcessing]({%slug radwordsprocessing-overview%}) in a WPF/WinForms project which targets .NET 6.0 , a `System.IO.FileNotFoundException` error may occur, stating that the file for assembly 'System.Text.Encoding.CodePages, Version=7.0.0.0' could not be found. This issue arises while utilizing the `Telerik.Windows.Documents.Flow.FormatProviders.Html.HtmlFormatProvider`.

![WPF project Net6](images/wpf-net6-project.png)   

![Encoding CodePages Error](images/codepages-error.png)   

## Solution
To resolve the FileNotFoundException for 'System.Text.Encoding.CodePages' in a .NET 6.0 project using RadWordsProcessing, follow these steps:

1. Right-click the project to edit the `.csproj` file of your project.

![Edit proj file](images/edit-wpf-net6-project.png)    

2. Include the necessary `PackageReference` entry for `System.Text.Encoding.CodePages` and add a `FunctionsPreservedDependencies` entry for it.

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

By adding these entries to your `.csproj` file, the required package references will be included in your project, resolving the FileNotFoundException.

## Notes
Ensure that your project targets the appropriate .NET 6.0 framework and that all NuGet package versions are compatible with your project setup.

## See Also
- [RadWordsProcessing]({%slug radwordsprocessing-overview%}) 
