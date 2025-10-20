---
title: Upgrade Instructions
page_title: Upgrade Instructions
description: Telerik Document Processing is part of several Telerik UI bundles, between you can choose. Learn more about the needed steps and the available options. 
slug: installation-upgrade-instructions
tags: upgrade,instructions,document,processing
published: True
position: 2
---

# Upgrade Instructions

Telerik Document Processing is part of several Telerik bundles and could be upgraded following the steps for upgrading the other assemblies from the suite with which you've obtained the product.

>Starting from Q1 2016, the Document Processing assemblies have an assembly version which may differ from the assembly version of the other assemblies in the particular suite. 
>
>Starting from R3 2016, only assemblies with a version number ending with .40 suffix are distributed. The libraries don't contain code specific for .NET Framework 4.5, thus an additional version is not needed.
>
>The changes are synced between the controls that have a dependency on Telerik Document Processing and while the referenced files are from the same release, they should work as expected regardless of the version distinction. 



## UI for ASP.NET AJAX

[Upgrading Telerik UI for ASP.NET AJAX](http://docs.telerik.com/devtools/aspnet-ajax/installation/upgrading-instructions/upgrading-a-trial-to-a-developer-license-or-to-a-newer-version)


## UI for ASP.NET MVC

[Upgrading Telerik UI for ASP.NET MVC project](http://docs.telerik.com/kendo-ui/aspnet-mvc/vs-integration/upgrade-wizard)


## UI for WPF

[Upgrading Telerik UI for WPF](https://docs.telerik.com/devtools/wpf/upgrade/installation-upgrading-from-trial-to-developer-license-wpf)


## UI for WinForms

[Upgrading Telerik UI for WinForms project](https://docs.telerik.com/devtools/winforms/visual-studio-integration/visual-studio-extensions/upgrade-project)


## UI for Silverlight

[Upgrading Telerik UI for Silverlight](http://docs.telerik.com/devtools/silverlight/installation-and-deployment/upgrading-instructions/installation-upgrading-from-trial-to-developer-license.html)

>Due to the specifics of Telerik Document Processing, a project that uses only packages of this product cannot be upgraded using the Upgrade Wizard of Visual Studio Extensions. You can manually replace the packages with the new ones or change the project's references to point to the location of the new version. 

## UI for Xamarin

[Upgrading Telerik UI for Xamarin on Windows](https://docs.telerik.com/devtools/xamarin/upgrade/upgrading-windows)

[Upgrading Telerik UI for Xamarin on Mac](https://docs.telerik.com/devtools/xamarin/upgrade/upgrading-mac)

## See Also

- [Telerik.Licensing NuGet Package Information]({%slug dpl-telerik-licensing-nuget-feed%})
- [Guidelines for Upgrading Document Processing Libraries Independently from WPF (WinForms) Libraries]({%slug upgrade-document-processing-libraries-separately-from-wpf%})
