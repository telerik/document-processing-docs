---
title: Finding a Table Containing a Specific Bookmark in Word Documents
description: This article demonstrates how to identify and retrieve the table that contains a specific bookmark within a document using WordsProcessing.
type: how-to
page_title: How to Retrieve a Table by Bookmark in RadWordsProcessing
slug: radwordsprocessing-find-table-by-bookmark
tags: radwordsprocessing, document processing, bookmarks, table, nested tables
res_type: kb
ticketid: 1657970
---

## Environment

| Version | Product | Author | 
| --- | --- | ---- | 
| 2024.2.426| RadWordsProcessing |[Yoan Karamanov](https://www.telerik.com/blogs/author/yoan-karamanov)| 

## Description

When working with documents, it's common to need to find a table that contains a specific bookmark. This can become complex when dealing with nested tables, as a bookmark could be situated within multiple layers of tables. This KB article outlines methods to find either the innermost or outermost table containing a given bookmark, catering to scenarios involving nested tables.

This KB article also answers the following questions:
- How can I find a table containing a specific bookmark in a document?
- What method can I use to retrieve the innermost table with a bookmark in RadWordsProcessing?
- How do I determine the outermost table that includes a specific bookmark in nested table scenarios?

## Solution

To find a table containing a specific bookmark, especially in documents with nested tables, you can use the following two methods: `GetInnermostTableContainingBookmark` and `GetOutermostTableContainingBookmark`. These methods help in identifying either the innermost or outermost table that contains the bookmark, depending on the nesting level of tables in the document.

1. **Load the document and identify the bookmark:**

```csharp
RadFlowDocument document;
DocxFormatProvider docxFormatProvider = new DocxFormatProvider();

using (Stream input = File.OpenRead("input.docx"))
{
    document = docxFormatProvider.Import(input);
}

Bookmark bookmark = document.EnumerateChildrenOfType<BookmarkRangeStart>().Select(b => b.Bookmark).ToList().First(bm => bm.Name == "BookmarkName");
```

2. **Define methods to get the innermost and outermost tables containing the bookmark:**

- **GetInnermostTableContainingBookmark:**

```csharp
private static Table GetInnermostTableContainingBookmark(Bookmark bookmark)
{
    TableCell tableCell = bookmark.BookmarkRangeStart.Paragraph.BlockContainer as TableCell;

    if (tableCell != null)
    {
        return tableCell.Table;
    }

    return null;
}
```

- **GetOutermostTableContainingBookmark:**

```csharp
private static Table GetOutermostTableContainingBookmark(Bookmark bookmark)
{
    TableCell tableCell = bookmark.BookmarkRangeStart.Paragraph.BlockContainer as TableCell;

    if (tableCell != null)
    {
        Table table = tableCell.Table;
        return GetTableContainingAnotherTable(table);
    }

    return null;
}

private static Table GetTableContainingAnotherTable(Table table)
{
    TableCell cell = table.BlockContainer as TableCell;

    if (cell != null)
    {
        return GetTableContainingAnotherTable(cell.Table);
    }

    return table;
}
```

3. **Retrieve the innermost and outermost tables containing the bookmark (as needed):**

```csharp
Table innermostTable = GetInnermostTableContainingBookmark(bookmark);
Table outermostTable = GetOutermostTableContainingBookmark(bookmark);
```

If the bookmark is in a single table, both methods will yield the same result. These methods ensure you can accurately find the table containing a specific bookmark, regardless of the complexity of the document's table structure.

## See Also

- [RadWordsProcessing Documentation](https://docs.telerik.com/devtools/document-processing/libraries/radwordsprocessing/overview)
- [Bookmark]({%slug radwordsprocessing-model-bookmark%})
