---
title: Telerik NuGet Source
page_title: Telerik NuGet Feed
description: Learn how to configure the Telerik NuGet feed in Visual Studio, the .NET CLI, or NuGet.Config for package installation and restore.
slug: telerik-nuget-source
tags: nuget, feed, installation, telerik, authentication, cli, configuration, api
published: True
position: 8
---

# Telerik NuGet Source

This article explains how to add the Telerik NuGet package feed to your environment. Use it for earlier releases or when your organization requires the private feed. For current releases, install packages from [NuGet.org]({%slug installation-nuget-packages%}#how-to-install-telerik-document-processing-from-nugetorg).

Choose one of the following methods to set up the remote Telerik NuGet feed:

* [Configure the feed in Visual Studio](#use-visual-studio) if you use the Visual Studio interface on Windows.
* [Configure the feed with the .NET CLI](#use-the-net-cli) for command-line or automated workflows.
* [Edit the NuGet.Config file manually](#edit-the-nuget-config-file) when you need direct control over the configuration.

All methods in this article use the current NuGet v3 URL. The NuGet v2 URL is no longer available.

When you use the .NET CLI or edit `NuGet.Config` manually, authenticate with your Telerik account credentials or a [Telerik NuGet API key](#use-nuget-api-key).

>important If you use single sign-on (SSO) to access telerik.com, use a [Telerik NuGet API key for authentication](#use-nuget-api-key).

>warning Never hard-code Telerik account credentials or NuGet API keys in a `NuGet.Config` file in a GitHub repository, Docker image, or any location that unauthorized parties can access. Exposed credentials can allow access to packages licensed under your account and may trigger a security review of the affected Telerik account.

For NuGet-related issues, see [troubleshoot Telerik NuGet feed issues]({%slug troubleshooting-telerik-nuget%}).

For information on automated builds, CI, and CD, see [restore Telerik NuGet packages in CI workflows]({%slug using-nuget-keys%}).


## Use Visual Studio

When you add a NuGet source in Visual Studio, Visual Studio encrypts the credentials and stores them outside the `NuGet.Config` file.

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

When you add a NuGet source with the .NET CLI, the credentials are stored in the `NuGet.Config` file. The [Windows encrypted-password limitations](#store-encrypted-credentials) apply. You can use a plain-text password, but [generate a Telerik NuGet API key](#use-nuget-api-key) for better security.

To add the Telerik NuGet package source with the .NET CLI, use the [`dotnet nuget add source` command](https://learn.microsoft.com/en-us/dotnet/core/tools/dotnet-nuget-add-source). This command creates or updates a `NuGet.Config` file for you, so you do not have to [edit the configuration file manually](#edit-the-nuget-config-file).

The command below stores the password or NuGet API key in plain text in the [global NuGet configuration file](https://learn.microsoft.com/en-us/nuget/consume-packages/configuring-nuget-behavior#config-file-locations-and-uses).

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

Visual Studio encrypts credentials and stores them in the Windows Credential Manager on Windows and in the Keychain on macOS.

Read about the NuGet tooling options in the Microsoft [packageSourceCredentials section of the NuGet.Config reference](https://learn.microsoft.com/en-us/nuget/reference/nuget-config-file#packagesourcecredentials). The `password` and `cleartextpassword` options behave differently.


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
* Use `api-key` (**recommended**) as the **username** and your personal [Telerik NuGet API key]({%slug generating-api-keys%}) as the password.

>important Using an API key minimizes the risk of exposing client credentials when configuring NuGet access. User credentials grant full access to the user account, while the API key limits access to the NuGet feed only. 

You can [generate a Telerik NuGet API key in your Telerik account](https://www.telerik.com/account/downloads/nuget-keys). Read more about [restoring Telerik NuGet packages in CI workflows]({%slug using-nuget-keys%}).

>important Always use the NuGet API key in plain text.


### Package Source Mapping

The Document Processing Libraries NuGet packages and most dependencies are on `nuget.telerik.com`. The [`Telerik.Licensing` package and license setup]({%slug setting-up-license-key%}) is on `nuget.org`. Use the [NuGet package source mapping configuration](https://learn.microsoft.com/en-us/nuget/consume-packages/package-source-mapping) below as a model.

>important Match the `key` values in the `packageSourceMapping` section to the `key` values in the `packageSources` section. Otherwise, NuGet returns a "Package not found" error.

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

If a firewall restricts outgoing requests, allow requests to the following domains:

* `nuget.telerik.com`, which provides authentication and license verification
* `downloads.cdn.telerik.com`, which hosts the NuGet packages

The firewall must also allow requests that redirect from `nuget.telerik.com` to `downloads.cdn.telerik.com`.

### Obsolete Telerik NuGet URL

Telerik ended the NuGet v2 server at `https://nuget.telerik.com/nuget` in November 2024. The server is no longer available. The v3 protocol offers faster package searches and restores, improved security, and more reliable infrastructure. If your configuration uses the obsolete URL, replace it with `https://nuget.telerik.com/v3/index.json`.


### Troubleshooting

See the [Telerik NuGet feed troubleshooting guide]({%slug troubleshooting-telerik-nuget%}) for tips about common pitfalls when working with the Telerik NuGet feed.

## See Also

* [Restore Telerik NuGet packages in CI workflows]({%slug using-nuget-keys%})
* [Install Document Processing libraries from NuGet packages]({%slug installation-nuget-packages%})
