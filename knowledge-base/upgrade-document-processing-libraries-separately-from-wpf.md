---
title: Upgrading Document Processing Libraries Independently from WPF Libraries
description: Learn how to upgrade Telerik Document Processing Libraries while using an older version of the Telerik UI for WPF suite, and understand the implications.
type: how-to
page_title: How to Upgrade Telerik Document Processing Libraries Without Upgrading WPF Libraries
slug: upgrade-document-processing-libraries-separately-from-wpf
tags: document processing, libraries, upgrade, dependencies, wpf, telerik
res_type: kb
ticketid: 1681608
---

## Environment

| Version | Product | Author | 
| ---- | ---- | ---- | 
| 2025.1.205| Telerik Document Processing |[Desislava Yordanova](https://www.telerik.com/blogs/author/desislava-yordanova)| 

## Description

This article covers the case when a client needs to upgrade **only** the Telerik Document Processing Libraries version to address a vulnerability issue, while the WPF libraries remains the previous version in the same project. 

Is it possible to upgrade only the Document Processing Libraries without updating the WPF libraries, and what are the implications? This knowledge base article also answers the following questions:
- Can I upgrade Telerik Document Processing Libraries separately from Telerik UI for WPF suite?
- What are the dependencies between Telerik UI for WPF and Telerik Document Processing Libraries?
- How to ensure application stability when upgrading Telerik Document Processing Libraries?

## Solution

To upgrade the Telerik Document Processing Libraries (DPL) while using an older version of the Telerik UI for WPF suite, follow these guidelines:

1. **Understand Dependencies**: Certain WPF controls such as RichTextBox, PdfViewer, PivotGrid, and GridView have dependencies on the Document Processing Libraries (DPL) for specific functionalities, like exporting data. If your application does not utilize these specific functionalities or controls, you might not need to upgrade DPL.
   
2. **Evaluate Compatibility**: While it is technically possible to use a newer DPL version ( e.g. 2025.1.205) with an older WPF version (e.g. 2024.4.1111), Telerik does not guarantee the same level of application stability due to the potential changes in the internal API used by the WPF suite.

3. **Consider Licensing Changes**: Starting from the 2025 Q1 release, all Telerik products, including DPL, introduced a dependency on the Telerik.Licensing library. Ensure to account for this change by setting up the license key as outlined in the [Setting Up Your Telerik Document Processing Libraries License Key](https://docs.telerik.com/devtools/document-processing/distribution-and-licensing/license-key).

4. **Perform Extensive Testing**: Before finalizing the upgrade, thoroughly test your application with the new DPL version to identify any runtime issues that might not be apparent during development.

5. **Upgrading**: If your application uses functionalities or controls dependent on DPL, consider upgrading both the DPL and WPF libraries to ensure compatibility and stability. For scenarios where upgrading the entire suite is not feasible, removing unused references to DPL might be an alternative.

## See Also

- [Telerik.Licensing NuGet Package Information]({%slug dpl-telerik-licensing-nuget-feed%})
