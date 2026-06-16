---
title: Comments vs Notes in RadSpreadProcessing
description: Learn how to set comments and notes on cells in RadSpreadProcessing for Document Processing and understand the difference between Comments and Notes in Excel.
type: how-to
page_title: Comments vs Notes in RadSpreadProcessing
slug: comments-vs-notes-in-radspreadprocessing
tags: radspreadprocessing, excel, comments, notes, spreadsheet, cells, document, processing
res_type: kb
---

## Environment

| Version | Product | Author | 
| --- | --- | ---- | 
| 2024.1.124 | RadWordsProcessing |[Desislava Yordanova](https://www.telerik.com/blogs/author/desislava-yordanova)| 

## Description

When opening XLSX files in MS Excel, the comments may appear as threaded comments. This article explains the reason behind this behavior.

![Threaded Comments in MS Excel](images/comments-vs-notes-in-radspreadprocessing001.png)

## Solution

The [SpreadProcessing]({%slug radspreadprocessing-overview%}) library supports both [Comments]({%slug radspreadprocessing-features-comments%}) and [Notes]({%slug radspreadprocessing-features-notes%}) in Excel. The difference between them is as follows:

* **Comments**: These are the traditional comments that were available in earlier versions of Excel. They are anchored as small purple triangles in the corners of cells and can be viewed by hovering over the cell. Each comment can be replied to, forming a thread of information.

![Comments in MS Excel](images/comments-vs-notes-in-radspreadprocessing002.png)

* **Notes**: Notes are used for making annotations about the data.

![Notes in MS Excel](images/comments-vs-notes-in-radspreadprocessing003.png)

Microsoft rebranded their Comments to Notes, and added the ability to add comments to comments. This is now known as Threaded Comments or Comments. That is why some documents may have Comments and others have Notes. It depends on the MS Excel version on which the document was generated.

> For more information about the changes in the Excel functionality, refer to the [Comments and Notes Updates in Excel](https://support.microsoft.com/en-us/office/the-difference-between-threaded-comments-and-notes-75a51eec-4092-42ab-abf8-7669077b7be3) article.

The Telerik Document Processing libraries do not affect this changed behavior in MS Excel and how the documents are generated or displayed. The libraries provide both Comments and Notes functionalities. No matter what document is imported in the SpreadProcessing library, you can iterate both collections and extract whatever data is stored.

## See Also

* [Comments]({%slug radspreadprocessing-features-comments%})
* [Notes]({%slug radspreadprocessing-features-notes%})
