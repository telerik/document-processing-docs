---
title: Axes
page_title: Axes
description: Axes
slug: radspreadprocessing-features-charts-axes
tags: chart, axes, axis
published: True
position: 5
platforms: ajax, mvc, wpf, winforms
---

# Working with Axes

## Axis Object and Their Properties

The axes of the chart are contained in two objects of type **AxisGroup**. The two collections can be accessed by the **PrimaryAxes** and **SecondaryAxes** properties of the **DocumentChart** object. Each of the collections contains two axes, contained in the **CategoryAxis** and **ValueAxis** properties. The **PrimaryAxes** property is populated on creation when the constructor of **FloatingChartShape** or the **AddChart()** methods of the **ShapeCollection** are used  and can be replaced or edited as desired.

If the **SeriesGroup** object implements the **ISupportAxes** interface, it can indicate whether it is associated with the **Primary** or **Secondary** couple of axes. For example, the bar and line chart groups implement the interface, while the pie group does not. The **ISupportAxes** interface defines one property: **AxisGroupName**, of type **AxisGroupName**. The AxisGroupName enum has two members: **Primary** and **Secondary**. 


Refer to the scenario from **Figure 1**. The chart shown there has two axes: a date (horizontal, category) axis and a value (vertical, value) axis. The respective objects can be found in the **PrimaryAxes** property of the chart.  The **BarSeriesGroup** object **AxisGroupName** property has value *AxisGroupName.Primary*. The properties of the axes are listed in **Example 1**.

#### Figure 1: Sample data
![](images/SpreadProcessing-Features-Charts-Axes_1.png)

#### [C#] Example 1: Axes properties
{{region radspreadprocessing-features-charts-axes_0}}

	DocumentChart chart = new FloatingChartShape(worksheet, new CellIndex(0,0), new CellRange(1, 1, 5, 2), ChartType.Column).Chart;
	
	DateAxis dateAxis = chart.PrimaryAxes.CategoryAxis as DateAxis;
	ValueAxis valAxis = chart.PrimaryAxes.ValueAxis as ValueAxis;
	
	ISupportAxes chartComponentWithAxes = chart.SeriesGroups.First() as ISupportAxes;
	AxisGroupName axisGroup = chartComponentWithAxes.AxisGroupName; // Primary
	
	bool dateIsVisible = dateAxis.IsVisible; // true
	bool valIsVisible = valAxis.IsVisible; // true
	
	double? dateMin = dateAxis.Min; // 1
	double? dateMax = dateAxis.Max; // 4
	
	double? valMin = valAxis.Min; // 0
	double? valMax = valAxis.Max; // 1800

{{endregion}}

## Changing the Axis of a Chart

RadSpreadProcessing allows you to replace the axis of a chart with a new object. This is achieved through the **PrimaryAxes** and **SecondaryAxes** properties of **DocumentChart**.

#### [C#] Example 2: Replace axis 
{{region radspreadprocessing-features-charts-axes_1}}
	
	DocumentChart chart = new FloatingChartShape(worksheet, new CellIndex(0, 0), new CellRange(1, 1, 5, 2), ChartType.Column).Chart;
	chart.PrimaryAxes.CategoryAxis = new DateAxis();
{{endregion}}

