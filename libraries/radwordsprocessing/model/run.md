---
title: Run
page_title: Run
slug: radwordsprocessing-model-run
tags: run
published: True
position: 4
---

# Run

__Run__ element is an inline-level flow content element intended to contain a run of formatted text.
      
* [Inserting a Run](#inserting-a-run)

* [Modifying a Run](#modifying-a-run)

## Inserting a Run

The code in __Example 1__ creates a __Run__ element and adds it to a [Paragraph]({%slug radwordsprocessing-model-paragraph%}).      

#### __[C#] Example 1: Create and add a run to a paragraph__

<snippet id='codeblock-dn'/>

>tipThe parent __Paragraph__ should belong to the same document that is passed to the constructor of the __Run__.     

You can add a run at a specific index in the __Inlines__ collection of a paragraph using the __Insert()__ method. __Example 2__ demonstrates how to add a run at the beginning of a paragraph.     

#### __[C#] Example 2: Create and add a run at a specific index of a paragraph's Inlines collection__

<snippet id='codeblock-do'/>

You can also use the __AddRun()__ method of the __Inlines__ collection of a paragraph. The method creates a new __Run__ instance, adds it to the container and returns it:     

#### __[C#] Example 3: Create and add a run to a paragraph__

<snippet id='codeblock-dp'/>

Inserting text in the document can also be achieved with the [RadFlowDocumentEditor]({%slug radwordsprocessing-editing-radflowdocumenteditor%}) class:
        
#### __[C#] Example 4: Insert a run using RadFlowDocumentEditor__

<snippet id='codeblock-dq'/>

## Modifying a Run

The Run exposes several properties that allow you to customize how it is rendered and formatted. A part of these properties are Style properties and some of the values represent a themable object.

>tipStyle properties are properties that can be inherited from a style. For more information about styles see [this article]({%slug radwordsprocessing-concepts-style-properties%}).
          
>tipThemable objects are objects that can be inherited from a theme. For more information about themes check [this article]({%slug radwordsprocessing-concepts-document-themes%}).
            
* __Properties__: Retrieves all __CharacterProperties__ for this element. For more information about the CharacterProperties see [this article]({%slug radwordsprocessing-concepts-style-properties%}).
            
* __Text__: Specifies the text for the run.

* __FlowDirection__: Represents the flow direction of the run:
	
	* __LeftToRight__: Indicates that the text should flow from left to right.
	* __RightToLeft__: Indicates that the text should flow from right to left.            

* __StyleId__: Represents the ID of the style that is applied to this run.         

* __FontFamily__: Specifies the font family that is used to render the text. *This is a Style property. The value is themable object.*

* __FontSize__: The font size. The measurement unit used for font size is [Device Independent Pixels]({%slug device-independent-pixels%}) (DIPs). You can convert it to points or other units using the [Unit](https://docs.telerik.com/devtools/document-processing/api/Telerik.Windows.Documents.Media.Unit.html) class.

* __Shading__: Represents the shading applied to the run. It is a composite object and is read-only. You can obtain the following properties from it:

    * __BackgroundColor__: Specifies the background color for the shading. *This is a Style property. The value is themable object.*
    * __PatternColor__: Specifies the pattern color for the shading. *This is a Style property. The value is themable object.*
    * __Pattern__: Specifies the pattern which is used to lay the pattern color over the background color for the shading. *This is a Style property.*

* __FontStyle__: Specifies the font style. *This is a Style property.*

* __FontWeight__:  Specifies the font weight. *This is a Style property.*

* __ForegroundColor__:  Specifies the foreground color. *This is a Style property. The value is themable object.*

* __HighlightColor__: Specifies the highlight color. *This is a Style property.*

* __BaselineAlignment__: Specifies how the baseline is positioned on the vertical axis, relative to the established baseline for text. *This is a Style property.*

* __Strikethrough__: Specifies if the text is stroked trough. *This is a Style property.*

* __Underline__: Specifies the underline for the run. It is composite object and is read-only. You can obtain the following properties from it:

    * __Color__: Indicates the underline color. *This is a Style property.*
    * __Pattern__: Indicates the underline pattern. *This is a Style property.*
     

## See Also

 * [Run API Reference](https://docs.telerik.com/devtools/document-processing/api/Telerik.Windows.Documents.Flow.Model.Run.html)
 * [Paragraph]({%slug radwordsprocessing-model-paragraph%})
 * [Style Properties]({%slug radwordsprocessing-concepts-style-properties%})
 * [Document Themes]({%slug radwordsprocessing-concepts-document-themes%})
 * [How to Make Bold only a Part of the Text in a Paragraph with RadWordsProcessing]({%slug create-bold-text-run-wordsprocessing%})
