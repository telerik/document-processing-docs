---
title: Named Destinations
page_title: Named Destinations
slug: radpdfprocessing-model-named-destinations
tags: named,destinations
published: True
position: 10
---

# Named Destinations

Named destinations are destinations in the document which can be referred to indirectly by means of a name object or a byte string.

## NamedDestination Class

The **NamedDestination** class is the one that represents the named destinations in PDF documents. It exposes the following properties:
      

* **Name**: Gets or sets the destination name. Changing this property also affects the name of the named destination inside the document collection.
          

* **Destination**: Property of type [Destination](https://docs.telerik.com/devtools/document-processing/api/Telerik.Windows.Documents.Fixed.Model.Navigation.Destination.html), which determines the actual destination the named destination points to. 
          
* **GoToAction**: Gets or sets the [GoToAction](https://docs.telerik.com/devtools/document-processing/api/Telerik.Windows.Documents.Fixed.Model.Actions.GoToAction.html) of the named destination.


## NamedDestinations Collection

The **NamedDestinations** collection is exposed by RadFixedDocument and is used to add, remove, modify and iterate the **NamedDestination** objects in a PDF document. This collection implements **IEnumerable** and you can obtain a **NamedDestination** using its name.

## Create  

**NamedDestination** objects can be created through the Add() method of the **NamedDestinations** collection exposed by RadFixedDocument.

#### __[C#] Example 1: Create NamedDestination with Destination of type Link__

{{region cs-radpdfprocessing-model-named-destinations_0}}

    this.pdfDocument.NamedDestinations.Add("myNamedDest", new Location() { Page = this.pdfDocument.Pages[0], Left = 50, Top = 150 });
{{endregion}}

## Remove

You can remove a named destination as you would do with any item in a collection.

#### __[C#] Example 2: Remove NamedDestination__

{{region cs-radpdfprocessing-model-named-destinations_1}}

     this.pdfDocument.NamedDestinations.Remove("myNamedDest");
{{endregion}}

## Rename 

In addition to the **Name** property of the **NamedDestination** class which provides you with a setter, you can use the **Rename()** method of the **RadFixedDocument.NamedDestinations** collection.

#### __[C#] Example 3: Remove NamedDestination__

{{region cs-radpdfprocessing-model-named-destinations_2}}

     this.pdfDocument.NamedDestinations.Rename("myNamedDest", "Chapter1");
{{endregion}}

## Check If a Name Exists

The **NamedDestinations** collection provides you with the ContainsName() method which is convenient to check whether the name you would like to use has been already applied to a NamedDestination or to check whether the NamedDestination you are searching for exists.

#### __[C#] Example 4: Check if a NamedDestination already exists__

{{region cs-radpdfprocessing-model-named-destinations_3}}

     this.pdfDocument.NamedDestinations.ContainsName("myNamedDest");
{{endregion}}

## See Also 

* [Annotations]({%slug radpdfprocessing-model-annotations-overview%})
* [RadFixedDocument]({%slug radpdfprocessing-model-radfixeddocument%})