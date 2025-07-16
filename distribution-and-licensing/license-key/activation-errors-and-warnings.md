---
title: Activation Errors and Warnings
page_title: License Activation Errors and Warnings
slug: activation-errors-and-warnings
tags: activation, activate, errors, warnings, license, key, document, processing, libraries
published: True
position: 2
---

# License Activation Errors and Warnings
Starting with the 2025 Q1 release, using a product without a license or with an invalid license causes specific license warnings and errors. This article defines what an invalid license is, explains what is causing it, and describes the related license warnings and errors.

A missing, expired, or invalid license will result in:
- A watermark appearing on application startup.
- A modal dialog appearing on application startup. Clicking the **OK** button of the dialog closes the dialog and removes the banner until the next application startup.
- A warning message can appear in the build log.

### Invalid License
An invalid license can be caused by any of the following:

- Using an expired subscription license-subscription licenses expire at the end of the subscription term.
- Using a perpetual license for product versions released outside the validity period of your license.
- Using an expired trial license.
- A missing license for the product.
- Not installing a license key in your application.
- Not updating the license key after renewing your product license.

### License Warnings and Errors
When using the product in a project with an expired or missing license, the _Telerik.Licensing_ build task will indicate the following errors or conditions:

|**Condition**|**Message Code**|**Solution**|
|----|----|----|
|`No Telerik or Kendo UI product references detected in project`|TKL001|<ul><li>If you use Telerik products and see this message, update the Telerik.Licensing package to version 1.4.9 or later.</li><li>If you do not use Telerik products, remove the Telerik.Licensing NuGet reference from your project.</li></ul>|
|`No Telerik and Kendo UI License file found`|TKL002|[Install a license key]({%slug setting-up-license-key%}) to activate the UI components and remove the error message.|
|`Corrupted Telerik and Kendo UI License Key content in: [file path or environment variable name]`|TKL003|<ul><li>If you use a `telerik-license.txt` file to activate the components, [download a new license key file]({%slug setting-up-license-key%}) and place it in your home directory. Make sure to use a license key and not a script key.</li><li>If you use the `TELERIK_LICENSE` environment variable to store your license key, [download a new license key]({%slug setting-up-license-key%}), update the content of the environment variable, and make sure it contains the entire key.</li></ul>|
|`Unable to locate licenses for all products`|TKL004|Your license is not valid for all Telerik and Kendo products added to your project. If you have already purchased the required license, then update your license key]({%slug setting-up-license-key%}).|
|`"Telerik Document Processing Libraries" product is not listed in your current license file.`|TKL101|Review the purchase options for the listed products. Alternatively, remove the references to the listed packages from _package.json._|
|`Your current license has expired.`|TKL102|You are using a product version released outside the validity period of your perpetual license. To remove the error message, do either of the following: <br> - Renew your subscription and [download a new license key]({%slug setting-up-license-key%}#downloading-the-license-key). <br> - Downgrade to a product version included in your perpetual license as indicated in the message.|
|`Your subscription license has expired.`|TKL103; TKL104|Renew your subscription and [download a new license key]({%slug setting-up-license-key%}).|
|`Your trial license has expired.`|TKL105|Purchase a commercial license to continue using the product.|

## See Also

* [Setting Up Your License Key]({%slug setting-up-license-key%})
* [Adding the License Key to CI Services]({%slug adding-license-key-ci-cd-services%})
* [License Key FAQ]({%slug frequently-asked-questions%})
* [License Agreement]({%slug license-agreement%})
* [Redistributing Telerik Document Processing]({%slug installation-deploying-telerik-document-processing%})
* [Unable to find package Telerik.Licensing]({%slug dpl-package-update-failure-license%})
* [Handling License Key File Name and Environment Variable Name Changes in the 2025 Q1 Release]({%slug handling-license-file-name-changes%})
* [Telerik.Licensing NuGet package is not available on the Telerik NuGet feed]({%slug dpl-telerik-licensing-nuget-feed%})

