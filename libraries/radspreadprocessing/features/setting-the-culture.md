---
title: Setting the Culture
page_title:  Setting the Culture
slug: radspreadprocessing-features-setting-the-culture
tags: culture, workbook, spreadsheet
published: True
position: 18
---

## Setting the culture

__RadSpreadProcessing__ allows you to set a culture that differs from the current thread culture. This can be achieved by creating a new __CultureHelper__.

#### __Setting the Culture__

```csharp

    Telerik.Windows.Documents.Spreadsheet.Formatting.FormatHelper.CultureHelper = new SpreadsheetCultureHelper(new CultureInfo("en-US"));

```

