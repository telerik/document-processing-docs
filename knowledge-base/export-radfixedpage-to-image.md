---
title: Export RadFixedPage to image
description: Export RadFixedPage to image
type: how-to
page_title: Export RadFixedPage to image
slug: export-radfixedpage-to-image
position: 0
tags: pdf, page, export, image
res_type: kb
---

<table>
<thead>
	<tr>
		<th>Product Version</th>
		<th>Product</th>
		<th>Author</th>
	</tr>
</thead>
<tbody>
	<tr>
		<td>2020.1.310</td>
		<td>RadPdfProcessing</td>
		<td rowspan="2">[Martin Velikov](https://www.telerik.com/blogs/author/martin-velikov)</td>
	</tr>
	<tr>
	    <td>2020.1.309</td>
		<td>RadPdfViewer</td>
	</tr>	
</tbody>
</table>

## Description
 
How to export RadFixedPage to TIFF file.

## Solution

To achieve this we can use the [RadPdfViewer](https://docs.telerik.com/devtools/wpf/controls/radpdfviewer/overview) control form the [UI for WPF](https://docs.telerik.com/devtools/wpf/introduction) suite to create images from the RadFixedDocument pages using the **ThumbnailFactory** class.

#### __[C#]__
{{region cs-kb-export-radfixedpage-to-image-1}}

    byte[] data = GetDocumentData();
    
    RadPdfViewer pdfViewer = new RadPdfViewer();
    
    PdfFormatProvider provider = new PdfFormatProvider(new MemoryStream(data), FormatProviderSettings.ReadAllAtOnce);
    pdfViewer.Document = provider.Import();
    
    int pageNumber = 0;
    RadFixedPage page = pdfViewer.Document.Pages[pageNumber];
    
    ThumbnailFactory factory = new ThumbnailFactory();
    
    ImageSource imageSource = factory.CreateThumbnail(page, page.Size);
    
    Image image = new Image();
    image.Source = imageSource;
    
    Grid container = new Grid();
    container.Background = Brushes.White;
    container.Children.Add(image);
    container.Measure(new Size(double.PositiveInfinity, double.PositiveInfinity));
    container.Arrange(new Rect(new Point(0, 0), container.DesiredSize));
    
    RenderTargetBitmap bitmap = new RenderTargetBitmap((int)PageLayoutHelper.GetActualWidth(page), (int)PageLayoutHelper.GetActualHeight(page), 96, 96, PixelFormats.Pbgra32);
    bitmap.Render(container);
    
    string exportedFileName = "Exported.tiff";
    using (FileStream fileStream = new FileStream(exportedFileName, FileMode.Create))
    {
        BitmapEncoder encoder = new TiffBitmapEncoder();
        encoder.Frames.Add(BitmapFrame.Create(bitmap));
        encoder.Save(fileStream);
    }
{{endregion}}
