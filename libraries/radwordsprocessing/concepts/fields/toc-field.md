---
title: Table of Contents Field
page_title: Table of Contents Field
description: The TOC (Table of Contents) field creates a table of contents from heading styles or TC fields in a RadFlowDocument using RadWordsProcessing.
slug: radwordsprocessing-concepts-toc-field
tags: toc, word, flow, docx, fields, contents, document, table, model, navigation
published: True
position: 0
---

# Table of Contents Field

The TOC (Table of Contents) field creates a table of contents. It uses the heading or other styles in the document. You can also specify the items by using the TC field.

>To update the `PageRef` fields within the TOC field, set the [FlowExtensibilityManager.NumberingFieldsProvider]({%slug radpdfprocessing-formats-and-conversion-pdf-numbering-fields-provider%}).

## Syntax

| Syntax |
| :--- |
| { **TOC** [Switches ] } |

## Switches

The following tables describe the available switches for the TOC field.

### Switches That Control What Is Included in the Table of Contents

| Switch | Description |
| :--- | :--- |
| \\o "Levels" | Builds a table of contents from paragraphs formatted with styles that include outline levels (most commonly, heading styles). For example, { TOC \o "1-3" } lists only paragraphs formatted with styles that include outline levels 1 through 3. |
| \\t "Style,Level,Style,Level,..." | Builds a table of contents from paragraphs formatted with styles other than the built-in styles. For example, { TOC \t "style1,1, style2,2" }. |
| \\u | Builds a table of contents from paragraphs whose formatting includes outline levels applied directly, in paragraph settings. |
| \\c "SEQIdentifier" | Lists figures, tables, charts, or other items that are numbered by a SEQ (Sequence) field. |
| \\a Identifier | Lists items captioned with the Caption but omits caption labels and numbers. You can insert a caption by adding a SEQ field. |
| \\f EntryIdentifier | Builds a table from TC fields. If EntryIdentifier is specified, the table is built only from TC fields with the same identifier (typically a letter). |
| \\l Levels | Builds a table of contents from TC fields that assign entries to one of the specified levels. |
| \\b BookmarkName | Collects entries only from the portion of the document marked by the specified bookmark. |

### Switches That Format the Page Number

| Switch | Description |
| :--- | :--- |
| \\s Identifier | Includes a number such as a chapter number before the page number. The chapter or other item must be numbered with a SEQ field. Identifier must match the identifier in the SEQ field. |
| \\d "Separator" | When used with the \s switch, specifies the character that separates the sequence numbers and page numbers. |
| \\p "Separator" | Specifies the character that separates an entry and its page number. |
| \\n Levels | Omits page numbers from the table of contents. Page numbers are omitted from all levels unless a range of entry levels is specified. |

### Switches That Format Table Entries

| Switch | Description |
| --- | --- |
| \\w | Preserves tab entries within table entries. |
| \\x | Preserves manual line breaks within table entries. |
| \\z | Hides tab leader and page numbers in Web layout view. |
| \\h Hyperlinks | Inserts TOC entries as hyperlinks. |

## Inserting

Insert this field through the [RadFlowDocumentEditor]({%slug radwordsprocessing-editing-radflowdocumenteditor%})'s `InsertField()` method. It accepts code as an argument.

**Example 1** demonstrates how to insert a TOC field.

#### **Example 1: Insert a TOC field that builds entries from TC fields with the a identifier**

```C#
    var document = new RadFlowDocument();
    var editor = new RadFlowDocumentEditor(document);

    editor.InsertField("TOC \\f a ");
```

This creates a list of all TC fields with the 'a' identifier.

## See Also

* [RadFlowDocumentEditor]({%slug radwordsprocessing-editing-radflowdocumenteditor%})
* [TC Field]({%slug radwordsprocessing-concepts-tc-field%})
* [Generating a Table of Contents in a Merged Document Using RadWordsProcessing]({%slug generate-table-of-contents-radwordsprocessing%})
* [Updating TOC Page Numberings in Word Documents Before Exporting to DOCX Format]({%slug update-toc-radwordsprocessing-before-docx-export%})
* [Styling Table of Contents with Multilevel List Numbering in Telerik WordsProcessing]({%slug wordsprocessing-styling-table-of-contents-multilevel-list-numbering%})
* [WordsProcessing Table Of Contents/Authorities Demo](https://demos.telerik.com/document-processing/wordsprocessing/table_of_contents_authorities)
* [Resolving Distorted Font of TOC (Table of Contents) Title When Converting DOCX to PDF]({%slug resolve-toc-title-font-docx-to-pdf%})

