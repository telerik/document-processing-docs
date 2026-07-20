---
title: Telerik NuGet Source
page_title: Telerik NuGet Feed
description: Explore the different ways to add the Telerik NuGet feed to your system, and start using NuGet packages to install the Telerik Document Processing libraries.
slug: telerik-nuget-source
tags: nuget, feed, installation, telerik, authentication, cli, configuration, api
published: True
position: 8
---

# Telerik NuGet Source

This article explains how to add the Telerik NuGet package feed to your environment. You can use it to get the Telerik Document Processing libraries instead of [manually configuring a local NuGet feed]({%slug installation-nuget-packages%}#how-to-install-from-a-local-nuget-feed).

The benefit of using an online NuGet source is that you receive notifications for later component versions.

You can set up the remote Telerik NuGet feed in the following ways:

* [Configure the feed in Visual Studio](#use-visual-studio)
* [Configure the feed with the .NET CLI](#use-the-net-cli)
* [Edit the NuGet.Config file manually](#edit-the-nuget-config-file)

>tip When working with the .NET CLI or editing the `NuGet.Config` manually, you can use your Telerik account credentials or a [Telerik NuGet API key](#use-nuget-api-key). If you are logging in to telerik.com through single sign-on (SSO), use a [Telerik NuGet API key for authentication](#use-nuget-api-key).

>warning Never hard-code Telerik account credentials or NuGet API keys in a `NuGet.Config` file in a GitHub repository, Docker image, or any location that may be accessed by unauthorized parties. A NuGet key is valuable, and bad actors can use it to access the NuGet packages that are licensed under your account. A credentials abuse can lead to a review of the affected Telerik account.

For NuGet-related issues, see [troubleshoot Telerik NuGet feed issues]({%slug troubleshooting-telerik-nuget%}).

For information on automated builds, CI, and CD, see [restore Telerik NuGet packages in CI workflows]({%slug using-nuget-keys%}).


## Use Visual Studio

When adding NuGet sources in Visual Studio, the credentials are encrypted and stored outside the `NuGet.Config` file.

Refer to the [Microsoft guide to installing and using NuGet packages in Visual Studio](https://learn.microsoft.com/en-us/nuget/consume-packages/install-use-packages-visual-studio), or follow the steps below for Visual Studio on Windows.

1. Open Visual Studio and go to **Tools** > **NuGet Package Manager** > **Package Manager Settings** > **Package Sources**.

1. Click the **+** button at the top right-hand side.

1. Add the Telerik Feed URL `https://nuget.telerik.com/v3/index.json` and choose a name for that package source (for example, "TelerikOnlineFeed").

1. Click OK.

1. Open a project that references a Telerik NuGet package. 
    * Make sure to remove local `NuGet.Config` files from the solution that contain information about Telerik packages. 
    
1. Rebuild the solution.

1. A Windows prompt will ask for the Telerik feed credentials. Enter your Telerik email and password.
    * Select the **Remember My Password** checkbox.
    
1. Your project should now build and restore all packages - including those from nuget.org and from Telerik.
    * If you experience issues, see how to [resolve Telerik NuGet restore problems]({%slug troubleshooting-telerik-nuget%}).


## Use the .NET CLI

When adding NuGet sources from the .NET CLI, the credentials are stored in the `NuGet.Config` file. The [Windows encrypted-password limitations](#store-encrypted-credentials) apply. You can use a plain text password, but for better security, [generate a Telerik NuGet API key](#use-nuget-api-key), and use it with the .NET CLI instead of a password.

To add the Telerik NuGet package source with the .NET CLI, use the [`dotnet nuget add source` command](https://learn.microsoft.com/en-us/dotnet/core/tools/dotnet-nuget-add-source). This command creates or updates a `NuGet.Config` file for you, so you do not have to [edit the configuration file manually](#edit-the-nuget-config-file).

The command below stores the password or NuGet API Key in plain text in the [global NuGet configuration file](https://learn.microsoft.com/en-us/nuget/consume-packages/configuring-nuget-behavior#config-file-locations-and-uses).

The backslashes `\` below enable multi-line commands for better readability in terminals that support them.

**Use the .NET CLI to add the Telerik NuGet source**

````SH.skip-repl
dotnet nuget add source https://nuget.telerik.com/v3/index.json \
--name TelerikOnlineFeed \
--username <TELERIK EMAIL or api-key> \
--password <TELERIK PASSWORD or NUGET API KEY> \
--store-password-in-clear-text
````

If you have already stored the Telerik package source, you can update the configuration with the command below.

**Use the .NET CLI to update the Telerik NuGet source**

````SH.skip-repl
dotnet nuget update source "TelerikOnlineFeed" \
--source "https://nuget.telerik.com/v3/index.json" \
--username <TELERIK EMAIL or api-key> \
--password <TELERIK PASSWORD or NUGET API KEY> \
--store-password-in-clear-text
````

### Store Encrypted Credentials

The .NET CLI supports NuGet password encryption only on the Windows platform. The [encrypted `NuGet.Config` password is limited to one user and one machine](https://learn.microsoft.com/en-us/nuget/reference/nuget-config-file#packagesourcecredentials).

If you [configure the Telerik package source in Visual Studio](#use-visual-studio), the credentials will be encrypted and stored in the Windows Credential Manager on Windows and in the Keychain on macOS.

You can read more about the options provided by the NuGet tooling in the Microsoft article about the <a href="https://learn.microsoft.com/en-us/nuget/reference/nuget-config-file#packagesourcecredentials" target="_blank">packageSourceCredentials section of the NuGet.Config reference</a>. The `password` and `cleartextpassword` options behave differently. 


## Edit the NuGet.Config File

NuGet package sources and other settings are stored in a `NuGet.Config` file. You can read more about the file structure in the Microsoft [NuGet.Config file reference](https://learn.microsoft.com/en-us/nuget/reference/nuget-config-file).

Ensure you are familiar with how such configurations work. Refer to [NuGet configuration behavior and file locations](https://learn.microsoft.com/en-us/nuget/consume-packages/configuring-nuget-behavior) for details about the possible file locations and how multiple `NuGet.Config` files work.

To edit a `NuGet.Config` file and add the Telerik feed, you need to:

1. Ensure you are editing the [correct NuGet.Config file for your package sources](https://learn.microsoft.com/en-us/nuget/consume-packages/configuring-nuget-behavior#config-file-locations-and-uses). You can also create a new one with the [`dotnet new nugetconfig` command](https://learn.microsoft.com/en-us/dotnet/core/tools/dotnet-new).

2. Add the Telerik package source to the config file. Use plain text credentials because the .NET Core NuGet tooling does not fully support encrypted credentials. The following example shows a `NuGet.Config` file configuration:

````XML.skip-repl
<?xml version="1.0" encoding="utf-8"?>
<configuration>
    <packageSources>
    <!--To inherit the global NuGet package sources remove the <clear/> line below -->
    <clear />
    <add key="nuget.org" value="https://api.nuget.org/v3/index.json" />
    <add key="TelerikOnlineFeed" value="https://nuget.telerik.com/v3/index.json" />
    </packageSources>
    <packageSourceCredentials>
    <TelerikOnlineFeed>
        <add key="Username" value="api-key" />
        <add key="ClearTextPassword" value="Your API KEY" />
    </TelerikOnlineFeed>
    </packageSourceCredentials>
</configuration>
````

### Use NuGet API Key

There are two ways to authenticate with the Telerik NuGet server when you add the Telerik NuGet source [using the .NET CLI](#use-the-net-cli) or [editing the `NuGet.Config` file manually](#edit-the-nuget-config-file):

* Use your Telerik account email as the username, and your Telerik password.
* Use `api-key` (**recommended**) as the **username** and your personal [Telerik NuGet API key]({%slug using-nuget-keys%}) as the password.

>important Using an API key minimizes the risk of exposing client credentials when configuring NuGet access. User credentials grant full access to the user account, while the API key limits access to the NuGet feed only. 

You can [generate a Telerik NuGet API key in your Telerik account](https://www.telerik.com/account/downloads/nuget-keys). Read more about [restoring Telerik NuGet packages in CI workflows]({%slug using-nuget-keys%}).

> Always use the NuGet API Key in plain text.


### Package Source Mapping

The Document Processing Libraries NuGet packages and most of their dependencies are on `nuget.telerik.com`. The [`Telerik.Licensing` package and license setup]({%slug setting-up-license-key%}) is on `nuget.org`. The correct [NuGet package source mapping configuration](https://learn.microsoft.com/en-us/nuget/consume-packages/package-source-mapping) should be similar to the one below.

> Ensure that the `key` values in the `packageSourceMapping` section match the `key` values in the `packageSources` section. Otherwise, you get a "Package not found" error.

**Package source mapping for Telerik Document Processing and other Telerik packages**

<div class="skip-repl"></div>

````XML
<?xml version="1.0" encoding="utf-8" ?>
<configuration>
    <packageSources>
        <add key="nuget.org" value="https://api.nuget.org/v3/index.json" />
        <add key="TelerikOnlineFeed" value="https://nuget.telerik.com/v3/index.json" />
    </packageSources>

    <packageSourceMapping>
        <packageSource key="nuget.org">
            <package pattern="*" />
            <package pattern="Telerik.Licensing" />
        </packageSource>
        <packageSource key="TelerikOnlineFeed">
            <package pattern="Telerik*" />
        </packageSource>
    </packageSourceMapping>
</configuration>
````


### Access NuGet Packages behind Firewall

To access the Telerik NuGet feed behind a firewall that restricts outgoing requests, you may need to allow the following domains:

* `nuget.telerik.com`, which provides authentication and license verification
* `downloads.cdn.telerik.com`, which hosts the NuGet packages

The firewall must allow some of the requests to be redirected from `nuget.telerik.com` to `downloads.cdn.telerik.com`.

### Obsolete Telerik NuGet URL

The NuGet v2 server at `https://nuget.telerik.com/nuget` was sunset in November 2024 and is no longer available. The v3 protocol offers faster package searches and restores, improved security, and more reliable infrastructure. To redirect your feed to the NuGet v3 protocol, change your NuGet package source URL to `https://nuget.telerik.com/v3/index.json`.


### Troubleshooting

See the [Telerik NuGet feed troubleshooting guide]({%slug dpl-troubleshooting-nuget%}) for tips about common pitfalls when working with the Telerik NuGet feed.

## See Also

* [Restore Telerik NuGet packages in CI workflows]({%slug using-nuget-keys%})
* [Install Document Processing libraries from NuGet packages]({%slug installation-nuget-packages%})
