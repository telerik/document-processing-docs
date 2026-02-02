---
title: Overview
page_title: Telerik Document Processing AI Tooling Overview
description: Learn about the Telerik Document Processing Libraries AI-powered developer tools that integrate with your IDE or code editor for greater productivity and enhanced developer experience.
slug: ai-coding-assistant
tags: ai, dpl, document, processing, coding, assistant
published: True
position: 0
---

# AI Coding Assistant

[Telerik Document Processing]({%slug introduction%}) offers an **AI Coding Assistant**, which helps you enhance your productivity and reduce guesswork when building applications with the [Document Processing Libraries]({%slug introduction%}). The coding assistant is an AI code generator that provides specialized context to AI models, enabling them to produce higher-quality code samples.

## Available Tools

The **AI Coding Assistant** is available through the following tool:

* [MCP server]({%slug ai-mcp-server%})&mdash;A powerful tool for running complex or multi-step prompts that integrates with any MCP-enabled client.

### Key Features

The major features are listed in the table below.

| Feature| MCP Server|
|-----|----|
|Prompt Handling|Handles complex, multi-step prompts|
|Client Compatibility|Works with MCP-enabled clients (e.g., Cursor, Copilot Agent mode)|
|Code Suggestions|Can directly suggest changes and rebuild applications to verify code|
|Response Focus|Primarily code-focused|

## Intended Use

>warning Always double-check the code and solutions proposed by any AI-powered tool before applying them to your project.

You can use the AI Coding Assistant for:

* **Initial code generation:** Quickly create / update / convert documents in your app to speed up the initial development.
* **Basic document library configuration:** Enable or disable specific document library features, or fine tune the configuration through prompting. More complex configurations are possible but may require additional manual work to be production-ready.
* **Dummy data generation:** Quickly add data to your app for testing and prototyping purposes. Avoid exposing or providing access to your proprietary or production data to AI-enabled tools.
* **Step-by-step explanations:** Understand the solutions provided by the AI Coding Assistant through the detailed explanations (depends on the tool, mode, and model used). To further develop your knowledge, check the respective documentation.
* **Preliminary troubleshooting:** Resolve obvious and easy-to-solve issues affecting your code. For more complex issues, look for assistance from the community or contact the support team.

## Recommendations

Consider the following recommendations when working with the AI Coding Assistant:

* When switching between tasks and files, start a new session in a new chat window to avoid polluting the context with irrelevant or outdated information.
* At the time of publishing, **Claude Sonnet 4** and **GPT-5** produce optimal results.
* Specify the [Target Framework]({%slug available-nuget-packages%}) (e.g. .NET Framework, .NET Standard, .NET  {{site.mindotnetversion}} or later (Target OS: *None*), .NET  {{site.mindotnetversion}} or later (Target OS: *Windows*)) for producing as high-quality results as possible.

## Usage Limits

Access to the Telerik Document Processing AI Coding Assistant depends on your [Telerik license type](https://www.telerik.com/purchase/faq/licensing-purchasing):

* Subscription License
  * A Subscription is the primary license that grants full access to the AI Coding Assistant.
  * Includes a virtually unlimited number of requests, with a fair use threshold of 300 requests per day.
  * Best for ongoing and high-volume usage.
* Perpetual License (Limited Access)
  * Perpetual licenses include limited access of 50 requests per year.
  * Intended for exploring and trying out the AI Coding Assistant.
  * For continued or higher-volume access, upgrade to a Subscription license.
* Trial License
  * Trial licenses include 300 requests per trial per year.
  * Reactivating the same trial for a new release does not grant additional requests.
  * Designed for evaluating the feature before purchasing.

> All Telerik AI tools share a single request limit for your Telerik account. For example, the [Telerik MCP server]({%slug ai-mcp-server%}) takes up from the same usage quota.
> When using the Telerik Document Processing MCP server, one prompt may trigger several requests, depending on the prompt complexity.

## Privacy

The Telerik Document Processing AI Coding Assistant operates under strict privacy guidelines:

* The Assistant does not have access to your workspace and application code. Note that when using the Telerik Document Processing MCP server (or any other MCP server), the LLM generates parameters for the MCP server request, which may include parts of your application code.

* The Assistant does not have access to your workspace and application code. Note that when using the DPL MCP server (or any other MCP server), the LLM generates parameters for the MCP server request, which may include parts of your application code.
* The Assistant does not use your prompts to train Telerik AI models.
* The Assistant does not generate the actual responses and has no access to these responses. The Assistant only provides a better context that helps your selected model (for example, GPT, Gemini, Claude) provide better responses.
* The Assistant does not associate your prompts to your Telerik user account. Your prompts and generated context are anonymized and stored for statistical and troubleshooting purposes.
* The Assistant stores metrics about how often and how much you use it in order to ensure compliance with the [allowed number of requests that correspond to your current license](#usage-limits).

Make sure to also get familiar with the terms and privacy policy of your selected AI model and AI client.
 
## Next Steps

* Configure the [Telerik Document Processing MCP Server]({%slug ai-mcp-server%})
* Explore the [Telerik Document Processing Prompt Library]({%slug ai-prompt-library%}).
