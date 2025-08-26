---
title: Prompt Library
page_title: Prompt Library
description: Explore prompt engineering techniques and ready-to-use prompt templates for the AI coding assistant of Telerik Document Processing Libraries.
slug: ai-prompt-library
tags: telerik, dpl, ai, server, mcp, dotnet,coding, assistant, prompt, library
published: True
position: 3
---

# Prompt Library

The prompts provided here are intended and optimized for use with Telerik Document Processing [AI Coding Assistant]({%slug ai-coding-assistant%}). When you run them in the [MCP Server]({%slug ai-mcp-server%}), these prompts will help you kick start your app development, speed up the component configuration process, and troubleshoot your code.

You can use the provided prompts as they are or modify them to fit your use case. Make sure to start your prompt with the respective [MCP Server]({%slug ai-mcp-server%}) handle).

You can also use the prompts with any AI-powered tool of your choice. However, the Telerik Document Processing AI Coding Assistant is developed to provide highly accurate results based extensively on the documentation, APIs, and community knowledge for Telerik Document Processing. Running the prompts outside the AI Coding Assistant may not produce as relevant results.

The list of prompts is not exhaustive and the Telerik Document Processing team is constantly working on adding more prompts to the library.

>caution Always double-check the code and solutions proposed by AI-powered tool before applying them to your project.

## How to Use This Library

Quick Start Guide:

1. Find a prompt that matches your needs

1. Copy the prompt text

1. Paste it in your IDE with the AI Assistant

1. Customize the prompt for your specific use case 

## General Prompts

The section provides examples of general questions related to RadPdfProcessing.

<table>
		<tr>
			<th>Create a New PDF Document with Text</th>
      <th>Create a New PDF Document with a Table</th>
		</tr>
    <tr>  
      <td>
        <pre><code>
#telerik_dpl_assistant show me how to create a PDF document and insert text "Hello Telerik Document Processing".
			  </code></pre>
      </td>
            <td>
         <pre><code>
#telerik_dpl_assistant create a PDF document with a table that has 3 rows and 3 columns, with background highlighting on the header row and red top and bottom borders for the entire table.
			  </code></pre>
      </td>
    </tr>   
</table>   

<table>
		<tr>
			<th>Create a New PDF Document with a Barcode</th>
      <th>Create a PDF Document with a Specific font</th>
		</tr>
    <tr>  
      <td>
      <pre><code>
#telerik_dpl_assistant create a PDF document with Barcode inside the first page and export it.
			  </code></pre>
      </td>
      <td>
        <pre><code>
#telerik_dpl_assistant  create a PDF document with text using Arial font and font size 12.
			  </code></pre>
      </td>
    </tr>   
</table>  

<table>
		<tr>
			<th>Register a Font</th>
      <th>Generate an Interactive Form</th>
		</tr>
    <tr>  
      <td>
      <pre><code>
#telerik_dpl_assistant register a font.
			  </code></pre>
      </td>
      <td>
        <pre><code>
#telerik_dpl_assistant create a new PDF document with an interactive form containing a text field, a combobox field and a listbox field. 
			  </code></pre>
      </td>
    </tr>   
</table>  

<table>
		<tr>
			<th>Create a PDF with a Text Annotation</th>
      <th>Embed a Text File in a PDF</th>
		</tr>
    <tr>  
      <td>
      <pre><code>
#telerik_dpl_assistant implement code for generating a PDF document with a red highlighted text annotation "I am a highlighted annotation."
			  </code></pre>
      </td>
      <td>
        <pre><code>
#telerik_dpl_assistant show me a complete code example on how to embed a text file.
			  </code></pre>
      </td>
    </tr>   
</table>  

<table>
		<tr>
			<th>Generate and Export a PDF Document to an Image</th>
      <th>Generate an Accessible PDF document</th>
		</tr>
    <tr>  
      <td>
      <pre><code>
#telerik_dpl_assistant create a PDF document with a "Hello DPL!" text in the middle of the page and export it to a PNG image.
			  </code></pre>
      </td>
      <td>
        <pre><code>
#telerik_dpl_assistant create a PDF/UA1 compliant document with StructureTree and text content in MarkedContent container with StructureTag set. Position the text in the middle of the page.
			  </code></pre>
      </td>
    </tr>   
</table> 

## See Also

* [AI Coding Assistant Overview]({%slug ai-coding-assistant%})
* [Telerik DPL MCP Server]({%slug ai-mcp-server%})