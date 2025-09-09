---
title: Search
page_title: Search
description: This article shows how one can use the search feature to find text in a PDF Document.
slug: radwordsprocessing-features-search
tags: pdf,search
published: True
position: 0
---

# Search

This feature allows you to search for a specific text in a PDF document. You can use plain text or a regex for the search criteria. There are various methods that allow you to find all occurrences at once or one by one.

## The TextSearch class

This class exposes methods for searching. You need to pass an instance of [RadFixedDocument]({%slug radpdfprocessing-model-radfixeddocument%}) when creating a new instance. This is the document that will be searched. 


#### __[C#] Example 1:  Create TextSearch Instance__

<snippet id='snippet-74'/>

### Search Methods

The **TextSeach** class exposes the following methods which allow you to search the document:

* **Find(string text, TextSearchOptions options):** Finds the first occurrence of the specified string starting from the beginning of the document. Optionally you can specify a start position or a specific range.
* **FindPrevious(string text, TextSearchOptions options):** Finds the previous occurrence of the specified text. Optionally you can specify a start position or a specific range.
* **FindAll(string text, TextSearchOptions options):** Finds all occurrences of the specified text. Optionally you can specify a start position or a specific range.

### SearchResult class

All of the above methods return one or more instances of the **SearchResult** class. This class exposes the following public members that provide information about the results.

* **TextRange:** An object describing the start and end positions of the match. This object exposed the following properties.
    * **StartPosition:** An object that contains the start index and location of the current match. 
    * **EndPosition** An object that contains the end index and location of the current match. 
* **Result:** A string value representing the match.
* **GetWordBoundingRect():** Gets the rectangle of the current match.
* **GetResultPage():** Gets the page where the current result is.

#### __[C#] Example 2:  Searching in a document__

<snippet id='snippet-75'/>

### TextSearchOptions

The **TextSearchOptions** class exposes the following properties which allow you to set the search parameters. 

* **UseRegularExpression:**  Gets or sets a value indicating whether a regular expression should be used for searching.
* **CaseSensitive:** Gets or sets a value indicating whether the search should be case sensitive.
* **WholeWordsOnly:** Gets or sets a value indicating whether only whole words should be matched.



