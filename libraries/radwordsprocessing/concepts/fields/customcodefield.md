---
title: Custom Code Field
page_title: Custom Code Field
description: Custom Code field is a Field element with configurable code part.
slug: radwordsprocessing-concepts-customcodefield
tags: custom,code,field
published: True
position: 2
---

# CustomCodeField

__Fields__ in __RadFlowDocument__ consist of code fragment and result fragment as explained in the [Fields]({%slug radwordsprocessing-concepts-fields%}) article. Some fields have a direct representation in the document model – for example [Hyperlinks]({%slug radwordsprocessing-concepts-hyperlink-field%}). For all other fields you can use the [CustomCodeField](https://docs.telerik.com/devtools/document-processing/api/telerik.windows.documents.flow.model.fields.customcodefield) class – however you will need some knowledge of how to correctly form the code of the field.

## Field Syntax

Here is the basic syntax of a field code:  

| Syntax   								 |
| :---     								 |
| **field-type** [_field-argument_] [_switches_] | 



* *field-type*: The type of the field. For example: HYPERLINK.

* *argument*: The argument of the field. This is optional as some of the fields do not require an argument.

* *switches*: Additional properties of the field. More information on the topic can be found in the [Fields]({%slug radwordsprocessing-concepts-fields%}) article.


## Inserting

The suggested approach for inserting code fields is by using [RadFlowDocumentEditor]({%slug radwordsprocessing-editing-radflowdocumenteditor%}). The __InsertField()__ method accepts code as a first argument and the result as a second argument.
        

Here are some commonly used fields. The complete list of field codes and the switches for each of them can be found in the [Docx specification](http://www.ecma-international.org/publications/standards/Ecma-376.htm).
        

>In all examples the result fragment is also inserted. However, if you export the document to [Docx format]({%slug radwordsprocessing-formats-and-conversion-docx-docxformatprovider%}#docx), you can make use of the __AutoUpdateFields__ property. It forces all fields to be updated when the document is opened in MS Word or another editor.
          

### Inserting PAGE Field

**Example 1** shows how to insert a __PAGE__ field representing the current page number in the document.

#### __[C#] Example 1: Insert PAGE field__

<pre><code>    
	editor.InsertField("PAGE  \\* ROMAN", "«VII»");
</code></pre>


The __\\* ROMAN__ is general formatting switch that formats a numeric result using uppercase Roman numerals.
            

### Inserting NUMPAGES Field

**Example 2** demonstrates how a combination of __PAGE__ and __NUMPAGES__ fields can be inserted to show which is the current page as well as the total page count in the document.
            

#### __[C#] Example 2: Insert NUMPAGES field__

<pre><code>          
	editor.InsertText("Page ");
	editor.InsertField("PAGE", "3");
	editor.InsertText(" of ");
	editor.InsertField("NUMPAGES", "5");
</code></pre>


### Inserting AUTHOR Field

In **Example 3** is demonstrated how to insert __AUTHOR__ field showing the name of the author of the document.

#### __[C#]  Example 3: Insert AUTHOR field__

<pre><code>            
	editor.InsertField("AUTHOR  \\* Upper", "«JOHN DOE»");
</code></pre>


The __\\* Upper__ switch will convert all letters in the result to uppercase.
            

### Inserting Table of Contents Field

**Example 4** shows how to insert a table of contents (TOC) field.
            
#### __[C#]  Example 4: Insert Table of Contents field__

<pre><code>           
	FieldInfo tocField = editor.InsertField("TOC \\o \"1-3\" \\h \\z \\u", "«result»");
	tocField.IsDirty = true;
</code></pre>


There are several switches which can be used for this field:

| Switch   | Description                                                                           |
| :---     | :---                                                                                  |
| \o "1-3" | Specifies that the first 3 heading levels should be included in the table of contents |
| \h       | Makes the table of contents entries hyperlinks                                        |
| \z       | Hides tab leader and page numbers in Web layout view                                  |
| \u       | Uses the applied paragraph outline level                                              |

The __IsDirty__ property is set so that the TOC field is updated when the document is loaded inside an editor like Microsoft Word.
            

## See Also

 * [Fields]({%slug radwordsprocessing-concepts-fields%})
 * [RadFlowDocument]({%slug radwordsprocessing-model-radflowdocument%})
 * [RadFlowDocumentEditor]({%slug radwordsprocessing-editing-radflowdocumenteditor%})
