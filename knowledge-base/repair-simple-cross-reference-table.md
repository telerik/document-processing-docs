---
title: Repair Simple Cross-Reference Table 
description: Repair Simple Cross-Reference Table
type: how-to
page_title: Repair Simple Cross-Reference Table
slug: repair-simple-cross-reference-table
position: 0
tags: 
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
		<td>2020.1.316</td>
		<td>RadPdfProcessing</td>
		<td>[Martin Velikov](https://www.telerik.com/blogs/author/martin-velikov)</td>
	</tr>
</tbody>
</table>

## Description

How to repair a **PDF** document with invalid **Cross-Reference**(**XREF**) table offset. 

## Solution

The provided code snippets demonstrates how to repair an invalid XREF table offset by using the **RepairDocumentWithSimpleCrossReferenceTable** method.

> The provided solution, however, can handle only simple cases in which the document contains a single XREF table.

```` C#
RadFixedDocument document;

string filePath = "add-the-path-to-your-file";

using (Stream originalFile = File.OpenRead(filePath))
{
	MemoryStream repairedDocument = this.RepairDocumentWithSimpleCrossReferenceTable(originalFile);
	using (repairedDocument)
	{
		document = new PdfFormatProvider().Import(repairedDocument);
	}
}
````

```` C#
public MemoryStream RepairDocumentWithSimpleCrossReferenceTable(Stream corruptedPdfFile)
{
	string xrefKeyword = "xref";
	long xrefIndex = corruptedPdfFile.IndexOf(xrefKeyword);
	corruptedPdfFile.Seek(0, SeekOrigin.Begin);
	MemoryStream repairedDocument = new MemoryStream();
	corruptedPdfFile.CopyTo(repairedDocument);

	corruptedPdfFile.Seek(xrefIndex, SeekOrigin.Begin);
	corruptedPdfFile.ReadLine();
	string line = corruptedPdfFile.ReadLine();
	string[] tokens = line.Split(' ');
	string secondToken = tokens[1].Trim();
	int numberOfObjects = int.Parse(secondToken);
	corruptedPdfFile.ReadLine();
	long nextLinePosition = corruptedPdfFile.Position;

	for (int pdfId = 1; pdfId < numberOfObjects; pdfId++)
	{
		repairedDocument.Seek(nextLinePosition, SeekOrigin.Begin);
		long pdfOffset = corruptedPdfFile.IndexOf(string.Format("{0} 0 obj", pdfId));
		repairedDocument.Write(string.Format("{0} 00000 n", pdfOffset.ToString().PadLeft(10, '0')));

		corruptedPdfFile.Seek(nextLinePosition, SeekOrigin.Begin);
		corruptedPdfFile.ReadLine();
		nextLinePosition = corruptedPdfFile.Position;
	}

	long startXrefPosition = corruptedPdfFile.IndexOf("startxref");
	corruptedPdfFile.Seek(startXrefPosition, SeekOrigin.Begin);
	corruptedPdfFile.ReadLine();
	long xrefOffsetPosition = corruptedPdfFile.Position;
	string corruptedOffset = corruptedPdfFile.ReadLine();
	repairedDocument.Seek(xrefOffsetPosition, SeekOrigin.Begin);
	repairedDocument.Write(xrefIndex.ToString().PadRight(corruptedOffset.Length));

	return repairedDocument;
}
````

```` C#
public static class PdfStreamExtensions
{
	private const byte LineFeed = (byte)'\n';
	private const byte CarriageReturn = (byte)'\r';
	private static readonly Encoding PdfEncoding = Encoding.UTF8;

	public static void Write(this Stream stream, string text)
	{
		byte[] bytes = PdfEncoding.GetBytes(text);
		stream.Write(bytes, 0, bytes.Length);
	}

	public static long IndexOf(this Stream stream, string text)
	{
		byte[] bytes = PdfEncoding.GetBytes(text);

		return stream.IndexOf(bytes);
	}

	public static long IndexOf(this Stream stream, byte[] byteSequence)
	{
		stream.Seek(0, SeekOrigin.Begin);

		int byteSequenceIndexToCheck = 0;

		while (!IsEndOfStream(stream))
		{
			byte b = (byte)stream.ReadByte();

			if (b.Equals(byteSequence[byteSequenceIndexToCheck]))
			{
				byteSequenceIndexToCheck++;
			}
			else if (byteSequenceIndexToCheck != 0)
			{
				stream.Seek(-byteSequenceIndexToCheck, SeekOrigin.Current);
				byteSequenceIndexToCheck = 0;
			}

			if (byteSequenceIndexToCheck == byteSequence.Length)
			{
				long oldPosition = stream.Position;
				stream.Seek(-(byteSequence.Length + 1), SeekOrigin.Current);
				byte previousByte = (byte)stream.ReadByte();
				stream.Seek(oldPosition , SeekOrigin.Begin);

				if (previousByte == 10 || previousByte == 13 || previousByte == 20)
				{
					break;
				}
				else
				{
					byteSequenceIndexToCheck = 0;
				}
			}
		}

		if (byteSequenceIndexToCheck == byteSequence.Length)
		{
			long startPosition = stream.Position - byteSequenceIndexToCheck;

			return startPosition;
		}
		else
		{
			return -1;
		}
	}

	public static string ReadLine(this Stream stream)
	{
		StringBuilder stringBuilder = new StringBuilder();
		byte b;
		while (!IsEndOfStream(stream) && !IsLineFeed(b = (byte)stream.ReadByte()))
		{
			if (b != CarriageReturn)
			{
				stringBuilder.Append((char)b);
			}
			else if (!IsEndOfStream(stream) && !IsLineFeed(b = stream.Peek()))
			{
				break;
			}
		}

		return stringBuilder.ToString();
	}

	public static byte Peek(this Stream stream)
	{
		byte b = (byte)stream.ReadByte();
		stream.Seek(-1, SeekOrigin.Current);

		return b;
	}

	private static bool IsLineFeed(byte b)
	{
		return b == LineFeed;
	}

	private static bool IsEndOfStream(Stream stream)
	{
		return stream.Position >= stream.Length;
	}
}
````
