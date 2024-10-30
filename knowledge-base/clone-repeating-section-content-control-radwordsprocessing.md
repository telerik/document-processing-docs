---
title: How to Clone and Populate Repeating Section Content Controls in RadWordsProcessing
description: Learn how to programmatically clone and populate repeating section content controls in RadWordsProcessing documents.
type: how-to
page_title: How to Clone and Populate Repeating Section Content Controls in RadWordsProcessing
slug: clone-repeating-section-content-control-radwordsprocessing
tags: wordsprocessing, document, processing, content, controls, clone, repeating, section
res_type: kb
ticketid: 1668130
---

## Environment

| Version | Product | Author | 
| --- | --- | ---- | 
| 2024.3.806| RadWordsProcessing |[Desislava Yordanova](https://www.telerik.com/blogs/author/desislava-yordanova)| 

## Description

When working with MS Word documents that contain [Content Controls]({%slug wordsprocessing-model-content-controls%}), it's straightforward to map model properties to the appropriate content control. However, cloning a [RepeatingSection][Content Controls]({%slug wordsprocessing-model-content-controls%}#repeatingsection) with content controls inside presents a challenge as there seems to be no direct method to clone a repeating section content control along with its contents. 

This KB article shows a sample approach how to duplicate the content controls inside a [RepeatingSection][Content Controls]({%slug wordsprocessing-model-content-controls%}#repeatingsection) in a Word document and populate them with data considering the mapped object. 

## Solution

Let's have an Employee object defined below. We need to use the RepeatingSection to list all of the telephones associated with the respective Employee.

```csharp
    public class Employee
    {
        public int EmployeeId { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public DateTime Dob { get; set; }
        public int WorkLocationId { get; set; }
        public WorkLocation WorkLocation { get; set; }
        public List<Telephone> Phones { get; set; } = new List<Telephone>();
    }

    public class Telephone
    {
        public int Id { get; set; }
        public string Carrier { get; set; }
        public string PhoneNumber { get; set; }
        public int PhoneTypeId { get; set; }
        public TelephoneType PhoneType { get; set; }
    }

    public class TelephoneType
    {
        public int Id { get; set; }
        public string Name { get; set; }

        public override string ToString()
        {
            return this.Name;
        }
    }
```
This original document template looks like this:



To simulate the MS Word behavior of duplicating a repeating section with all the content controls within the section, you can follow the custom approach detailed below. This solution involves generating table rows based on the number of instances in a collection, such as a list of telephone numbers associated with an employee. Note that this solution is custom and may require adjustments to fit specific requirements.

1. **Enumerate Content Controls and Identify Repeating Sections**: Iterate through all content controls in the document and identify those that are type `SdtType.RepeatingSection`.

2. **Clone Repeating Sections Programmatically**: For each identified repeating section, dynamically create and populate new table rows based on the data in the collection associated with the repeating section.

3. **Remove Original Repeating Section Content Controls**: After cloning and populating the new sections, remove the original repeating section content controls from the document to avoid duplication.

The following code snippet demonstrates how to populate a template with dynamic data by cloning repeating section content controls:

```csharp
private static void PopulateTemplate(RadFlowDocument document, Employee employee)
{
    var contentControls = document.EnumerateChildrenOfType<SdtRangeStart>().ToList();
    foreach (var contentControl in contentControls)
    {
        if (string.IsNullOrEmpty(contentControl.SdtProperties.Tag))
            continue;

        if (contentControl.SdtProperties.Type == SdtType.RepeatingSection)
        {
            var value = GetValueFromEmployee(employee, contentControl.SdtProperties.Tag);
            List<Telephone> telephones = value as List<Telephone>;
            if (telephones == null)
            {
                continue;
            }
            TableRow startRow = contentControl.Paragraph.Parent.Parent as TableRow;
            TableRow endRow = contentControl.End.Paragraph.Parent.Parent as TableRow;
            Table repeatingTable = startRow.Table;
            int startIndex = repeatingTable.Rows.IndexOf(startRow);
            int endIndex = repeatingTable.Rows.IndexOf(endRow);
            foreach (Telephone tel in telephones)
            {
                for (int k = startIndex; k < endIndex + 1; k++)
                {
                    TableRow newRow = repeatingTable.Rows.AddTableRow();
                    TableCell cell = newRow.Cells.AddTableCell();
                    cell.PreferredWidth = repeatingTable.Rows[k].Cells[0].PreferredWidth;
                    Paragraph p = repeatingTable.Rows[k].Cells[0].Blocks[0] as Paragraph;
                    string telPropName = (p.Inlines.Last() as Run).Text;
                    cell.Blocks.AddParagraph().Inlines.AddRun(telPropName);
                    cell = newRow.Cells.AddTableCell();
                    cell.PreferredWidth = repeatingTable.Rows[k].Cells[1].PreferredWidth;
                    var telValue = GetValueFromEmployee(tel, telPropName.Replace(" ", string.Empty));
                    cell.Blocks.AddParagraph().Inlines.AddRun(telValue?.ToString() ?? string.Empty);
                }
            }
            for (int z = startIndex; z < endIndex + 1; z++)
            {
                repeatingTable.Rows.RemoveAt(0);
            }
            RadFlowDocumentEditor editor = new RadFlowDocumentEditor(document);
            editor.RemoveStructuredDocumentTag(contentControl, false);
        }
        else
        {
            var value = GetValueFromEmployee(employee, contentControl.SdtProperties.Tag);
            SetContentControlValue(contentControl, value?.ToString() ?? string.Empty);
        }
    }
}
```
The produced result is illustrated below:


## See Also

- [Content Controls]({%slug wordsprocessing-model-content-controls%})
- [Populate a Table with Data using Nested Mail Merge Functionality](https://docs.telerik.com/devtools/document-processing/knowledge-base/populate-table-data-mail-merge)
- [Generating a Word Document with Data Using MailMerge in RadWordsProcessing](https://docs.telerik.com/devtools/document-processing/knowledge-base/generate-doc-template-and-populate-with-collection-data-mail-merge)
- [Mail Merge Functionality in RadWordsProcessing](https://docs.telerik.com/devtools/document-processing/libraries/radwordsprocessing/editing/mail-merge)
