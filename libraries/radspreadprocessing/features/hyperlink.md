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



__Hyperlinks__ enable quick access to web pages, places in the workbook or email addresses. This article demonstrates how to use the feature in terms of the API exposed by the document model.
      

* [HyperlinkCollection](#hyperlinkcollection)

* [Add Hyperlink](#add-hyperlink)

* [Search for Hyperlink](#search-for-hyperlink)

* [Remove Hyperlink](#remove-hyperlink)

## HyperlinkCollection

Each worksheet object maintains a collection of the hyperlinks it contains. This collection can be reached through the __Hyperlinks__ property of the Worksheet class. This property is of type __HyperlinkCollection__ and facilitates the process of searching, adding and removing hyperlinks.
        

The __SpreadsheetHyperlink__ class is the representation of hyperlink in the document model. The class exposes the following properties:
        

* __Range__: Property of type CellRange; indicates the range of cells that holds the hyperlink info.
            

* __HyperlinkInfo__: Property of type __HyperlinkInfo__; indicates the type of the hyperlink and contains information about the target of the hyperlink. There are three supported types of hyperlinks:
            

	* __Url__: The Url hyperlink refers to a page on the internet.
	                
	
	* __MailTo__: The MailTo hyperlink contains an e-mail address and, optionally, a subject.
	                
	
	* __InDocument__: The InDocument hyperlink holds a reference to a cell range in string format, e.g. A1:B3.
                

Depending on the type of the hyperlink, the __HyperlinkInfo__ object may contain additional information about the target. The class exposes the string properties Address, EmailSubject, ScreenTip and SubAddress and each hyperlink type requires a set of these properties to be filled. Note, however, that some of them are mutually exclusive. For example, if you have an Url hyperlink, you do not need to specify the EmailSubject.
        

You can create instances of each of those types, using the static methods of the __HyperlinkInfo__ class.
        

__Example 1__ creates a hyperlink to a web address.
        

#### __Example 1: Create link to web address__

<snippet id='codeblock-ciz'/>



__Example 2__ creates a hyperlink to a cell range somewhere in the document.
        

#### __Example 2: Create link to place in the document__

<snippet id='codeblock-cja'/>


__Example 3__ creates a hyperlink to a cell in another worksheet of the document.


#### __Example 3: Create link to a cell in another worksheet of the document__

<snippet id='codeblock-cjb'/>



__Example 4__ shows how you can create a hyperlink to an email address.
        

#### __Example 4: Create link to email address__

<snippet id='codeblock-cjc'/>



## Add Hyperlink

To add a hyperlink, you need to specify a cell range that will contain the hyperlink and a hyperlink info that will determine the type of the hyperlink.
        

__Example 5__ assigns the hyperlink created in __Example 1__ to A1.
        

#### __Example 5: Add hyperlink__

<snippet id='codeblock-cjd'/>



## Search for Hyperlink

There are several ways you can retrieve hyperlinks from the __HyperlinkCollection__ depending on their position relative to a given cell range.
        

__Example 6__ defines two indexes and then a cell range out of those indexes.
        

#### __Example 6: Define cell range__

<snippet id='codeblock-cje'/>



 __Example 7__ gets all hyperlinks the ranges of which are contained in the cell range from __Example 5__.
            

#### __Example 7: Get hyperlinks in cell range__

<snippet id='codeblock-cjf'/>



>The __GetContainingHyperlinks()__ method has an overload which accepts a collection of cell ranges.
              

 __Example 8__ gets all hyperlinks the ranges of which intersect with the cell range from __Example 5__.
            

#### __Example 8: Get hyperlinks intersecting with cell range__

<snippet id='codeblock-cjg'/>



 __Example 9__ gets the last added hyperlink that intersects with the cell range from __Example 5__.
            

#### __Example 9: Get last hyperlink intersecting with cell range__

<snippet id='codeblock-cjh'/>



>The __TryGetHyperlink__ method has an overload that accepts a __CellIndex__ instead of __CellRange__.
              

 __Example 10__ gets the hyperlink which range matches the cell range from __Example 5__.
            

#### __Example 10: Get hyperlink exactly matching cell range__

<snippet id='codeblock-cji'/>



## Remove Hyperlink

To remove a hyperlink you need to retrieve a __SpreadsheetHyperlink__ object and then remove it from the hyperlinks collection.
        

__Example 11__ removes a hyperlink.
        

#### __Example 11: Remove hyperlink__

<snippet id='codeblock-cjj'/>


