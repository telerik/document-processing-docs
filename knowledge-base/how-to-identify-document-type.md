---
title: How to identify the actual document type when the filename extension is not correct
description: This knowledge base article describes how to identify the actual document type when the filename extension is not correct 
type: how-to
page_title: How to identify the actual document type when the filename extension is not correct 
slug: how-to-identify-document-type
position: 0
tags: processing, file, filename, extension, incorrect
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

This article describes how to identify the actual document type when the filename extension is incorrect which helps us to determine the appropriate format provider.

## Solution

The following example demonstrates how to read two documents with ".doc" filename extensions but actually different document types. Using the [`StringBuilder`](https://docs.microsoft.com/en-us/dotnet/api/system.text.stringbuilder?view=net-6.0) class we are creating the document signature (header) string, which later to compare with predefined values.
Once having the right document type we can determine which format provider to use to import the document.

#### __[C#] Example__

{{region how-to-identify-document-type1}}

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
{{endregion}}

#### __[C#] Getting document header__
{{region how-to-identify-document-type1}}

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
{{endregion}}
