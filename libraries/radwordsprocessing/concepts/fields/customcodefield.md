---
title: Custom Code Field
page_title: Custom Code Field
description: Learn how to use the CustomCodeField element to insert fields with configurable code parts in RadWordsProcessing documents.
slug: radwordsprocessing-concepts-customcodefield
tags: custom, code, field, word, flow, docx, fields, document, model, extension
published: True
position: 2
---

# Custom Code Field

Fields in `RadFlowDocument` consist of a code fragment and a result fragment as explained in the [Fields]({%slug radwordsprocessing-concepts-fields%}) article. Some fields have a direct representation in the document model, for example, [Hyperlinks]({%slug radwordsprocessing-concepts-hyperlink-field%}). For all other fields, you can use the [`CustomCodeField`](https://docs.telerik.com/devtools/document-processing/api/telerik.windows.documents.flow.model.fields.customcodefield) class. You need some knowledge of how to correctly form the code of the field.

## Field Syntax

Here is the basic syntax of a field code:

| Syntax   								 |
| :---     								 |
| **field-type** [_field-argument_] [_switches_] |


* *field-type*: The type of the field. For example: HYPERLINK.

* *argument*: The argument of the field. This is optional because some of the fields do not require an argument.

* *switches*: Additional properties of the field. More information on the topic is available in the [Fields]({%slug radwordsprocessing-concepts-fields%}) article.


## Inserting

The suggested approach for inserting code fields is through [RadFlowDocumentEditor]({%slug radwordsprocessing-editing-radflowdocumenteditor%}). The `InsertField()` method accepts code as the first argument and the result as the second argument.

The following are some commonly used fields. The complete list of field codes and the switches for each of them is available in the [Docx specification](https://www.ecma-international.org/publications/standards/Ecma-376.htm).

>In all examples, the result fragment is also inserted. However, if you export the document to [Docx format]({%slug radwordsprocessing-formats-and-conversion-docx-docxformatprovider%}#docx), you can use the `AutoUpdateFields` property. It forces all fields to be updated when the document is opened in MS Word or another editor.

### Inserting PAGE Field

**Example 1** shows how to insert a `PAGE` field representing the current page number in the document.

**Example 1: Insert PAGE field**

```C#
	editor.InsertField("PAGE  \\* ROMAN", "«VII»");
```


The `\\* ROMAN` is a general formatting switch that formats a numeric result using uppercase Roman numerals.

### Inserting NUMPAGES Field

**Example 2** demonstrates how a combination of `PAGE` and `NUMPAGES` fields can be inserted to show the current page and the total page count in the document.

**Example 2: Insert NUMPAGES field**

```C#
	editor.InsertText("Page ");
	editor.InsertField("PAGE", "3");
	editor.InsertText(" of ");
	editor.InsertField("NUMPAGES", "5");
```


### Inserting AUTHOR Field

**Example 3** demonstrates how to insert an `AUTHOR` field showing the name of the author of the document.

**Example 3: Insert AUTHOR field**

```C#
	editor.InsertField("AUTHOR  \\* Upper", "«JOHN DOE»");
```


The `\\* Upper` switch converts all letters in the result to uppercase.

### Inserting Table of Contents Field

**Example 4** shows how to insert a table of contents (TOC) field.

**Example 4: Insert Table of Contents field**

```C#
	FieldInfo tocField = editor.InsertField("TOC \\o \"1-3\" \\h \\z \\u", "«result»");
	tocField.IsDirty = true;
```


The following table describes the available switches for this field:

| Switch   | Description                                                                           |
| :---     | :---                                                                                  |
| \o "1-3" | Specifies that the first three heading levels are included in the table of contents |
| \h       | Makes the table of contents entries hyperlinks                                        |
| \z       | Hides tab leader and page numbers in Web layout view                                  |
| \u       | Uses the applied paragraph outline level                                              |

The `IsDirty` property is set so that the TOC field is updated when the document is loaded inside an editor like Microsoft Word.

## See Also

* [Fields]({%slug radwordsprocessing-concepts-fields%})
* [RadFlowDocument]({%slug radwordsprocessing-model-radflowdocument%})
* [RadFlowDocumentEditor]({%slug radwordsprocessing-editing-radflowdocumenteditor%})
