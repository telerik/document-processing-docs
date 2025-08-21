---
title: Prompt Library
page_title: Prompt Library
description: Explore prompt engineering techniques and ready-to-use prompt templates for the AI coding assistant of Telerik Document Processing Libraries.
slug: ai-prompt-library
tags: telerik, dpl, ai, server, mcp, dotnet,coding, assistant, prompt, library
published: True
position: 3
---

# Telerik Document Processing Prompt Library

The prompts provided here are intended and optimized for use with Telerik Document Processing [AI Coding Assistant]({%slug ai-coding-assistant%}). When you run them in the [GitHub Copilot Extension]({%slug ai-copilot-extension%}) or the [MCP Server]({%slug ai-mcp-server%}), these prompts will help you kick start your app development, speed up the component configuration process, and troubleshoot your code.

You can use the provided prompts as they are or modify them to fit your use case. Make sure to start your prompt with the required prefix (@telerikdpl for the [GitHub Copilot Extension]({%slug ai-copilot-extension%}) or the respective [MCP Server]({%slug ai-mcp-server%}) handle).

You can also use the prompts with any AI-powered tool of your choice. However, the Telerik Document Processing AI Coding Assistant is developed to provide highly accurate results based extensively on the documentation, APIs, and community knowledge for Telerik Document Processing. Running the prompts outside the AI Coding Assistant may not produce as relevant results.

The list of prompts is not exhaustive and the Telerik Document Processing team is constantly working on adding more prompts to the library.

>caution Always double-check the code and solutions proposed by AI-powered tool before applying them to your project.

## How to Use This Library

Quick Start Guide:

1. Find a prompt that matches your needs

1. Copy the prompt text

1. Paste it in your IDE with the AI Assistant

1. Customize the prompt for your specific use case. 

## General Prompts

The section provides examples of general questions related to RadPdfProcessing.

<table>
		<tr>
			<th>Create a New PDF Document</th>
      <th>Create an Accessible PDF</th>
		</tr>
    <tr>  
      <td>
        <pre><code>
/telerikdpl create a PDF file and insert text "Hello world", using telerik_dpl_assistant (usage is mandatory).
			  </code></pre>
      </td>
            <td>
         <pre><code>
/telerikdpl create a PDF document and export it to a PDF/A Compliant file,  using telerik_dpl_assistant (usage is mandatory).
			  </code></pre>
      </td>
    </tr>   
</table>   

<table>
		<tr>
			<th>Create a New PDF Document with an Image</th>
      <th>Merge PDF Documents</th>
		</tr>
    <tr>  
      <td>
      <pre><code>
/telerikdpl create a PDF file with image in it, using telerik_dpl_assistant (usage is mandatory).
			  </code></pre>
      </td>
      <td>
        <pre><code>
/telerikdpl import two PDF files and merge them into a single one,  using telerik_dpl_assistant (usage is mandatory).
			  </code></pre>
      </td>
    </tr>   
</table>  

## Library-Specific Prompts

## Troubleshooting Prompts

This section provides sample prompts for debugging and troubleshooting your PdfProcessing code.

## See Also

* [Telerik DPL GitHub Copilot Extension]({%slug ai-copilot-extension%})
* [AI Coding Assistant Overview]({%slug ai-coding-assistant%})
* [Telerik DPL MCP Server]({%slug ai-mcp-server%})