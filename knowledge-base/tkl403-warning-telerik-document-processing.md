---
title: Resolving TKL403 Licensing Warning for Telerik Document Processing
description: Explains how to address the TKL403 licensing warning related to the Telerik Document Processing Libraries and subscription requirements.
type: how-to
page_title: Fixing TKL403 Warning for Telerik Document Processing Libraries
meta_title: Fixing TKL403 Warning for Telerik Document Processing Libraries
slug: tkl403-warning-telerik-document-processing
tags: telerik, document, processing, licensing, tkl403, subscription, license, wpf, winforms, allcontrols
res_type: kb
ticketid: 1714155
---

## Environment

| Version | Product | Author | 
| ---- | ---- | ---- | 
| Q1 2026 | Telerik Document Processing|[Desislava Yordanova](https://www.telerik.com/blogs/author/desislava-yordanova)| 

## Description

The `TKL403` licensing warning occurs when using Telerik Document Processing Libraries version Q1 2026. The error states: *"Services associated with Telerik Document Processing Libraries require a subscription or trial license. Please obtain a subscription license."* This issue commonly arises when using one of the following NuGet packages:

* `Telerik.UI.for.Wpf.AllControls`
* `UI.for.WinForms.AllControls`

Both packages include references to the Telerik Document Processing [Agent Tools]({%slug agent-tools-overview%}). These AI tools require a **subscription** license, which is not covered under a **perpetual** license.

This knowledge base article also answers the following questions:
* How to resolve the `TKL403` warning for Telerik Document Processing Libraries?
* Why does Telerik Document Processing require a subscription license?
* How to fix licensing warnings for AI tools in Telerik Document Processing?

## Solution

To resolve the `TKL403` licensing warning, follow these steps:

1. Check if the `Telerik.UI.for.Wpf.AllControls` or `UI.for.WinForms.AllControls` NuGet package is in use. This package includes unnecessary dependencies like Telerik Document Processing Agent Tools, which require a subscription license.
2. If you use one of the combined packages, replace it with individual NuGet packages for the specific components in your project. This approach excludes the AI tools and prevents licensing warnings.
3. If you need the AI tools, get a subscription license to remove the warning. For more information, see [License Requirements]({%slug agent-tools-overview%}#license-requirements).
4. The generated documents do not display a watermark and your license for the core Telerik Document Processing libraries remains valid. The warnings do not indicate a license problem for the packages you actively use.
5. If the warning persists, confirm that only relevant NuGet packages are installed and no unnecessary dependencies are included.

## See Also

* [License Requirements for AI Tools]({%slug agent-tools-overview%}#license-requirements)
* [Troubleshooting Licensing Warnings and Errors]({%slug activation-errors-and-warnings%})
