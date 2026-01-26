---
title: Inserting an Image in a Specified Worksheet Cell Range With SpreadProcessing While Preserving Aspect Ratio
description: Learn how to insert an image within a specified worksheet cell range with Telerik SpreadProcessing while maintaining its aspect ratio.
type: how-to
page_title: How to Add an Image to a Worksheet Cell Range and Preserve Aspect Ratio with SpreadProcessing
meta_title: How to Add an Image to a Worksheet Cell Range and Preserve Aspect Ratio with SpreadProcessing
slug: spreadprocessing-insert-image-cell-range-aspect-ratio
tags: spread, processing, telerik, document, processing, image, worksheet, aspect, ratio, excel, cell, range, insert, preserve
res_type: kb
ticketid: 1708189
---

## Environment
<table>
<tbody>
<tr>
<td>Product</td>
<td>Telerik Document Processing SpreadProcessing</td>
</tr>
<tr>
<td>Version</td>
<td>19.3.25.1119</td>
</tr>
</tbody>
</table>

## Description

I want to insert an image within a defined cell range in Telerik Document Processing SpreadProcessing, ensuring that the image retains its original aspect ratio. There is no built-in API for this, so manual calculations are required to determine the image's dimensions based on the cell range.

This knowledge base article also answers the following questions:
- How to calculate image dimensions for a cell range in SpreadProcessing?
- How to preserve aspect ratio when adding an image to a worksheet?
- How to manually scale an image in SpreadProcessing?

## Solution

To insert an image within a specified cell range while preserving its aspect ratio:

1. Define the target cell range.
2. Calculate the total width and height of the cell range.
3. Create the image and set its source.
4. Calculate the scaling factor to fit the image within the cell range while maintaining its aspect ratio.
5. Use either `SetWidth` or `SetHeight` methods to adjust dimensions based on the limiting factor.
6. Add the image to the worksheet.

Here is the code example:

```csharp
// Define your target cell range
int startRow = 0; 
int startColumn = 3; 
int endRow = 10;        
int endColumn = 6;     

Worksheet worksheet = workbook.Worksheets[0];

// Calculate the total width and height of the cell range
double rangeWidth = 0;
for (int col = startColumn; col <= endColumn; col++)
{
    rangeWidth += worksheet.Columns[col].GetWidth().Value.Value;
}

double rangeHeight = 0;
for (int row = startRow; row <= endRow; row++)
{
    rangeHeight += worksheet.Rows[row].GetHeight().Value.Value;
}

// Create the image
ImageSource imageSource = new ImageSource(File.ReadAllBytes("image.jpeg"), "jpeg");

FloatingImage image = new FloatingImage(worksheet, new CellIndex(startRow, startColumn), 0, 0);
image.ImageSource = imageSource;

// Calculate the scaling to fit within the range while maintaining aspect ratio
double imageWidth = image.Width;
double imageHeight = image.Height;

double scaleX = rangeWidth / imageWidth;
double scaleY = rangeHeight / imageHeight;
double scale = Math.Min(scaleX, scaleY); // Use smaller scale to fit within bounds

// Use the dimension that hits the boundary first
if (scaleX < scaleY)
{
    // Width is the limiting factor
    image.SetWidth(true, rangeWidth);
}
else
{
    // Height is the limiting factor
    image.SetHeight(true, rangeHeight);
}

// Add the image to the worksheet
worksheet.Images.Add(image);
```

### Notes:
- Use the `SetWidth` and `SetHeight` methods with `true` for the `respectLockAspectRatio` parameter to maintain the aspect ratio.
- Ensure the target cell range is correctly defined before performing calculations.

## See Also

- [SpreadProcessing Overview](https://docs.telerik.com/devtools/document-processing/libraries/radspreadprocessing/overview)
- [Working with Images in SpreadProcessing](https://docs.telerik.com/devtools/document-processing/libraries/radspreadprocessing/features/images)
- [API Reference for FloatingImage](https://docs.telerik.com/devtools/document-processing/api/spreadprocessing/telerik.windows.documents.spreadsheet.model.floatingimage)
---
