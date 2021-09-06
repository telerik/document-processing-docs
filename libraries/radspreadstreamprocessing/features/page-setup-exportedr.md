---
title: Page Setup Exporter
page_title: Page Setup Exporter
slug: radspreadstreamprocessing-features-page-setup-exporter
tags: worksheet, page, exporter
published: True
position: 3
---

# Page Setup Exporter

The __PageSetupExporter__ allows you to export the page settings for printing. The following methods are exposed:

* __SetFitToPagesTall:__ Sets the number of pages tall the worksheet will be scaled to when it's printed.
* __SetFitToPagesWide:__ Sets the number of pages wide the worksheet will be scaled to when it's printed.
* __SetPageOrder:__ Sets the page order.
* __SetPageOrientation:__ Sets the page orientation.
* __SetPaperSize:__ Sets the size of the paper.
* __SetScaleFactor:__ Sets the scale factor of the printed worksheet. The valid values are from 0.1 to 4.


## Working with PageSetupExporter

An important part is that you need to place the **PageSetupExporer** after the code for exporting all cells on the sheet. Example 1 demonstrates how you can create the **PageSetupExporter** and where to place it.

#### **[C#] Example 1: Using  PageSetupExporter**

{{region cs-radspreadstreamprocessing-features-page-setup-exporter_0}}

    using (FileStream stream = File.Open(fileName, FileMode.OpenOrCreate))
    {
        using (IWorkbookExporter workbook = SpreadExporter.CreateWorkbookExporter(documentFormat, stream))
        {
            using (IWorksheetExporter worksheet = workbook.CreateWorksheetExporter("Date"))
            {
    			// export cells here
    
                using (IPageSetupExporter pageSetupExporter = worksheet.CreatePageSetupExporter())
                {
                    pageSetupExporter.SetFitToPagesTall(2);
                    pageSetupExporter.SetFitToPagesWide(3);
                    pageSetupExporter.SetPageOrder(SpreadPageOrder.OverThenDown);
                    pageSetupExporter.SetPageOrientation(SpreadPageOrientation.Landscape);
                    pageSetupExporter.SetPaperSize(SpreadPaperSize.A5);
                    pageSetupExporter.SetScaleFactor(1.5);
                }
            }
        }
    }

{{endregion}}


>IPageSetupExporter inherits from [IDisposable](https://msdn.microsoft.com/en-us/library/system.idisposable(v=vs.110).aspx). Make sure the object is disposed when you are done with it. Otherwise, the content won't be written in the exported file. The best way to ensure this is handled properly is to wrap it in a *using* statement.