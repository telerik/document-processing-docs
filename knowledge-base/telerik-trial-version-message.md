---
title: Diagnostic Options for Telerik Licensing
description: Learn how to better diagnose the issues of the trial version message in Telerik products when using a DevCraft UI License.
type: how-to
page_title: Diagnostic Options for Telerik Licensing
slug: telerik-trial-version-message-diagnostic-options
tags: telerik, license, trial, diagnostics, document, processing, devcraft, watermark
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
* How to properly set up Telerik Document Processing license keys?
* How to resolve trial version messages?
* How to verify included assemblies for Telerik Document Processing?

## Solution

Ensure your license includes the respective product. Without a valid license for the respective Telerik product, the trial version message persists. Verify your license details on the [Telerik Purchase](https://www.telerik.com/purchase.aspx?filter=web) page.

[Telerik Document Processing]({%slug introduction%}) is distributed with several bundles. Learn [What Versions of Document Processing Libraries are Distributed with the Telerik Products]({%slug distribute-telerik-document-processing-libraries-net-versions%}). To integrate and validate its license, follow these steps:

* Remove any environment variables such as `KENDO_UI_LICENSE` or `TELERIK_LICENSE `, as they may cause licensing issues due to length limitations on Windows. Instead, use the `telerik-license.txt` file as described in [Setting Up Your Telerik Document Processing Libraries License Key]({%slug setting-up-license-key%}).

* Use the `TelerikLicensingVerbosity` configuration in your project file to enable detailed licensing diagnostics during build. The following example shows a sample configuration of the project file:

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

### Verbosity Values

`TelerikLicensingVerbosity` controls how much information the Telerik licensing targets emit during the build process. The available values are: 

| Mode | Accepted values | Description |
|------|----------------|-------------|
| Quiet | `q`, `Q`, `quiet`, `Quiet` | Reduces routine licensing output; high-priority messages remain visible. |
| Verbose | `v`, `V`, `verbose`, `Verbose` | Shows more licensing details by increasing message importance. |
| Diagnostic | `d`, `D`, `diag`, `Diag`, `diagnostic`, `Diagnostic`, `diagnostics`, `Diagnostics` | Promotes all licensing messages to high importance for troubleshooting. |
| Normal (default) | Unset or any unrecognized value | Uses standard licensing output. |

For maximum logging during troubleshooting:

```xml
<PropertyGroup>
  <TelerikLicensingVerbosity>diagnostic</TelerikLicensingVerbosity>
</PropertyGroup>
```

The following sample build output shows license lookup and resolution messages during a successful rebuild. Account details, organization names, and license identifiers use placeholders:

```text
     Provision Licensing
           Looking up license file...
           - EnvironmentVariablePath: TELERIK_LICENSE_PATH (NotAvailable)
           - EnvironmentVariable: TELERIK_LICENSE (NotAvailable)
           - EnvironmentVariable: KENDO_UI_LICENSE (NotAvailable)
           - RecursiveFilePath: C:\Users\MyUserName\MyProjects\WinForms_Sample\telerik-license.txt (NotAvailable)
           - RecursiveFilePath: C:\Users\MyUserName\MyProjects\WinForms_Sample\kendo-ui-license.txt (NotAvailable)
           - RecursiveFilePath: C:\Users\MyUserName\OneDrive - Contoso\MyProjects\telerik-license.txt (NotAvailable)
           - RecursiveFilePath: C:\Users\MyUserName\OneDrive - Contoso\MyProjects\kendo-ui-license.txt (NotAvailable)
           - RecursiveFilePath: C:\Users\MyUserName\OneDrive - Contoso\telerik-license.txt (NotAvailable)
           - RecursiveFilePath: C:\Users\MyUserName\OneDrive - Contoso\kendo-ui-license.txt (NotAvailable)
           - RecursiveFilePath: C:\Users\MyUserName\telerik-license.txt (NotAvailable)
           - RecursiveFilePath: C:\Users\MyUserName\kendo-ui-license.txt (NotAvailable)
           - RecursiveFilePath: C:\Users\telerik-license.txt (NotAvailable)
           - RecursiveFilePath: C:\Users\kendo-ui-license.txt (NotAvailable)
           - RecursiveFilePath: C:\telerik-license.txt (NotAvailable)
           - RecursiveFilePath: C:\kendo-ui-license.txt (NotAvailable)
           - UserDirectory: C:\Users\MyUserName\AppData\Roaming\Telerik\telerik-license.txt (LicenseFound)
           - UserDirectory: C:\Users\MyUserName\AppData\Roaming\Telerik\kendo-ui-license.txt (Skip)
           LicenseKey
           - AUD: u***@example.com
           - UsedId: YourUserID
           - LicenseId: YourLicenseID
           - IssuedAt: 10/6/2026 8:52:46 AM
           - Licenses
             0) Subscription BLAZOR, expiration 8/18/2027 5:00:00 AM, type: 'subscription'
             1) Trial FORGE, expiration 11/6/2026 9:52:44 AM, type: 'trial'
             2) Subscription JM, expiration 8/18/2027 5:00:00 AM, type: 'subscription'
             3) Subscription KENDOUIANGULAR, expiration 8/18/2027 5:00:00 AM, type: 'subscription'
             4) Subscription KENDOUICOMPLETE, expiration 8/18/2027 5:00:00 AM, type: 'subscription'
             5) Subscription KENDOUIMVC, expiration 8/18/2027 5:00:00 AM, type: 'subscription'
             6) Subscription KENDOUIREACT, expiration 8/18/2027 5:00:00 AM, type: 'subscription'
             7) Subscription KENDOUIVUE, expiration 8/18/2027 5:00:00 AM, type: 'subscription'
             8) Subscription MAUI, expiration 8/18/2027 5:00:00 AM, type: 'subscription'
             9) Subscription RCAJAX, expiration 8/18/2027 5:00:00 AM, type: 'subscription'
             10) Subscription RCWF, expiration 8/18/2027 5:00:00 AM, type: 'subscription'
             11) Subscription RCWPF, expiration 8/18/2027 5:00:00 AM, type: 'subscription'
             12) Subscription REPORTING, expiration 8/18/2027 5:00:00 AM, type: 'subscription'
             13) Subscription REPORTSERVER, expiration 8/18/2027 5:00:00 AM, type: 'subscription'
             14) Subscription UIASPCORE, expiration 8/18/2027 5:00:00 AM, type: 'subscription'
             15) Subscription UIXAM, expiration 2/19/2025 6:00:00 AM, type: 'subscription'
             16) Subscription WINUI, expiration 8/18/2027 5:00:00 AM, type: 'subscription'
             17) Usage UserId: YourUserId, LicenseId: YourLicenseID, type: 'usage'
     License Resolution
           Messages
             - License OK for "Telerik UI for WinForms" (RCWF) 2026.3.1007.90 @2026-10-07 - Subscription, valid until 2027-08-18.
             - License OK for "Telerik Document Processing Libraries" (DPL) 2026.3.1006.100 @2026-10-06 - Subscription for RCWF, valid until 2027-08-18.
           JWTs
             - YourLicenseKey
           Licenses
             - License OK for "Telerik UI for WinForms" (RCWF) 2026.3.1007.90 @2026-10-07 - Subscription, valid until 2027-08-18.
             - License OK for "Telerik Document Processing Libraries" (DPL) 2026.3.1006.100 @2026-10-06 - Subscription for RCWF, valid until 2027-08-18.
   OutputType: WinExe, ImportXamlTargets: True
   LicenseEvidence CodeGen: obj\Debug\net10.0-windows\Telerik.Licensing.LicenseInfo.cs

         Call-Home Telerik Products (2 for net10.0-windows)
         - "Telerik UI for WinForms" (RCWF) 2026.3.1007
         - "DPL" (DPL) 2026.3.1006


         Call-Home Telerik Features (0 for net10.0-windows)

     Instantiate Licensing Client...
     Resolve Licensing Context...
     Send Events...
     Report Telerik.Licensing
           UserId: YourUserId
           LicenseId: YourLicenseId
           Products
           - LicenseUsed RCWF 2026.3.1007.90 SKIPPED
           - LicenseUsed DPL 2026.3.1006.100 SKIPPED
         Report finished in 00:00:00.0675129
     Licensing Metrics done 00:00:00.0675129
     Sending Telemetry...
     Instantiate Call-Home Client...
     Resolve Call-Home Context...
     Send Events...
     Metrics done 00:00:00.0505100
   [Telerik and Kendo UI Licensing]
         Telerik and Kendo UI License Key found at: C:\Users\MyUserName\AppData\Roaming\Telerik\telerik-license.txt (UserDirectory)
         License issued at 2026-10-06 to u***@example.com.
   [Telerik and Kendo UI Licensing]
         Your Telerik UI for WinForms subscription is active. Expiration in 281 days.
   [Telerik and Kendo UI Licensing]
         Your Telerik Document Processing Libraries subscription is active. Expiration in 281 days.
   Resolve Telerik Products. Done (00:00:00.3798748) for net10.0-windows
========== Rebuild All: 1 succeeded, 0 failed, 0 skipped ==========
========== Rebuild completed at 12:28 PM and took 22.470 seconds ==========
```

The following sections explain the sample build output above. License locations, entitlements, expiration dates, and resolution results can differ in your environment.

### License Discovery

During the **Provision Licensing** phase, the build searches for a Telerik license key in supported locations, including environment variables, project folders, parent directories, and the Telerik user profile directory. After checking multiple locations, a valid license file is found at: C:\Users\MyUserName\AppData\Roaming\Telerik\telerik-license.txt. This confirms that licensing is configured through the standard Telerik user-profile location rather than through environment variables or a repository-local license file.

### License Information

The discovered license contains several Telerik and Kendo UI product entitlements associated with the licensed user account. Most subscriptions are active through 18-Aug-2027, including Telerik UI for WinForms (RCWF) and related product suites. The presence of multiple product entitlements indicates a bundled subscription such as DevCraft or a similar Telerik subscription package.

### License Resolution

The License Resolution phase validates that the license covers the specific Telerik assemblies referenced by the project. The build confirms valid licensing for:

* Telerik UI for WinForms (RCWF) version 2026.3.1007.90
* Telerik Document Processing Libraries (DPL) version 2026.3.1006.100

Both products are covered by an active subscription valid until 18-Aug-2027, allowing the build to proceed without trial limitations or licensing warnings.

For runtime investigations, see the separate [runtime licensing diagnostics workflow]({%slug runtime-licensing-diagnostics%}).

## See Also

* [Setting Up Your Telerik Document Processing Libraries License Key]({%slug setting-up-license-key%})
* [Telerik Purchase Options](https://www.telerik.com/purchase.aspx?filter=web)
