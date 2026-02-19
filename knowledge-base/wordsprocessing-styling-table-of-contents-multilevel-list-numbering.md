---
title: Styling Table of Contents with Multilevel List Numbering in Telerik WordsProcessing
description: Learn how to create and style a table of contents (TOC) with hierarchical, multilevel list numbering in Telerik WordsProcessing.
type: how-to
page_title: Applying Multilevel List Numbering to Table of Contents in Telerik WordsProcessing
meta_title: Applying Multilevel List Numbering to Table of Contents in Telerik WordsProcessing
slug: wordsprocessing-styling-table-of-contents-multilevel-list-numbering
tags: words, processing, telerik, document, processing, table, contents, toc, hierarchical, numbering, styling, multilevel, list, word, docx
res_type: kb
ticketid: 1698635
---

## Environment
| Version | Product | Author | 
| --- | --- | ---- | 
| 2025.3.806 | RadWordsProcessing |[Yoan Karamanov](https://www.telerik.com/blogs/author/yoan-karamanov)| 

## Description

This article describes how to apply multilevel list numbering and other specific styles to each level of [Table Of Contents]({%slug radwordsprocessing-concepts-toc-field%}) (TOC) in a DOCX document, such as font size, indentations, and font weight.

This knowledge base article also answers the following questions:
- How to add multilevel list numbering to a TOC in Telerik WordsProcessing?
- How to customize TOC level styles programmatically?
- How to use ParagraphProperties and CharacterProperties to style a TOC?

## Solution

To achieve a multilevel list numbering in your [Table Of Contents]({%slug radwordsprocessing-concepts-toc-field%}) (TOC) and apply custom styles to each level, follow these steps:

1. Set the [NumberingFieldsProvider]({%slug radpdfprocessing-formats-and-conversion-pdf-numbering-fields-provider%}) for the hierarchical numbering functionality.
2. Load your document using the [DocxFormatProvider]({%slug radwordsprocessing-formats-and-conversion-docx-docxformatprovider%}).
3. Add a table of contents field using the [RadFlowDocumentEditor]({%slug radwordsprocessing-editing-radflowdocumenteditor%}).
4. Configure hierarchical numbering by adding a list of type [NumberedHierarchical]({%slug radwordsprocessing-concepts-lists%}).
5. Style each TOC level by specifying its properties using [ParagraphProperties]({%slug radwordsprocessing-concepts-style-properties%}#style-properties-in-styles) and [CharacterProperties]({%slug radwordsprocessing-concepts-style-properties%}#style-properties-in-styles).

### Implementation

```csharp
using System;
using System.IO;
using System.Diagnostics;
using Telerik.Windows.Documents.Flow.Model;
using Telerik.Windows.Documents.Flow.FormatProviders.Docx;
using Telerik.Windows.Documents.Flow.Extensibility;

FlowExtensibilityManager.NumberingFieldsProvider = new Telerik.Windows.Documents.Flow.FormatProviders.Pdf.NumberingFieldsProvider();

RadFlowDocument flowDocument;
DocxFormatProvider docxFormatProvider = new DocxFormatProvider();

// Load the document.
using (Stream input = File.OpenRead("input.docx"))
{
    flowDocument = docxFormatProvider.Import(input, null);
}

var editor = new RadFlowDocumentEditor(flowDocument);

// Insert table of contents field.
FieldInfo tocFieldInfo = editor.InsertField("TOC \f a");
tocFieldInfo.UpdateField();

// Create hierarchical numbering list for the TOC.
var tocList = flowDocument.Lists.Add(ListTemplateType.NumberedHierarchical);
tocList.MultilevelType = MultilevelType.Multilevel;

// Style TOC Level 1
var tocLevel1StyleId = BuiltInStyleNames.GetTocStyleIdByIndex(1);
flowDocument.StyleRepository.AddBuiltInStyle(tocLevel1StyleId);
var tocLevel1Style = flowDocument.StyleRepository.GetStyle(tocLevel1StyleId);
tocLevel1Style.CharacterProperties.FontSize.LocalValue = 13;
tocLevel1Style.ParagraphProperties.LeftIndent.LocalValue = 0;
tocLevel1Style.CharacterProperties.FontWeight.LocalValue = FontWeights.Bold;
tocLevel1Style.ParagraphProperties.HangingIndent.LocalValue = 35;
tocLevel1Style.ParagraphProperties.ListLevel.LocalValue = 0;
tocLevel1Style.ParagraphProperties.ListId.LocalValue = tocList.Id;

// Style TOC Level 2
var tocLevel2StyleId = BuiltInStyleNames.GetTocStyleIdByIndex(2);
flowDocument.StyleRepository.AddBuiltInStyle(tocLevel2StyleId);
var tocLevel2Style = flowDocument.StyleRepository.GetStyle(tocLevel2StyleId);
tocLevel2Style.ParagraphProperties.ListLevel.LocalValue = 1;
tocLevel2Style.ParagraphProperties.LeftIndent.LocalValue = 35;
tocLevel2Style.ParagraphProperties.HangingIndent.LocalValue = 35;
tocLevel2Style.CharacterProperties.FontSize.LocalValue = 13;
tocLevel2Style.ParagraphProperties.ListId.LocalValue = tocList.Id;

// Style TOC Level 3
var tocLevel3StyleId = BuiltInStyleNames.GetTocStyleIdByIndex(3);
flowDocument.StyleRepository.AddBuiltInStyle(tocLevel3StyleId);
var tocLevel3Style = flowDocument.StyleRepository.GetStyle(tocLevel3StyleId);
tocLevel3Style.ParagraphProperties.ListLevel.LocalValue = 2;
tocLevel3Style.ParagraphProperties.LeftIndent.LocalValue = 65;
tocLevel3Style.ParagraphProperties.HangingIndent.LocalValue = 35;
tocLevel3Style.CharacterProperties.FontSize.LocalValue = 13;
tocLevel3Style.ParagraphProperties.ListId.LocalValue = tocList.Id;

// Export the styled document
string docxOutputPath = "..\\..\\..\\output.docx";
File.Delete(docxOutputPath);
using (Stream output = File.OpenWrite(docxOutputPath))
{
    docxFormatProvider.Export(flowDocument, output, null);
}
```

## See Also

* [WordsProcessing Overview]({%slug radwordsprocessing-overview%})
* [Table of Contents Field]({%slug radwordsprocessing-concepts-toc-field%})
* [ParagraphProperties API Reference]({%slug radwordsprocessing-concepts-style-properties%}#style-properties-in-styles)
* [CharacterProperties API Reference]({%slug radwordsprocessing-concepts-style-properties%}#style-properties-in-styles) 
