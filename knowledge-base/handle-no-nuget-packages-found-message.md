---
title: Handling the 'No packages found" Message when Using the Telerik NuGet Server
description: Learn how to handle the 'No packages found" message when using the Telerik NuGet Server
type: how-to
page_title: How to handle the 'No packages found" message when using the Telerik NuGet Server
slug: handle-no-nuget-packages-found-message
tags: telerik, nuget, server, package, dpl, document, processing
res_type: kb
ticketid: 1672286
---

## Description

When adding the Telerik NuGet source (https://nuget.telerik.com/v3/index.json) to a .NET 8 (WebApi) project in Visual Studio 2022, the expected Telerik NuGet packages do not appear in the Manage NuGet Packages window, even after entering the correct credentials. This knowledge base article also answers the following questions:
- How can I ensure Telerik NuGet packages are visible in Visual Studio 2022?
- What steps should I take if Telerik NuGet packages do not appear after adding the Telerik source?
- How do I troubleshoot issues with adding Telerik NuGet packages to a .NET 8 project?

## Solution

To resolve the issue of Telerik NuGet packages not appearing in Visual Studio 2022 for a .NET 8 project, follow these steps:

1. **Add Telerik NuGet Source Correctly**: Make sure the Telerik NuGet source is added correctly to Visual Studio 2022. The correct source URL is `https://nuget.telerik.com/v3/index.json`. Refer to the [official Telerik documentation](https://docs.telerik.com/devtools/document-processing/getting-started/installation/nuget-packages) for detailed instructions.

2. **Enter Correct Credentials**: When prompted, enter the correct Telerik account credentials. Ensure you are using an account with an active subscription or trial.

3. **Check for Multiple Accounts**: Verify if you have multiple Telerik accounts and ensure you are using the one with an active subscription. Packages may not appear if the account used has no active licenses.

4. **Reset Telerik NuGet Credentials**: If you have verified the above steps and still face issues, try resetting your Telerik NuGet credentials. This ensures that Visual Studio is using the correct account for authentication. Instructions for resetting credentials can be found in the [Troubleshooting Telerik NuGet](https://docs.telerik.com/devtools/document-processing/troubleshooting/telerik-nuget#issue-resetting-telerik-nuget-credentials) guide.

5. **Download Packages Manually (Optional)**: As a workaround, you can manually download the required Telerik NuGet packages and add them as a local source in Visual Studio. Detailed steps for manual download are provided in the [Manually Download NuGet Packages](https://docs.telerik.com/devtools/document-processing/getting-started/installation/install-nuget-packages#manually-download-nuget-packages) section.

Ensure you follow these steps to add Telerik NuGet packages to your .NET 8 project successfully.

## See Also

- [Available NuGet Packages](https://docs.telerik.com/devtools/document-processing/getting-started/installation/nuget-packages)
- [Install Using NuGet Packages](https://docs.telerik.com/devtools/document-processing/getting-started/installation/install-nuget-packages)
- [Restoring NuGet Packages in Your CI Workflow](https://docs.telerik.com/devtools/document-processing/getting-started/installation/nuget-keys)
- [Troubleshooting Telerik NuGet](https://docs.telerik.com/devtools/document-processing/troubleshooting/telerik-nuget)

---
