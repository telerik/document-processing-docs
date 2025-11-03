---
title: Runtime Licensing Diagnostics
description: Step-by-step walkthrough of using Telerik.Licensing runtime diagnostics to investigate unexpected watermarks across web, plugin, and desktop scenarios.
type: how-to
page_title: Runtime Licensing Diagnostics
meta_title: Runtime Licensing Diagnostics
slug: runtime-licensing-diagnostics
tags: licensing, diagnostics, runtime, watermark, plugins, webforms, aspnet, blazor, wpf, winforms, license, key, register
ticketid: 1697496
res_type: kb
---

## Environment

| Version | Product(s) | Author |
| ---- | ---- | ---- |
| 2025.3.806 | Document Processing & Telerik UI |[Yoan Karamanov](https://www.telerik.com/blogs/author/yoan-karamanov)|

## Description

In certain environments an application may still show a trial watermark (or trial sheet) **at runtime** even though everything looked correct at **build time**:

* Valid **telerik-license.txt** file is present.
* Build logs indicate Telerik products detected (class library and executable).
* No licensing build errors are reported.

Yet the rendered UI (document, control, page) contains a watermark.

These issues surface mainly in two categories:

1. **Web products (ASP.NET AJAX, MVC, Core, Blazor)** – Incorrect script load order or duplicate script imports where one import overrides a previously applied license.
2. **.NET applications with extensibility / plugins (WPF, WinForms, class libraries, host wrappers)** - The entry assembly at runtime differs (e.g. a host like **SentinelDotNetFx.dll**), changing the licensing evaluation path.

Runtime diagnostics in **Telerik.Licensing** help correlate what the licensing engine sees (entry assembly, loaded assemblies, product metadata, license evidences) with the final **IsLicenseValid** result.

## Solution

### 1. Enable Diagnostics Early
Call **Telerik.Licensing.TelerikLicensing.EnableDiagnostics();** **as early as possible**, before any Telerik UI controls or Document Processing code is first reached/loaded.

### 2. Plugin / Non-Standard Entry Scenarios
If the code runs as a plugin or a dynamically loaded context (no traditional entry assembly, or an unexpected wrapper assembly), call **TelerikLicensing.Register()** **after** enabling diagnostics to provision runtime script keys.

### 3. Execute
Trigger the Telerik code so the licensing pipeline executes.

### 4. Collect the Log
Read the accumulated diagnostics text from **Telerik.Licensing.TelerikLicensing.Diagnostics** and persist it (file, console). The log grows for the life of the process (restart to clear).

### 5. Analyze Key Sections
Look for:
- Entry assembly (**Assembly.GetEntryAssembly()**)
- Product metadata extraction (**ProductMetadataForAssembly ...**)
- License evidences (subscription / perpetual tokens)
- Final resolution line (**Resolved: IsLicenseValid: ...**)

### 6. Disable When Done
Diagnostics add overhead and should not remain enabled indefinitely in production.

### Performance & Operational Notes
- Diagnostics add measurable overhead. Use only during investigation.
- Log size grows monotonically until process restart.
- Capture the log after reproducing the watermark; then disable diagnostics.

## See Also

* [License Activation Errors and Warnings]({%slug activation-errors-and-warnings%})
* [Adding the License Key to CI Services]({%slug adding-license-key-ci-cd-services%})
* [License Key FAQ]({%slug frequently-asked-questions%})
* [License Agreement]({%slug license-agreement%})
* [Redistributing Telerik Document Processing]({%slug installation-deploying-telerik-document-processing%})
* [Unable to find package Telerik.Licensing]({%slug dpl-package-update-failure-license%})
* [Handling License Key File Name and Environment Variable Name Changes in the 2025 Q1 Release]({%slug handling-license-file-name-changes%})
* [Telerik.Licensing NuGet package is not available on the Telerik NuGet feed]({%slug dpl-telerik-licensing-nuget-feed%})
* [Diagnostic Options for Telerik Licensing]({%slug telerik-trial-version-message-diagnostic-options%})
* [Resolving License Validation Issues in Telerik Document Processing Libraries]({%slug license-not-recognized-telerik-document-processing-libraries%})
* [Telerik License Approaches](https://github.com/LanceMcCarthy/DevOpsExamples?tab=readme-ov-file#telerik-license-approaches)
