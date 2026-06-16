---
title: Why Does the IsLicenseValid Flag Return False
description: Learn how to check the license at runtime for Telerik Document Processing and understand scenarios where the IsLicenseValid property returns false.
type: how-to
page_title: Why Does the IsLicenseValid Flag Return False
meta_title: Why Does the IsLicenseValid Flag Return False
slug: verify-license-runtime-telerik-document-processing
tags: licensing, telerik, document, processing, runtime, diagnostics, validation, islicensevalid
res_type: kb
ticketid: 1710169
---

## Environment

| Version | Product | Author | 
| ---- | ---- | ---- | 
| 2026.1.210| Telerik Document Processing|[Desislava Yordanova](https://www.telerik.com/blogs/author/desislava-yordanova)| 

## Description

When using the `TelerikLicensing.License()` method, the `IsLicenseValid` flag may consistently return `false` even though the license is handled correctly.

## Solution

The `TelerikLicensing.License` method has several overloads that accept different parameters. If you call the `License()` method without passing any arguments, it checks the entry assembly of your project (for example, a console application). This explains the `false` result. You can pass a Telerik assembly explicitly to the `License` method to check the license validity for that particular assembly. For example:

```csharp
using Telerik.Windows.Documents.Fixed;

Assembly fixedAssembly = typeof(RadFixedDocument).Assembly;
var license = Telerik.Licensing.TelerikLicensing.License(fixedAssembly);
bool isValid = license.IsLicenseValid;
```
If the [license is properly set up]({%slug setting-up-license-key%}), the `IsLicenseValid` flag returns `true`.

## See Also

* [Runtime Licensing Diagnostics]({%slug runtime-licensing-diagnostics%})
