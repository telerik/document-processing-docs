---
title: ExpandableMemoryStream 
page_title: ExpandableMemoryStream
description: Learn about the segmented, dynamically growing in-memory stream implementation used for large PDF processing scenarios.
slug: radpdfprocessing-formats-and-conversion-pdf-expandablememorystream
tags: pdf, memory, performance, stream, fixed, document, processing, dpl, format, expandablememorystream, large, file, size
published: True
position: 3
---

# ExpandableMemoryStream

ExpandableMemoryStream is a specialized in-memory stream built to handle demanding PDF workloads that involve large data volumes or concurrent operations. It provides a scalable alternative to traditional memory buffers by managing data growth in a controlled, efficient way. Instead of relying on a single expanding array, it uses an internal structure that minimizes memory churn and maintains stable performance even under heavy or unpredictable load.

## Why a Segmented Approach

Large PDF generation often needs a temporary buffer. A normal contiguous array may reallocate and copy data multiple times as it expands, increasing CPU work, peak memory, and pressure on the Large Object Heap (LOH). Avoiding large contiguous allocations lowers fragmentation, reduces garbage collection pauses, and scales better when size is unpredictable or workloads are bursty.

## How It Works

Data lives in equal‑sized blocks held in order. When more space is required a single new block is allocated, earlier blocks stay untouched. A position maps to (block index, offset). Growing exposes cleared bytes ready for writing. Shrinking lowers only the visible length and retains the blocks so later growth can reuse already allocated memory without new large allocations.

## When to Use

Use it when you need to:

- Build or merge large PDFs fully in memory before saving.
- Combine many pieces where the final size is unknown.
- Run multiple document builds in parallel and want steady, predictable allocations.
- Seek and rewrite parts of the buffered content without triggering array growth copies.

## Example

The following example shows two common ways to load a large PDF document into memory before further processing. The first approach constructs the stream directly from a byte array and passes an explicit segment size (bufferSize). The second approach creates an empty instance and copies a file stream into it. The constructor's second parameter (bufferSize) is optional and defaults to 1,000,000 bytes (1 MB). You can omit it unless you want a different segment size.

<snippet id='libraries-pdf-formats-and-conversion-expandablememorystream-implementation'/>

In both cases the segmented internal structure avoids reallocating a single large contiguous buffer, helping performance and memory stability for very large PDF files.

## See Also

* [PdfFormatProvider]({%slug radpdfprocessing-formats-and-conversion-pdf-pdfformatprovider%})
* [RadFixedDocument]({%slug radpdfprocessing-model-radfixeddocument%})
