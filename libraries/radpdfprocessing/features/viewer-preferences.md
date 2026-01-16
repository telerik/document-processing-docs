---
title: Viewer Preferences
description: The ViewerPreferences class controls how PDF documents are displayed and behave in PDF viewers.
page_title: Viewer Preferences
slug: radpdfprocessing-features-viewer-preferences
tags: viewer, preferences, pdf, display, print, settings, behavior, processing
published: True
position: 7
---

# Viewer Preferences <sup>Q3 2025 (or newer)</sup>

The **ViewerPreferences** class designates a viewer preferences dictionary controlling the way the document is to be presented on the screen or in print. If no such dictionary is specified, viewing and printing applications should behave in accordance with their own current user preference settings.

## What Are Viewer Preferences

**ViewerPreferences** allows you to control various aspects of how a PDF document is displayed and behaves in PDF viewer applications. These preferences affect the user interface, window behavior, and printing options when the document is opened.

The ViewerPreferences class provides the following properties:

|Property|Type|Description width|Default Value|
|----|----|----|----|
|**ShouldHideToolbar**|bool|Specifies whether to hide the viewer application's tool bars when the document is active.|false|
|**ShouldHideMenubar**|bool|Specifies whether to hide the viewer application's menu bar when the document is active.|false|
|**ShouldHideWindowUI**|bool|Specifies whether to hide user interface elements in the document's window (such as scroll bars and navigation controls), leaving only the document's contents displayed.|false|
|**ShouldFitWindow**|bool|Specifies whether to resize the document's window to fit the size of the first displayed page.|false|
|**ShouldCenterWindow**|bool|Specifies whether to position the document's window in the center of the screen.|false|
|**ShouldDisplayDocumentTitle**|bool|Specifies whether the window's title bar should display the document title from the document information dictionary. If false, displays the PDF file name instead.|false|
|**NonFullScreenPageMode**|NonFullScreenPageModeType|The page mode specifying how to display the document on exiting full-screen mode. Only meaningful if PageMode is FullScreen.|UseNone|
|**PrintScaling**|PrintScalingType|The page scaling option to be selected when a print dialog is displayed.|AppDefault|
|**Duplex**|DuplexType?|The paper handling option to use when printing the file from the print dialog.|null|
|**NumberOfCopies**|NumberOfCopiesType|The number of copies to be printed when the print dialog is opened.|One|
|**Direction**|DirectionType|The predominant reading order for text. Affects relative positioning of pages when displayed side by side or printed n-up.|L2R|

>important If a document is created with the PDF/A-1a, PDF/A-2a, PDF/A-3a, or PDF/UA-1 standard, the **ShouldDisplayDocumentTitle** setting is automatically set to **true** to comply with the standard's [accessability]({%slug create-accessible-pdf-documents%}) requirements.

#### **Example: Setting viewer preferences**

You can access and modify viewer preferences through the **ViewerPreferences** property of the **RadFixedDocument** class.

<snippet id='libraries-pdf-features-pdf-viewerpreferences-setviewerpreferences'/>

>note Viewer preferences are suggestions to the PDF viewer application. Not all viewers may support all preferences, and some may ignore certain settings based on their own configuration or capabilities.

## See Also

* [RadFixedDocument]({%slug radpdfprocessing-model-radfixeddocument%})
* [RadFixedDocumentInfo]({%slug radpdfprocessing-model-radfixeddocumentinfo%})
* [Export to PDF]({%slug radpdfprocessing-formats-and-conversion-pdf-pdfformatprovider%})
