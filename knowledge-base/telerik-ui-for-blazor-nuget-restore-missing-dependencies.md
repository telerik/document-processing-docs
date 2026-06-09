---
title: Resolving Telerik UI for Blazor NuGet Restore Failures Due to Missing Dependencies
description: Learn how to address restore failures for Telerik UI for Blazor NuGet packages caused by missing dependencies in Telerik Document Processing libraries.
type: how-to
page_title: Resolving Telerik UI for Blazor NuGet Restore Failures Due to Missing Dependencies
meta_title: Resolving Telerik UI for Blazor NuGet Restore Failures Due to Missing Dependencies
slug: telerik-ui-for-blazor-nuget-restore-missing-dependencies
tags: blazor, nuget, restore, dependencies, telerik, document, processing, packages
res_type: kb
ticketid: 1712515
---

## Environment

| Version | Product | Author | 
| ---- | ---- | ---- | 
| 2026.1.210| Telerik Document Processing|[Desislava Yordanova](https://www.telerik.com/blogs/author/desislava-yordanova)| 
|13.1.0 (Trial)|Telerik.UI.for.Blazor||

## Description

When you have an active Blazor **trial** license and attempt to restore the `Telerik.UI.for.Blazor` package, the process may fail due to missing dependencies in Telerik Document Processing libraries, such as `Telerik.Documents.Spreadsheet`, `Telerik.Documents.SpreadsheetStreaming`, and `Telerik.Zip`. 

## Solution

Activate a [trial for DevCraft](https://www.telerik.com/download). This enables the Document Processing Downloads section in your Telerik account.

Alternatively, instead of using the NuGet packages, download the zip (for example, `telerik.ui.for.blazor.13.1.0.zip`) from your Telerik account:

<img style="border: 1px solid gray;" src="images/blazor-zip.png" alt="Blazor Zip" /> 

It contains all necessary DPL assemblies:

<img style="border: 1px solid gray;" src="images/all-assemblies.png" alt="All assemblies" />  

To ensure that the Telerik NuGet server is set up correctly on your machine, follow the steps:

1. Generate a new NuGet API Key from your Telerik account. Use this key for authenticating with the trial account. An API key instead of a password is a more secure approach:

    <img style="border: 1px solid gray;" src="images/generate-api-key.png" alt="Generate API key" />    

2. Configure the Telerik NuGet server as a package source in Visual Studio:

    <img style="border: 1px solid gray;" src="images/configure-nuget.png" alt="Configure NuGet Server" />  

3. Delete any existing package sources that contain Telerik NuGet packages. Add a new package source and enter `https://nuget.telerik.com/v3/index.json` in the **Source** field:

    <img style="border: 1px solid gray;" src="images/add-package-source.png" alt="Add package Source" />   

4. Specify the credentials by using the generated API key in the NuGet Config File:
   ```xml
   <?xml version="1.0" encoding="utf-8"?>
   <configuration>
       <packageSources>
           <clear />
           <add key="nuget.org" value="https://api.nuget.org/v3/index.json" />
           <add key="TelerikNuGetServer" value="https://nuget.telerik.com/v3/index.json" />
       </packageSources>
       <packageSourceCredentials>
           <TelerikNuGetServer>
               <add key="Username" value="api-key" />
               <add key="ClearTextPassword" value="Your API KEY" />
           </TelerikNuGetServer>
       </packageSourceCredentials>
   </configuration>
   ```

This ensures that you have added the Telerik NuGet feed as a package source associated with your trial license.

>note If you previously stored credentials for the Telerik NuGet server, reset them to authenticate with your new API key. Remove the saved credentials in the [Windows Credential Manager](https://support.microsoft.com/en-us/windows/credential-manager-in-windows-1b5c916a-6a16-889f-8581-fc16e8165ac0). These credentials appear as `nuget.telerik.com` or `VSCredentials_nuget.telerik.com` entries.

## See Also

* [Troubleshooting Telerik NuGet Feed](https://www.telerik.com/blazor-ui/documentation/troubleshooting/nuget-feed#unable-to-find-package)
