---
title: Table of Authorities Field
page_title: Table of Authorities Field
description: TOA field is a Field element that creates and inserts a table of authorities.
slug: radwordsprocessing-concepts-toa-field
tags: table of authorities,field
published: True
position: 0
---

# TOA (Table of Authorities) Field

The TOA (Table of Authorities) field creates and inserts a table of authorities. The TOA field collects entries marked by TA (Table of Authorities Entry) fields.

# Switches 

Switches are a way for the code fragment to specify formatting for the result of the field. More information is available in the [Syntax and Switches](https://docs.telerik.com/devtools/document-processing/libraries/radwordsprocessing/concepts/fields/fields#syntax-and-switches) section of the _Fields_ article.

| Switch                 | Description                        |
| :---                   | :---                               |
|\\c "Category" |Specifies the category of entries to collect in a table of authorities. This switch is required |
|\\b Bookmark |Collects entries only from the portion of the document marked by the specified bookmark.|
|\\e "Separators"|Specifies the characters (up to five) that separate a table of authorities entry and its page number.|
|\\f|Removes the formatting of the entry text in the document from the entry in the table of authorities. |
|\\g "Separators"|Defines the abbreviated form of the entry.| 
|\\h|Includes the category heading for the entries in a table of authorities.|
|\\l|Specifies the characters (up to five) that separate multiple page references. |
|\\p|Replaces five or more different page references to the same authority with "passim".|
|\\s Identifier|Includes a number, such as a case number or section number, before the page number. The item must be numbered with a SEQ field, and Identifier must match the identifier in the SEQ field.|
|\\d "Separator"|Used with the \s switch, specifies the characters (up to five) that separate the sequence numbers and page numbers. |



# Inserting

Inserting this field is easily achieved through the [RadFlowDocumentEditor]({%slug radwordsprocessing-editing-radflowdocumenteditor%})'s __InsertField()__ method. It accepts code as argument.

__Example 1__ demonstrates how you can insert a TOA field.
        

#### __[C#] Example 1: Insert TOA field__

{{region cs-radwordsprocessing-concepts-toa-field_0}}

 


{{endregion}}
 

## See Also 

* [RadFlowDocumentEditor]({%slug radwordsprocessing-editing-radflowdocumenteditor%})