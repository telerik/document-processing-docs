---
title: License Key Frequently Asked Questions
page_title: License Key Frequently Asked Questions
slug: frequently-asked-questions
tags: frequently, asked, questions, license, key, document, processing, libraries
published: True
position: 3
---

## Frequently Asked Questions
This article lists the answers to the most frequently asked questions (FAQs) about working with the license key.

### Does the license key expire?
Yes, the license key expires at the end of your support subscription:

- For trial users, this is at the end of your 30-day trial.
- For commercial license holders, this is when your subscription term expires.

You will need to obtain and install a new license key after starting a trial, renewing a license, or upgrading a license.

>important An expired perpetual license key is valid for all product versions published before its expiration date.

### [2025 Q2] Will the product function with an expired license key?
This depends on your license type.

- _Perpetual licenses_ will continue to function normally with an expired license key. However, the following will happen if you update or install a package version which is released after the expiration date of the license:
  - A watermark appears on application startup.
  - A modal dialog appears on application startup.
  - A warning message is logged in the build log.
    See the [Invalid License]({%slug activation-errors-and-warnings%}#invalid-license) section for more information.
- **Subscription licenses** used in deployed applications will continue to function normally. However, the following will happen if you rebuild the application with an expired subscription license:
  - A watermark appears on application startup.
  - A modal dialog appears on application startup.
  - A warning message is logged in the build log.
    See the [Invalid License]({%slug activation-errors-and-warnings%}#invalid-license) section for more information.
- **Trial licenses** will prevent the applications from functioning normally once the trial period has expired. The following will happen if you try to build or run the application:
  - A watermark appears on application startup.
  - A modal dialog appears on application startup.
  - A warning message similar to the following is logged in the build log.
    See the [Invalid License]({%slug activation-errors-and-warnings%}#invalid-license) section for more information.

### I updated the version of the product packages in my project and the invalid license errors have appeared. What is the cause of this behavior?
The most likely cause is that the newly installed product version was released after the expiration date of your current license. To fix this issue:

1. [Download a new license key]({%slug setting-up-license-key%}#downloading-the-license-key).
1. [Activate the new license key]({%slug setting-up-license-key%}#activating-the-document-processing-libraries) in your project.

### Can I use the same license key in multiple builds?
You can use your personal license key in multiple pipelines, builds, and environments.

However, each individual developer must use a unique personal license key.

### Do I need an Internet connection to activate the license?

No, the license activation and validation are performed entirely offline.

### Do I have to add the license key to source control?
No, you do not have to add the _telerik-license.txt_ license key file or its contents to source control.

Build servers must use the TELERIK\_LICENSE environment variable described in [Adding the License Key to CI Services]({%slug adding-license-key-ci-cd-services%}).

>important Do not store the license key in plaintext, for example, in a GitHub Actions Workflow definition.

### What happens if both the environment variable and the license key file are present?
If both the TELERIK\_LICENSE environment variable and the _telerik-license.txt_ file are present, then the environment variable will be used.

To enforce the use of the license key file, unset the environment variable.

### My team has more than one license holder. Which key do we have to use?
- To activate the product on your development machine, use the key associated with your personal account.
- To activate the product in a CI/CD environment, use any of the license keys in your team.

### Are earlier versions of the product affected?
No, versions released prior to January 2025 do not require a license key.

## See Also

* [Setting Up Your License Key]({%slug setting-up-license-key%})
* [License Activation Errors and Warnings]({%slug activation-errors-and-warnings%})
* [Adding the License Key to CI Services]({%slug adding-license-key-ci-cd-services%})
* [License Agreement]({%slug license-agreement%})
* [Redistributing Telerik Document Processing]({%slug installation-deploying-telerik-document-processing%})
* [Unable to find package Telerik.Licensing]({%slug dpl-package-update-failure-license%})
* [Handling License Key File Name and Environment Variable Name Changes in the 2025 Q1 Release]({%slug handling-license-file-name-changes%})
* [Telerik.Licensing NuGet package is not available on the Telerik NuGet feed]({%slug dpl-telerik-licensing-nuget-feed%})
