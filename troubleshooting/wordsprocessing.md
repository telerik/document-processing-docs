---
title: Troubleshooting WordsProcessing
page_title: Troubleshooting WordsProcessing
description: Learn how to resolve common WordsProcessing issues such as NotSupportedException when importing HTML with images in Windows Server.
slug: troubleshooting-wordsprocessing
tags: troubleshooting, radwordsprocessing, docx, html, word, telerik, exceptions, import
published: True
position: 2
---

# Troubleshooting WordsProcessing

This article provides solutions to common issues that you may observe when working with the WordsProcessing library.

## Issue: NotSupportedException When Importing HTML with Images in Windows Server

You get this error when importing an HTML file that contains images in a Windows Server environment that does not have .NET 4.8 installed. The required TLS security protocols are missing and cause the observed behavior.

### Solution

You can choose one of the following options:

* Install **.NET 4.8** on the Windows Server.
* Subscribe to the [LoadImageFromUri](https://docs.telerik.com/devtools/document-processing/libraries/radwordsprocessing/formats-and-conversion/html/settings#loadimagefromuri-and-loadstylesheetfromuri-events) event to load external resources that are not included in the HTML.
