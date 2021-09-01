---
title: Page Setup Exporter
page_title: Page Setup Exporter
slug: radspreadstreamprocessing-features-page-setup-exporter
tags: worksheet, page, exporter
published: True
position: 3
---

# Page Setup Exporter

The PageSetupExporter alloes you to export the page setting used when the document is printed. the following methods are exposed:

* __SetFitToPagesTall:__
* __SetFitToPagesWide:__
* __SetPageOrder:__
* __SetPageOrientation:__
* __SetPaperSize:__
* __SetScaleFactor:__


## Working with PageSetupExporter

Importan part is that you need to place the PageSetupExporer after all cells on the sheet are exported. Example e demostrates how you can create the PageSetup exporter and where to palce it. 

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


>IWorksheetViewExporter inherits from [IDisposable](https://msdn.microsoft.com/en-us/library/system.idisposable(v=vs.110).aspx). Make sure the object is disposed when you are done with it. Otherwise, the content won't be written in the exported file. The best way to ensure this is handled properly is to wrap it in a *using* statement.