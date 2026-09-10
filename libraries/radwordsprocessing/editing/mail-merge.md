---
title: Mail Merge
description: Learn how to use mail merge in RadWordsProcessing to create personalized documents from a template, merge fields, and a data source.
page_title: Mail Merge
slug: radwordsprocessing-editing-mail-merge
tags: mail, merge, word, flow, docx, document, template, fields, data, source, personalization, editing
published: True
position: 4
---

# Mail Merge

Mail merge produces personalized documents from a template that contains fixed content and placeholders. The placeholders are [merge fields]({%slug radwordsprocessing-concepts-merge-field%}). During the merge process, `RadWordsProcessing` replaces each placeholder with content from a data source.

## Inserting Merge Fields

Merge fields are [field elements]({%slug radwordsprocessing-concepts-fields%}) that you can add to a template document through the `InsertField()` method of [`RadFlowDocumentEditor`]({%slug radwordsprocessing-editing-radflowdocumenteditor%}). The method requires the field code and the result that is shown in the template before you run mail merge.

The code snippet in **Example 1** shows how to initialize a `RadFlowDocumentEditor` instance and insert a merge field.

**Example 1: Create a RadFlowDocumentEditor and insert a MERGEFIELD for FirstName**

<snippet id='codeblock-bu'/>

You can also add a field to a `Paragraph` manually. Create a `FieldInfo` instance, then place its start, code, separator, result, and end in the block. **Example 2** shows this approach.

**Example 2: Manually construct a MERGEFIELD for LastName with FieldInfo**

<snippet id='codeblock-bv'/>

## Performing Mail Merge

To perform mail merge, call the `MailMerge()` method of [`RadFlowDocument`]({%slug radwordsprocessing-model-radflowdocument%}). The method accepts an `IEnumerable` collection of data records.

During the operation, each `MergeField` is replaced with the corresponding value from the current data record in a new `RadFlowDocument` instance. If the data source contains multiple records, the method appends each result to the returned document. The original template remains unchanged.

**Example 3** shows a sample data source.

**Example 3: Define a sample mail-merge data source with FirstName and LastName values**

<snippet id='codeblock-bw'/>

**Example 4** performs the mail merge operation over a previously defined template document using the data source from **Example 3**.

**Example 4: Run MailMerge over the template document with the sample data source**

<snippet id='codeblock-bx'/>

## Nested Mail Merge

The nested mail merge feature is available starting with R1 2022. Use it when your data source contains nested data. For example, a business object can contain a collection of child objects, and nested mail merge lets you access their properties. To reference the child objects, declare one of these group tag pairs:

* `BeginGroup`/`EndGroup`
* `TableStart`/`TableEnd`
* `RangeStart`/`RangeEnd`
* `GroupStart`/`GroupEnd`

All tag pairs work the same way. Multiple options exist to improve document readability.

>important When a table row has only one cell, using `TableStart`/`TableEnd` around the whole cell content creates a new row for each value. The other tag pairs keep the values on the same row inside that cell.

>caption A single cell (spanning the whole row) with TableStart/TableEnd tags:

![Telerik RadWordsProcessing nested mail merge example showing TableStart and TableEnd tags in a single table cell that expand into separate output rows](images/RadWordsProcessing_MailMerge_SingleCellRow_01.png)

>caption A single cell (spanning the whole row) with a tag group different than TableStart/TableEnd:

![Telerik RadWordsProcessing nested mail merge example showing RangeStart and RangeEnd tags in a single table cell that expand into one row with multiple item values](images/RadWordsProcessing_MailMerge_SingleCellRow_02.png)

The following example shows how to use nested mail merge.

First, define a data source that contains an `IEnumerable` collection of objects.

**Example 5: Define a nested mail-merge data source with teams and player collections**

<snippet id='codeblock-by'/>

Then, add the fields by using one of the supported group tag pairs. In this example, the fields are added to the table with `TableStart`/`TableEnd`. This is not required, and you can use any supported tag pair.

**Example 6: Build a table-based nested mail-merge template and merge team and player data**

<snippet id='codeblock-bz'/>

### Single-Row and Multiline Mail Merge

With the nested mail merge feature, you can add all items to a single line. Add the group and regular fields to a single paragraph.

>caption Figure 1: Mail merge on a single row and the results

![Telerik RadWordsProcessing nested mail merge result showing RangeStart and RangeEnd tags on one paragraph that produce a single comma-separated row of item values](images/RadWordsProcessing_MailMerge_01.png)

To separate the items into several rows, close the group on the next row.

>caption Figure 2: Mail merge on multiple rows and the results

![Telerik RadWordsProcessing nested mail merge result showing group tags split across rows so each merged item appears on its own line](images/RadWordsProcessing_MailMerge_02.png)

## See Also

* [Working with Fields]({%slug radwordsprocessing-concepts-fields%})
* [Merge Field]({%slug radwordsprocessing-concepts-merge-field%})
* [RadFlowDocument]({%slug radwordsprocessing-model-radflowdocument%})
* [Hiding MailMerge Line in Output Word Document If Blank]({%slug hide-mailmerge-line-output-word-document-if-blank%})
* [Inserting Images using Mail Merge]({%slug inserting-images-using-mail-merge-radwordsprocessing%})
* [Populate a Table with Data using Nested Mail Merge Functionality]({%slug populate-table-data-mail-merge%})
* [Generating a Word Document Template with Data Using MailMerge in RadWordsProcessing]({%slug generate-doc-template-and-populate-with-collection-data-mail-merge%})
* [How to Remove a MERGEFIELD While Replacing the Placeholders with Values in RadWordsProcessing]({%slug remove-mergefields-retain-values-radwordsprocessing%})
* [Performing Nested MailMerge with Multiple Levels in RadWordsProcessing]({%slug nested-mailmerge-radwordsprocessing%})
* [Simulating Mail Merge with HTML content by Utilizing the Find and Replace Functionality]({%slug simulating-mail-merge-with-html-content%})
* [Mail Merge with HTML Formatted Strings in RadWordsProcessing]({%slug mail-merge-html-formatted-strings-radwordsprocessing%})
