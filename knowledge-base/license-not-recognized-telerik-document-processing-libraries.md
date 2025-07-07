---
title: Resolving License Validation Issues in Telerik Document Processing Libraries
description: Troubleshooting the issue where the license is not recognized during runtime in Telerik Document Processing Libraries.
type: troubleshooting
page_title: License Not Recognized in Telerik Document Processing Libraries
meta_title: License Not Recognized in Telerik Document Processing Libraries
slug: license-not-recognized-telerik-document-processing-libraries
tags: telerik, document, processing, license, validation, runtime, issues, licensing, diagnostics
res_type: kb
ticketid: 1690929
---

## Environment

| Version | Product | Author | 
| ---- | ---- | ---- | 
| 2025.2.520| RadPdfProcessing |[Desislava Yordanova](https://www.telerik.com/blogs/author/desislava-yordanova)| 

## Description

This article aims to address potential licensing issues while generating Excel (or PDF, DOCX, etc.) files with Telerik Document Processing Libraries during **runtime** testing. The generated file contains a "License" sheet (or a watermark) with a trial message, despite the **Build Output** window indicating a valid license. The issue arises in a multi-project (e.g. Blazor WASM) application setup, where dependencies are shared across projects.

## Cause

This issue generally occurs due to incomplete license validation during runtime in complex setups, particularly when using shared libraries or plugin architectures. *Even if the license is validated during build time, runtime environments may fail to recognize it due to transitive dependency limitations.*

## Solution

The **Telerik.Licensing** verifies the DevSeat association at the time your classlib is built, and also provisions at runtime licenses in the Root app. When you have a setup such as **"Root app -> classlib -> Telerik UI"**, the Telerik UI will execute and verify the licensing for the classlib, but will not be applied transitively in the Root app. That's why you **need to add the Telerik.Licensing NuGet package reference to Root app manually**.

To ensure proper license validation and eliminate trial messages, follow the steps below:

* **Direct Package References**: Add references to the **Telerik.Licensing** package directly in the Root project. This resolves transitive dependency limitations.

* **Explicit License Registration**: Add a call to `TelerikLicensing.Register()` early in your application lifecycle. For Blazor WASM applications, include this call in the `Program.cs` file. This approach validates the license explicitly.

* **Verify Assemblies**: Ensure **no trial** versions of Telerik assemblies are referenced in any project. Replace [trial assemblies]({%slug upgrade-trial-to-licensed-version%}) with licensed ones, if such even exist.

* **Enable Diagnostics**: Add the following property to your `.csproj` file to enable detailed licensing diagnostics during build and runtime:
   ```xml
   <PropertyGroup>
       <TelerikLicensingVerbosity>diagnostic</TelerikLicensingVerbosity>
   </PropertyGroup>
   ```
   Review the diagnostic output for clues about license validation issues.

* **Avoid Environment Variables**: Use only the `telerik-license.txt` file for license delivery instead of environment variables, which can cause issues due to length limitations.

By following these steps, runtime validation issues should resolve, and the trial message will no longer appear in generated documents.

## See Also

- [Telerik Document Processing Licensing Overview]({%slug introduction%})
- [Setting Up Your Telerik Document Processing Libraries License Key]({%slug setting-up-license-key%})
- [Using TelerikLicensing.Register Method]({%slug adding-license-key-ci-cd-services%}#using-teleriklicensingregister-method-on-aws-lambdas)
- [Diagnostic Options for Telerik Licensing]({%slug telerik-trial-version-message-diagnostic-options%})
