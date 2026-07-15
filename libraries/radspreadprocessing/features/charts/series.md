---
title: Series
description: Learn how to insert and remove chart series, and configure the data plotted on charts in RadSpreadProcessing.
page_title: Series
slug: radspreadprocessing-features-charts-series
tags: series, charts, spreadsheet, radspreadprocessing, insert, remove, data, excel, spread, xlsx
published: True
position: 4
platforms: ajax, mvc, wpf, winforms
---

# Series

A series is a set of data—a line or a set of columns, for example. All data plotted on a chart comes from the series object.

## Series Classes

There are several base classes used to unite the different kinds of series and values they work with.

![Telerik Document Processing RadSpreadProcessing class diagram showing SeriesBase, CategorySeriesBase, PointSeriesBase, and their concrete chart series types](images/SpreadProcessing-Features-Charts-WorkingWithSeries_7.png)

### SeriesBase Class

The `SeriesBase` class is the base class for all series in RadSpreadProcessing. It exposes the following members:

| Member | Description |
|---|---|
| `SeriesType` | Gets the type of the series. |
| `Title` | Gets or sets the title of the series. |
| `Outline` | Represents the outline of a chart. It is of type [Outline](https://docs.telerik.com/devtools/document-processing/api/Telerik.Windows.Documents.Model.Drawing.Theming.Outline.html). |
| `Fill` | Represents the fill of the series. You can use the [SolidFill](https://docs.telerik.com/devtools/document-processing/api/telerik.windows.documents.model.drawing.theming.solidfill) type to set the series color. |
| `Clone()` | Creates a deep copy of the object and returns the cloning. |

The different types of charts support different types of series. To meet this need, the base class is inherited by the `CategoriesSeriesBase` and `PointSeriesBase` base classes representing the different series types.

### CategorySeriesBase

A base class for all series that use Values and Categories.

| Member | Description |
|---|---|
| `Values` | Gets or sets the data for the values of the series. |
| `Categories` | Gets or sets the data for the categories of the series. |


The `CategorySeriesBase` is inherited by the following classes, which represent concrete different types of series:

* `AreaSeries`
* `LineSeries`
* `BarSeries`
* `PieSeries`

### PointSeriesBase

A base class for all series that use X values and Y values.

| Member | Description |
|---|---|
| `XValues` | Gets or sets the data for the X values of the series. |
| `YValues` | Gets or sets the data for the Y values of the series. |

`PointSeriesBase` is inherited by the following classes, which represent concrete different types of series:

* `ScatterSeries`
* `BubbleSeries`


## Add and Remove Series

Add new series through the `SeriesCollection` `Add()` method overloads and remove series through the `Remove()` method. The first overload throws an exception when the series parameter passed is not of the correct type, and the other `Add()` overloads create a series of the appropriate type. The overloads of the base `SeriesCollection` type are listed in the following table:

| Overload | Description |
|---|---|
| `Add(IChartData categoriesData, IChartData valuesData, Title title = null)` | Adds a series with the specified categories, values, and optional title. Returns a `SeriesBase` instance. |
| `Add()` | Adds a new empty series. Returns a `SeriesBase` instance. |
| `Remove(SeriesBase series)` | Removes the specified series from the collection. |

To better illustrate how you can change the series of a chart, consider the sample data and chart from **Figure 1**.

**Figure 1: Initial chart with a single Income series from worksheet data**

![Telerik Document Processing RadSpreadProcessing worksheet showing Year, Income, and Employees data with a column chart for the Income series](images/SpreadProcessing-Features-Charts-WorkingWithSeries_1.png)

**Example 1: Add and remove series from a chart**

<snippet id='codeblock-cln'/>

**Figure 2: Modified chart after changing the displayed series**

![Telerik Document Processing RadSpreadProcessing worksheet showing the chart updated to display the Employees series instead of Income](images/SpreadProcessing-Features-Charts-WorkingWithSeries_2.png)

The same methods for adding and removing series can be accessed through the concrete `SeriesCollection` of the concrete `SeriesGroup`, and they return concrete Series objects.

**Example 2: Add a series through a concrete SeriesGroup**

<snippet id='codeblock-clo'/>

## Iterating the Series of a Chart


You can access the `Series` property of the `SeriesGroup` object contained in the `SeriesGroups` property of the `Chart` object and iterate the `SeriesBase` objects in it.

**Example 3: Iterate the chart series collection**

<snippet id='codeblock-clp'/>

## Making Changes to the Series

You can modify the properties of the base class for all series—`SeriesBase`.

**Example 4: Change common series properties**

<snippet id='codeblock-clq'/>


## SeriesGroup Class and Properties Related to Specific Series Types

There are properties defined on `SeriesGroup` level. The `SeriesGroup` base class represents a group of series and is inherited by the classes holding specific types of series. In addition to the `SeriesType` and `Series` properties, which give you access to the type of the series and the series collection respectively, there are properties implemented in the inheritors. The additional properties are specific for the type of series and give you control over the appearance of all the series in the group.

### BarSeriesGroup

| Property | Type | Description |
|---|---|---|
| `BarDirection` | `BarDirection` | Determines the orientation of the bar chart. `BarDirection.Bar` results in a horizontal bar chart. `BarDirection.Column` results in a vertical column chart. |

### DoughnutSeriesGroup

| Property | Type | Description |
|---|---|---|
| `HoleSizePercent` | `int` | Gets or sets the size of the hole relative to the size of the doughnut. The value is limited to values between 0 and 90. |


## Properties Related to Specific Series Types and Defined in Concrete SeriesBase Implementations

These properties enable you to control the options for each of the series independently.

### BubbleSeries

| Property | Type | Description |
|---|---|---|
| `BubbleSizes` | `IChartData` | Gets or sets the data for the bubble size of the series. You can set it to a specific cell range or directly using values. |

### LineSeries

| Property | Type | Description |
|---|---|---|
| `IsSmooth` | `bool` | Determines whether the line of the series is smooth. |
| `Marker` | `Marker` | Represents the marker of the series. |

### ScatterSeries

| Property | Type | Description |
|---|---|---|
| `IsSmooth` | `bool` | Determines whether the line of the series is smooth. |
| `Marker` | `Marker` | Represents the marker of the series. |
| `ScatterStyle` | `ScatterStyle` | Determines the style of the scatter series. See the following table for possible values. |

The `ScatterStyle` enumeration supports the following values:

| Value | Description |
|---|---|
| `None` | Points on the scatter chart are not connected with straight lines and markers are not drawn. |
| `Line` | Points on the scatter chart are connected with straight lines but markers are not drawn. |
| `LineMarker` | Points on the scatter chart are connected with straight lines and markers are drawn. |
| `Marker` | Points on the scatter chart are not connected with lines and markers are drawn. |
| `Smooth` | Points on the scatter chart are connected with smoothed lines but markers are not drawn. |
| `SmoothMarker` | Points on the scatter chart are connected with smoothed lines and markers are drawn. |

**Example 5: Customize the appearance of a ScatterSeries**

<snippet id='codeblock-clr'/>


## Series Grouping

Some series groups (Bar, Line, and Area) implement the `ISupportGrouping` interface. It defines the `Grouping` property which is of type `SeriesGrouping` enum. The enum contains the following members: `SeriesGrouping.Standard`, `SeriesGrouping.Stacked`, and `SeriesGrouping.PercentStacked`. For the Bar chart, the Standard grouping results in a clustered chart. See the following examples for what the results of different grouping look like.

**Figure 3: Sample category and value data used for series grouping examples**

![Telerik Document Processing RadSpreadProcessing worksheet showing sample categories test 1 through test 4 with two value columns for series grouping examples](images/SpreadProcessing-Features-Charts-WorkingWithSeries_3.png)

**Example 6: Create a standard clustered chart with vertical bars**

<snippet id='codeblock-cls'/>

**Figure 4: Standard clustered chart with two separate value series per category**

![Telerik Document Processing RadSpreadProcessing clustered vertical bar chart showing separate blue and orange series for test 1 through test 4](images/SpreadProcessing-Features-Charts-WorkingWithSeries_4.png)

**Example 7: Create a stacked chart with vertical bars**

<snippet id='codeblock-clt'/>

**Figure 5: Stacked chart with both series combined in each category**

![Telerik Document Processing RadSpreadProcessing stacked vertical bar chart showing combined blue and orange series values for test 1 through test 4](images/SpreadProcessing-Features-Charts-WorkingWithSeries_5.png)


**Example 8: Create a percent-stacked chart with vertical bars**

<snippet id='codeblock-clu'/>

**Figure 6: Percent-stacked chart normalized to 100 percent for each category**

![Telerik Document Processing RadSpreadProcessing percent-stacked vertical bar chart showing proportional blue and orange series values for test 1 through test 4](images/SpreadProcessing-Features-Charts-WorkingWithSeries_6.png)

