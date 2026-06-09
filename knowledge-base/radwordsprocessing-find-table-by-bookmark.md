---
title: Finding a Table Containing a Specific Bookmark in Word Documents
description: This article demonstrates how to identify and retrieve the table that contains a specific bookmark within a document using WordsProcessing.
type: how-to
page_title: How to Retrieve a Table by Bookmark in RadWordsProcessing
slug: radwordsprocessing-find-table-by-bookmark
tags: radwordsprocessing, docx, bookmark, table, document, processing, word, nested
res_type: kb
ticketid: 1657970
---

## Environment

| Version | Product | Author | 
| --- | --- | ---- | 
| 2024.2.426| RadWordsProcessing |[Yoan Karamanov](https://www.telerik.com/blogs/author/yoan-karamanov)| 

## Description

When working with documents, finding a table that contains a specific bookmark is a common requirement. This task can become complex with nested tables, as a bookmark can reside within multiple layers of tables. This article outlines methods to find either the innermost or outermost table that contains a given bookmark.

This article also answers the following questions:

* How can I find a table containing a specific bookmark in a document?
* What method can I use to retrieve the innermost table with a bookmark in RadWordsProcessing?
* How do I determine the outermost table that includes a specific bookmark in nested table scenarios?

## Solution

To find a table containing a specific bookmark in documents with nested tables, use the following custom methods: `GetInnermostTableContainingBookmark` and `GetOutermostTableContainingBookmark`. These methods identify either the innermost or outermost table that contains the bookmark, depending on the nesting level.

1. **Load the document and identify the bookmark:**
2. **Define methods to get the innermost and outermost tables containing the bookmark:**
- **GetInnermostTableContainingBookmark:**
- **GetOutermostTableContainingBookmark:**
3. **Retrieve the innermost and outermost tables containing the bookmark (as needed):**

```csharp
RadFlowDocument document;
DocxFormatProvider docxFormatProvider = new DocxFormatProvider();

using (Stream input = File.OpenRead("input.docx"))
{
    document = docxFormatProvider.Import(input);
}

Bookmark bookmark = document.EnumerateChildrenOfType<BookmarkRangeStart>().Select(b => b.Bookmark).ToList().First(bm => bm.Name == "BookmarkName");

Table innermostTable = GetInnermostTableContainingBookmark(bookmark);
Table outermostTable = GetOutermostTableContainingBookmark(bookmark);

private static Table GetInnermostTableContainingBookmark(Bookmark bookmark)
{
    TableCell tableCell = bookmark.BookmarkRangeStart.Paragraph.BlockContainer as TableCell;

    if (tableCell != null)
    {
        return tableCell.Table;
    }

    return null;
}

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

If the bookmark is in a single table, both methods yield the same result. These methods ensure accurate table retrieval regardless of the document table structure complexity.

## See Also

* [RadWordsProcessing Overview]({%slug radwordsprocessing-overview%})
* [Bookmark]({%slug radwordsprocessing-model-bookmark%})
