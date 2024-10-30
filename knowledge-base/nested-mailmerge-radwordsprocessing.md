---
title: Performing Nested MailMerge with Multiple Levels in RadWordsProcessing
description: Learn how to implement nested MailMerge operations with multiple levels of data, such as handling lists within lists, in RadWordsProcessing.
type: how-to
page_title: How to Handle Nested MailMerge with Multi-Level Data in RadWordsProcessing
slug: nested-mailmerge-radwordsprocessing
tags: radwordsprocessing, mailmerge, nested, data, list, document processing
res_type: kb
ticketid: 1668943
---

## Environment

| Version | Product | Author | 
| --- | --- | ---- | 
| 2024.3.806| RadWordsProcessing |[Desislava Yordanova](https://www.telerik.com/blogs/author/desislava-yordanova)| 

## Description

When attempting to perform a MailMerge operation with multiple levels of nested data, such as a list within a list (e.g., `Incident` > `Person` > `Phones`), an issue occurs where the nested collection enumerator exhausts prematurely. How can one resolve multi-layer nesting for MailMerge operations in RadWordsProcessing?

This KB article also answers the following questions:

- How to perform a nested MailMerge operation in RadWordsProcessing?
- How to use MailMerge with lists within lists in RadWordsProcessing?
- How to avoid premature exhaustion of the nested collection enumerator during MailMerge in RadWordsProcessing?

## Solution

To achieve a nested MailMerge operation with multiple levels of data, follow the steps below:

1. Prepare your data model to reflect the nested structure. In this case, the model includes `Incident`, `Person`, and `Phone` classes.

2. Use the `MailMerge` method to merge the data with the document template. Ensure your document template has the appropriate merge fields defined for each level of data.

3. Use special merge fields (`TableStart`, `TableEnd`, `RangeStart`, and `RangeEnd`) to denote the beginning and end of each nested collection.

Here is an example demonstrating how to set up your data model and perform the nested MailMerge:

```csharp
// Define your data models
public class Incident
{
    public string ReportNumber { get; set; }
    public List<Person> People { get; set; }
}

public class Person
{
    public string FirstName { get; set; }
    public string LastName { get; set; }
    public List<Phone> Phones { get; set; }
}

public class Phone
{
    public string PhoneNumber { get; set; }
}

// Preparing the data
var mergeData = new List<Incident>{
    new Incident{
        ReportNumber = "INC-2024-001",
        People = new List<Person>{
            new Person{
                FirstName = "John",
                LastName = "Doe",
                Phones = new List<Phone>{
                    new Phone{ PhoneNumber = "310-555-0101" },
                    new Phone{ PhoneNumber = "310-555-0102" }
                }
            },
            // Add more Person instances as needed
        }
    }
};

// Perform the MailMerge operation
RadFlowDocument document = new RadFlowDocument();
// Assume 'provider' is initialized and points to the appropriate document format provider
var mailMergeResult = document.MailMerge(mergeData);
```

In your document template, ensure you have the corresponding merge fields:

- For the start and end of the `People` list: `TableStart:People` and `TableEnd:People`.
- For the start and end of the `Phones` list within each `Person`: `RangeStart:Phones` and `RangeEnd:Phones`.
- For merging individual property values, use merge fields named after the properties, such as `FirstName`, `LastName`, and `PhoneNumber`.

### Generating the Necessary Table Structure in the Document

When dealing with nested collections, it's crucial to dynamically create table structures that can accommodate the varying lengths of these collections. Below is an example showing how to generate a table in the document for `People` and their `Phones`:

```csharp
private static void GenerateTable(RadFlowDocumentEditor editor)
{
    // Example code to generate a table structure for People and Phones
    // This code should be adapted to fit the structure of your document template
}
```

By following these steps and utilizing the provided code snippets, you can effectively perform nested MailMerge operations with multiple levels of data in RadWordsProcessing.

## See Also

- [Nested MailMerge Documentation](https://docs.telerik.com/devtools/document-processing/libraries/radwordsprocessing/editing/mail-merge#nested-mail-merge)
- [Generating a Word Document with Data Using MailMerge in RadWordsProcessing](https://docs.telerik.com/devtools/document-processing/knowledge-base/generate-doc-template-and-populate-with-collection-data-mail-merge)
- [RadFlowDocument Overview](https://docs.telerik.com/document-processing/libraries/radwordsprocessing/model/radflowdocument)
