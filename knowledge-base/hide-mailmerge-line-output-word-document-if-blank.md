---
title: Hiding MailMerge Line in Output Word Document If Blank
description: Learn how to hide the empty lines in the output Word document when the corresponding fields are blank during the MailMerge process using RadWordsProcessing.
type: how-to
page_title: Hide MailMerge Line in Output Word Document If Blank | RadWordsProcessing for Document Processing
slug: hide-mailmerge-line-output-word-document-if-blank
tags: how-to, word, mailmerge, hide, blank, RadWordsProcessing
res_type: kb
---

## Environment
| Version | Product | Author | 
| --- | --- | ---- | 
| 2024.1.124 | RadWordsProcessing |[Desislava Yordanova](https://www.telerik.com/blogs/author/desislava-yordanova)| 

## Description
This article demonstrates how to hide the empty lines in the output Word document when the fields are blank during the MailMerge process using RadWordsProcessing.

## Solution
To achieve this, you can follow these steps:

1. Instead of leaving the fields blank, insert some specific text that will serve as a placeholder. For example, you can use "{remove_Empty_field}" as the placeholder text.
2. Perform the MailMerge process as usual.
3. After the MailMerge process is complete, iterate through the document and remove the paragraphs that contain the placeholder text.

Here's a code snippet demonstrating this solution:

```csharp
using Telerik.Windows.Documents.Flow.FormatProviders.Docx;
using Telerik.Windows.Documents.Flow.Model;
using Telerik.Windows.Documents.Flow.Model.Editing;
using Telerik.Windows.Documents.Flow.TextSearch;
using System.Collections.Generic;
using System.IO;

internal class Program
{
    static void Main(string[] args)
    {
        string placeHolder = "{remove_Empty_field}";
        RadFlowDocument document = new RadFlowDocument();
        RadFlowDocumentEditor editor = new RadFlowDocumentEditor(document);
        
        // Insert your MailMerge fields here
        editor.InsertField("MERGEFIELD Agent", "");
        editor.InsertParagraph();
        editor.InsertField("MERGEFIELD Address2", "");
        editor.InsertParagraph();
        
        // Perform the MailMerge process
        // ...

        // Remove paragraphs with the placeholder text
        editor = new RadFlowDocumentEditor(mailMergeResult);

        foreach (FindResult find in editor.FindAll(placeHolder))
        {
            Paragraph paragraph = find.Runs[0].Paragraph;
            BlockContainerBase paragraphParent = paragraph.Parent as BlockContainerBase;
            if (paragraphParent != null)
            {
                paragraphParent.Blocks.Remove(paragraph);
            }
        }

        DocxFormatProvider provider = new DocxFormatProvider();

        string mergedFilePath = @"..\..\..\merged.docx";
        File.Delete(mergedFilePath);
        using (Stream output = File.OpenWrite(mergedFilePath))
        {
            provider.Export(mailMergeResult, output);
        }
    }
}
```

## See Also
- [Performing Mail Merge](https://docs.telerik.com/devtools/document-processing/libraries/radwordsprocessing/features/mail-merge)
- [WordsProcessing: Add Mail Merge events](https://feedback.telerik.com/document-processing/1509791-wordsprocessing-add-mail-merge-events)
