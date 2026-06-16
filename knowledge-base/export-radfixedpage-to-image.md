---
title: Export RadFixedPage to Image
description: Learn how to export RadFixedPage instances from PDF documents to image files such as TIFF using the RadPdfViewer ThumbnailFactory class.
type: how-to
page_title: Export RadFixedPage to Image
slug: export-radfixedpage-to-image
position: 0
tags: radpdfprocessing, pdf, page, image, export, document, processing, fixed
res_type: kb
---

## Environment

|Product Version|Product|Author|
|----|----|----|
|below 2020.2.513 or above*|RadPdfProcessing|[Martin Velikov](https://www.telerik.com/blogs/author/martin-velikov)|
|below 2020.2.513 or above*|RadPdfViewer|[Martin Velikov](https://www.telerik.com/blogs/author/martin-velikov)|

\* Due to the new `RadPdfViewer` document model transition, there is a difference in the implementation between different assembly versions.

## Description

How to export a `RadFixedPage` to a TIFF file.

## Solution

To achieve this, use the [RadPdfViewer](https://docs.telerik.com/devtools/wpf/controls/radpdfviewer/overview) control from the [UI for WPF](https://docs.telerik.com/devtools/wpf/introduction) suite to create images from the [RadFixedDocument]({%slug radpdfprocessing-model-radfixeddocument%}) pages by using the `ThumbnailFactory` class.

>note The COM threading model for the application must be a single-threaded apartment (STA). Place a `[STAThread]` attribute on the entry point method.

**Example 1: Assembly Versions below 2020.2.513**

```csharp

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

```

**Example 2: Assembly Versions 2020.2.513 or Later**

```csharp

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

```

## See Also

* [RadPdfProcessing Overview]({%slug radpdfprocessing-overview%})
* [RadFixedPage]({%slug radpdfprocessing-model-radfixedpage%})
