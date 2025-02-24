---
title: Adding Charts to a PDF Document in RadPdfProcessing
description: Learn how to insert charts into a PDF document using RadPdfProcessing.
type: how-to
page_title: How to Include Charts in PDF Files with RadPdfProcessing
slug: add-charts-to-pdf-radpdfprocessing
tags: pdfprocessing, document, processing, chart, pdf, image, export
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

To embed a chart into a PDF document using RadPdfProcessing, follow these steps:

1. **Export the Chart as an Image**: First, generate the chart you want to include in your PDF and convert it an image format. For Telerik UI for Blazor Chart, you can utilize the [Export Chart as Image](https://www.telerik.com/blazor-ui/documentation/knowledge-base/chart-export-to-image) feature. Refer to [forum post](https://www.telerik.com/forums/export-chart-as-image-47277c4c2e77) for detailed instructions.

2. **Insert the Image into the PDF**: After obtaining the image of your chart, use RadPdfProcessing to insert this image into your PDF document. RadPdfProcessing offers two approaches for working with images in PDFs:
    - Using `FixedContentEditor` as detailed in [How to Generate a PDF Document from Images with FixedContentEditor]({%slug pdf-from-images-with-fixedcontenteditor%}).
    - Utilizing `RadFixedDocumentEditor` as outlined in [How to Generate a PDF Document from Images with RadFixedDocumentEditor]({%slug pdf-from-images-with-radfixeddocumenteditor%}).

Choose the approach that best suits your needs. Both methods will allow you to position and scale the image (chart) as needed within your PDF document.

## See Also

- [Exporting Telerik UI for Blazor Chart as Image](https://www.telerik.com/blazor-ui/documentation/knowledge-base/chart-export-to-image)
- [Telerik UI for Blazor Chart Documentation](https://docs.telerik.com/blazor-ui/components/chart/overview)
