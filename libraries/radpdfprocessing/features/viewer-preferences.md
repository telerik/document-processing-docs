---
title: Viewer Preferences
description: Learn how to use the ViewerPreferences class in RadPdfProcessing to control how PDF documents are displayed, printed, and behave in PDF viewer applications.
page_title: Viewer Preferences
slug: radpdfprocessing-features-viewer-preferences
tags: viewer, preferences, pdf, display, print, radpdfprocessing, settings, behavior
published: True
position: 7
---

# Viewer Preferences

|Minimum Version|Q3 2025|
|----|----|

The `ViewerPreferences` class defines a viewer preferences dictionary that controls how a document appears on screen or in print. If no such dictionary exists, viewing and printing applications follow their own user preference settings.

## What Are Viewer Preferences

`ViewerPreferences` allows you to control various aspects of how a PDF document is displayed and behaves in PDF viewer applications. These preferences affect the user interface, window behavior, and printing options when the document is opened.

The `ViewerPreferences` class provides the following properties:

|Property|Type|Description|Default Value|
|----|----|----|----|
|`ShouldHideToolbar`|bool|Specifies whether to hide the viewer application toolbars when the document is active.|false|
|`ShouldHideMenubar`|bool|Specifies whether to hide the viewer application menu bar when the document is active.|false|
|`ShouldHideWindowUI`|bool|Specifies whether to hide user interface elements in the document window (such as scroll bars and navigation controls), leaving only the document contents displayed.|false|
|`ShouldFitWindow`|bool|Specifies whether to resize the document window to fit the size of the first displayed page.|false|
|`ShouldCenterWindow`|bool|Specifies whether to position the document window in the center of the screen.|false|
|`ShouldDisplayDocumentTitle`|bool|Specifies whether the window title bar displays the document title from the document information dictionary. If false, the PDF filename appears instead.|false|
|`NonFullScreenPageMode`|NonFullScreenPageModeType|The page mode that specifies how to display the document on exiting full-screen mode. Only meaningful if PageMode is FullScreen.|UseNone|
|`PrintScaling`|PrintScalingType|The page scaling option to select when a print dialog box is displayed.|AppDefault|
|`Duplex`|DuplexType?|The paper handling option to use when printing the file from the print dialog box.|null|
|`NumberOfCopies`|NumberOfCopiesType|The number of copies to print when the print dialog box opens.|One|
|`Direction`|DirectionType|The predominant reading order for text. Affects relative positioning of pages when displayed side by side or printed n-up.|L2R|

>important If a document is created with the PDF/A-1a, PDF/A-2a, PDF/A-3a, or PDF/UA-1 standard, the `ShouldDisplayDocumentTitle` setting is automatically set to `true` to comply with the [accessibility]({%slug create-accessible-pdf-documents%}) requirements of the standard.

**Example: Setting Viewer Preferences**

You can access and modify viewer preferences through the `ViewerPreferences` property of the `RadFixedDocument` class.

<snippet id='libraries-pdf-features-pdf-viewerpreferences-setviewerpreferences'/>

>note Viewer preferences are suggestions to the PDF viewer application. Not all viewers support all preferences, and some may ignore certain settings based on their own configuration or capabilities.

## See Also

* [RadFixedDocument]({%slug radpdfprocessing-model-radfixeddocument%})
* [RadFixedDocumentInfo]({%slug radpdfprocessing-model-radfixeddocumentinfo%})
* [Export to PDF]({%slug radpdfprocessing-formats-and-conversion-pdf-pdfformatprovider%})
