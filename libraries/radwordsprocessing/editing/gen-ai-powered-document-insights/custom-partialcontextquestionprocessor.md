---
title: Custom PartialContextQuestionProcessor
description: Customize the PartialContextQuestionProcessor by providing a custom IContextRetriever and interface implementations for fragmentation, embedding, similarity, token counting, and retrieval.
page_title: Custom PartialContextQuestionProcessor
slug: radwordsprocessing-features-gen-ai-powered-document-insights-custom-partialcontextquestionprocessor
tags: customization, genai, word, flow, docx, embeddings, retriever, ai, tokenizer, document
published: True
position: 6
---

# Custom PartialContextQuestionProcessor

This article explains how to create a custom `PartialContextQuestionProcessor` configuration by supplying your own `IContextRetriever` and related interface implementations. You can tailor every step—text splitting, embedding production, relevance ranking, token limit enforcement, context formatting, and retrieval—to optimize performance, cost, accuracy, or compliance.

When you need full control over fragmentation, embedding, similarity ranking, and retrieval, use the constructor that accepts an `IContextRetriever`:

```csharp
PartialContextQuestionProcessor(
    IChatClient chatClient,
    IContextRetriever contextRetriever,
    IEmbeddingSettings settings,
    SimpleTextDocument document)
```

This constructor gives you end-to-end control over how the pipeline fragments, embeds, stores, and selects document text as context for a question.

## Interfaces

All extension points live in `Telerik.Documents.AI.Core` (as abstractions) with their default implementations in `Telerik.Documents.AI.RAG`:

| Interface | Responsibility | Used By |
|---|---|---|
| `IContextFragmentsManager` | Splits raw document text into token-bounded semantic fragments (pages, sections, paragraphs) | Fragmentation stage |
| `IEmbedder` | Converts fragments into embeddings/vectors for similarity comparison | Embedding stage |
| `ISimilarityCalculator` | Scores fragment relevance against a question/prompt | Ranking stage |
| `ITokensCounter` | Counts tokens for limits enforcement (fragment size, total context) | Throughout pipeline |
| `IEmbeddingSettings` | Provides token and size limits plus formatting hints | Configuration source |
| `IContextRetriever` | Orchestrates loading text, preparing embeddings, and returning best context | Retrieval stage |
| `ISupportJsonEmbeddings` / `ISupportPlainTextEmbeddings` | Controls how context is formatted for the model (JSON versus plain text) | Formatting stage |
| `IFragments` / `IFragment` | Data structures representing chunk collections and individual chunks | Shared across stages |

### Life Cycle

1. **`SetContextAsync(text, embeddingTokenSize)`**—The `IContextFragmentsManager` fragments the text, `ITokensCounter` checks tokens, and `IEmbedder` generates and stores embeddings.
2. **`GetContextAsync(question)`**—The `ISimilarityCalculator` computes similarity scores, selects top fragments within limits, and formats context (plain text or JSON).
3. The processor sends the formatted context and the question through `IChatClient` and returns the model answer.

## Custom Implementation

The following example constructs a custom `PartialContextQuestionProcessor` by supplying a `DefaultContextRetriever` that mixes user implementations (custom `IContextFragmentsManager` and `IEmbedder`) with default components (`DefaultSimilarityCalculator`, `DefaultTokensCounter`, and the retriever's own orchestration). This hybrid approach lets you optimize the most impactful stages (fragmentation and embedding) without the need to rewrite the entire retrieval pipeline.

>note The `DefaultEmbedder` is only available on **net8-windows** and higher. On other target frameworks you must supply your own `IEmbedder` (as shown with [CustomOpenAIEmbedder]({%slug radwordsprocessing-features-gen-ai-powered-document-insights-partial-context-question-processor%}#implementing-custom-iembedder)).

**Example 1: Create a DefaultContextRetriever with custom fragmentation and embedding components before constructing PartialContextQuestionProcessor**

<snippet id='libraries-flow-features-gen-ai-custom-partial-processor'/>

## See Also

* [PartialContextQuestionProcessor]({%slug radwordsprocessing-features-gen-ai-powered-document-insights-partial-context-question-processor%})
* [SummarizationProcessor]({%slug radwordsprocessing-features-gen-ai-powered-document-insights-summarization-processor%})
* [CompleteContextQuestionProcessor]({%slug radwordsprocessing-features-gen-ai-powered-document-insights-complete-context-question-processor%})
* [GenAI-powered Document Insights Overview]({%slug radwordsprocessing-features-gen-ai-powered-document-insights-overview%})