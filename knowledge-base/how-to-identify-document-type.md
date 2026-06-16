---
title: How to identify the actual document type when the filename extension is not correct
description: Learn how to identify the actual document type when the filename extension is incorrect and determine the appropriate format provider for import.
type: how-to
page_title: How to identify the actual document type when the filename extension is not correct 
slug: how-to-identify-document-type
position: 0
tags: fileformatdetector, document, format, detection, file, processing, telerik, extension
res_type: kb
---

<table>
<thead>
	<tr>
		<th>Product Version</th>
		<th>Product</th>
		<th>Author</th>
	</tr>
</thead>
<tbody>
	<tr>
		<td>2022.1.217</td>
		<td>WordsProcessing</td>
		<td><a href="https://www.telerik.com/blogs/author/martin-velikov">Martin Velikov</a></td>
	</tr>
</tbody>
</table>

## Description

This article describes how to identify the actual document type when the filename extension is incorrect. Identifying the document type helps you determine the appropriate format provider.

## Solution

The following example demonstrates how to read two documents with ".doc" filename extensions that have different actual document types. The [`StringBuilder`](https://learn.microsoft.com/en-us/dotnet/api/system.text.stringbuilder?view=net-6.0) class creates the document signature (header) string. You can then compare the signature with predefined values to determine which format provider to use for importing the document.

**Example 1: Identify Document Type by File Signature**

```csharp

	List<byte[]> documents = new List<byte[]>();
	documents.Add(File.ReadAllBytes("rtf.doc"));
	documents.Add(File.ReadAllBytes("doc.doc"));

	foreach (byte[] document in documents)
	{
		string headerCode = GetHeaderInfo(document).ToUpper();

		//! The signatures are taken from: https://www.filesignatures.net/index.php?page=search
		if (headerCode.StartsWith("7B5C72746631"))
		{
			//! The document is RTF
			RtfFormatProvider rtfFormatProvider = new RtfFormatProvider();
			RadFlowDocument rtfDocument = rtfFormatProvider.Import(new MemoryStream(document));
		}
		else if (headerCode.StartsWith("D0CF11E0A1B11AE1"))
		{
			//! The document is DOC
			DocFormatProvider docFormatProvider = new DocFormatProvider();
			RadFlowDocument docDocument = docFormatProvider.Import(document);
		}
	}
```

**Example 2: Get Document Header**

```csharp

	private static string GetHeaderInfo(byte[] documentData)
	{
		byte[] buffer = documentData.Take(8).ToArray();

		StringBuilder sb = new StringBuilder();
		foreach (byte b in buffer)
		{
			sb.Append(b.ToString("X2"));
		}

		return sb.ToString();
	}
```

## See Also

* [Getting Started with Telerik Document Processing]({%slug getting-started%})
