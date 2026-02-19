---
title: TA Field
page_title: TA Field
description: TA field is a field element that represents the and entry in a Table of Authorities table.
slug: radwordsprocessing-concepts-ta-field
tags: table of authorities,field
published: True
position: 0
---
# TA (Table of Authorities Entry) Field 

The TA (Table of Authorities Entry) field defines the text and page number for a table of authorities entry.

# Syntax

| Syntax   |
| :---     	 |
| { **TA** [Switches ] }|    

>In order to update the field, you need to set the [FlowExtensibilityManager.NumberingFieldsProvider]({%slug radpdfprocessing-formats-and-conversion-pdf-numbering-fields-provider%}).

# Switches 

Switches are a way for the code fragment to specify formatting for the result of the field. More information is available in the [Syntax and Switches](https://docs.telerik.com/devtools/document-processing/libraries/radwordsprocessing/concepts/fields/fields#syntax-and-switches) section of the _Fields_ article.

| Switch                 | Description                        |
| :---                   | :---                               |
|\\b  |Applies bold formatting to the page number for the entry. |
|\\c "Category" |Specifies the entry category. The number determines how citations are grouped in tables of authorities.|
|\\i |Makes the entry's page number italic.|
|\\l "Long"|Defines the long citation for the entry in the table of authorities.|
|\\r Bookmark|Inserts as the entry's page number the range of pages marked by the specified bookmark.|
|\\s "Short"|Defines the abbreviated form of the entry.| 

# Inserting

Inserting this field is easily achieved through the [RadFlowDocumentEditor]({%slug radwordsprocessing-editing-radflowdocumenteditor%})'s __InsertField()__ method. It accepts code as argument.

__Example 1__ demonstrates how you can insert a TA field.
        

#### __Example 1: Insert TA field__

```C#
    var document = new RadFlowDocument();
    var editor = new RadFlowDocumentEditor(document);

    editor.InsertField("TA \"Item\" \\b");
```

This type of field does not have a result but when updated the switches are applied to the text.

## See Also 

* [RadFlowDocumentEditor]({%slug radwordsprocessing-editing-radflowdocumenteditor%})
* [TOA field]({%slug radwordsprocessing-concepts-toa-field%}))