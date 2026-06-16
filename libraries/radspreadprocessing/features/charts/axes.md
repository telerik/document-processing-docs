---
title: Axes
description: Learn how to configure the primary and secondary axes of charts in RadSpreadProcessing spreadsheet documents.
page_title: Axes
slug: radspreadprocessing-features-charts-axes
tags: axes, charts, spreadsheet, radspreadprocessing, primary, secondary, configuration, excel, spread, xlsx
published: True
position: 5
platforms: ajax, mvc, wpf, winforms
---

# Axes

## Axis Object and Its Properties

The axes of the chart are contained in two objects of type `AxisGroup`. You can access the two collections through the `PrimaryAxes` and `SecondaryAxes` properties of the `DocumentChart` object. Each of the collections contains two axes, stored in the `CategoryAxis` and `ValueAxis` properties. The `PrimaryAxes` property is populated on creation when the constructor of `FloatingChartShape` or the `Add()` method of the `ChartCollection` are used, and you can replace or edit it as desired.

If the `SeriesGroup` object implements the `ISupportAxes` interface, it can indicate whether it is associated with the **Primary** or **Secondary** couple of axes. For example, the bar and line chart groups implement the interface, while the pie group does not. The `ISupportAxes` interface defines one property: `AxisGroupName`, of type `AxisGroupName`. The `AxisGroupName` enum has two members: `Primary` and `Secondary`.

Refer to the scenario from **Figure 1**. The chart shown there has two axes: a date (horizontal, category) axis and a value (vertical, value) axis. The respective objects can be found in the `PrimaryAxes` property of the chart. The `BarSeriesGroup` object `AxisGroupName` property has value `AxisGroupName.Primary`. The properties of the axes are listed in **Example 1**.

**Figure 1: Sample Data**

![Sample data for chart axes](images/SpreadProcessing-Features-Charts-Axes_1.png)

**Example 1: Axes Properties**

<snippet id='codeblock-clh'/>

## Changing the Axis of a Chart

RadSpreadProcessing allows you to replace the axis of a chart with a new object. This is achieved through the `PrimaryAxes` and `SecondaryAxes` properties of `DocumentChart`.

**Example 2: Replace Axis**

<snippet id='codeblock-cli'/>


## Changing the Appearance of the Axes

You can customize the way the axes in the chart look. The API of SpreadProcessing enables you to change the fill and width of the outline of an axis and its major gridlines.

**Example 3: Customize the Major Gridlines and Outline of an Axis**

<snippet id='codeblock-clj'/>

**Figure 2: Custom Appearance**

![Custom axis appearance](images/SpreadProcessing-Features-Charts-Axes_3.png)