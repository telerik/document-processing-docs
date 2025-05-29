---
title: Guidelines for Upgrading Document Processing Libraries Independently from WPF (WinForms) Libraries
description: Learn what to have in mind when upgrading Telerik Document Processing Libraries while using an older version of the Telerik UI for WPF (WinForms) suite, and understand the implications.
type: how-to
page_title: How to Upgrade Telerik Document Processing Libraries Without Upgrading WPF Libraries
slug: upgrade-document-processing-libraries-separately-from-wpf
tags: document, processing, libraries, upgrade, dependencies, wpf, telerik, winforms
res_type: kb
ticketid: 1681608
---

## Environment

| Version | Product | Author | 
| ---- | ---- | ---- | 
| 2025.1.205| Telerik Document Processing |[Desislava Yordanova](https://www.telerik.com/blogs/author/desislava-yordanova)| 

## Description

This article covers the case when a client needs to upgrade **only** the Telerik Document Processing Libraries version to address a vulnerability issue, while the WPF (WinForms) libraries remain the previous version in the same project. 

## Solution

To upgrade the Telerik Document Processing Libraries (DPL) while using an older version of the Telerik UI for WPF (WinForms) suite, follow these guidelines:

* **Understand Dependencies**: Certain Telerik UI for WPF (or WinForms) controls such as RichTextBox (RichTextEditor), PdfViewer, PivotGrid, and GridView have dependencies on the Document Processing Libraries (DPL) for specific functionalities, like exporting data. If your application uses functionalities or controls dependent on DPL, consider upgrading both the DPL and WPF (WinForms) libraries to ensure compatibility and stability. For scenarios where upgrading the entire suite is not feasible, removing unused references to DPL might be an alternative. 
If your application does not utilize these specific functionalities or controls, you may upgrade only the DPL assemblies.
   
* **Evaluate Compatibility**: While it is technically possible to use a newer DPL version ( e.g. 2025.1.205) with an older WPF version (e.g. 2024.4.1111), Telerik does not guarantee the same level of application stability due to the potential changes in the internal API used by the WPF suite.

* **Consider Licensing Changes**: Starting from the 2025 Q1 release, all Telerik products, including DPL, introduced a dependency on the Telerik.Licensing library. Ensure to account for this change by setting up the license key as outlined in the [Setting Up Your Telerik Document Processing Libraries License Key]({%slug setting, up, license, key, document, processing, libraries%}).

* **Perform Extensive Testing**: Before finalizing the upgrade, thoroughly test your application with the new DPL version to identify any runtime issues that might not be apparent during development.

## See Also

- [Telerik.Licensing NuGet Package Information]({%slug dpl-telerik-licensing-nuget-feed%})
- [Upgrade Instructions]({%slug installation-upgrade-instructions%})
- [Upgrading Q1 2025 Trial to Q2 2025 Licensed Version]({%slug upgrade-q1-2025-trial-to-q2-2025-purchase-license%})
