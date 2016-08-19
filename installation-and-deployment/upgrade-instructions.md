---
title: Upgrade Instructions
page_title: Upgrade Instructions
description: Upgrade Instructions
slug: installation-upgrade-instructions
tags: upgrade,instructions,document,processing
published: True
position: 2
---

# Upgrade Instructions

Telerik Document Processing is part of several Telerik bundles and could be upgraded following the steps for upgrading the other assemblies from the suite with which you've obtained the product.

Starting from Q1 2016, the Document Processing Libraries are built separately from any other component that comes with the different suites. Thus, they have their own version, which may differ with the version of the other assemblies in the particular suite. 

Another change in the version of Telerik Document Processing is that from R3 2016, only assemblies with version number ending with .40 suffix are distributed. The libraries are built only for .NET 4.0. They doesn't contain code specific for .NET 4.5, thus an additional version is not needed.

The changes are synced between the controls that have a dependency on Telerik Document Processing and while the referenced files are from the same release, they should work as expected regardless of the version distinction. 


## UI for ASP.NET AJAX

[Upgrading Telerik UI for ASP.NET AJAX](http://docs.telerik.com/devtools/aspnet-ajax/installation/upgrading-instructions/upgrading-a-trial-to-a-developer-license-or-to-a-newer-version)


## UI for ASP.NET MVC

[Upgrading Telerik UI for ASP.NET MVC project](http://docs.telerik.com/kendo-ui/aspnet-mvc/vs-integration/upgrade-wizard)


## UI for WPF

[Upgrading Telerik UI for WPF](http://docs.telerik.com/devtools/wpf/installation-and-deployment/upgrading-instructions/installation-upgrading-from-trial-to-developer-license-wpf.html)


## UI for WinForms

[Upgrading Telerik UI for WinForms project](http://docs.telerik.com/devtools/winforms/installation-deployment-and-distribution/visual-studio-extensions/upgrade-wizard)


## UI for Silverlight

[Upgrading Telerik UI for Silverlight](http://docs.telerik.com/devtools/silverlight/installation-and-deployment/upgrading-instructions/installation-upgrading-from-trial-to-developer-license.html)

>Due to the specifics of Telerik Document Processing, a project that uses only assemblies of this product cannot be upgraded using the Upgrade Wizard of Visual Studio Extensions. You can manually replace the assemblies with the new ones or change the project's references to point to the location of the new version. 