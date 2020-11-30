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
		<td>bellow 2020.2.513 or above*</td>
		<td>RadPdfProcessing</td>
		<td rowspan="2"><a href="https://www.telerik.com/blogs/author/martin-velikov">Martin Velikov</a></td>
	</tr>
	<tr>
	    <td>bellow 2020.2.513 or above*</td>
		<td>RadPdfViewer</td>
	</tr>	
</tbody>
</table>

\* Due to the new PdfViewer's document model transition, there is a difference in the implementation between different assemblies version.

## Description
 
How to export RadFixedPage to TIFF file.

## Solution

To achieve this we can use the [RadPdfViewer](https://docs.telerik.com/devtools/wpf/controls/radpdfviewer/overview) control form the [UI for WPF](https://docs.telerik.com/devtools/wpf/introduction) suite to create images from the [RadFixedDocument]({%slug radpdfprocessing-model-radfixeddocument%}) pages using the **ThumbnailFactory** class.
	q
>note The COM threading model for the application has to be a single-threaded apartment (STA). A STAThreadAttribute tag "[STAThread]" should be placed on the class. 

#### __[C#] Assemblies version bellow 2020.2.513__
{{region kb-export-radfixedpage-to-image1}}

	[STAThread]
	private static void Main(string[] args)
	{
		PdfFormatProvider pdfProcessingProvider = new PdfFormatProvider();
		RadFixedDocument document = GetRadFixedDocument(pdfProcessingProvider);

		byte[] data = pdfProcessingProvider.Export(document);
			
		RadPdfViewer pdfViewer = new RadPdfViewer();

		PdfFormatProvider pdfViewerProvider = new PdfFormatProvider(new MemoryStream(data), FormatProviderSettings.ReadAllAtOnce);
		pdfViewer.Document = pdfViewerProvider.Import();

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
	}

{{endregion}}

#### __[C#] Assemblies version 2020.2.513 or above__
{{region  kb-export-radfixedpage-to-image2}}

	[STAThread]
	private static void Main(string[] args)
	{
		PdfFormatProvider pdfProcessingProvider = new PdfFormatProvider();
		RadFixedDocument document = GetRadFixedDocument(pdfProcessingProvider);

		int pageNumber = 0;
		RadFixedPage page = document.Pages[pageNumber];

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
	}

{{endregion}}
