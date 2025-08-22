---
title: Generating Stacked Line Graphs and Configuring Axes in Excel Using FloatingChartShape
description: Learn how to generate stacked line graphs and configure axes in Excel spreadsheets using Telerik Document Processing's SpreadProcessing library.
type: how-to
page_title: Creating Stacked Line Graphs and Setting Axes in Excel with FloatingChartShape
meta_title: Creating Stacked Line Graphs and Setting Axes in Excel with FloatingChartShape
slug: generating-stacked-line-graphs-configuring-axes-excel-floatingchartshape
tags: spreadprocessing,telerik document processing,floatingchartshape,line graph,stacked line chart,x-axis,y-axis
res_type: kb
ticketid: 1695510
---

## Environment

<table>
<tbody>
<tr>
<td> Product </td>
<td> SpreadProcessing for Telerik Document Processing </td>
</tr>
<tr>
<td> Version </td>
<td> 2025.2.701 </td>
</tr>
</tbody>
</table>

## Description

I want to generate stacked line graphs in Excel using the `FloatingChartShape` feature in Telerik Document Processing's SpreadProcessing library. However, the chart defaults to a stacked line graph with markers instead of a plain stacked line graph. Additionally, I want to configure the X-axis to display dates while the Y-axis displays numerical values when plotting multiple columns of data.

This knowledge base article also answers the following questions:
- How do I create a stacked line chart in Excel using Telerik Document Processing?
- How can I plot specific data on the X-axis and Y-axis in an Excel chart?
- How do I remove markers from a stacked line graph using FloatingChartShape?

## Solution

To create a stacked line graph and configure the axes as desired, follow these steps:

1. Define the `LineSeriesGroup` and set its grouping to `Stacked`. This ensures the graph is created as a stacked line chart.

```csharp
LineSeriesGroup seriesGroup = new LineSeriesGroup();
seriesGroup.Grouping = SeriesGrouping.Stacked;
```

2. Create individual `LineSeries` for each data column. Set the `Values` to represent numerical data and `Categories` to represent dates.

```csharp
LineSeries lineSeries1 = new LineSeries();
lineSeries1.Values = new WorkbookFormulaChartData(worksheet, new CellRange(1, 1, 10, 1));
lineSeries1.Categories = new WorkbookFormulaChartData(worksheet, new CellRange(1, 0, 10, 0));
lineSeries1.Marker = new Marker();
lineSeries1.Marker.Symbol = MarkerStyle.None; // Removes markers
seriesGroup.Series.Add(lineSeries1);

LineSeries lineSeries2 = new LineSeries();
lineSeries2.Values = new WorkbookFormulaChartData(worksheet, new CellRange(1, 2, 10, 2));
lineSeries2.Categories = new WorkbookFormulaChartData(worksheet, new CellRange(1, 0, 10, 0));
lineSeries2.Marker = new Marker();
lineSeries2.Marker.Symbol = MarkerStyle.None; // Removes markers
seriesGroup.Series.Add(lineSeries2);
```

3. Define the axes for the chart. Set the `CategoryAxis` to plot dates and the `ValueAxis` for numerical values.

```csharp
AxisGroup axisGroup = new AxisGroup();
CategoryAxis categoryAxis = new CategoryAxis();
SolidFill lineColor = new SolidFill(new ThemableColor(ThemeColorType.Background2));
categoryAxis.Outline.Fill = lineColor;
categoryAxis.MajorGridlines.Outline.Fill = lineColor;
axisGroup.CategoryAxis = categoryAxis;

ValueAxis valueAxis = new ValueAxis();
valueAxis.Outline.Fill = lineColor;
valueAxis.MajorGridlines.Outline.Fill = lineColor;
axisGroup.ValueAxis = valueAxis;
```

4. Create the chart and associate the `LineSeriesGroup` and axes with it.

```csharp
DocumentChart documentChart = new DocumentChart();
documentChart.SeriesGroups.Add(seriesGroup);
documentChart.PrimaryAxes = axisGroup;
```

5. Replace the default chart in the `FloatingChartShape` with the configured `DocumentChart`. Set the dimensions and add it to the worksheet.

```csharp
FloatingChartShape floatingChartShape = new FloatingChartShape(worksheet, new CellIndex(0, 5), new CellRange(0, 0, 4, 3), ChartType.Line);
floatingChartShape.Chart = documentChart;
floatingChartShape.Width = 400; // Set desired width
floatingChartShape.Height = 250; // Set desired height

worksheet.Charts.Add(floatingChartShape);
```

By following these steps, you can generate a stacked line graph without markers and configure the axes to display the required data.

## See Also

- [SpreadProcessing Documentation](https://docs.telerik.com/devtools/document-processing/libraries/radspreadprocessing/overview)
- [FloatingChartShape API Reference](https://docs.telerik.com/devtools/document-processing/api/Telerik.Documents.Spreadsheet.Model.Shapes.FloatingChartShape)
- [LineSeriesGroup API Reference](https://docs.telerik.com/devtools/document-processing/api/Telerik.Documents.Spreadsheet.Model.Charts.LineSeriesGroup)
