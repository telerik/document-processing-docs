---
title: How to Upgrade Trial to Licensed Version
description: This tutorial explains in details how to upgrade your Telerik trial to a licensed version of Document Processing Libraries. 
type: how-to
page_title: How to Upgrade Trial to Licensed Version
slug: upgrade-trial-to-licensed-version
position: 0
tags: trial, license, purchase, , processing, document, dpl
res_type: kb
---

| Version | Product | Author | 
| --- | --- | ---- | 
| Valid until Q2 2025 | Document Processing Libraries |[Desislava Yordanova](https://www.telerik.com/blogs/author/desislava-yordanova)| 

## Description

This tutorial explains in detail how to upgrade your Telerik [Trial]({%slug trial-license-limitations%}) to a Licensed version of the Document Processing Libraries.

>caution This approach is valid for versions **before Q2 2025**. For later versions, it is just necessary to update the [license key]({%slug setting-up-license-key%}).

Let's start with having a trial version installed on your machine and a project that uses the trial version:

>caption Access to the Trial version of product files in the Downloads section of your Telerik account

![upgrade-trial-to-licensed-version 001](images/upgrade-trial-to-licensed-version001.png) 

>note Telerik Document Processing is a part of several Telerik bundles and is installed following the steps for installing the suite with which you've obtained the product: [Installing on Your Computer]({%slug installation-installing-on-your-computer%})

If you expand the **References** in the Solution Explorer in Visual Studio, you will see the currently referred assemblies in the project:

>caption Trial Assemblies referred in the project 

![upgrade-trial-to-licensed-version 002](images/upgrade-trial-to-licensed-version002.png)  

Navigate to the project's folder and right-click on the .dll to open the Properties dialog to check if the **Trial** .dll is added.

![upgrade-trial-to-licensed-version 003](images/upgrade-trial-to-licensed-version003.png)   

>note The only difference between the license and trial versions of the assemblies is that trial assemblies add a copyright message to the produced documents:

![upgrade-trial-to-licensed-version 005](images/upgrade-trial-to-licensed-version005.png)  

## Solution

Once you purchase a Telerik license, you will have access to the *Purchase* **License Type** in your Telerik account:

![upgrade-trial-to-licensed-version 006](images/upgrade-trial-to-licensed-version006.png) 

Depending on the Telerik product with which you've obtained the Telerik Document Processing, the libraries can be used either through the [available NuGet packages]({%slug installation-nuget-packages%}) or through the assemblies available in the installation folder of the Telerik product.

## Upgrade the Trial Assemblies

1\. **Download** the .msi file for the *Purchase* version.

2\. **Uninstall** the already installed *Trial* version, e.g. from the Windows Control Panel >> Programs and Features.

3\. **Install** the downloaded .msi file in step 1.

4\. Update the references in your project with the assemblies from the licensed installation. It is necessary to delete the old trial assemblies first and then add the licensed ones:

![upgrade-trial-to-licensed-version 004](images/upgrade-trial-to-licensed-version004.png)  

![upgrade-trial-to-licensed-version 007](images/upgrade-trial-to-licensed-version007.png)  

5\. **Delete** the license.licx file (if such file exists). 

6\. **Rebuild** your project, close Visual Studio and open it again to make sure that no references are kept in the memory by Visual Studio. 

## Upgrade the Trial NuGet packages

1\. Open the **NuGet Package Manager**, e.g. select the Manage NuGet Packages... option

![upgrade-trial-to-licensed-version 008](images/upgrade-trial-to-licensed-version008.png)

2\. Uninstall any **Trial** Telerik NuGet packages:

![upgrade-trial-to-licensed-version 009](images/upgrade-trial-to-licensed-version009.png)

3\. Intall the respective **Purchase** version of the NuGet packages, without the word "Trial" in its name:

![upgrade-trial-to-licensed-version 010](images/upgrade-trial-to-licensed-version010.png)

# See Also

* [Trial vs Licensed version]({%slug trial-license-limitations%}) 
* [Installing on Your Computer]({%slug installation-installing-on-your-computer%})
* [Install using NuGet Packages]({%slug installation-nuget-packages%})
