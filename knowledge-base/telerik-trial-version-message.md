---
title: Removing Trial Version Message from Telerik Reporting Project
description: Resolving the issue of the trial version message in Telerik Reporting when using a DevCraft UI License.
type: how-to
page_title: Resolving Licensing Issues for Telerik Reporting and Document Processing
slug: telerik-trial-version-message
tags: progress, telerik, reporting, license, document-processing, devcraft-ui
res_type: kb
ticketid: 1688475
---

## Environment

| Version | Product | Author | 
| ---- | ---- | ---- | 
| 2025.1.205| Telerik Document Processing|[Desislava Yordanova](https://www.telerik.com/blogs/author/desislava-yordanova)| 

## Description

I created a project using Telerik UI for ASP.Net Core and attempted to integrate Telerik Reporting and Telerik Document Processing. Despite adding the license key file `TelerikLicense.cs`, the reports displayed the trial version message. Additionally, I encountered issues with the `KENDO_UI_LICENSE` environment variable and errors indicating corrupted license key content in the build output.

This knowledge base article also answers the following questions:
- How to properly set up Telerik Document Processing license keys?
- How to resolve trial version messages in Telerik Reporting?
- How to verify included assemblies for Telerik Document Processing?

## Solution

### License Compatibility for Telerik Reporting
Ensure your license includes Telerik Reporting. The DevCraft UI license does not cover Telerik Reporting; it requires a DevCraft Complete or Ultimate license. Without a valid license for Telerik Reporting, the trial version message will persist. Verify your license details on the [Telerik Purchase](https://www.telerik.com/purchase.aspx?filter=web) page.

### Using Telerik Document Processing Libraries
Telerik Document Processing is distributed with Telerik UI for ASP.Net Core. To integrate and validate its license, follow these steps:

1. Remove any environment variables such as `KENDO_UI_LICENSE`, as they may cause licensing issues due to length limitations on Windows. Instead, use the `telerik-license.txt` file as described in [Setting Up Your Telerik Document Processing Libraries License Key](https://docs.telerik.com/devtools/document-processing/distribution-and-licensing/license-key/setting-up-license-key).

2. Ensure only the following NuGet packages related to Telerik Document Processing are included in your project:
   - `Telerik.Documents.Core`
   - `Telerik.Documents.DrawingML`
   - `Telerik.Documents.Fixed`
   - `Telerik.Documents.Fixed.FormatProviders.Image.Skia`
   - `Telerik.Documents.Flow`
   - `Telerik.Documents.Flow.FormatProviders.Pdf`
   - `Telerik.Documents.ImageUtils`

3. Use the following configuration in your project file to enable detailed licensing diagnostics during build:
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

4. Build the project and verify the output window for confirmation that the license setup is valid.

### Recommendations for Project Setup
If your goal is to utilize Telerik Document Processing for tasks like PDF or Excel export, ensure you do not include Telerik Reporting libraries unless you have the appropriate license. For testing purposes, create a new project using the Telerik Visual Studio extension and include only the required NuGet packages for Telerik Document Processing.

## See Also

- [Setting Up Your Telerik Document Processing Libraries License Key](https://docs.telerik.com/devtools/document-processing/distribution-and-licensing/license-key/setting-up-license-key)
- [Available Assemblies in Telerik Document Processing](https://docs.telerik.com/devtools/document-processing/introduction#available-assemblies)
- [Telerik Purchase Options](https://www.telerik.com/purchase.aspx?filter=web)
---
