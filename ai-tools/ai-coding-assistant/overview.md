---
title: Overview
page_title: Telerik Document Processing AI Tooling Overview
description: Learn about the Telerik Document Processing Libraries AI-powered developer tools that integrate with your IDE or code editor for greater productivity and enhanced developer experience.
slug: ai-coding-assistant
tags: ai, coding, assistant, mcp, document, processing, telerik, productivity
published: True
position: 0
---

# AI Coding Assistant

[Telerik Document Processing]({%slug introduction%}) offers an **AI Coding Assistant** that helps you reduce guesswork when you build applications with the [Document Processing Libraries]({%slug introduction%}). The assistant provides specialized context to AI models so they can generate higher-quality code samples.

## Available Tools

The **AI Coding Assistant** is available through this tool:

* [Telerik DPL MCP Server]({%slug ai-mcp-server-as-a-nuget%})&mdash;Runs complex or multi-step prompts and integrates with MCP-enabled clients.

### Key Features

The major features are listed in the table below.

| Feature | MCP Server |
|---|---|
| Prompt Handling | Handles complex, multi-step prompts |
| Client Compatibility | Works with MCP-enabled clients, for example, Cursor and Copilot Agent mode |
| Code Suggestions | Can suggest changes directly and rebuild applications to verify code |
| Response Focus | Primarily code-focused |

## Intended Use

>important Always double-check code and solutions from AI-powered tools before you apply them to your project.

You can use the AI Coding Assistant for:

* **Initial code generation:** Quickly create, update, or convert documents in your app to speed up the initial development.
* **Basic document library configuration:** Enable or disable specific document library features, or fine-tune the configuration through prompting. More complex configurations are possible but may require additional manual work to be production-ready.
* **Dummy data generation:** Quickly add data to your app for testing and prototyping purposes. Avoid exposing or providing access to your proprietary or production data to AI-enabled tools.
* **Step-by-step explanations:** Review detailed explanations of proposed solutions. Availability depends on the tool, mode, and model that you use.
* **Preliminary troubleshooting:** Resolve common issues affecting your code. For more complex issues, look for assistance from the community or contact the support team.

## Recommendations

Consider the following recommendations when working with the AI Coding Assistant:

* When you switch between tasks and files, start a new session in a new chat window to avoid context pollution.
* Use a current high-capability model for the best results.
* Specify the [target framework]({%slug available-nuget-packages%}) of your project. For example, state whether you target .NET Framework, .NET Standard, or .NET {{site.mindotnetversion}} or later.

## Usage Limits

Access to the Telerik Document Processing AI Coding Assistant requires an active product trial or subscription license for a Telerik product that includes Document Processing. Telerik offers Document Processing only with other Telerik products, not as a standalone license. The following table summarizes access by license type:

| License or trial type | Access | Details |
|---|---|---|
| Subscription License | Yes | Subscription licenses provide full access to the AI Coding Assistant, with a fair-use threshold of 300 requests per day. |
| Product Trial | Yes | Activating a trial for a Telerik product that includes Document Processing also activates the Telerik DPL MCP server trial. Trial users can make a limited number of requests per year. |
| Perpetual License | No | A perpetual license alone does not provide access to the AI Coding Assistant. |

>note All Telerik AI tools share a single request limit for your Telerik account. For example, the [Telerik DPL MCP Server]({%slug ai-mcp-server-as-a-nuget%}) counts against the same usage quota. One prompt can trigger several requests, depending on prompt complexity.

## Privacy

The Telerik Document Processing AI Coding Assistant operates under strict privacy guidelines:

* The assistant does not have access to your workspace or application code. When you use the Telerik Document Processing MCP server, the LLM generates request parameters, which can include parts of your application code.
* The assistant does not use your prompts to train Telerik AI models.
* The assistant does not generate the final responses and does not have access to them. It only provides better context to your selected model, such as GPT, Gemini, or Claude.
* The assistant does not associate your prompts with your Telerik user account. Your prompts and generated context are anonymized and stored for statistical and troubleshooting purposes.
* The assistant stores usage metrics to verify compliance with the [request limits for your current license](#usage-limits).

Review the terms and privacy policy of your selected AI model and AI client.
 
## Next Steps

Continue with these resources:

* Configure the [Telerik Document Processing MCP Server]({%slug ai-mcp-server-as-a-nuget%})
* Explore the [Telerik Document Processing Prompt Library]({%slug ai-prompt-library%}).
