---
title: Hyperlink
description: Learn how to add and manage hyperlinks to web pages, workbook locations, and email addresses in RadSpreadProcessing.
page_title: Hyperlink
slug: radspreadprocessing-features-hyperlink
tags: hyperlink, spreadsheet, radspreadprocessing, links, url, cells, navigation, email, spread, xlsx
published: True
position: 8
---

# Hyperlink



Hyperlinks enable quick access to web pages, places in the workbook, or email addresses. The following sections demonstrate how to use the feature through the API exposed by the document model.
      

* [HyperlinkCollection](#hyperlinkcollection)

* [Add Hyperlink](#add-hyperlink)

* [Search for Hyperlink](#search-for-hyperlink)

* [Remove Hyperlink](#remove-hyperlink)

## HyperlinkCollection

Each worksheet object maintains a collection of the hyperlinks it contains. This collection can be reached through the `Hyperlinks` property of the `Worksheet` class. This property is of type `HyperlinkCollection` and simplifies the process of searching, adding, and removing hyperlinks.
        

The `SpreadsheetHyperlink` class is the representation of hyperlink in the document model. The class exposes the following properties:
        

* `Range`: Property of type `CellRange` that indicates the range of cells that holds the hyperlink info.
            

* `HyperlinkInfo`: Property of type `HyperlinkInfo` that indicates the type of the hyperlink and contains information about the target of the hyperlink. There are three supported types of hyperlinks:
            

	* `Url`: The Url hyperlink refers to a page on the internet.
	                
	
	* `MailTo`: The MailTo hyperlink contains an email address and, optionally, a subject.
	                
	
	* `InDocument`: The InDocument hyperlink holds a reference to a cell range in string format, for example A1:B3.
                

Depending on the type of the hyperlink, the `HyperlinkInfo` object may contain additional information about the target. The class exposes the string properties `Address`, `EmailSubject`, `ScreenTip`, and `SubAddress` and each hyperlink type requires a set of these properties to be filled. Some of them are mutually exclusive. For example, if you have a Url hyperlink, you do not need to specify the `EmailSubject`.
        

You can create instances of each of those types using the static methods of the `HyperlinkInfo` class.
        

**Example 1** creates a hyperlink to a web address.
        

**Example 1: Create a hyperlink to a web address**

<snippet id='codeblock-ciz'/>



**Example 2** creates a hyperlink to a cell range somewhere in the document.
        

**Example 2: Create a hyperlink to a location in the workbook**

<snippet id='codeblock-cja'/>


**Example 3** creates a hyperlink to a cell in another worksheet of the document.


**Example 3: Create a hyperlink to a cell in another worksheet**

<snippet id='codeblock-cjb'/>



**Example 4** shows how to create a hyperlink to an email address.
        

**Example 4: Create a hyperlink to an email address**

<snippet id='codeblock-cjc'/>



## Add Hyperlink

To add a hyperlink, you need to specify a cell range that contains the hyperlink and a hyperlink info that determines the type of the hyperlink.
        

**Example 5** assigns the hyperlink created in **Example 1** to A1.
        

**Example 5: Add a hyperlink to cell A1**

<snippet id='codeblock-cjd'/>



## Search for Hyperlink

There are several ways you can retrieve hyperlinks from the `HyperlinkCollection` depending on their position relative to a given cell range.
        

**Example 6** defines two indexes and then a cell range out of those indexes.
        

**Example 6: Define a cell range for hyperlink searches**

<snippet id='codeblock-cje'/>



 **Example 7** gets all hyperlinks the ranges of which are contained in the cell range from **Example 5**.
            

**Example 7: Get hyperlinks contained in a cell range**

<snippet id='codeblock-cjf'/>



>The `GetContainingHyperlinks()` method has an overload which accepts a collection of cell ranges.
              

 **Example 8** gets all hyperlinks the ranges of which intersect with the cell range from **Example 5**.
            

**Example 8: Get hyperlinks intersecting a cell range**

<snippet id='codeblock-cjg'/>



 **Example 9** gets the last added hyperlink that intersects with the cell range from **Example 5**.
            

**Example 9: Get the last hyperlink intersecting a cell range**

<snippet id='codeblock-cjh'/>



>The `TryGetHyperlink` method has an overload that accepts a `CellIndex` instead of `CellRange`.
              

 **Example 10** gets the hyperlink which range matches the cell range from **Example 5**.
            

**Example 10: Get a hyperlink exactly matching a cell range**

<snippet id='codeblock-cji'/>



## Remove Hyperlink

To remove a hyperlink you need to retrieve a `SpreadsheetHyperlink` object and then remove it from the hyperlinks collection.
        

**Example 11** removes a hyperlink.
        

**Example 11: Remove a hyperlink from the worksheet**

<snippet id='codeblock-cjj'/>


