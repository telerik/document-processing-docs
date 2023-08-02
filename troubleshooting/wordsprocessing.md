---
title: Troubleshooting WordsProcessing
page_title: Troubleshooting WordsProcessing
description: Troubleshooting WordsProcessing
slug: troubleshooting-wordsprocessing
tags: wordsprocessing, document, processing, troubleshooting, telerik, word, docx
published: True
position: 0
---

# Troubleshooting WordsProcessing

This article provides solutions to common issues that you may observe when working with the WordsProcessing library.

## Issue: "NotSupportedException: The requested security protocol is not supported." when importing HTML with images in Windows Server

You get this error when importing an HTML file containing images, in a Windows Server environment that does not have .NET 4.8 installed. The required TLS security protocols are missing and are causing the observed behavior.  

### Solution

You can choose one of the following:

* Install **.NET 4.8** on the Windows Server.
* Subscribe to the [LoadImageFromUri](https://docs.telerik.com/devtools/document-processing/libraries/radwordsprocessing/formats-and-conversion/html/settings?_gl=1*5qmunw*_ga*ODA0MjEzMDU2LjE2NjEyNjUxMjc.*_ga_9JSNBCSF54*MTY5MDUyNDk1Ni4yMDYuMS4xNjkwNTI1NzY1LjcuMC4w#loadimagefromuri-and-loadstylesheetfromuri-events) event to load external resources that are not included in the HTML.
