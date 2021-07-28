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

#### __C# Setting the Culture__

{{region cs-radspreadprocessing-features-setting-the-culture_1}}

    FormatHelper.CultureHelper = new SpreadsheetCultureHelper(new CultureInfo("en-US"));

{{endregion}}

