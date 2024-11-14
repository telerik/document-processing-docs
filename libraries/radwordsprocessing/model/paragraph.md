---
title: Paragraph
page_title: Paragraph
slug: radwordsprocessing-model-paragraph
tags: paragraph
published: True
position: 3
---

# Paragraph



The __Paragraph__ class allows you to separate the content into paragraphs. It is responsible for displaying inline elements such as [Run]({%slug radwordsprocessing-model-run%}), [FloatingImage]({%slug radwordsprocessing-model-floatingimage%}), [ImageInline]({%slug radwordsprocessing-model-imageinline%}) etc. It is also possible to configure the appearance of the paragraph by modifying its parameters.
      

* [Inserting a Paragraph](#inserting-a-paragraph)

* [Modifying a Paragraph](#modifying-a-paragraph)

* [Operating with a Paragraph](#operating-with-a-paragraph)

## Inserting a Paragraph

Paragraphs can be added as a child of a [BlockContainer](https://docs.telerik.com/devtools/document-processing/api/Telerik.Windows.Documents.Flow.Model.BlockContainerBase.html) element – [Section]({%slug radwordsprocessing-model-section%}), [TableCell]({%slug radwordsprocessing-model-tablecell%}), [Headers and Footers]({%slug radwordsprocessing-model-headers-footers%}), through the __Blocks__ collection.
        

The code snippet from __Example 1__ creates and inserts a __Paragraph__ in a __Section__.
        

#### __C# Example 1: Insert paragraph in section__

{{region cs-radwordsprocessing-model-paragraph_0}}
	RadFlowDocument document = new RadFlowDocument();
	Section section = document.Sections.AddSection();

	Paragraph paragraph = new Paragraph(document);
	section.Blocks.Add(paragraph);
{{endregion}}



>tipThe parent BlockContainer element (in this case - the *section*) should belong to the same document that is passed to the constructor of the __Paragraph__.
          

You can add a paragraph at a specific index in the __Blocks__ collection of a __BlockContainer__ using the __Insert()__ method. In __Example 2__ is demonstrated how to add a paragraph at the beginning of a section.
        

#### __C# Example 2: Insert a paragraph at a specific position of the Blocks collection__

{{region cs-radwordsprocessing-model-paragraph_1}}
	Paragraph paragraph = new Paragraph(document);
	section.Blocks.Insert(0, paragraph);
{{endregion}}



You can also use the __AddParagraph()__ method of the __Blocks__ collection of a __BlockContainer__. The method creates a new __Paragraph__ instance, adds it to the container and returns it.
        

#### __C# Example 3: Create a new paragraph and add it to a section__

{{region cs-radwordsprocessing-model-paragraph_2}}
	Paragraph paragraph = section.Blocks.AddParagraph();
{{endregion}}



Inserting a new __Paragraph__ in the document can also be achieved with the [RadFlowDocumentEditor]({%slug radwordsprocessing-editing-radflowdocumenteditor%}) class.
        

#### __C#  Example 4: Insert a paragraph using the RadFlowDocumentEditor__

{{region cs-radwordsprocessing-model-paragraph_3}}
	RadFlowDocumentEditor editor = new RadFlowDocumentEditor(GetDocument());
	Paragraph paragraph = editor.InsertParagraph();
{{endregion}}



## Modifying a Paragraph

__Paragraph__ exposes several properties that allow you to customize the layout of the elements placed underneath it. Here is a list of them:


* __Properties__:  Gets all paragraph properties as ParagraphProperties object. More info on how to use section properties can be found in [Style Properties]({%slug radwordsprocessing-concepts-style-properties%}) article.
            

* __StyleId__:  Represents the ID of the style applied on the __Paragraph__ element.
            

* __Inlines__: Represents the inline elements in the paragraph. Exposes methods for adding a __Run__, an __ImageInline__ and a __FloatingImage__ elements.
            

* __FlowDirection__: Specifies the text flow direction. The default value is *LeftToRight*.
            

* __TextAlignment__: Represents the alignment of the text inside the __Paragraph__.
            

* __Spacing__: Defines the __Paragraph__ spacing.
            

* __KeepOnOnePage__: Indicates if the __Paragraph__ should be rendered on one page when the document is shown in page view mode.
            

* __KeepWithNextParagraph__: Indicates if the __Paragraph__ should be rendered at least partly on the same page with the following paragraph when this is possible and when the document is shown in page view mode.
            

* __OutlineLevel__: Defines the level of the __Paragraph__ in TOC field. The default value is Level9 – no level.
            

* __ApplyEastAsianLineBreakingRules__: Specifies whether East-Asian line breaking rules are applied to the __Paragraph__.
            

* __PageBreakBefore__: Specifies if the __Paragraph__ should be rendered on a new page when the document is shown in page view mode.
            

* __Borders__: Defines the borders of the __Paragraph__.
            

* __ContextualSpacing__: Defines whether spacing before/after are ignored when preceding/following paragraph has same paragraph style.
            

* __MirrorIndents__: Defines whether left and right indents should be swapped on odd pages.
            

* __Indentation__: Defines a set of indentations which can be applied to a __Paragraph__ element through a __ParagraphIndentation__ object. __ParagraphIndentation__ is a composite one and its properties are listed below. All the values of these properties are in device independent pixels (1/96 inch).
    
    * __FirstLineIndent__: Indicates the additional indentation which is applied to the first line of the paragraph.
    * __HangingIndent__: Specifies a value which is removed from the indentation of the first line of the paragraph, by moving the indentation on the first line back towards the beginning of the direction of text flow.    
    * __LeftIndent__: Indicates the indentation which is applied to the left side of the whole paragraph.    
    * __RightIndent__: Indicates the indentation which is applied to the right side of the whole paragraph.
    
    
* __Shading__: Represents the shading applied to the paragraph. It is a composite object and is read-only. You can obtain the following properties from it:
    * __BackgroundColor__: Specifies the background color for the shading.    
    * __PatternColor__: Specifies the pattern color for the shading.    
    * __Pattern__: Specifies the pattern which is used to lay the pattern color over the background color for the shading.

* __AllowOverflowPunctuation__: Defines whether the last punctuation character on a line can overflow in paragraph margin/indent.
            
* __ListId__: Specifies the list ID.

* __ListLevel__: Gets a value indicating that the paragraph is referencing list style. The default value is -1, which means that list style is not referenced.

* __TabStops__: Immutable collection, which holds the TabStops of the __Paragraph__. More information can be found in the [TabStop article]({%slug radwordsprocessing-concepts-tabstop%})


## Operating with a Paragraph

You can add inline elements to a __Paragraph__ instance.
        

### Adding a Run

In __Example 5__ is illustrated how to add a run to an existing paragraph.
            

#### __C# Example 5: Insert run in a paragraph__

{{region cs-radwordsprocessing-model-paragraph_4}}
	Run run = paragraph.Inlines.AddRun();
{{endregion}}



For more information about __Run__ element, you can read [this article]({%slug radwordsprocessing-model-run%}).
            

### Adding an ImageInline

__Example 6__ adds an inline image to an existing paragraph.
            

#### __C# Example 6: Insert image inline__

{{region cs-radwordsprocessing-model-paragraph_5}}
	ImageInline imageInline = paragraph.Inlines.AddImageInline();
{{endregion}}



For more information about __ImageInline__ element, you can read [this article]({%slug radwordsprocessing-model-imageinline%}).
            

### Adding a FloatingImage

The code snippet from __Example 7__  adds a floating image to an existing paragraph.
            

#### __C# Example 7: Add floating image__

{{region cs-radwordsprocessing-model-paragraph_6}}
	FloatingImage floatingImage = paragraph.Inlines.AddFloatingImage();
{{endregion}}


For more information about __FloatingImage__ element, you can read [this article]({%slug radwordsprocessing-model-floatingimage%}).


### Adding a TabStop

In __Example 8__ it is demonstrated how to add a tab stop to the paragraph's collection.

#### __C# Example 8: Insert TabStop__

{{region cs-radwordsprocessing-model-paragraph_7}}
	TabStop tabstop = new TabStop(Unit.InchToDip(2), TabStopType.Center, TabStopLeader.Hyphen);
	paragraph.TabStops = paragraph.TabStops.Insert(tabstop);
{{endregion}}

You can refer to the [TabStop article]({%slug radwordsprocessing-concepts-tabstop%}) for more details about this element.

### Setting Borders

__Example 9__ shows how to create Borders and set them to a Paragraph.

#### __C# Example 9: Setting Borders__

{{region cs-radwordsprocessing-model-paragraph_9}}
	Border blackBorder = new Border(1, BorderStyle.Single, new ThemableColor(Colors.Black));
	Border redBorder = new Border(2, BorderStyle.Single, new ThemableColor(Colors.Red));

	paragraph.Borders = paragraph.Borders.SetLeft(blackBorder).SetRight(redBorder).SetTop(blackBorder).SetBottom(redBorder);
{{endregion}}

## See Also

 * [Paragraph API Reference](https://docs.telerik.com/devtools/document-processing/api/Telerik.Windows.Documents.Flow.Model.Paragraph.html)
 * [Section]({%slug radwordsprocessing-model-section%})
 * [TableCell]({%slug radwordsprocessing-model-tablecell%})
 * [Headers and Footers]({%slug radwordsprocessing-model-headers-footers%})
 * [Run]({%slug radwordsprocessing-model-run%})
