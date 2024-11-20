---
title: How to Remove a MERGEFIELD While Replacing the Placeholders with Values in RadWordsProcessing
description: Learn how to remove a MERGEFIELD from a document while replacing the placeholders with actual values, facilitating the MailMerge process in RadWordsProcessing.
type: how-to
page_title: How to Remove a MERGEFIELD WWhile Replacing the Placeholders with Values in RadWordsProcessing
slug: remove-mergefields-retain-values-radwordsprocessing
tags: wordsprocessing, document, processing, merge, field, mailmerge, remove 
res_type: kb
ticketid: 1667593
---

## Environment

| Version | Product | Author | 
| --- | --- | ---- | 
| 2024.3.806| RadWordsProcessing |[Desislava Yordanova](https://www.telerik.com/blogs/author/desislava-yordanova)| 

## Description
When preparing a document for the [MailMerge]({%slug radwordsprocessing-editing-mail-merge%}) operation in RadWordsProcessing, it might be necessary to remove a [MERGEFIELD]({%slug radwordsprocessing-concepts-merge-field%}) without losing its inserted value. This process ensures that the document is clean and ready for MailMerge without encountering issues related to leftover `MERGEFIELD` .

This KB article also answers the following questions:
- How can I delete `MERGEFIELD` fields but keep their content in the document?
- What is the correct approach to prepare a document for MailMerge in RadWordsProcessing?
- Is there a way to clean up `MERGEFIELD` from a document without affecting its content?

## Solution
To remove a `MERGEFIELD` while retaining their values, you can use the `RadFlowDocumentEditor`'s `DeleteContent` method. This approach involves deleting the field codes but leaving the field values as plain text in the document. Additionally, the [Find and Replace]({%slug radwordsprocessing-editing-find-and-replace%}) functionality provides a straightforward way to handle any leftover text from the fields.

Here is an example code snippet demonstrating how to accomplish this:

```csharp
using Telerik.Windows.Documents.Flow.Model.Editing;
using Telerik.Windows.Documents.Flow.Model;
using Telerik.Windows.Documents.Flow.Model.Fields;
using Telerik.Windows.Documents.Flow.FormatProviders.Docx;
using System.Diagnostics;

RadFlowDocument document = new RadFlowDocument();
RadFlowDocumentEditor editor = new RadFlowDocumentEditor(document);
FieldInfo firstNameField = editor.InsertField("MERGEFIELD First_Name", "«first name»");
FieldInfo lastNameField = editor.InsertField("MERGEFIELD Last_Name", "«last name»");

//Get field characters of merged fields
var fieldCharacters = document.EnumerateChildrenOfType<FieldCharacter>().Where(ch => ch.FieldInfo.Field is MergeField).ToList();

//Get field infos of merged fields
var fieldInfos = fieldCharacters.Select(fc => fc.FieldInfo).Distinct();

//Iterate and delete merge fields
foreach (var fieldInfo in fieldInfos)
{
    editor.DeleteContent(fieldInfo.Start, fieldInfo.Separator, true);
    editor.DeleteContent(fieldInfo.End, fieldInfo.End, true);
}

//Replace the text that is left
editor.ReplaceText("«first name»", "John ");
editor.ReplaceText("«last name»", "Smith ");


//Export document
DocxFormatProvider provider = new DocxFormatProvider();
string outputFilePath = "output.docx";
File.Delete(outputFilePath);
using (Stream output = File.OpenWrite(outputFilePath))
{
    provider.Export(document, output);
}

//Open document
Process.Start(new ProcessStartInfo() { FileName = outputFilePath, UseShellExecute = true });
```

This method ensures that the `MERGEFIELD ` is removed effectively, leaving only the value in the document.

|Before|After|
|----|----|
|![Merge Fields Before](images/mergeFields.gif)|![Merge Fields After](images/replacedMergeFields.png)|

## See Also

- [Find and Replace Text and Style in RadWordsProcessing]({%slug radwordsprocessing-editing-find-and-replace%})
- [RadFlowDocumentEditor Class Overview]({%slug radwordsprocessing-editing-radflowdocumenteditor%})
- [FieldCharacter Class in RadWordsProcessing]({%slug radwordsprocessing-model-fieldcharacter%})
