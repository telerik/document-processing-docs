---
title: Named Destinations
description: Learn how to create and use named destinations in RadPdfProcessing for indirect document navigation references by name.
page_title: Named Destinations
slug: radpdfprocessing-model-named-destinations
tags: nameddestinations, pdf, navigation, radpdfprocessing, links, destinations, bookmarks, references
published: True
position: 10
---

# Named Destinations

Named destinations are destinations in a document that you can refer to indirectly through a name object or a byte string.

## NamedDestination Class

The `NamedDestination` class represents named destinations in PDF documents. It exposes the following properties:

| Property | Description |
|---|---|
| `Name` | Gets or sets the destination name. Changing this property also affects the name of the named destination inside the document collection. |
| `Destination` | Of type [Destination](https://docs.telerik.com/devtools/document-processing/api/Telerik.Windows.Documents.Fixed.Model.Navigation.Destination.html), determines the actual destination this named destination points to. |
| `GoToAction` | Gets or sets the [GoToAction](https://docs.telerik.com/devtools/document-processing/api/Telerik.Windows.Documents.Fixed.Model.Actions.GoToAction.html) of the named destination. |


## NamedDestinations Collection

The `NamedDestinations` collection is exposed by `RadFixedDocument` and allows you to add, remove, modify, and iterate the `NamedDestination` objects in a PDF document. This collection implements `IEnumerable` and you can obtain a `NamedDestination` by its name.

## Create

You can create `NamedDestination` objects through the `Add()` method of the `NamedDestinations` collection exposed by `RadFixedDocument`.

#### **Example 1: Create NamedDestination with Destination of type Link**

<snippet id='libraries-pdf-model-named-destinations-create-named-destination'/>

## Remove

You can remove a named destination as you do with any item in a collection.

#### **Example 2: Remove NamedDestination**

<snippet id='libraries-pdf-model-named-destinations-remove-named-destination'/>

## Rename

In addition to the `Name` property of the `NamedDestination` class, which has a setter, you can use the `Rename()` method of the `RadFixedDocument.NamedDestinations` collection.

#### **Example 3: Rename NamedDestination**

<snippet id='libraries-pdf-model-named-destinations-rename-named-destination'/>

## Check If a Name Exists

The `NamedDestinations` collection provides the `ContainsName()` method. Use it to check whether a name is already applied to a `NamedDestination` or whether the `NamedDestination` you are searching for exists.

#### **Example 4: Check if a NamedDestination already exists**

<snippet id='libraries-pdf-model-named-destinations-exist-named-destination'/>

## See Also

* [Annotations]({%slug radpdfprocessing-model-annotations-overview%})
* [RadFixedDocument]({%slug radpdfprocessing-model-radfixeddocument%})