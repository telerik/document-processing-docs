---
title: Overview
page_title: Telerik Document Processing AI Tooling Overview
description: Learn about the Telerik Document Processing Libraries AI-powered developer tools that integrate with your IDE or code editor for greater productivity and enhanced developer experience.
slug: ai-coding-assistant
tags: ai, dpl, document, processing, coding, assistant
published: True
position: 0
---

# AI Coding Assistant <sup>Telerik Document Processing</sup>

[Telerik Document Processing]({%slug introduction%}) offers an **AI Coding Assistant**, which helps you enhance your productivity, reduce guesswork, and ensure compliance with security standards when building applications with the [Document Processing Libraries]({%slug introduction%}). The coding assistant is an AI code generator that provides specialized context to AI models, enabling them to produce higher-quality code samples.

## Available Tools

The **AI Coding Assistant** is available through the following tools:

* [Copilot Extension]({%slug ai-copilot-extension%})&mdash;A Copilot add-on for fast initial code generation, basic component configuration, and detailed explanations within Copilot-enabled IDEs

* [MCP server]({%slug ai-mcp-server%})&mdash;A powerful tool for running complex or multi-step prompts that integrates with any MCP-enabled client.

### Key Differences

The major differences between these tools are listed in the table below.

| Feature| MCP Server| GitHub Copilot Extension|
|-----|----|----|
|Prompt Handling|Handles complex, multi-step prompts| Offers shorter, focused code snippets|
|Client Compatibility|Works with MCP-enabled clients (e.g., Cursor, Copilot Agent mode)|Integrated as a Copilot extension|
|Code Suggestions|Can directly suggest changes and rebuild applications to verify code|Provides detailed explanations alongside code suggestions|
|Response Focus|Primarily code-focused|Better for learning and understanding implementation|

## Prerequisites for the AI Coding Assistant

To use the Telerik Document Processing Libraries AI Coding Assistant, you need:

* A [Telerik user account](https://www.telerik.com/account/).
* An active [Telerik license](https://www.telerik.com/purchase.aspx?filter=web) that includes Telerik Document Processing.
* An application that uses the Telerik [Document Processing Libraries]({%slug introduction%}).

## Intended Use

>warning Always double-check the code and solutions proposed by any AI-powered tool before applying them to your project.

You can use the AI Coding Assistant for:

* **Initial code generation:** Quickly create/ udpate / convert documents in your app to speed up the initial development.
* **Basic document library configuration:** Enable or disable specific document library features, or fine tune the configuration through prompting. More complex configurations are possible but may require additional manual work to be production-ready.
* **Dummy data generation:** Quickly add data to your app for testing and prototyping purposes. Avoid exposing or providing access to your proprietary or production data to AI-enabled tools.
* **Step-by-step explanations:** Understand the solutions provided by the AI Coding Assistant through the detailed explanations (depends on the tool, mode, and model used). To further develop your knowledge, check the respective documentation.
* **Preliminary troubleshooting:** Resolve obvious and easy-to-solve issues affecting your code. For more complex issues, look for assistance from the community or contact the support team.

## Recommendations

Consider the following recommendations when working with the AI Coding Assistant:

* When switching between tasks and files, start a new session in a new chat window to avoid polluting the context with irrelevant or outdated information.
* At the time of publishing, **Claude Sonnet 4** and **GPT-5** produce optimal results.
* Specify the [Target Framework]({%slug available-nuget-packages%}) (e.g. .NET Framework, .NET Standard, .NET  {{site.mindotnetversion}} (Target OS: None), .NET  {{site.mindotnetversion}} (Target OS: Windows)) for producing as high-quality results as possible.

## Number of Requests

The Document Processing AI Coding Assistant allows the following maximum number of requests based on your [Telerik license type](https://www.telerik.com/purchase.aspx?filter=web):

| License Type | Request Limit |
|--------------|---------------|
| Perpetual | 50 requests per year |
| Subscription | Virtually unlimited with fair use threshold of 300 requests per day |
| Trial | 300 requests per trial period (does not reset with new trial activations) |

> All Telerik AI tools share a single request quota for your Telerik account. Usage from the [Telerik Copilot extension]({%slug ai-copilot-extension%}) and [Telerik MCP server]({%slug ai-mcp-server%}) counts toward the same limit. Complex prompts in the MCP server may consume multiple requests.

## Privacy

The Telerik Document Processing AI Coding Assistant operates under strict privacy guidelines:

* No access to your workspace and application code.
* Exception: when using the Telerik MCP server (or any other MCP server), the LLM generates parameters for the MCP server request, which may include parts of your application code.
 
## Next Steps

* Install the [Telerik Document Processing Libraries GitHub Copilot Extension]({%slug ai-copilot-extension%})
* Configure the [Telerik Document Processing Libraries MCP Server]({%slug ai-mcp-server%}) with an MCP-enabled client
