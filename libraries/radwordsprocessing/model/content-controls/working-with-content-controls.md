---
title: Working with Content Controls
page_title:  Working with Content Controls
description: This article show you you can access the content controls in code
slug: wordsprocessing-features-working-with-content-controls
tags: content controls, wordsprocessing
published: True
---

# Working with Content Controls Programmatically

This article shows some examples of how you can insert content controls, access existing and modify their properties from the code. In the RadWordsProcessing library, the content controls are marked with annotations and you can manipulate them as such. Additional information is available in the [Manipulating Annotations]({%slug wordsprocessing-model-document-elements-manipulating-annotations%}) topic as well.

## Manipulate Existing Content Controls

### Get the Content Controls 

The content controls can be retrieved by using the __EnumerateChildrenOfType__ method.

#### Example 1: Get all content controls

#### __C#__

{{region wordsprocessing-model-working-with-content-controls_0}}

    IEnumerable<SdtRangeStart> content_controls = document.EnumerateChildrenOfType<SdtRangeStart>();
    foreach (SdtRangeStart item in content_controls)
    {
        Console.WriteLine("Type: {0} ID:{1}", item.SdtProperties.Type, item.SdtProperties.ID);
    }

{{endregion}}

### Set Content Controls Properties

This example show how one can iterate the items and add an item to to a existing ComboBox content control. 

#### Example 2: Adding items to a ComboBox or a DropDownList

#### __C#__

{{region wordsprocessing-model-working-with-content-controls_1}}

    foreach (SdtRangeStart item in content_controls)
    {
        if (item.SdtProperties.Type == SdtType.ComboBox)
        {
            ComboBoxProperties properties = item.SdtProperties as ComboBoxProperties;

            ListItem newItem = new ListItem();
            newItem.DisplayText = "New Item Text";

            properties.Items.Add(newItem);
        }
    }
{{endregion}}

## Insert or Remove Content Controls

New content controls can be inserted trough the **InsertStructuredDocumentTag** method of [RadFlowDocumentEditor]({%slug radwordsprocessing-editing-radflowdocumenteditor%}).The method has several overloads that allow to insert the content control by passing its type, properties, and position in the document. 

#### Example 3: Inserting a content control using content control type

#### __C#__

{{region wordsprocessing-model-working-with-content-controls_2}}

    RadFlowDocumentEditor editor = new RadFlowDocumentEditor(document);
    var checkbox = editor.InsertStructuredDocumentTag(SdtType.CheckBox);
    ((CheckBoxProperties)checkbox.SdtProperties).Checked = true;
{{endregion}}

#### Example 4: Inserting a content control using content control properties

#### __C#__

{{region wordsprocessing-model-working-with-content-controls_3}}

    SdtProperties sdtProperties = new SdtProperties(SdtType.RichText)
    {
        Alias = "AliasName",
        Lock = Lock.SdtContentLocked,
    };
    this.radRichTextBox.InsertStructuredDocumentTag(sdtProperties);
    // OR
    RadDocumentEditor editor = new RadDocumentEditor(this.radRichTextBox.Document);
    editor.InsertStructuredDocumentTag(sdtProperties);
{{endregion}}

#### Example 5: Remove a content control

#### __C#__

{{region wordsprocessing-model-working-with-content-controls_4}}

    RadFlowDocumentEditor editor = new RadFlowDocumentEditor(document);
    editor.RemoveStructuredDocumentTag(contentControl); 

{{endregion}}

#### Example 6: Insert a content control to a specific position

>note When sung the bellow insert method and passing a start end elements, make sure that the elements are not already part of an content control. 

#### __C#__

{{region wordsprocessing-model-working-with-content-controls_5}}

    RadFlowDocument document = new RadFlowDocument();
    RadFlowDocumentEditor editor = new RadFlowDocumentEditor(document);

    var paragrpah1 = editor.InsertParagraph();
    editor.InsertText("Content Control");
    var paragraph2 = editor.InsertParagraph();

    SdtProperties sdtProperties = new SdtProperties(SdtType.RichText)
    {
        Alias = "AliasName",
        Lock = Lock.SdtContentLocked,
    };

    editor.InsertStructuredDocumentTag(sdtProperties, paragrpah1, paragraph2);

{{endregion}}

# See Also
* [Content Controls Overview]({%slug wordsprocessing-model-content-controls%})
* [Manipulating Annotations]({%slug wordsprocessing-model-document-elements-manipulating-annotations%})
* [Working with Content Controls UI]({%slug wordsprocessing-model-working-with-content-controls-ui%})
