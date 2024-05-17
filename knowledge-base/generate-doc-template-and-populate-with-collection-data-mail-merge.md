---
title: Generating a Word Document Template with Data Using MailMerge in RadWordsProcessing
description: Learn how to create s Word document template with a collection of data using the Mail Merge functionality in RadWordsProcessing.
type: how-to
page_title: How to Generate a Word Document Template with Data Using MailMerge in RadWordsProcessing
slug: generate-doc-template-and-populate-with-collection-data-mail-merge
tags: word, documentprocessing, mailmerge, nestedmailmerge, docx, word, template
res_type: kb
category: knowledge-base
ticketid: 1651971
---

## Environment

| Version | Product | Author | 
| --- | --- | ---- | 
| 2024.2.426| RadWordsProcessing|[Desislava Yordanova](https://www.telerik.com/blogs/author/desislava-yordanova)| 

## Description

When working with Word documents, a common requirement is to generate a document template with a collection of data, such as a list of products, without rebuilding the application. This operation can be achieved using the Mail Merge functionality provided by RadWordsProcessing. 

## Solution

To populate an existing Word document with a collection of data using RadWordsProcessing, follow these steps:

1. **Prepare the Template**: Ensure that the Word document template contains the appropriate merge fields for the data that will be populated. For nested collections, use nested merge fields.

2. **Create a Data Source**: Prepare the data source that will be used to populate the template. This can include simple properties or nested collections.

3. **Perform the Mail Merge Operation**: Use the Mail Merge functionality of RadWordsProcessing to populate the template with data from your data source.

4. **Save and Open the Result Document**: Save the populated document to a file and, if needed, open it for review or further processing.

The following code snippet demonstrates these steps, including the setup for a nested Mail Merge operation:

```csharp
using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.IO;
using Telerik.Windows.Documents.Flow.FormatProviders.Docx;
using Telerik.Windows.Documents.Flow.Model;
using Telerik.Windows.Documents.Flow.Model.Editing;

public class Program
{
    static void Main(string[] args)
    {
        // Assuming 'template.docx' is your existing Word document template
        string templatePath = "template.docx";
        RadFlowDocument template = LoadTemplateDocument(templatePath);

        IEnumerable<Product> products = GetMemberProducts();
        RadFlowDocument mailMergeResult = template.MailMerge(products);
        
        string resultFileName = "merged.docx";
        SaveDocument(mailMergeResult, resultFileName);
        
        Process.Start(resultFileName);
    }

    private static RadFlowDocument LoadTemplateDocument(string filePath)
    {
        DocxFormatProvider provider = new DocxFormatProvider();
        using (FileStream inputStream = File.OpenRead(filePath))
        {
            return provider.Import(inputStream);
        }
    }

    private static void SaveDocument(RadFlowDocument document, string filePath)
    {
        DocxFormatProvider provider = new DocxFormatProvider();
        using (FileStream outputStream = File.OpenWrite(filePath))
        {
            provider.Export(document, outputStream);
        }
    }

    private static IEnumerable<Product> GetMemberProducts()
    {
        // Populate this method with your data source
        return new List<Product>();
    }

    public class Product
    {
        public string Name { get; set; }
        public List<Item> Items { get; set; }
    }

    public class Item
    {
        public string ProductName { get; set; }
        public decimal Price { get; set; }
        public int Qty { get; set; }
        public decimal Amount { get; set; }
    }
}
```

Ensure your existing Word document template (`template.docx`) contains the correct MergeFields, such as `MERGEFIELD Name`, `MERGEFIELD TableStart:Items`, `MERGEFIELD ProductName`, and so on, to match the properties of the `Product` and `Item` classes.

For more information on Mail Merge and Nested Mail Merge, refer to the official documentation:
- [Mail Merge](https://docs.telerik.com/devtools/document-processing/libraries/radwordsprocessing/editing/mail-merge#mail-merge)
- [Nested Mail Merge](https://docs.telerik.com/devtools/document-processing/libraries/radwordsprocessing/editing/mail-merge#nested-mail-merge)

## See Also

- [Populate a Table with Data using Nested Mail Merge Functionality](https://docs.telerik.com/devtools/document-processing/knowledge-base/populate-table-data-mail-merge)
- [Official Documentation: RadWordsProcessing](https://docs.telerik.com/devtools/document-processing/libraries/radwordsprocessing/overview)


