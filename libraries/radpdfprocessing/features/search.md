---
title: Search
page_title: Search
description: Learn how to use the TextSearch class in RadPdfProcessing to find text in PDF documents with plain text or regular expression patterns.
slug: radwordsprocessing-features-search
tags: search, pdf, text, radpdfprocessing, find, pattern, document, results
published: True
position: 0
---

# Search

The search feature allows you to find specific text in a PDF document. You can use plain text or a regular expression for the search criteria. Various methods allow you to find all occurrences at once or one by one.

## The TextSearch Class

The `TextSearch` class exposes methods for searching. Pass an instance of [RadFixedDocument]({%slug radpdfprocessing-model-radfixeddocument%}) when you create a new instance. This is the document that the search targets.

**Create a TextSearch Instance**

<snippet id='search-find-all'/>

### Search Methods

The `TextSearch` class exposes the following methods for searching the document:

| Method | Description |
|---|---|
| `Find(string text, TextSearchOptions options)` | Finds the first occurrence of the specified string starting from the beginning of the document. Optionally accepts a start position or a specific range. |
| `FindPrevious(string text, TextSearchOptions options)` | Finds the previous occurrence of the specified text. Optionally accepts a start position or a specific range. |
| `FindAll(string text, TextSearchOptions options)` | Finds all occurrences of the specified text. Optionally accepts a start position or a specific range. |

### SearchResult Class

All of the listed methods return one or more instances of the `SearchResult` class. This class exposes the following public members that provide information about the results:

| Member | Description |
|---|---|
| `TextRange` | An object describing the start and end positions of the match. Exposes `StartPosition` (start index and location) and `EndPosition` (end index and location). |
| `Result` | A string value representing the match. |
| `GetWordBoundingRect()` | Gets the rectangle of the current match. |
| `GetResultPage()` | Gets the page where the current result is. |

**Searching in a Document**

<snippet id='search-highlight-results'/>

### TextSearchOptions

The `TextSearchOptions` class exposes the following properties for setting the search parameters:

| Property | Description |
|---|---|
| `UseRegularExpression` | Gets or sets a value indicating whether a regular expression is used for searching. |
| `CaseSensitive` | Gets or sets a value indicating whether the search is case sensitive. |
| `WholeWordsOnly` | Gets or sets a value indicating whether only whole words are matched. |

## See Also

* [RadFixedDocument]({%slug radpdfprocessing-model-radfixeddocument%})
