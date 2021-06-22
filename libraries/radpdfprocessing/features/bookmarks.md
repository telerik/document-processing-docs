---
title: Bookmarks (Outlines)
page_title: Bookmarks (Outlines)
slug: radpdfprocessing-features-bookmarks
tags: bookmarks, outlines
position: 0
---

# Bookmarks (Outlines) 

Bookmarks or Outlines are a tree-structured hierarchy that the reader presents as a visual table of contents separated from the actual content as a side panel. The Bookmark items allow users, by interacting with them, to navigate through parts of the document and/or invoke different actions. PdfProcessing enables you to create bookmarks, modify existing ones and save the changes into the PDF document.

## BookmarkItem Class

This is the class representing a single bookmark inside the model of PdfProcessing. Each bookmark can have the following characteristics described in the respective properties:

* **IsExpanded**: Determines whether the bookmark item is open or closed by default. An item is open when its children are visible upon opening the document in a viewer.

* **Action**: Gets the action to be performed when this bookmark item is activated. For more information on how to work with actions, check the [Action]({%slug radpdfprocessing-model-annotations-and-destinations%}#action) help topic.

* **Destination**: Gets the destination to be displayed when this bookmark item is activated. For more information on how to work with destinations, check the [Destination]({%slug radpdfprocessing-model-annotations-and-destinations%}#destination) help topic.

* **NamedDestination**: Gets the named destination to be displayed when this bookmark item is activated. Check the [Named Destinations]({%slug radpdfprocessing-model-named-destinations%}) topic for more details about these objects.

* **TextStyle**: Gets or sets the style characteristics for displaying the bookmark item's text. This property is of type **BookmarkItemStyles**. This type is a set of flags and can have the following values: **Normal**, **Italic** and/or **Bold**.

* **TextColor**: Gets or sets the color of the bookmark item's text in RGB color space.

* **Title**: Gets or sets the text to be displayed in the viewer's navigation pane for this bookmark item.

* **Children**: Gets the immediate child elements for this bookmark item.


### Working with BookmarkItem

The **BookmarkItem** class exposes several constructor overloads which enable you to set the title of the bookmark as well as what should be executed when the users click on it.

*  BookmarkItem(string title, Action action)
*  BookmarkItem(string title, Destination destination) 
*  BookmarkItem(string title, NamedDestination namedDestination)

<a name="example1"><a/>
#### **[C#] Example 1: Creating a bookmark and setting its properties**
{{region radpdfprocessing-features-bookmarks_0}}

    Location location = new Location();
    location.Page = document.Pages[0];
    location.Left = 10;
    location.Top = 10;
    BookmarkItem bookmark = new BookmarkItem("Title", location);
    bookmark.TextColor = new RgbColor(255, 0, 255);
    bookmark.TextStyle = BookmarkItemStyles.Bold | BookmarkItemStyles.Italic;
    bookmark.IsExpanded = true;
{{endregion}}


## Bookmarks Collection

The **Bookmarks** property exposed through the **RadFixedDocument** class allows you to access all the bookmarks in a document so you can add, remove or reorder them. This property is a collection of [**BookmarkItem**](#bookmarkitem-class) objects which represent each bookmark.

Inserting a bookmark in a document is achieved by adding it to the Bookmarks collection. **Example 2** shows adding the **BookmarkItem** created in [**Example 1**](#example-1)

#### **[C#] Example 2: Adding a bookmark to a document**
{{region radpdfprocessing-features-bookmarks_1}}
    
    document.Bookmarks.Add(bookmark);
{{endregion}}

Removing a bookmark is pretty similar to adding one. In **Example 3**, the second bookmark inside the document is removed.

#### **[C#] Example 3: Removing a bookmark from a document**
{{region radpdfprocessing-features-bookmarks_2}}
    
    BookmarkItem bookmark = document.Bookmarks[1];
    document.Bookmarks.RemoveAt(1);
{{endregion}}
 
In case you need to iterate all the bookmarks in a document, keep in mind that each BookmarkItem can contain other bookmarks in its Children collection. If you are encountering such a case, you will need to iterate the Bookmarks collection recursively.
 
#### **[C#] Example 4: Iterate through all bookmarks**
{{region radpdfprocessing-features-bookmarks_3}}
    
    private static void IterateBookmarks(RadFixedDocument document)
    {
        foreach (BookmarkItem bookmark in document.Bookmarks)
        {
            IterateBookmarksHierarchy(bookmark);
        }
    }

    private static void IterateBookmarksHierarchy(BookmarkItem bookmark)
    {
        foreach (BookmarkItem child in bookmark.Children)
        {
            IterateBookmarksHierarchy(child);
        }
    }
{{endregion}}


## See Also

* [Annotations and Destinations]({%slug radpdfprocessing-model-annotations-and-destinations%})
* [Named Destinations]({%slug radpdfprocessing-model-named-destinations%})
* [RadFixedDocument]({%slug radpdfprocessing-model-radfixeddocument%})
* [BookmarkItem API Reference](https://docs.telerik.com/devtools/document-processing/api/Telerik.Windows.Documents.Fixed.Model.Navigation.BookmarkItem.html)
