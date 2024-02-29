---
title: Troubleshooting Telerik NuGet
page_title: Troubleshooting Telerik NuGet
description: Troubleshooting Telerik NuGet
slug: troubleshooting-telerik-nuget
tags: nuget, document, processing, troubleshooting, telerik
published: True
position: 0
---

# Troubleshooting Telerik NuGet

This article provides solutions to common issues that you may observe when working with the Telerik NuGet server and the NuGet packages that it provides.

## Issue: The NuGet Package Takes Too Long to Install or Update on Visual Studio

The NuGet package takes too long to install or update on Visual Studio. How to improve the installation and update times?

### Solution

* Disable the auto-sync in the `_references.js` file by modifying the following `/// <autosync enabled="false" />` line.
* You can also disconnect the project from the source control before running the Update Wizard.

## Issue: Telerik NuGet Returns 401 Logon Failed after Password Change

After changing your Telerik password, you get `[Telerik Nuget] The V2 feed at '...' returned an unexpected status code '401 Logon failed.'` error in the NuGet Package Manager.

### Solution

After changing your Telerik password, you must reset your credentials in the `NuGet.config` file. To do this, run the `NuGet Sources Update -Name "telerik.com" -Source "https://nuget.telerik.com/v3/index.json" -UserName "your login email" -Password "your new password"` command.

The password must contain only ASCII characters.

As an alternative, you can [reset your Telerik NuGet Feed credentials from the Windows Credentials Manager](#solution-2-windows-credentials-manager)

## '401 Logon failed' error

If you're receiving this error when connecting to Telerik NuGet Server, you could try to update your NuGet credentials through the __Windows Credential Manager__.

1. Close all open Visual Studio instances (this is so that all NuGet package manager tasks are stopped).
2. Open the "Credential Manager" app on your PC.
3. Scroll through all the entries until you find any that are for `nuget.telerik.com`.
4. Once you find that entry, expand it and select "edit".
5. Make sure the username and password are the same ones you use for your Telerik account:
    1. Use the email address in the place of username
    2. Make sure any special characters are escaped (see *Handling Special Characters in Password* below)
    3. Click "Save" 
6. Make sure the URL does not have a trailing slash, it must be only `https://nuget.telerik.com/nuget`
7. Reopen Visual Studio and access the Telerik NuGet server. 

## Handling Special Characters in Password

If your password contains a special character, those characters need to be escaped or it may fail authentication resulting in *Error 401 login failure* from the NuGet server. A common character that needs to be escaped is the ampersand `&`, but it can be as unique as the section character `§`. There are two ways to handle this.

* Change the password so that it only includes characters that do not need to be escaped.
* HTML encode the password so the special characters are escaped (e.g. `my§uper&P@§§word` becomes `my&sect;uper&amp;P@&sect;&sect;word`).

We **strongly** discourage entering your password into an online encoder utility, use Powershell instead.  

```
Add-Type -AssemblyName System.Web
[System.Web.HttpUtility]::HtmlEncode('my§uper&P@§§word') 
```

![Powershell Encoding](images/nuget-troubleshooting-powershell-encoding.png)


## Issue: Unable to load the service index for source https://nuget.telerik.com/v3/index.json

Make sure that the Telerik NuGet Feed is live at [https://status.telerik.com/](https://status.telerik.com/).

## Issue: Resetting Telerik Nuget Credentials

On Windows, if you enter and save wrong credentials for the Telerik NuGet or if you change your Telerik credentials, you won't have access to the desired NuGet packages. Before you can enter the correct user name and password, you must clear the saved credentials.

### Solution 1: Resetting The Credentials in NuGet.config

Try resetting your credentials by using the approach suggested in the [Telerik NuGet returns 401 Logon failed after password change](#issue-telerik-nuget-returns-401-logon-failed-after-password-change). If the credentials are not updated, continue with [Solution 2](#solution-2-windows-credentials-manager) below.

### Solution 2: Windows Credentials Manager

Alternatively, use Windows Credentials Manager to remove the saved credentials:

1. In Visual Studio navigate to __Tools__ > __NuGet Package Manager__ > __Package Manager Settings__. Select __NuGet Package Manager__, click __Package Sources__, and remove the listed Telerik NuGet package source.
1. Close Visual Studio.
1. Open the Windows Credentials Manager. To access it, navigate to __Control Panel__ > __User Accounts__ > __Credential Manager__.
1. Click __Windows Credentials__.
1. Remove the following saved credentials:
    * `nuget.telerik.com`
    * `VSCredentials_nuget.telerik.com`

    ![Manage your credentials](images/windows-credential-manager.png "Manage your credentials")  
1. Add the Telerik NuGet Feed again, and then enter the correct credentials. For more details, see the [Available Nuget Packages]({%slug installation-nuget-packages%}) article.
1. If desired, verify the NuGet credentials by inspecting the `NuGet.config` file located in `%AppData%\NuGet\NuGet.config`.

## Networking Problems

Another common problem is that your machine (PC, GitHub Actions runner or Azure DevOps agent) is behind a proxy. To check if you're experiencing a networking issue, open the following URL in your web browser:

* https://nuget.telerik.com/nuget/Search()?$filter=IsAbsoluteLatestVersion&searchTerm=%27WPF%27&includePrerelease=true&$skip=0&$top=100&semVerLevel=2.0.0. 

After you enter your telerik.com username and password, you should see an XML search result containing a list of all the Telerik.UI.for.WPF packages available with your license.