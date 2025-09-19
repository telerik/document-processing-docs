---
title: TC Field
page_title: TC Field
description: TC field is a field element that represents a table of contents entry.
slug: radwordsprocessing-concepts-tc-field
tags: table of contents,field
published: True
position: 0
---

# TC (Table of Contents Entry) Field

The TC (Table of Contents Entry) field defines the text and page numbers for entries in a table of contents and in lists of tables, figures, and similar contents. This fields should be inserted before the text that you want to include in the contents. 

>In order to update the field, you need to set the [FlowExtensibilityManager.NumberingFieldsProvider]({%slug radpdfprocessing-formats-and-conversion-pdf-numbering-fields-provider%}).

# Syntax

| Syntax   |
| :---     	 |
| { **TC** *"Text"* [Switches ] }|    


# Switches 

Switches are a way for the code fragment to specify formatting for the result of the field. More information is available in the [Syntax and Switches](https://docs.telerik.com/devtools/document-processing/libraries/radwordsprocessing/concepts/fields/fields#syntax-and-switches) section of the _Fields_ article.

| Switch                 | Description                        |
| :---                   | :---                               |
| \\f Type  | The item types used in particular contents list. Use a unique Type identifier (typically a letter from A-Z) for each type of list. |
| \\l Level | The level of the TC entry.  |
| \\n | Omits the page number for the entry. |

# Inserting

Inserting this field is easily achieved through the [RadFlowDocumentEditor]({%slug radwordsprocessing-editing-radflowdocumenteditor%})'s __InsertField()__ method. It accepts code as argument.

__Example 1__ demonstrates how you can insert a TC field.
        

#### __[C#] Example 1: Insert TC field__


<pre><code>
    editor.InsertText("Text before ");
    editor.InsertBreak(BreakType.LineBreak);

    editor.InsertField("TC Item1 \\f a \\l 1");

    editor.InsertBreak(BreakType.LineBreak);
    editor.InsertText("Text after");
</code></pre>
 
This type of field does not have a result and there is no need to be updated. 

## See Also 

* [RadFlowDocumentEditor]({%slug radwordsprocessing-editing-radflowdocumenteditor%})
* [TOC field]({%slug radwordsprocessing-concepts-toc-field%}))