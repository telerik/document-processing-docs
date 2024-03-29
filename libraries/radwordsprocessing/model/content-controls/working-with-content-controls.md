---
title: Working with Content Controls
page_title:  Working with Content Controls
description: This article show how you can access the content controls in code.
slug: wordsprocessing-model-working-with-content-controls
tags: content controls, wordsprocessing
published: True
---

# Working with Content Controls 

This article shows some examples of how you can insert content controls, access existing and modify their properties from the code. 

## Manipulate Existing Content Controls

### Get the Content Controls 

The content controls can be retrieved by using the __EnumerateChildrenOfType()__ method of any document element. 

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

This example shows how one can iterate the items and add an item to an existing ComboBox content control. 

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

New content controls can be inserted through the **InsertStructuredDocumentTag** method of [RadFlowDocumentEditor]({%slug radwordsprocessing-editing-radflowdocumenteditor%}).The method has several overloads that allow you to insert the content control by passing its type, properties, and relative document elements. 

>note If adding content controls with the InsertStructuredDocumentTag(SdtType) method without specifying the content, the resulting document will only have the annotation range start and end of the control. The desired content should be manually added afterwards. 

#### Example 3: Inserting a content control using content control type

#### __C#__

{{region wordsprocessing-model-working-with-content-controls_2}}

    RadFlowDocument document = new RadFlowDocument();
    RadFlowDocumentEditor editor = new RadFlowDocumentEditor(document);
    var dateContentControl = editor.InsertStructuredDocumentTag(SdtType.Date);

    editor.MoveToInlineStart(dateContentControl.End);
    editor.InsertText(DateTime.Now.ToString()); // Insert content
  
{{endregion}}

#### Example 4: Inserting a Rich Text content control using content control properties

#### __C#__

{{region wordsprocessing-model-working-with-content-controls_3}}

    SdtProperties sdtProperties = new SdtProperties(SdtType.RichText)
    {
        Alias = "AliasName",
        Lock = Lock.SdtContentLocked,
    };

    RadFlowDocumentEditor editor = new RadFlowDocumentEditor(document);
    editor.InsertStructuredDocumentTag(sdtProperties);
    editor.MoveToInlineStart(control.End);
    Run span = editor.InsertText("Rich Text Content Control"); // Insert content inside the content control
    span.FontWeight = FontWeights.Bold; // Style the content
{{endregion}}

#### Example 5: Inserting a CheckBox content control using content control properties

#### __C#__

{{region wordsprocessing-model-working-with-content-controls_6}}

    RadFlowDocumentEditor editor = new RadFlowDocumentEditor(document);
    CheckBoxProperties checkBoxProperties = new CheckBoxProperties();
    SdtRangeStart sdt = editor.InsertStructuredDocumentTag(checkBoxProperties);
    editor.MoveToInlineEnd(sdt);
    char text = (char)checkBoxProperties.UncheckedState.CharacterCode;
    editor.InsertText(text.ToString());
    editor.MoveToInlineEnd(sdt.End);
{{endregion}}

#### Example 6: Remove a content control

#### __C#__

{{region wordsprocessing-model-working-with-content-controls_4}}

    RadFlowDocumentEditor editor = new RadFlowDocumentEditor(document);
    editor.RemoveStructuredDocumentTag(contentControl); //this will delete the entire content control along with the value
    // or 
    editor.RemoveStructuredDocumentTag(contentControl, false); //this will preserve the value 

{{endregion}}

#### Example 7: Insert a content control to a specific position

>note When using the InsertStructuredDocumentTag() method and passing start and end elements, make sure that the elements are not already part of a content control.  An exception to the rule are the rich text and repeating section content controls, which can fully contain other controls, with the restriction that they cannot intersect their ranges. 

>caption Figure 1: Examples of correct/incorrect adding of content controls

![working-with-content-controls001](images/working-with-content-controls001.png)		


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
