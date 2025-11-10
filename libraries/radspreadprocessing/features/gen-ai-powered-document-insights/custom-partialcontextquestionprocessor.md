---
title: Custom PartialContextQuestionProcessor
description: Customize the PartialContextQuestionProcessor by providing a custom IContextRetriever and interface implementations for fragmentation, embedding, similarity, token counting, and retrieval.
page_title: Custom PartialContextQuestionProcessor
slug: radspreadprocessing-features-gen-ai-powered-document-insights-custom-partialcontextquestionprocessor
tags: ai, context, retriever, embeddings, customization, spread, document, partial, processor, question, insights, xlsx, excel, workbook
published: True
position: 6
---

# Custom PartialContextQuestionProcessor

This article explains how to create a custom **PartialContextQuestionProcessor** configuration by supplying your own **IContextRetriever** and related interface implementations. You can tailor every step: splitting text, producing embeddings, ranking relevance, enforcing token limits, formatting context, and retrieving it efficiently to optimize performance, cost, accuracy, or compliance.

When you need full control over fragmentation, embedding, similarity ranking, and retrieval, use the constructor that accepts an **IContextRetriever**:

```csharp
PartialContextQuestionProcessor(
    IChatClient chatClient,
    IContextRetriever contextRetriever,
    IEmbeddingSettings settings,
    SimpleTextDocument document)
```

This constructor gives you end‑to‑end control over how document text is fragmented, embedded, stored, and later selected (ranked) as context for a question, forming your custom **PartialContextQuestionProcessor** pipeline.

## Interfaces

All extension points live in **Telerik.Documents.AI.Core** (as abstractions) with their default implementations in **Telerik.Documents.AI.RAG**:

| Interface | Responsibility | Used By |
|---|---|---|
| **IContextFragmentsManager** | Splits raw document text into token-bounded semantic fragments (pages, sections, paragraphs) | Fragmentation stage |
| **IEmbedder** | Converts fragments into embeddings/vectors for similarity comparison | Embedding stage |
| **ISimilarityCalculator** | Scores fragment relevance against a question/prompt | Ranking stage |
| **ITokensCounter** | Counts tokens for limits enforcement (fragment size, total context) | Throughout pipeline |
| **IEmbeddingSettings** | Provides token & size limits + formatting hints | Configuration source |
| **IContextRetriever** | Orchestrates loading text, preparing embeddings, and returning best context | Retrieval stage |
| **ISupportJsonEmbeddings** / **ISupportPlainTextEmbeddings** | Control how context is formatted for the model (JSON vs plain text) | Formatting stage |
| **IFragments** / **IFragment** | Data structures representing chunk collections and individual chunks | Shared across stages |

### Life Cycle
1. **SetContextAsync(text, embeddingTokenSize)** - Text is fragmented (**IContextFragmentsManager**), tokens checked (**ITokensCounter**), embeddings generated (**IEmbedder**), and stored.
2. Question time (**GetContextAsync(question)**) - Similarity scores computed (**ISimilarityCalculator**), top fragments selected within limits, context formatted (plain or JSON).
3. Processor sends formatted context + question via **IChatClient** and returns model answer.

## Custom Implementation

The example below constructs a custom **PartialContextQuestionProcessor** by supplying a **DefaultContextRetriever** that mixes user implementations (custom **IContextFragmentsManager** and **IEmbedder**) with default components (**DefaultSimilarityCalculator**, **DefaultTokensCounter**, and the retriever's own orchestration). This hybrid approach lets you optimize the most impactful stages (fragmentation + embedding) without rewriting the entire retrieval pipeline.

>note **DefaultEmbedder** is only available on **net8-windows** and higher. On other target frameworks you must supply your own **IEmbedder** (as shown below with [CustomOpenAIEmbedder]({%slug radspreadprocessing-features-gen-ai-powered-document-insights-partial-context-question-processor%}#implementing-custom-iembedder)).
<snippet id='libraries-spread-features-gen-ai-custom-partial-processor'/>

## See Also
* [PartialContextQuestionProcessor]({%slug radspreadprocessing-features-gen-ai-powered-document-insights-partial-context-question-processor%})
* [SummarizationProcessor]({%slug radspreadprocessing-features-gen-ai-powered-document-insights-summarization-processor%})
* [CompleteContextQuestionProcessor]({%slug radspreadprocessing-features-gen-ai-powered-document-insights-complete-context-question-processor%})
* [GenAI-powered Document Insights Overview]({%slug radspreadprocessing-features-gen-ai-powered-document-insights-overview%})