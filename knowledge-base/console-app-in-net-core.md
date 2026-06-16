---
title: Console app with .Net Core
description: Find out the references you need to use when creating a .NET Core app with Telerik Document Processing.
type: troubleshooting
page_title: Console app with .Net Core
slug: console-app-with.net-core
position: 0
tags: dotnet, console, netcore, references, document, processing, assembly, packages
res_type: kb
---

## Environment

|Product Version|Product|Author|
|----|----|----|
|2020.1.218|Telerik Document Processing for .NET Core|[Dimitar Karamfilov](https://www.telerik.com/blogs/author/dimitar-karamfilov)|

## Description

You need to create a console application using the latest .NET Core version. The assemblies for WPF or WinForms do not work because they depend on assemblies available in the Desktop compatibility pack. You may get an exception that the `PresentationCore` or `System.Windows.Size` assemblies are missing.

## Solution

When you need to create a console application, reference the .NET Standard assemblies. They do not depend on the Windows types. The .NET Standard assemblies do not have the word "Windows" in their names. They are also available as [NuGet packages]({%slug available-nuget-packages%}).

## See Also

* [Available NuGet Packages]({%slug available-nuget-packages%})

