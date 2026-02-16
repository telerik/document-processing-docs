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

The section provides examples of general questions related to [RadPdfProcessing]({%slug radpdfprocessing-overview%}).

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

## SpreadProcessing Prompts

The section provides examples of general questions related to [RadSpreadProcessing]({%slug radspreadprocessing-overview%}).

<table>
		<tr>
			<th>Create a Spreadsheet with random data</th>
      <th>Import a Spreadsheet and read the content</th>
		</tr>
    <tr>  
      <td>
        <pre><code>
#telerik-dpl-assistant create a new spreadsheet file with random data inside.
			  </code></pre>
      </td>
            <td>
         <pre><code>
#telerik-dpl-assistant import an excel file and read the content of row 1 and column 1, and how to change the value on row 1 and column 2 to 5
			  </code></pre>
      </td>
    </tr>  
		<tr>
			<th>Import a Spreadsheet and color cells</th>
      <th>Import a Spreadsheet and format a cell</th>
		</tr>
    <tr>  
      <td>
        <pre><code>
#telerik-dpl-assistant import an excel document and change the background color of the first 5 cells on the first 2 rows.
			  </code></pre>
      </td>
            <td>
         <pre><code>
#telerik-dpl-assistant import an excel document and change the number format for cell A1.
			  </code></pre>
      </td>
    </tr>     
</table> 

## SpreadStreamProcessing Prompts

The section provides examples of general questions related to [RadSpreadStreamProcessing]({%slug radspreadstreamprocessing-overview%}).

<table>
		<tr>
			<th>Create a Spreadsheet with random data</th>
      <th>Import an existing Spreadsheet</th>
		</tr>
    <tr>  
      <td>
        <pre><code>
#telerik-dpl-assistant create a new excel file using spreadstreamprocessing with random data.
			  </code></pre>
      </td>
            <td>
         <pre><code>
#telerik-dpl-assistant import an excel file using spreadstreamprocessing.
			  </code></pre>
      </td>
    </tr>  
		<tr>
			<th>Import an Excel document and color cells</th>
      <th>	Import a Spreadsheet and format a cell</th>
		</tr>
    <tr>  
      <td>
        <pre><code>
#telerik-dpl-assistant open an excel file using spreadstreamprocessing and change the background color of the first 5 cells on the first 2 rows.
			  </code></pre>
      </td>
            <td>
         <pre><code>
#telerik-dpl-assistant open an excel file using spreadstreamprocessing and change the number format for cell A1.
			  </code></pre>
      </td>
    </tr>   
</table>

## WordsProcessing Prompts

The section provides examples of general questions related to [RadWordsProcessing]({%slug radwordsprocessing-overview%}).

<table>
		<tr>
			<th>Create a Word document</th>
      <th>Import a Word document</th>
		</tr>
    <tr>  
      <td>
        <pre><code>
#telerik-dpl-assistant  create a new Word document with text "Test".
			  </code></pre>
      </td>
            <td>
         <pre><code>
#telerik-dpl-assistant import an existing word document.
			  </code></pre>
      </td>
    </tr>  
		<tr>
			<th>MailMerge a Word document</th>
      <th>Convert DOCX to PDF</th>
		</tr>
    <tr>  
      <td>
        <pre><code>
#telerik-dpl-assistant perform a mail merge with a word document.
			  </code></pre>
      </td>
            <td>
         <pre><code>
#telerik-dpl-assistant open a docx document and export it to a pdf file.
			  </code></pre>
      </td>
    </tr> 
		<tr>
			<th></th>
      <th></th>
		</tr> 
</table>

## ZipLibrary Prompts

The section provides examples of general questions related to [RadZipLibrary]({%slug radziplibrary-overview%}).

<table>
		<tr>
			<th>Create a new zip archive</th>
      <th>Open an existing zip archive</th>
		</tr>
    <tr>  
      <td>
        <pre><code>
#telerik-dpl-assistant create a new zip archive.
			  </code></pre>
      </td>
            <td>
         <pre><code>
#telerik-dpl-assistant open a zip archive.
			  </code></pre>
      </td>
    </tr>  
		<tr>
			<th>Add a file to a zip archive</th>
      <th>Protect a zip archive</th>
		</tr>
    <tr>  
      <td>
        <pre><code>
#telerik-dpl-assistant add a new file into a zip archive.
			  </code></pre>
      </td>
            <td>
         <pre><code>
#telerik-dpl-assistant protect a zip archive.
			  </code></pre>
      </td>
    </tr> 
		<tr>
			<th></th>
      <th></th>
		</tr> 
</table>

## See Also

* [AI Coding Assistant Overview]({%slug ai-coding-assistant%})
* [Telerik DPL MCP Server]({%slug ai-mcp-server%})