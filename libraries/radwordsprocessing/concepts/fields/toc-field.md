---
title: Table of Contents Field
page_title: Table of Contents Field
description: Table of Contents Field is a Field element that inserts a table of contents in the document.
slug: radwordsprocessing-concepts-toc-field
tags: table of contents,field
published: True
position: 0
---

# Table of Contents Field

The TOC (Table of Contents) field creates a table of contents. It is created from the heading or other styles used in the document. You can specify the items by using the TC field as well.  

>In order to update the **PageRef** fields within the TOC field you need to set the [FlowExtensibilityManager.NumberingFieldsProvider]({%slug radpdfprocessing-formats-and-conversion-pdf-numbering-fields-provider%})


# Syntax

| Syntax   |
| :---     	 |
| { **TOC** [Switches ] }|    


# Switches

### Switches that control whats included in the table of contents.

|Switch|Description|
|:---  |:---  |
|\\o "Levels"|Builds a table of contents from paragraphs formatted with styles that include outline levels (most commonly, heading styles). For example, { TOC \o "1-3" } lists only paragraphs formatted with styles that include outline levels 1 through 3|
|\\t "Style,Level,Style,Level,..."|Builds a table of contents from paragraphs formatted with styles other than the built-in styles. For example, { TOC \t "style1,1, style2,2" }|
|\\u|Builds a table of contents from paragraphs whose formatting includes outline levels applied directly, in paragraph settings.|
|\\c "SEQIdentifier"|Lists figures, tables, charts, or other items that are numbered by a SEQ (Sequence) field.|
|\\a Identifier|Lists items captioned with the Caption but omits caption labels and numbers. Currently you can insert caption by adding a SEQ field|
|\\f EntryIdentifier|Builds a table from TC fields. If EntryIdentifier is specified, the table is built only from TC fields with the same identifier (typically a letter)|
|\\l Levels|Builds a table of contents from TC fields that assign entries to one of the specified levels.|
|\\b BookmarkName|Collects entries only from the portion of the document marked by the specified bookmark.|
 

### Switches that format the page number

|Switch|Description|
|:--- |:--- |
|\\s Identifier|Includes a number such as a chapter number before the page number. The chapter or other item must be numbered with a SEQ field. Identifier must match the identifier in the SEQ field.|
|\\d "Separator"|When used with the \s switch, specifies the character that separates the sequence numbers and page numbers.|
|\\p "Separator"|Specifies the character that separates an entry and its page number.|
|\\n Levels|Omits page numbers from the table of contents. Page numbers are omitted from all levels unless a range of entry levels is specified.|
 

### Switches that format table entries

|Switch|Description|
|---|---|
|\\w|Preserves tab entries within table entries.|
|\\x|Preserves manual line breaks within table entries.|
|\\z|Hides tab leader and page numbers in Web layout view.|
|\\h Hyperlinks|Inserts TOC entries as hyperlinks.|

# Inserting

Inserting this field is easily achieved through the [RadFlowDocumentEditor]({%slug radwordsprocessing-editing-radflowdocumenteditor%})'s __InsertField()__ method. It accepts code as argument.

__Example 1__ demonstrates how you can insert a TOC field.
        

#### __[C#] Example 1: Insert TOC field__

<pre><code>
    var document = new RadFlowDocument();
    var editor = new RadFlowDocumentEditor(document);

    editor.InsertField("TOC \\f a ");
</code></pre>

This makes a list of all TC fields with the 'a' identifier.

## See Also 

* [RadFlowDocumentEditor]({%slug radwordsprocessing-editing-radflowdocumenteditor%})
* [TC field]({%slug radwordsprocessing-concepts-tc-field%}))
* [Generating a Table of Contents in a Merged Document Using RadWordsProcessing]({%slug generate-table-of-contents-radwordsprocessing%})
* [Updating TOC Page Numberings in Word Documents Before Exporting to DOCX Format]({%slug update-toc-radwordsprocessing-before-docx-export%}) 
* [Styling Table of Contents with Multilevel List Numbering in Telerik WordsProcessing]({%slug wordsprocessing-styling-table-of-contents-multilevel-list-numbering%})

