---
title: Diagnostic Options for Telerik Licensing
description: Learn how to better diagnose the issues of the trial version message in Telerik products when using a DevCraft UI License.
type: how-to
page_title: Diagnostic Options for Telerik Licensing
slug: telerik-trial-version-message-diagnostic-options
tags: progress, telerik, license, document, processing, devcraft, diagnostic, trial
res_type: kb
ticketid: 1688475
---

## Environment

| Version | Product | Author | 
| ---- | ---- | ---- | 
| 2025.1.205| Telerik Document Processing|[Desislava Yordanova](https://www.telerik.com/blogs/author/desislava-yordanova)| 

## Description

This article describes follow-up steps you can take if the **trial** message persists, even after following the steps listed in the [Setting Up Your Telerik Document Processing Libraries License Key]({%slug setting-up-license-key%}) article.

This knowledge base article also answers the following questions:
- How to properly set up Telerik Document Processing license keys?
- How to resolve trial version messages?
- How to verify included assemblies for Telerik Document Processing?

## Solution

Ensure your license includes the respective product. Without a valid license for the respective Telerik product, the trial version message will persist. Verify your license details on the [Telerik Purchase](https://www.telerik.com/purchase.aspx?filter=web) page.

[Telerik Document Processing]({%slug introduction%}) is distributed with several bundles. Learn [What Versions of Document Processing Libraries are Distributed with the Telerik Products]({%slug distribute-telerik-document-processing-libraries-net-versions%}). To integrate and validate its license, follow these steps:

* Remove any environment variables such as `KENDO_UI_LICENSE` or `TELERIK_LICENSE `, as they may cause licensing issues due to length limitations on Windows. Instead, use the `telerik-license.txt` file as described in [Setting Up Your Telerik Document Processing Libraries License Key]({%slug setting-up-license-key%}).

* Use the `TelerikLicensingVerbosity` configuration in your project file to enable detailed licensing diagnostics during build. A sample configuration of the proj file is shown below:

   ```xml
   <Project Sdk="Microsoft.NET.Sdk">
     <PropertyGroup>
       <OutputType>Exe</OutputType>
       <TargetFramework>net9.0</TargetFramework>
       <RootNamespace>MyProjNamespace</RootNamespace>
       <ImplicitUsings>enable</ImplicitUsings>
       <Nullable>enable</Nullable>
       <TelerikLicensingVerbosity>diagnostic</TelerikLicensingVerbosity>
     </PropertyGroup>
     <ItemGroup>
       <PackageReference Include="Telerik.Documents.Spreadsheet" Version="2025.2.520" />
       <PackageReference Include="Telerik.UI.for.AspNet.Core" Version="2025.1.227" />
     </ItemGroup>
   </Project>
   ```

* Build the project and verify the Output window for confirmation that the license setup is valid.

## See Also

- [Setting Up Your Telerik Document Processing Libraries License Key]({%slug setting-up-license-key%})
- [Telerik Purchase Options](https://www.telerik.com/purchase.aspx?filter=web)
---
