---
title: Adding Charts to a PDF Document in RadPdfProcessing
description: Learn how to generate a chart as an image and insert it into a PDF document using RadPdfProcessing and Telerik UI controls.
type: how-to
page_title: How to Include Charts in PDF Files with RadPdfProcessing
slug: add-charts-to-pdf-radpdfprocessing
tags: radpdfprocessing, document, processing, chart, pdf, image, export
res_type: kb
ticketid: 1679135
---

## Environment

| Version | Product | Author | 
| ---- | ---- | ---- | 
| 2025.1.205 (2025 Q1)| RadPdfProcessing |[Desislava Yordanova](https://www.telerik.com/blogs/author/desislava-yordanova)| 

## Description

This article shows how to programmatically generate a Chart and embed it into a PDF file using [RadPdfProcessing]({%slug radpdfprocessing-overview%}). 

## Solution

RadPdfProcessing does not provide functionality for generating chart elements inside the PDF document. However, you can generate the chart with the appropriate UI control, export it as an image, and then insert the image in the document.

To embed a chart into a PDF document using RadPdfProcessing, follow these steps:

1. **Export the Chart as an Image**: Generate the chart with the appropriate Telerik UI control and convert it to an image format.

    * For **.NET Standard** scenarios, use the Telerik UI for Blazor Chart and the [Export Chart as Image](https://www.telerik.com/blazor-ui/documentation/knowledge-base/chart-export-to-image) feature. Refer to the [forum post](https://www.telerik.com/forums/export-chart-as-image-47277c4c2e77) for detailed instructions.

    * For **.NET Framework** scenarios, use the Telerik UI for WinForms ChartView and its [Export to image](https://docs.telerik.com/devtools/winforms/controls/chartview/features/export) feature.

2. **Insert the Image into the PDF**: After you obtain the image of your chart, use RadPdfProcessing to insert it into the PDF document. RadPdfProcessing offers two approaches for working with images in PDFs:

    * Use `FixedContentEditor` as detailed in [How to Generate a PDF Document from Images with FixedContentEditor]({%slug pdf-from-images-with-fixedcontenteditor%}).

    * Use `RadFixedDocumentEditor` as outlined in [How to Generate a PDF Document from Images with RadFixedDocumentEditor]({%slug pdf-from-images-with-radfixeddocumenteditor%}).

Choose the approach that best suits your needs. Both methods allow you to insert and scale the image (chart) as needed within your PDF document.

## See Also

* [Exporting Telerik UI for Blazor Chart as Image](https://www.telerik.com/blazor-ui/documentation/knowledge-base/chart-export-to-image)
* [Telerik UI for Blazor Chart Documentation](https://docs.telerik.com/blazor-ui/components/chart/overview)
* [Telerik UI for WinForms Chart Documentation](https://docs.telerik.com/devtools/winforms/controls/chartview/overview)
* [How to Draw a Chart with FixedContentEditor in PdfProcessing]({%slug draw-chart-with-fixedcontenteditor%})
