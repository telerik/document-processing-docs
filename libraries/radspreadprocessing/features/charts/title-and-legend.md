---
title: Title and Legend
description: Learn how to configure the title and legend of charts in RadSpreadProcessing spreadsheet documents.
page_title: Title and Legend
slug: radspreadprocessing-features-charts-title-and-legend
tags: chart, legend, charts, spreadsheet, radspreadprocessing, title, legend, configuration, excel, spread, xlsx
published: True
position: 6
platforms: ajax, mvc, wpf, winforms
---

# Chart Title and Legend

You can manipulate the legend and the title of a chart.

## Title

You can access and set the **Title** property of the **DocumentChart** object, which is of type **Title**. The Title property is exposed in both, DocumentChart and SeriesBase classes. Similar to the series of the chart, the title can be a simple *string* value or a reference to data. The reference is not to a CellIndex, but to a CellRange and if the CellRange contains more than one cell, the values of the cells are concatenated.

#### Example 1: Setting the title of a chart to a string

<snippet id='codeblock-clv'/>


#### Example 1: Setting the title of a series to a CellRange

<snippet id='codeblock-clw'/>

#### Figure 1: Chart title
![](images/SpreadProcessing-Features-ChartTitle_1.png)


## Legend

The charts use a legend to help users to understand the data plotted on the chart. 

The legend of the chart can be added or edited through the **Legend** property of the **DocumentChart** object. The property is of type **Legend**. The **Legend** type contains one property: **LegendPosition** of type **LegendPosition**, which is an enumeration with four members: **Top**, **Bottom**, **Left** and **Right**. The actual entries of the legend are constructed by the titles of the series.

#### Example 3: Adding a chart legend
<snippet id='codeblock-clx'/>

#### Figure 2: Chart legend
![](images/SpreadProcessing-Features-ChartLegend_1.png)