---
title: Resolving Trial Watermark Issues with the Generated Documents in MFC applications
description: Instructions to resolve trial watermark issues in PDF files generated using Telerik Document Processing Libraries, caused by licensing setup or version mismatch.
type: how-to
page_title: Fixing Trial Watermark in the Generated Documents in MFC applications
meta_title: Fixing Trial Watermark in the Generated Documents in MFC applications
slug: resolving-trial-watermark-mfc-application
tags: licensing, watermark, mfc, telerik, document, processing, troubleshooting, pdf
res_type: kb
ticketid: 1711260
---

## Environment
| Version | Product | Author | 
| ---- | ---- | ---- | 
| 2026.1.210| Telerik Document Processing|[Desislava Yordanova](https://www.telerik.com/blogs/author/desislava-yordanova)| 

## Description

When you generate documents in MFC (Microsoft Foundation Class) applications with Telerik Document Processing libraries, a trial watermark may appear even though the [license is properly set up]({%slug setting-up-license-key%}). This issue can occur even if a valid license is detected during the build phase, as indicated by the build output.

## Solution

To resolve a license issue with Telerik Document Processing in MFC applications, follow these steps:

1. Verify that the [Telerik.Licensing](https://www.nuget.org/packages/Telerik.Licensing) NuGet package is directly referenced in the startup project. For .NET Framework startup projects that do not use the [SDK-style](https://learn.microsoft.com/en-us/dotnet/core/project-sdk/overview) project structure, verify that one or more Telerik Document Processing NuGet packages or assemblies are referenced in the project. If the startup project contains no Telerik Document Processing references and is not an SDK-style project, the licensing mechanism cannot determine that any Telerik products are in use. As a result, the license check returns `False` at runtime.

2. Verify that a [valid license key is present and correctly configured]({%slug setting-up-license-key%}).

3. Call the `TelerikLicensing`.[Register]({%slug adding-license-key-ci-cd-services%}#using-teleriklicensing-register-method-on-aws-lambdas) method as early as possible in your project because there is no strict entry point.

4. Use a Document Processing version that matches the corresponding `Telerik.Licensing` version. MFC C++ applications have no binding redirect, and it is possible to load different versions of `Telerik.Licensing`. You may call `.Register()` on one version while the libraries look for a license on another. Strictly follow the corresponding versions. For example:

    * Document Processing version **2025.4.1319** matches `Telerik.Licensing` **1.6.36**.

    * Document Processing version **2026.1.210** matches `Telerik.Licensing` **1.6.40**.

    * Document Processing version **2026.1.304** matches `Telerik.Licensing` **1.7.0**.

5. Check the loaded assemblies after the code that produces the document:

```csharp
            Assembly entryAssembly = Assembly.GetEntryAssembly();
            Debug.WriteLine(" - EntryAssembly: " + entryAssembly.FullName);
            foreach (var assembly in AppDomain.CurrentDomain.GetAssemblies())
            {
                Debug.WriteLine(" - LoadedAssembly: " + assembly.FullName); 
            }
``` 

## See Also

* [Setting Up Your Telerik Document Processing Libraries License Key]({%slug setting-up-license-key%})
