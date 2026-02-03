---
title: MCP Server as a NuGet Package
page_title: Telerik DPL MCP (Model Context Protocol) Server as a NuGet Package
description: Learn how to add and use the Telerik Document Processing MCP Server via a NuGet package with the dnx command as a .NET Document Processing AI coding assistant and code generator for better developer productivity. The Telerik Document Processing MCP server provides proprietary context about Telerik UI for .NET Document Processing to AI-powered software.
slug: ai-mcp-server-as-a-nuget
tags: telerik, dpl, ai, server, mcp, dotnet,coding, assistant, nuget
published: True
position: 2
---

# Telerik DPL MCP Server (NuGet)

The Telerik Document Processing [MCP (Model Context Protocol) server](https://modelcontextprotocol.io/introduction) is also available as a NuGet package. This NuGet distribution exposes the same AI Coding Assistant functionality as the npm package. 

Beginning with **.NET 10**, it can be executed directly via the `dnx` command. For **.NET 8 and .NET 9** (where `dnx` is not available), you can [install it as a global dotnet tool](https://learn.microsoft.com/en-us/dotnet/core/tools/dotnet-tool-install) and invoke its executable.

## Prerequisites 

| Target Runtime | Required SDK | Invocation Method | Notes |
|----------------|--------------|-------------------|-------|
| .NET 8 / .NET 9 | .NET 8 or .NET 9 SDK | [dotnet tool](https://learn.microsoft.com/en-us/dotnet/core/tools/global-tools) | `dnx` not supported; install tool manually |
| .NET 10 | .NET 10 SDK (Preview 6 or newer) | `dnx` dynamic execution | Simplest approach; no prior install step |

Additional requirements:

* A [Telerik user account](https://www.telerik.com/account/).
* An active [Telerik license](https://www.telerik.com/purchase.aspx?filter=web) that includes Telerik Document Processing.
* An application that uses the Telerik [Document Processing Libraries]({%slug introduction%}).

## Summary of Installation Approaches

| Aspect | .NET 8 / 9 | .NET 10 |
|--------|------------|---------|
| Availability of `dnx` | Not available | Available |
| Install Command | `dotnet tool install Telerik.DPL.MCP` | None (resolved on demand) |
| .mcp.json Command | `dotnet` | `dnx` |
| .mcp.json Args | `telerik-dpl-assistant` | `Telerik.DPL.MCP`, `--yes` |
| Update Version | Re-run tool install with `--version` or `tool update` | Handled by latest package resolved by `dnx` |
| Offline Use | Requires prior tool install | Requires prior NuGet cache warm-up |

## Server Installation

### .NET 8 / .NET 9

  * Global installation

Install the MCP server as a local tool in your solution root (or another chosen path):

````powershell
dotnet tool install -g Telerik.DPL.MCP
````

If updating:

````powershell
dotnet tool update -g Telerik.DPL.MCP
````

These commands install/update the Telerik DPL MCP [dotnet tool](https://learn.microsoft.com/en-us/dotnet/core/tools/global-tools) globally. Global tools are installed in the following directories by default when you specify the **-g** or **--global** option:

- Windows - `%USERPROFILE%\.dotnet\tools`
- Linux/MacOS - `$HOME/.dotnet/tools`

  * Local installation

    - Navigate to the solution folder.
    - Run `dotnet tool new-manifest` in the Terminal.
    - Run `dotnet tool install Telerik.DPL.MCP` in the Terminal.

### .NET 10

No manual install step is needed. The `dnx` command will download and execute the NuGet package on demand.

## Server Configuration

### .NET 8 / .NET 9 Configuration (`.mcp.json`)

Add `.mcp.json` file to your solution root (or to `%USERPROFILE%` for global usage):

```json
    {
      "servers": {
        "telerik-dpl-assistant": {
          "type": "stdio",
          "command": "dotnet",
          "args": ["tool", "run", "telerik-dpl-assistant"],
          "env": {
            "TELERIK_LICENSE_PATH": "THE_PATH_TO_YOUR_LICENSE_FILE",
            // or
            "TELERIK_LICENSE": "YOUR_LICENSE_KEY"
          }
        }
      },
      "inputs": []
    }
```

For the **local** installation use the following `.mcp.json`:

```json
    {
      "servers": {
        "telerik-dpl-assistant": {
         "type": "stdio",
         "command": "telerik-dpl-assistant",
          "env": {
            "TELERIK_LICENSE_PATH": "THE_PATH_TO_YOUR_LICENSE_FILE",
            // or
            "TELERIK_LICENSE": "YOUR_LICENSE_KEY"
          }
        }
      },
      "inputs": []
    }
```


### .NET 10 Configuration (`.mcp.json`)

Use these settings when configuring the server in your MCP client:

```json
    {
      "servers": {
        "telerik-dpl-assistant": {
          "type": "stdio",
          "command": "dnx",
          "args": ["Telerik.DPL.MCP", "--yes"],
          "env": {
            "TELERIK_LICENSE_PATH": "THE_PATH_TO_YOUR_LICENSE_FILE",
            // or
            "TELERIK_LICENSE": "YOUR_LICENSE_KEY"
          }
        }
      },
      "inputs": []
    }
```

You may substitute `TELERIK_LICENSE` instead of `TELERIK_LICENSE_PATH` (*see [License Configuration](#license-configuration) section below for details and recommendations*). The `inputs` array is optional and not required for the current functionality.

After saving the file, restart Visual Studio and enable the `telerik-dpl-assistant` tool in the [Copilot Chat window's tool selection dropdown](https://learn.microsoft.com/en-us/visualstudio/ide/mcp-servers?view=vs-2022#configuration-example-with-github-mcp-server).

![An image demonstrating how to enable the Telerik DPL MCP tool in Visual Studio](images\vs-select-dpl-mcp-tool.png)

### Global Setup

To enable the server globally for all projects, add the `.mcp.json` file to your user directory (`%USERPROFILE%`, e.g., `C:\Users\{YourName}\.mcp.json`).

## License Configuration

Add your [Telerik license key]({%slug setting-up-license-key%}) using one of these options in the `env` section.

__Option 1: License File Path (Recommended)__

````json
"env": {
	"TELERIK_LICENSE_PATH": "THE_PATH_TO_YOUR_LICENSE_FILE"
}
````

The `THE_PATH_TO_YOUR_LICENSE_FILE` should point to the `telerik-license.txt` file, usually in the AppData folder. Often it will look like:

`"TELERIK_LICENSE_PATH": "%appdata%/Telerik/telerik-license.txt"`

__Option 2: Direct License Key__

````json
"env": {
	"TELERIK_LICENSE": "YOUR_LICENSE_KEY_HERE"
}
````

> Option 1 is recommended unless you're sharing settings across different systems. Remember to [update your license key]({%slug setting-up-license-key%}#updating-your-license-key) when necessary.

## Visual Studio Usage

After configuration and restart:

1. Open Copilot Chat.
2. Enable the `telerik-dpl-assistant` tool.
3. Grant permissions when prompted (*per session, workspace, or always*).
4. Start fresh sessions for unrelated prompts to avoid context pollution. You can check the Output pane of Visual Studio for diagnostics (select output from **GitHub Copilot**).

## See Also

* [AI Coding Assistant Overview]({%slug ai-coding-assistant%})
* [Telerik Document Processing Prompt Library]({%slug ai-prompt-library%})
* [npm-based Telerik DPL MCP Server]({%slug ai-mcp-server%})