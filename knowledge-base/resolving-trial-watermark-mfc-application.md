---
title: Resolving Trial Watermark Issues with the Generated Documents in MFC applications
description: Instructions to resolve trial watermark issues in PDF files generated using Telerik Document Processing Libraries, caused by licensing setup or version mismatch.
type: how-to
page_title: Fixing Trial Watermark in the Generated Documents in MFC applications
meta_title: Fixing Trial Watermark in the Generated Documents in MFC applications
slug: resolving-trial-watermark-mfc-application
tags: licensing, telerik-document-processing, troubleshooting, pdf-generation, license-validation
res_type: kb
ticketid: 1711260
---

## Environment
| Version | Product | Author | 
| ---- | ---- | ---- | 
| 2026.1.210| Telerik Document Processing|[Desislava Yordanova](https://www.telerik.com/blogs/author/desislava-yordanova)| 

## Description

When generating documents in MFC (Microsoft Foundation Class) applications with Telerik Document Processing libraries, a trial watermark may be observed even though the [license is properly setup]({%slug setting-up-license-key%}). This issue can occur even if a valid license is detected during the build phase, as indicated by the build output. 

## Solution

To resolve a license issue with Telerik Document Processing in MFC applications, follow the steps:

1. Ensure that the [Telerik.Licensing](https://www.nuget.org/packages/Telerik.Licensing) NuGet package is directly referenced in the startup project. For .NET Framework startup projects that do not use the [SDK-style](https://learn.microsoft.com/en-us/dotnet/core/project-sdk/overview) project structure, ensure that there is one or more Telerik Document Processing NuGet packages/assemblies referenced in the project. If the startup project contains no Telerik Document Processing references and is not defined as SDK-style project, and is instead referencing other projects that contain the Document Processing-related code, our licensing mechanism cannot determine that any Telerik products are used, thus the license check will be False at runtime. 

2. Ensure that a [valid license key is present and correctly configured]({%slug setting-up-license-key%}). 

3. Call the TelerikLicensing.[Register]({%slug adding-license-key-ci-cd-services%}#using-teleriklicensing-register-method-on-aws-lambdas) method as early as possible in your project since there is not strict entry point.

4. Use Document Processing version that matches the corresponding Teleri.Licensing version. MFC C++ application have no binding redirect and it is possible to load different versions of Telerik.Licensing, respectively you call .Register() on one, and the libraries look for a license on another. That is why we should strictly follow the corresponding versions. For example: 

    * Document Processing Version **2025.4.1319** matches Telerik.Licensing **1.6.36**.

    * Document Processing Version **2026.1.210** matches Telerik.Licensing **1.6.40**.

    * Document Processing Version **2026.1.304** matches Telerik.Licensing **1.7.0**.

5. Troubleshooting Steps: Check the loaded assemblies after the code for producing the document: 

```csharp
            Assembly entryAssembly = Assembly.GetEntryAssembly();
            Debug.WriteLine(" - EntryAssembly: " + entryAssembly.FullName);
            foreach (var assembly in AppDomain.CurrentDomain.GetAssemblies())
            {
                Debug.WriteLine(" - LoadedAssembly: " + assembly.FullName); 
            }
``` 

## See Also

- [Setting Up Your Telerik Document Processing Libraries License Key]({%slug setting-up-license-key%})
