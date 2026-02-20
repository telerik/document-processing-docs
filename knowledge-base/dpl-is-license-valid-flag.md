---
title: Why Does the IsLicenseValid Flag Return False
description: Learn how to check the license at runtime for Telerik Document Processing and understand scenarios where `IsLicenseValid` returns false.
type: how-to
page_title: Why Does the IsLicenseValid Flag Return False
meta_title: Why Does the IsLicenseValid Flag Return False
slug: verify-license-runtime-telerik-document-processing
tags: licensing, telerik, document, processing, runtime, license, valid, check, diagnostic, islicensevalid
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

The TelerikLicensing.License method has several overloads accepting different parameters. If you call the License() method without passing any arguments, it checks the entry assembly of your project (e.g. console application) which explains the false result. However, you can pass a Telerik assembly explicitly to the `License` method to check the license validity for this particular assembly. For example:

```csharp
using Telerik.Windows.Documents.Fixed;

Assembly fixedAssembly = typeof(RadFixedDocument).Assembly;
var license = Telerik.Licensing.TelerikLicensing.License(fixedAssembly);
bool isValid = license.IsLicenseValid;
```
Thus, if the [license is properly setup]({%slug setting-up-license-key%}), the `IsLicenseValid` flag is expected to return `true`.

## See Also

- [Runtime Licensing Diagnostics]({%slug runtime-licensing-diagnostics%})
