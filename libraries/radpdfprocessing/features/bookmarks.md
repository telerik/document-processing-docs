---
title: Bookmarks (Outlines)
description: Learn how to create, modify, and navigate PDF bookmarks (document outlines) using RadPdfProcessing.
page_title: Bookmarks (Outlines)
slug: radpdfprocessing-features-bookmarks
tags: bookmarks, outlines, pdf, navigation, radpdfprocessing, document, hierarchy, links
position: 1
---

# Bookmarks (Outlines) 

Bookmarks, or outlines, are a tree-structured hierarchy that the reader presents as a visual table of contents separated from the actual content as a side panel. Bookmark items allow users to navigate through parts of the document and invoke different actions. RadPdfProcessing enables you to create bookmarks, modify existing ones, and save the changes into the PDF document.

## BookmarkItem Class

The `BookmarkItem` class represents a single bookmark inside the RadPdfProcessing model. Each bookmark can have the following characteristics described in the respective properties:

| Property | Description |
|---|---|
| `IsExpanded` | Determines whether the bookmark item is open or closed by default. An item is open when its children are visible upon opening the document in a viewer. |
| `Action` | Gets the action to perform when this bookmark item is activated. See the [Action]({%slug radpdfprocessing-model-annotations-links%}#action) help topic. |
| `Destination` | Gets the destination to display when this bookmark item is activated. See the [Destination]({%slug radpdfprocessing-model-annotations-links%}#destination) help topic. |
| `NamedDestination` | Gets the named destination to display when this bookmark item is activated. See the [Named Destinations]({%slug radpdfprocessing-model-named-destinations%}) topic. |
| `TextStyle` | Gets or sets the style characteristics for displaying the bookmark item text. Of type `BookmarkItemStyles` (a flags enum with values `Normal`, `Italic`, and/or `Bold`). |
| `TextColor` | Gets or sets the color of the bookmark item text in RGB color space. |
| `Title` | Gets or sets the text to display in the viewer navigation pane for this bookmark item. |
| `Children` | Gets the immediate child elements for this bookmark item. |


### Working with BookmarkItem

The `BookmarkItem` class exposes several constructor overloads that enable you to set the title of the bookmark and what action executes when users click it:

* `BookmarkItem(string title, Action action)`
* `BookmarkItem(string title, Destination destination)`
* `BookmarkItem(string title, NamedDestination namedDestination)`

<a name="example1"><a/>

<snippet id='libraries-pdf-features-bookmarks-create-bookmark'/>

## Bookmarks Collection

The `Bookmarks` property exposed through the `RadFixedDocument` class allows you to access all the bookmarks in a document so you can add, remove, or reorder them. This property is a collection of [BookmarkItem](#bookmarkitem-class) objects that represent each bookmark.

To insert a bookmark in a document, add it to the `Bookmarks` collection. The following example shows how to add the `BookmarkItem` created in the previous example:

<snippet id='libraries-pdf-features-bookmarks-add-bookmark-to-document'/>

To remove a bookmark, use the same collection. In the following example, the second bookmark inside the document is removed:

<snippet id='libraries-pdf-features-bookmarks-remove-bookmark-from-document'/>
 
If you need to iterate all bookmarks in a document, note that each `BookmarkItem` can contain other bookmarks in its `Children` collection. In such cases, you need to iterate the `Bookmarks` collection recursively.
 
<snippet id='libraries-pdf-features-bookmarks-iterate-bookmarks'/>


## See Also

* [Annotations]({%slug radpdfprocessing-model-annotations-overview%})
* [Named Destinations]({%slug radpdfprocessing-model-named-destinations%})
* [RadFixedDocument]({%slug radpdfprocessing-model-radfixeddocument%})
* [BookmarkItem API Reference](https://docs.telerik.com/devtools/document-processing/api/Telerik.Windows.Documents.Fixed.Model.Navigation.BookmarkItem.html)
