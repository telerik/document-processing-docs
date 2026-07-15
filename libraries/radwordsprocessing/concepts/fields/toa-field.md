---
title: Table of Authorities Field
page_title: Table of Authorities Field
description: The TOA field creates and inserts a table of authorities that collects TA field entries.
slug: radwordsprocessing-concepts-toa-field
tags: toa, word, flow, docx, fields, authorities, document, table, model, index
published: True
position: 0
---

# TOA (Table of Authorities) Field

The TOA (Table of Authorities) field creates and inserts a table of authorities. The TOA field collects entries marked by TA (Table of Authorities Entry) fields.

To obtain the pages of TA fields, `BookmarkRangeStart`, and `BookmarkRangeEnd` fields, you need to set the [FlowExtensibilityManager.NumberingFieldsProvider]({%slug radpdfprocessing-formats-and-conversion-pdf-numbering-fields-provider%}).

## Switches

Switches are a way for the code fragment to specify formatting for the result of the field. More information is available in the [Syntax and Switches](https://docs.telerik.com/devtools/document-processing/libraries/radwordsprocessing/concepts/fields/fields#syntax-and-switches) section of the _Fields_ article.

| Switch | Description |
| :--- | :--- |
| \\c "Category" | Specifies the category of entries to collect in a table of authorities. This switch is required. |
| \\b Bookmark | Collects entries only from the portion of the document marked by the specified bookmark. |
| \\e "Separators" | Specifies the characters (up to fifteen) that separate a table of authorities entry and its page number. |
| \\f | Removes the formatting of the entry text in the document from the entry in the table of authorities. |
| \\g "Separators" | Defines the abbreviated form of the entry. |
| \\h | Includes the category heading for the entries in a table of authorities. |
| \\l | Specifies the characters (up to fifteen) that separate multiple page references. |
| \\p | Replaces five or more different page references to the same authority with "passim". |
| \\s Identifier | Includes a number, such as a case number or section number, before the page number. The item must be numbered with a SEQ field, and Identifier must match the identifier in the SEQ field. |
| \\d "Separator" | Used with the \s switch, specifies the characters (up to fifteen) that separate the sequence numbers and page numbers. |

## Inserting

You can insert this field through the [RadFlowDocumentEditor]({%slug radwordsprocessing-editing-radflowdocumenteditor%})'s `InsertField()` method. It accepts code as an argument.

**Example 1** demonstrates how you can insert a TOA field.

**Example 1: Insert a Table of Authorities (TOA) field for category 3 with heading and passim/page-number formatting  switches**

```C#
    var document = new RadFlowDocument();
    var editor = new RadFlowDocumentEditor(document);

    editor.InsertField("TOA \\h \\c \"3\" \\p");
```

## See Also

* [RadFlowDocumentEditor]({%slug radwordsprocessing-editing-radflowdocumenteditor%})
* [TA Field]({%slug radwordsprocessing-concepts-ta-field%})