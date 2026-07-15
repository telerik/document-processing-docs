---
title: TA Field
page_title: TA Field
description: The TA field defines the text and page number for a table of authorities entry in a document.
slug: radwordsprocessing-concepts-ta-field
tags: tafield, word, flow, docx, fields, toa, authorities, document, model, reference
published: True
position: 0
---

# TA (Table of Authorities Entry) Field

The TA (Table of Authorities Entry) field defines the text and page number for a table of authorities entry.

## Syntax

| Syntax |
| :--- |
| { **TA** [Switches ] } |

>To update the field, you need to set the [FlowExtensibilityManager.NumberingFieldsProvider]({%slug radpdfprocessing-formats-and-conversion-pdf-numbering-fields-provider%}).

## Switches

Switches are a way for the code fragment to specify formatting for the result of the field. More information is available in the [Syntax and Switches](https://docs.telerik.com/devtools/document-processing/libraries/radwordsprocessing/concepts/fields/fields#syntax-and-switches) section of the _Fields_ article.

| Switch | Description |
| :--- | :--- |
| \\b | Applies bold formatting to the page number for the entry. |
| \\c "Category" | Specifies the entry category. The number determines how citations are grouped in tables of authorities. |
| \\i | Makes the entry's page number italic. |
| \\l "Long" | Defines the long citation for the entry in the table of authorities. |
| \\r Bookmark | Inserts as the entry's page number the range of pages marked by the specified bookmark. |
| \\s "Short" | Defines the abbreviated form of the entry. |

## Inserting

You can insert this field through the [RadFlowDocumentEditor]({%slug radwordsprocessing-editing-radflowdocumenteditor%})'s `InsertField()` method. It accepts code as an argument.

**Example 1** demonstrates how you can insert a TA field.

**Example 1: Insert a TA field entry for Item with the bold page-number switch**

```C#
    var document = new RadFlowDocument();
    var editor = new RadFlowDocumentEditor(document);

    editor.InsertField("TA \"Item\" \\b");
```

This type of field does not have a result, but when updated, the switches are applied to the text.

## See Also

* [RadFlowDocumentEditor]({%slug radwordsprocessing-editing-radflowdocumenteditor%})
* [TOA Field]({%slug radwordsprocessing-concepts-toa-field%})