---
title: Mail Merge
page_title: Mail Merge
slug: radwordsprocessing-editing-mail-merge
tags: mail,merge
published: True
position: 4
---

# Mail Merge

[Mail merge](http://en.wikipedia.org/wiki/Mail_merge) is functionality allowing to produce personalized documents from a template holding fixed content and variables. The variables are called [Merge Fields]({%slug radwordsprocessing-concepts-merge-field%}) and are replaced through the merge process with content from a specified data source.
      

## Inserting Merge Fields

Merge fields are a type of [Fields]({%slug radwordsprocessing-concepts-fields%}) and can be added in a template document via [RadFlowDocumentEditor]({%slug radwordsprocessing-editing-radflowdocumenteditor%})'s __InsertField()__ method. The method requires the code representation of the field and the result which is shown in the template before the document is mail-merged.
        

The code snippet in __Example 1__ shows how to initialize a RadFlodDocumentEditor instance and insert a merge field.
        

#### __[C#] Example 1: Insert a merge field__

<snippet id='codeblock-bu'/>



Additionally, a field can be added to a Paragraph manually by creating a __FieldInfo__ instance and placing its start, code, separator, result and end in the block. __Example 2__ shows the manual approach for adding a merge field.
        

#### __[C#] Example 2: Add a merge field manually__

<snippet id='codeblock-bv'/>



## Performing Mail Merge

Mail merge can be performed over a template document containing merge fields. For this action the __MailMerge()__ method of [RadFlowDocument]({%slug radwordsprocessing-model-radflowdocument%}) needs to be used. The method accepts a collection of elements as a parameter.
        

During the operation, each MergeField is replaced with the corresponding information from the data source record in a new __RadFlowDocument__ instance. Every subsequent entry in the data source is appended to a single resulting document which is returned by the method. The original template stays unmodified.
        

Example 3 shows a simple example data source.
        

#### __[C#] Example 3: Sample data source__

<snippet id='codeblock-bw'/>



__Example 4__ performs the mail merge operation over a previously defined template document using the data source from __Example 3__.
        

#### __[C#] Example 4: Perform mail merge__

<snippet id='codeblock-bx'/>

## Nested Mail Merge

The nested mail merge functionality is supported from R1 2022. It allows you to merge data sources that contain nested data. For example, your business object can contain a list of other objects and this functionality allows accessing the properties of the underlying objects. In order to use the underlying objects, you need to  declare a group. Currently, the following group tags are supported: 

* BeginGroup/EndGroup 
* TableStart/TableEnd
* RangeStart/RangeEnd
* GroupStart/GroupEnd

Currently, all tag pairs work equally and more than one option exists in order to improve the readability of the documents.

>Exception: When a table row has only one cell, using the TableStart/TableEnd tags over the whole content of that cell will create a new row for each value. Every other pair of tags (BeginGroup/EndGroup, RangeStart/RangeEnd, GroupStart/GroupEnd) are interchangeable and will put the values on the same row inside that cell.

>caption A single cell (spanning the whole row) with TableStart/TableEnd tags:

![Rad Words Processing mail merge](images/RadWordsProcessing_MailMerge_SingleCellRow_01.png)

>caption A single cell (spanning the whole row) with a tag group different than TableStart/TableEnd:

![Rad Words Processing mail merge](images/RadWordsProcessing_MailMerge_SingleCellRow_02.png)

The following example demonstrates how you can use the nested mail merge: 

First you need to define a data source that contains an `IEnumerable` of objects.

#### __[C#] Example 5: Nested mail merge data source__

<snippet id='codeblock-by'/>

Now you need to add the fields using the specific supported names. In this example, we are adding the fields to the table and we will use the TableStart/TableEnd tags, but this is not mandatory and you can use a tag of your choosing.

#### __[C#] Example 6: Perform nested mail merge__

<snippet id='codeblock-bz'/>

### One Row vs Multiline Mail Merge

With the nested mail merge functionality, it is possible to add all items to a single line. This is achieved by adding the group and regular fields to a single paragraph.

>caption Figure 1: Mail Merging on a single row and the results

![Rad Words Processing mail merge](images/RadWordsProcessing_MailMerge_01.png)

If you want to separate the items into several rows you need to close the group on the next row

>caption Figure 2: Mail Merging on multiple rows row and the results

![Rad Words Processing mail merge](images/RadWordsProcessing_MailMerge_02.png)



## See Also

 * [Fields]({%slug radwordsprocessing-concepts-fields%})
 * [Merge Field]({%slug radwordsprocessing-concepts-merge-field%})
 * [RadFlowDocument]({%slug radwordsprocessing-model-radflowdocument%})
 * [Hiding MailMerge Line in Output Word Document If Blank]({%slug hide-mailmerge-line-output-word-document-if-blank%})
 * [Inserting Images using Mail Merge]({%slug inserting-images-using-mail-merge-radwordsprocessing%})
 * [Populate a Table with Data using Nested Mail Merge Functionality]({%slug populate-table-data-mail-merge%})
 * [Generating a Word Document Template with Data Using MailMerge in RadWordsProcessing]({%slug generate-doc-template-and-populate-with-collection-data-mail-merge%})
 * [How to Remove a MERGEFIELD While Replacing the Placeholders with Values in RadWordsProcessing]({%slug remove-mergefields-retain-values-radwordsprocessing%})
 * [Performing Nested MailMerge with Multiple Levels in RadWordsProcessing]({%slug nested-mailmerge-radwordsprocessing%}) 
 * [Simulating Mail Merge with HTML content by Utilizing the Find and Replace Functionality]({%slug simulating-mail-merge-with-html-content%})
