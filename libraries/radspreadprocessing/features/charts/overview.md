---
title: Overview
description: Learn how to add, remove, and manipulate chart objects in spreadsheet documents using RadSpreadProcessing.
page_title: Charts
slug: radspreadprocessing-features-charts
tags: charts, spreadsheet, radspreadprocessing, excel, xlsx, worksheet, visualization, overview
published: True
position: 1
platforms: ajax, mvc, wpf, winforms
---

# Overview

Charts let you summarize the data in your spreadsheet document and make it readable and understandable. With RadSpreadProcessing you can add, remove, and manipulate chart objects in your spreadsheet documents.

## Supported Chart Types

### Column Charts

Column/bar charts display values as sets of vertical columns, grouped by category. The length of the bars is proportional to the values that they represent. With this type of chart you can compare values in different categories.


| Clustered column        | Stacked column | 100% stacked column |
| ----------------------- |:--------------:| -------------------:|
| ![Telerik Document Processing RadSpreadProcessing clustered column chart](images/SpreadProcessing-Features-Charts_1.png) | ![Telerik Document Processing RadSpreadProcessing stacked column chart](images/SpreadProcessing-Features-Charts_2.png) | ![Telerik Document Processing RadSpreadProcessing 100 percent stacked column chart](images/SpreadProcessing-Features-Charts_3.png)|


### Bar Charts

Bar charts are analogical to the column charts, except for the orientation of the bars. These charts use horizontal bars instead of vertical columns to display the values and their categories.


| Clustered bar           | Stacked bar    | 100% stacked bar    |
| ----------------------- |:--------------:| -------------------:|
| ![Telerik Document Processing RadSpreadProcessing clustered bar chart](images/SpreadProcessing-Features-Charts_4.png) | ![Telerik Document Processing RadSpreadProcessing stacked bar chart](images/SpreadProcessing-Features-Charts_5.png) | ![Telerik Document Processing RadSpreadProcessing 100 percent stacked bar chart](images/SpreadProcessing-Features-Charts_6.png)|



### Line Charts

The line chart shows the category data distributed on the horizontal axis and all the values distributed along the vertical axis. With this type of chart you can visualize continuous data over time on an evenly scaled axis. It is helpful when you need to show trends in data at equal intervals, such as months, years, or other periods.


| Clustered line          | Stacked line   | 100% stacked line   |
| ----------------------- |:--------------:| -------------------:|
| ![Telerik Document Processing RadSpreadProcessing clustered line chart](images/SpreadProcessing-Features-Charts_7.png) | ![Telerik Document Processing RadSpreadProcessing stacked line chart](images/SpreadProcessing-Features-Charts_8.png) | ![Telerik Document Processing RadSpreadProcessing 100 percent stacked line chart](images/SpreadProcessing-Features-Charts_9.png)|

### Scatter and Bubble Charts

Scatter and bubble charts provide you with a convenient way to display a lot of related data in a single chart. In scatter charts, the x-axis displays one numeric field and the y-axis displays another. This type of plotting makes it easy to see the relationship between the two values for all the items in the chart.

In a bubble chart, a third numeric field determines the size of the data points represented as bubbles.

| Scatter     | Bubble    | 
| ----------- |:----------| 
| ![Telerik Document Processing RadSpreadProcessing scatter chart](images/SpreadProcessing-Features-Charts_19.png) | ![Telerik Document Processing RadSpreadProcessing bubble chart](images/SpreadProcessing-Features-Charts_18.png) |

### Pie and Doughnut Charts

Pie charts are useful for comparing the values of different points in a single series. The data points in a pie chart appear as a percentage of the whole pie. The doughnut chart is identical to the pie chart. However, it can contain more than a single series and can be visualized with a hole in the middle of the shape.


| Pie         | Doughnut  | 
| ----------- |:----------| 
| ![Telerik Document Processing RadSpreadProcessing pie chart](images/SpreadProcessing-Features-Charts_10.png) | ![Telerik Document Processing RadSpreadProcessing doughnut chart](images/SpreadProcessing-Features-Charts_11.png) |



### Area Charts

Area charts can be used to plot change over time and draw attention to the total value across a trend. The area chart shows the sum of the plotted values as well, and it visualizes how the different parts contribute to the end result of the data.

| Clustered area          | Stacked area   | 100% stacked area   |
| ----------------------- |:--------------:| -------------------:|
| ![Telerik Document Processing RadSpreadProcessing clustered area chart](images/SpreadProcessing-Features-Charts_12.png) | ![Telerik Document Processing RadSpreadProcessing stacked area chart](images/SpreadProcessing-Features-Charts_13.png) | ![Telerik Document Processing RadSpreadProcessing 100 percent stacked area chart](images/SpreadProcessing-Features-Charts_14.png)|



### Combo Charts

Combo charts combine two or more chart types to make the data easy to understand. The secondary axis makes reading the data even easier.

| Clustered column and Line| Line and Area  |Doughnut and line    |
| ------------------------ |:--------------:| -------------------:|
| ![Telerik Document Processing RadSpreadProcessing clustered column and line combo chart](images/SpreadProcessing-Features-Charts_15.png) | ![Telerik Document Processing RadSpreadProcessing line and area combo chart](images/SpreadProcessing-Features-Charts_16.png) | ![Telerik Document Processing RadSpreadProcessing doughnut and line combo chart](images/SpreadProcessing-Features-Charts_17.png)|

>note For more details on the implementation of the charts and the properties you can use with them, check the [Using Charts]({%slug radspreadprocessing-features-charts-using-charts%}) topic.

## See Also

* [Generating Stacked Line Charts and Configuring Axes in Excel Using FloatingChartShape]({%slug generating-stacked-line-charts-configuring-axes-excel-floatingchartshape%})
* [SpreadProcessing Chart Generation Demo](https://demos.telerik.com/document-processing/spreadprocessing/charts)

