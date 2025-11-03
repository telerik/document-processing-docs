---
title: Install using NuGet Packages
page_title: Install using NuGet Packages
description: Learn how you can install the Telerik Document Processing libraries through NuGet.
slug: installation-nuget-packages
tags: nuget, document, processing, install, server, manual, download
published: True
position: 7
---

# Install using NuGet Packages

This article describes how you can install the Document Processing Libraries using a NuGet package. There are two ways for getting the NuGet packages:

* [Manually download the packages](#manually-download-nuget-packages)

* [Get the packages from the Telerik NuGet server](#download-from-the-nuget-server)

## Manually Download NuGet Packages

This approach allows you to setup a local NuGet package source, so you can install the Telerik products without an active Internet connection and without setting up our private feed.

1\. Copy all the .nupkg files we provide to your preferred local feed location. First you need to log in using your Telerik licensed account. Telerik Document Processing is a part of several Telerik bundles and is available in the Downloads section of the suite with which you've obtained the product, e.g. UI for Blazor. This way you will be able to download the packages:

![install-using-nuget001](images/install-using-nuget001.png)


**Telerik Document Processing** is also available as a separate distibution in your account: [Download Product Files]({%slug installation-nuget-packages%})
	
2\. Then, you need to add packages to Visual Studio. Open the NuGet manager and then click the Options button:
	
![installation-nuget-packages 002](images/installation-nuget-packages001.png)

3\. Add new package source. The __Source__ should point to the local folder with the NuGets:
	
![install-using-nuget002](images/install-using-nuget002.png) 

4\. The final step is to select and install the desired packages. 

![install-using-nuget003](images/install-using-nuget003.png) 

>important The Telerik Document Processing libraries are available in two versions:
>
>* A version for __.Net Framework 4.0__ or later
>
>* A version for __.Net Standard 2.0__
>
>Both versions are available as NuGet packages but with different names. The packages for __.NET Standard__ do __not__ contain the word __Windows__ in their name.

## Download from the NuGet server

To install the Telerik Document Processing Libraries, you can use the NuGet packages hosted on the public Telerik NuGet server. This online source lets you download and install various versions of the Document Processing libraries and enables quick updates with minimal manual intervention.

Before adding the Telerik NuGet server to Visual Studio, make sure you have:

* A commercial or trial license that includes Document Processing. Note that the Telerik NuGet server requires authentication and checks if you have a valid license.

* Generate an API key - As the Telerik NuGet server requires authentication, the first step is to obtain an API key.

### Generate an API Key

It is necessary to [obtain an API key]({%slug generating-api-keys%}) that you will use instead of a password. Using an API key instead of a password is a more secure approach, especially when working with .NET CLI or the NuGet.Config file.

### Add the Telerik NuGet Package Source to Visual Studio

Before you can install Telerik NuGet packages, you must configure the Telerik NuGet server as a package source in Visual Studio: 

```
https://nuget.telerik.com/v3/index.json
```

1\. In the Visual Studio Solution Explorer, right-click a Project, select **Manage NuGet Packages...**, and then select the **Settings** icon:

![installation-nuget-packages 001](images/installation-nuget-packages001.png)

2\. Select **+** to add a new package source and enter https://nuget.telerik.com/v3/index.json in the **Source** field. Add a name for the new package source, for example, **Telerik NuGet Server**:

![installation-nuget-packages 002](images/installation-nuget-packages002.png)

3\. Select **Telerik NuGet Server** from the __Package Source__ dropdown, and you will be prompted for a user name and a password. Use the credentials for your [Telerik Account](https://www.telerik.com/account/).

![installation-nuget-packages 003](images/installation-nuget-packages003.png)

4\. Select and install the desired NuGet packages.

![installation-nuget-packages 004](images/installation-nuget-packages004.png)

You have successfully added the Telerik NuGet feed as a Package source.

### Reset Store Credentials

If you previously stored credentials for the Telerik NuGet server, you need to reset them to be able to authenticate with your new API key. Here are the steps you need to follow:

1. Remove the saved credentials in the [Windows Credential Manager](https://support.microsoft.com/en-us/windows/accessing-credential-manager-1b5c916a-6a16-889f-8581-fc16e8165ac0). These credentials will appear as `nuget.telerik.com` or `VSCredentials_nuget.telerik.com` entries.
2. Remove the Telerik NuGet package source from Visual Studio.
3. If you have added the Telerik package source by using the .NET CLI, try to remove it by running the following commands:
    * [`dotnet nuget list source`](https://docs.microsoft.com/en-us/dotnet/core/tools/dotnet-nuget-list-source)
    * [`dotnet nuget remove source`](https://docs.microsoft.com/en-us/dotnet/core/tools/dotnet-nuget-remove-source)
4. Check if you have any credentials stored in `%AppData%\NuGet\Nuget.Config`. If so, remove them.
5. Try to reset the Visual Studio user data by [forcing NuGet to ask for authentication](https://stackoverflow.com/questions/43550797/how-to-force-nuget-to-ask-for-authentication-when-connecting-to-a-private-feed).
6. Restart Visual Studio.
7. Add the Telerik NuGet package source again through Visual Studio or .NET CLI. If you are using the Telerik NuGet feed in a .NET Core application, use a NuGet API key in the NuGet.Config file]({%slug telerik-nuget-source%}#edit-the-nugetconfig-file).

## See Also

 * [Restoring NuGet Packages in Your CI Workflow]({%slug using-nuget-keys%})
 * [How to Obtain Telerik Document Processing Libraries for .NET Framework, .NET Standard, {{site.dotnetversions}}]({%slug distribute-telerik-document-processing-libraries-net-versions%})
 * [Handling the 'No packages found" Message when Using the Telerik NuGet Server]({%slug handle-no-nuget-packages-found-message%})
