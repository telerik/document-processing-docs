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

ExpandableMemoryStream is a segmented in-memory stream designed for efficient large or parallel PDF operations. Instead of resizing a single contiguous array like a **MemoryStream**, it grows by adding fixed-size blocks as needed—avoiding costly reallocations and Large Object Heap (LOH) pressure. Each block remains untouched once filled, so data isn’t copied during expansion. This block-based approach keeps allocations small and predictable, reduces GC overhead, and supports very large or bursty workloads. When growing, new cleared blocks are appended. When shrinking, only the visible length changes, allowing future reuse of existing memory without additional allocations.

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
