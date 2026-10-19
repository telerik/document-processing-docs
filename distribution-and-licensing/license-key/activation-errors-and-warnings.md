---
title: Activation Errors and Warnings
description: Learn about Telerik Document Processing license activation errors and warnings caused by expired, missing, or invalid license keys.
page_title: License Activation Errors and Warnings
slug: activation-errors-and-warnings
tags: activation, license, key, errors, warnings, telerik, document, processing
published: True
position: 2
---

# Activation Errors and Warnings
Starting with the 2025 Q1 release, Telerik Document Processing reports licensing problems through build messages and runtime indicators. This article explains invalid licenses, distinguishes build-time messages from runtime behavior, and describes the related warning and error codes.

The result depends on the license type and whether you build or run the application:

* During a build, `Telerik.Licensing` reports a warning or error when it cannot validate the license.
* At runtime, a missing or invalid trial license can prevent normal operation and display a watermark and modal dialog box.
* An expired perpetual license can continue to work in a deployed application. Rebuilding with a product version outside the license validity period produces licensing indicators.
* An expired subscription license can continue to work in a deployed application. Rebuilding the application produces licensing indicators.

Click the **OK** button in the modal dialog box to close it and remove the banner until the next application startup.

## Invalid License
An invalid license can be caused by any of the following:

* Using an expired subscription license—subscription licenses expire at the end of the subscription term.
* Using a perpetual license for product versions released outside the validity period of your license.
* Using an expired trial license.
* A missing license for the product.
* Not installing a license key in your application.
* Not updating the license key after renewing your product license.

## License Warnings and Errors
When you use the product in a project with an expired or missing license, the `Telerik.Licensing` build task reports the following conditions:

|**Condition or message**|**Code**|**Resolution**|
|----|----|----|
|`No Telerik or Kendo UI product references detected in project.`|TKL001|<ul><li>If you use Telerik products and see this message, update the Telerik.Licensing package to version 1.4.9 or later.</li><li>If you do not use Telerik products, remove the Telerik.Licensing NuGet reference from your project.</li></ul>|
|`No Telerik and Kendo UI License file found.`|TKL002|[Install a license key]({%slug setting-up-license-key%}) to activate the UI components and remove the error message.|
|`Corrupted Telerik and Kendo UI License Key content in: [file path or environment variable name].`|TKL003|<ul><li>If you use a `telerik-license.txt` file to activate the components, [download a new license key file]({%slug setting-up-license-key%}) and place it in your home directory. Make sure to use a license key and not a script key.</li><li>If you use the `TELERIK_LICENSE` environment variable to store your license key, [download a new license key]({%slug setting-up-license-key%}), update the content of the environment variable, and make sure it contains the entire key.</li></ul>|
|`Unable to locate licenses for all products.`|TKL004|Your license is not valid for all Telerik and Kendo products added to your project. If you have already purchased the required license, then update [your license key]({%slug setting-up-license-key%}).|
|`"Telerik Document Processing Libraries" product is not listed in your current license file.`|TKL101|Review the purchase options for the listed products. Alternatively, remove the references to the listed packages from the project file (`.csproj`).|
|`Your current license has expired.`|TKL102|Use a license that covers the product version. [Download a new license key]({%slug setting-up-license-key%}#downloading-the-license-key) after renewing, or downgrade as indicated in the message.|
|`Your subscription license has expired.`|TKL103; TKL104|Renew your subscription and [download a new license key]({%slug setting-up-license-key%}).|
|`Your trial license has expired.`|TKL105|Purchase a commercial license to continue using the product.|
|`Services associated with Telerik Document Processing Libraries require a subscription or trial license. Obtain a subscription license.`|TKL403|In Q1 2026, this warning can occur when `Telerik.UI.for.Wpf.AllControls` or `UI.for.WinForms.AllControls` adds Telerik Document Processing Agent Tools. Replace the combined package with individual packages if you do not use the tools. Otherwise, purchase a subscription license. See [Resolving the TKL403 Licensing Warning]({%slug tkl403-warning-telerik-document-processing%}).|

## See Also

* [Setting Up Your License Key]({%slug setting-up-license-key%})
* [Adding the License Key to CI Services]({%slug adding-license-key-ci-cd-services%})
* [License Key FAQ]({%slug frequently-asked-questions%})
* [License Agreement]({%slug license-agreement%})
* [Redistributing Telerik Document Processing]({%slug installation-deploying-telerik-document-processing%})
* [Unable to find package Telerik.Licensing]({%slug dpl-package-update-failure-license%})
* [Handling License Key File Name and Environment Variable Name Changes in the 2025 Q1 Release]({%slug handling-license-file-name-changes%})
* [Telerik.Licensing NuGet package is not available on the Telerik NuGet feed]({%slug dpl-telerik-licensing-nuget-feed%})
* [Resolving TKL403 Licensing Warning for Telerik Document Processing]({%slug tkl403-warning-telerik-document-processing%})
