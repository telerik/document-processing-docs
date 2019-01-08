---
title: Working with Series
page_title: Working with Series
description: Working with Series
slug: radspreadprocessing-features-charts-working-with-series
tags: series, insert, remove
published: True
position: 3
---

# Working with Series

A series is a set of data - a line or a set of columns, for example. All data plotted on a chart comes from the series object. 

## SeriesBase Class

The SeriesBase class is the base class for all series in RadSpreadProcessing. It exposes the following members:

* **SeriesType**: Gets the type of the series.
* **Values**: Gets or sets the data for the values of the series.
* **Categories**: Gets or sets the data for the categories of the series.
* **Title**: Gets or sets the title of the series.
* **Clone()**: Creates a deep copy of the object and returns the cloning.

The SeriesBase is inherited by the following classes, which represent different types of series:

* **AreaSeries**
* **LineSeries**
* **BarSeries**
* **PieSeries**



## Add and Remove Series

The adding of the new series is done through the **SeriesCollection** Add() method overloads and removing is done through the Remove() method. The first overload throws an exception when the series parameter passed is not of the correct type and the other Add ()overloads create a series of the appropriate type. The overloads of the base **SeriesCollection** type are listed below:

- public void Add(SeriesBase series)
- public SeriesBase Add(IChartData categoriesData, IChartData valuesData, Title title = null)
- public SeriesBase Add()
- public void Remove(SeriesBase series)

To better illustrate how you can change the series of a chart, let's take the sample data and chart from **Figure 1**.

#### Figure 1: Initial state of a chart
![](images/SpreadProcessing-Features-Charts-WorkingWithSeries_1.png)

#### [C#] Example 1: Add and remove series from a chart

{{region}}
	
	// The worksheet contains a chart of type bar.
	DocumentChart chart = (worksheet.Shapes.First() as FloatingChartShape).Chart;
	SeriesGroup chartComponent = chart.SeriesGroups.First();
	SeriesBase firstSeries = chartComponent.Series.First();
	chartComponent.Series.Remove(firstSeries);
	
	CellRange valuesRange = new CellRange(2, 3, 5, 3); // D3:D6
	CellRange categoriesRange = new CellRange(2, 1, 5, 1); // B3:B6
	CellRange titleRange = new CellRange(1, 3, 1, 3); // B3:B6
	
	WorkbookFormulaChartData valuesData = new WorkbookFormulaChartData(worksheet, valuesRange);
	WorkbookFormulaChartData categoriesData = new WorkbookFormulaChartData(worksheet, categoriesRange);
	Title chartTitle = new FormulaTitle(new WorkbookFormulaChartData(worksheet, titleRange));
	
	SeriesBase newSeries = chartComponent.Series.Add(categoriesData, valuesData, chartTitle);
	Type seriesType = newSeries.GetType(); // Will be of type BarSeries
{{endregion}}

#### Figure 2: Modified series of a chart
![](images/SpreadProcessing-Features-Charts-WorkingWithSeries_2.png)

The same methods for adding and removing series can be accessed through the concrete SeriesCollection of the concrete SeriesGroup and they will return concrete Series object. 

#### [C#] Example 2: Add series to a chart using concrete SeriesGroup object

{{region}}
	
	BarSeriesGroup chartComponent = chart.SeriesGroups.First() as BarSeriesGroup; BarSeries newSeries = chartComponent.Series.Add(categoriesData, valuesData, chartTitle);
{{endregion}}

##	Iterating the Series of a Chart


You can access the **Series** property of the **SeriesGroup** object contained in the **SeriesGroups** property of the **Chart** object and iterate the **SeriesBase** objects in it. 

#### [C#] Example 3: Iterate series

{{region}}
	
	DocumentChart chart = (worksheet.Shapes.First() as FloatingChartShape).Chart;
	SeriesGroup seriesGroup = chart.SeriesGroups.First();
	
	foreach (SeriesBase series in seriesGroup.Series)
	{
	    if (series.Categories.ChartDataType == ChartDataType.Formula)
	    {
	        Worksheet dataWorksheet;
	        IEnumerable<CellRange> categories = (series.Categories as WorkbookFormulaChartData).EnumerateCellRanges(out dataWorksheet);
	    }
	
	    if (series.Values.ChartDataType == ChartDataType.Formula)
	    {
	        Worksheet dataWorksheet;
	        IEnumerable<CellRange> values = (series.Values as WorkbookFormulaChartData).EnumerateCellRanges(out dataWorksheet);
	    }
	}
{{endregion}}

## Making Changes to the Series

You can modify the properties of the base class for all series - SeriesBase.

#### [C#] Example 4: Change series

{{region}}
	
	DocumentChart chart = (worksheet.Shapes.First() as FloatingChartShape).Chart;
	SeriesGroup seriesGroup = chart.SeriesGroups.First();
	SeriesBase firstSeries = seriesGroup.Series.First();
	
	firstSeries.Title = new TextTitle("New title");
	firstSeries.Values = new WorksheetFormulaChartData(worksheet, new CellRange(2, 3, 5, 3));

{{endregion}}
