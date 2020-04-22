---
title: Console app with .Net Core
description: Console app with .Net Core
type: troubleshooting
page_title: Console app with .Net Core
slug: console-app-with.net-core
position: 0
tags:  console, net, core
res_type: kb
---

|Product Version|Product|Author|
|----|----|----|
|2020.1.218|Telerik Document Processing for .Net Core|[Dimitar Karamfilov](https://www.telerik.com/blogs/author/dimitar-karamfilov)|

## Problem  

You need to create a console application using the latest .Net Core version. In this case the assemblies for WPF or WinForms would not work because they depend on assemblies available in the Desktop compatibility pack. You may get an exception that the **PresentationCore** or **System.Windows.Size** assemblies are missing as well.  
 

## Solution

When you need to create a console application, reference the .Net Standard assemblies. They do not depend on the Windows types. The .Net standard assemblies do not have the word Windows in their names. They are available as: [NuGet packages](https://docs.telerik.com/devtools/document-processing/getting-started/Installation/nuget-packages)

