---
title: Activation Errors and Warnings
description: Troubleshoot Telerik Document Processing license activation errors and warnings caused by missing, expired, corrupted, or incompatible keys.
page_title: License Activation Errors and Warnings
slug: activation-errors-and-warnings
tags: activation, license, key, errors, warnings, telerik, document, processing
published: True
position: 2
---

# License Activation Errors and Warnings
Starting with the 2025 Q1 release, Telerik Document Processing reports specific license warnings and errors when an application uses a missing or invalid license. This article explains the common causes, identifies each message code, and provides a resolution for each condition.

An invalid license can produce the following results:

* A watermark appears when the application starts.
* A modal dialog appears when the application starts. Click **OK** to close the dialog and hide the banner until the next application startup.
* A warning appears in the build log.

## Invalid License
An invalid license can result from any of the following conditions:

* An expired subscription license. Subscription licenses expire at the end of the subscription term.
* A perpetual license used with a product version released outside the license validity period.
* An expired trial license.
* A license that does not include the product or service used by the project.
* A license key that is missing from the application or build environment.
* An old license key that was not replaced after a renewal, upgrade, or new purchase.

## License Warnings and Errors
When a project has an expired, missing, or incompatible license, the `Telerik.Licensing` build task reports one of the following conditions. Match the message code, then apply the corresponding solution:

| Condition | Message Code | Solution |
|----|----|----|
| `No Telerik or Kendo UI product references detected in project.` | `TKL001` | If the project uses Telerik products, update `Telerik.Licensing` to version `1.4.9` or later. If it does not, remove the `Telerik.Licensing` NuGet reference. |
| `No Telerik and Kendo UI License file found.` | `TKL002` | [Set up a license key]({%slug setting-up-license-key%}) in the developer, build, or deployment environment. |
| `Corrupted Telerik and Kendo UI License Key content in: [file path or environment variable name].` | `TKL003` | Download a new license key. For `telerik-license.txt`, replace the file in the expected location and use a license key, not a script key. For `TELERIK_LICENSE`, replace the variable value with the complete key. |
| `Unable to locate licenses for all products.` | `TKL004` | The license does not cover every Telerik or Kendo product in the project. If you purchased the required license, [download the updated license key]({%slug setting-up-license-key%}#downloading-the-license-key). Otherwise, remove the uncovered package references. |
| `"Telerik Document Processing Libraries" product is not listed in your current license file.` | `TKL101` | Review the license requirements for the listed products. If the project does not need them, remove the corresponding package references. |
| `Your current license has expired.` | `TKL102` | The product version is newer than the validity period of the perpetual license. [Download a new license key]({%slug setting-up-license-key%}#downloading-the-license-key) or downgrade to a version included in the perpetual license, as indicated in the message. |
| `Your subscription license has expired.` | `TKL103`, `TKL104` | Renew the subscription, [download a new license key]({%slug setting-up-license-key%}), replace the old key, and rebuild the project. |
| `Your trial license has expired.` | `TKL105` | Purchase a commercial license and [activate the new license key]({%slug setting-up-license-key%}). |
| `Services associated with Telerik Document Processing Libraries require a subscription or trial license. Obtain a subscription license.` | `TKL403` | The project references a service or tool that requires a subscription or trial license. [Review the TKL403 resolution]({%slug tkl403-warning-telerik-document-processing%}) or purchase a subscription license. |

## Troubleshooting Common Scenarios

Use the following checks when the message code does not identify the cause or when the warning continues after you update the license:

* **The warning appears after a package update:** Check whether the new product version was released after the license validity period. [Review the license expiration behavior]({%slug frequently-asked-questions%}#2025-q2-will-the-product-function-with-an-expired-license-key), then download a new key or use a supported product version.
* **The build succeeds, but generated documents show a trial watermark:** Add `Telerik.Licensing` to the root application that starts the Document Processing code path. A package reference in a class library does not apply transitively to the root application. For runtime validation steps, see [Resolving License Validation Issues in Telerik Document Processing Libraries]({%slug license-not-recognized-telerik-document-processing-libraries%}).
* **The warning occurs only in CI/CD or on a server:** Confirm that the build or service account can read the license file, or that the process receives the `TELERIK_LICENSE` environment variable. See [Adding the License Key to CI/CD Services]({%slug adding-license-key-ci-cd-services%}).
* **The package cannot be restored after the 2025 Q1 upgrade:** Confirm that `Telerik.Licensing` is referenced and that NuGet.org is allowed by package source mapping. See [Unable to find package Telerik.Licensing]({%slug dpl-package-update-failure-license%}).

After resolving the issue, rebuild the project and run the application again. Confirm that the build log has no licensing warnings and that generated documents have no trial watermark or banner.

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
