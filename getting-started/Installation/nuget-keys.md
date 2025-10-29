---
title: Restoring NuGet Packages in CI
page_title: Restoring NuGet Packages in CI 
description: Learn how to use NuGet Keys to authenticate with the Telerik NuGet server and restore Telerik Document Processing packages in your CI or desktop environment.
slug: using-nuget-keys
tags: telerik, document, processing, restore, nuget, packages, ci, continuous, integration, installation, api, key
published: True
position: 9
---

# Restoring NuGet Packages in Your CI Workflow

This article describes how to use token-based authentication for the Telerik NuGet feed. You will learn how to create and use NuGet API keys to restore Telerik NuGet packages in your Continuous Integration (CI) workflow.

When you need to restore the [Telerik NuGet packages]({%slug installation-nuget-packages%}#download-from-the-nuget-server) as part of your CI, using API Keys provides a secure way to authenticate. This method does not require you to provide your Telerik credentials anywhere in the CI workflow. An API key has a limited scope and can be used only with the Telerik NuGet server. If any of your API Keys is compromised, you can quickly delete it and create a new one.

## Generating API Keys

As the Telerik NuGet server requires authentication, the first step is to [obtain an API key]({%slug generating-api-keys%}) that you will use instead of a password. Using an API key instead of a password is a more secure approach, especially when working with .NET CLI or the NuGet.Config file.

## Storing a NuGet Key

> Never check-in NuGet API Keys with your source code or leave it publicly visible in plain text, for example, as a raw key value in a `nuget.config` file. A NuGet API Key is valuable as bad actors can use it to access the NuGet packages that are licensed under your account. A potential key abuse could lead to a review of the affected account.

To protect the NuGet Key, store it as a secret environment variable. The exact steps depend on your workflow:

* In GitHub Actions, save the key as a [GitHub Actions Secret](https://docs.github.com/en/actions/security-guides/using-secrets-in-github-actions). Go to **Settings** > **Security** > **Secrets** > **Actions** > **Add new secret**.

* In Azure DevOps, save the key as a [secret Azure DevOps pipeline variable](https://learn.microsoft.com/en-us/azure/devops/pipelines/process/set-secret-variables). If you use an Azure DevOps Service connection instead of secret environment variables, enter `api-key` in the username field and the API key as the password in the **New NuGet service connection** form editor.

* In Azure DevOps YAML pipelines, save the key as a secret variable as well. Click the YAML editor's **Variables** button and complete the **New variable** form.

* In Docker images, save the key as a [Docker secret](https://docs.docker.com/tags/secrets/).

For more details on storing and protecting your API key, check the [Announcing NuGet Keys](https://www.telerik.com/blogs/announcing-nuget-keys) blog post by Lance McCarthy.
The examples below assume that the secret environment variable name is `TELERIK_NUGET_KEY`.

## Using a NuGet API Key

There are two popular ways to use the Telerik NuGet server in a build:

* [Using a nuget.config file with your projects](#using-a-nugetconfig-file-with-your-projects)

* [Using only CLI commands](#using-only-cli-commands)

For more information on how to use NuGet keys in a build, check the [Announcing NuGet Keys](https://www.telerik.com/blogs/announcing-nuget-keys) blog post by Lance McCarthy.

The examples below assume that the secret environment variable name is `TELERIK_NUGET_KEY`.

### Using a nuget.config File with Your Projects

1. In your `nuget.config` file, set the `Username` value to `api-key` and the `ClearTextPassword` value to an environment variable name:

    ```xml
        <configuration>
        <packageSources>
            <clear/>
            <add key="nuget.org" value="https://api.nuget.org/v3/index.json" protocolVersion="3" />
            <add key="MyTelerikFeed" value="https://nuget.telerik.com/v3/index.json" protocolVersion="3"/>
        </packageSources>
        <packageSourceCredentials>
            <MyTelerikFeed>
            <add key="Username" value="api-key" />
            <add key="ClearTextPassword" value="%TELERIK_NUGET_KEY%" />
            </MyTelerikFeed>
        </packageSourceCredentials>
        ...
        </configuration>
    ```

1. Set the `TELERIK_NUGET_KEY` environment variable by using the value of your pipeline/workflow secret.

The exact steps to set the `TELERIK_NUGET_KEY` environment variable depend on your workflow. For more details, refer to the [Announcing NuGet Keys](https://www.telerik.com/blogs/announcing-nuget-keys) blog post by Lance McCarthy.

### Using Only CLI Commands

You can use the CLI `add source` (or `update source`) command to set the credentials of a package source. This CLI approach is applicable if your CI system doesn't support default environment variable secrets or if you do not use a custom `nuget.config`.

* To set the credentials in Azure DevOps:

    ```
    dotnet nuget add source 'MyTelerikFeed' --source 'https://nuget.telerik.com/v3/index.json' --username 'api-key' --password '$(TELERIK_NUGET_KEY)' --configfile './nuget.config' --store-password-in-clear-text
    ```

* To set the credentials in GitHub Actions:

    ```
    dotnet nuget add source 'MyTelerikFeed' --source 'https://nuget.telerik.com/v3/index.json' --username 'api-key' --password '${{ secrets.TELERIK_NUGET_KEY }}' --configfile './nuget.config' --store-password-in-clear-text
    ```

## Additional Resources

If you just start using the Telerik NuGet server in your CI or inter-department workflows, check the two blog posts below. You will learn about the various use cases and find practical implementation details.

* [Azure DevOps and Telerik NuGet Packages (Blog Post)](https://www.telerik.com/blogs/azure-devops-and-telerik-nuget-packages)

* [Announcing NuGet Keys (Blog Post)](https://www.telerik.com/blogs/announcing-nuget-keys)
