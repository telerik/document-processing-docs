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
When using the RadWordsProcessing in a .NET 6.0 project, a `System.IO.FileNotFoundException` error may occur, stating that the file for assembly 'System.Text.Encoding.CodePages, Version=7.0.0.0' could not be found. This issue arises while utilizing the `Telerik.Windows.Documents.Flow.FormatProviders.Html.HtmlFormatProvider`.

This KB article also answers the following questions:
- How to resolve FileNotFoundException when using RadWordsProcessing?
- How to add support for System.Text.Encoding.CodePages in .NET 6.0 projects?
- What to include in the .csproj file to fix assembly loading issues in RadWordsProcessing?

## Solution
To resolve the FileNotFoundException for 'System.Text.Encoding.CodePages' in a .NET 6.0 project using RadWordsProcessing, follow these steps:

1. Edit the `.csproj` file of your project.
2. Include the necessary `PackageReference` entries for `Telerik.Windows.Documents.Flow` and `System.Text.Encoding.CodePages`.
3. Add a `FunctionsPreservedDependencies` entry for the `System.Text.Encoding.CodePages.dll`.

```xml
<ItemGroup>
  <PackageReference Include="Telerik.Windows.Documents.Flow" Version="2024.2.426" />
  <PackageReference Include="System.Text.Encoding.CodePages" Version="7.0.0" />
</ItemGroup>
<ItemGroup>
  <FunctionsPreservedDependencies Include="System.Text.Encoding.CodePages.dll" />
</ItemGroup>
```

By adding these entries to your `.csproj` file, the required package references will be included in your project, resolving the FileNotFoundException.

## Notes
Ensure that your project targets the appropriate .NET 6.0 framework and that all NuGet package versions are compatible with your project setup.

## See Also
- [RadWordsProcessing Documentation](https://docs.telerik.com/devtools/document-processing/libraries/radwordsprocessing/overview)
