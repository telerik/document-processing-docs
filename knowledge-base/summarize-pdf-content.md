---
title: Summarizing the Text Content of PDF Documents using Text Analytics with Azure AI services
description: Learn how to summarize the text content from a PDF document using RadPdfProcessing and Text Analytics with Azure AI services.
type: how-to
page_title: How to Summarize the Text Content of PDF documents using Text Analytics with Azure AI services
slug: summarize-pdf-content
tags: pdf, document, processing, text, summarize,, summary, content, azure 
res_type: kb
ticketid: 1657503
---

## Environment

| Version | Product | Author | 
| ---- | ---- | ---- | 
| 2025.1.128| RadPdfProcessing |[Desislava Yordanova](https://www.telerik.com/blogs/author/desislava-yordanova)| 

## Description

Learn how to summarize the text content of a PDF document using [Text Analytics with Azure AI services](https://learn.microsoft.com/en-us/azure/synapse-analytics/machine-learning/tutorial-text-analytics-use-mmlspark).

## Solution

Follow the steps:

1\. Before going further, you can find listed below the **required** assemblies/ NuGet packages that should be added to your project:

* [Azure.AI.TextAnalytics](https://www.nuget.org/packages/Azure.AI.TextAnalytics)
* Telerik.Documents.Fixed
* Telerik.Documents.Core
* Telerik.Zip

2\.  It is necessary to generate your Azure AI key and endpoint: [Get your credentials from your Azure AI services resource](https://learn.microsoft.com/en-us/azure/ai-services/use-key-vault?tabs=azure-cli&pivots=programming-language-csharp)

![Azure AI key](images/azure-ai-key.png)  

3\. Use the custom implementation to summarize the text content extracted in step 1:

```csharp
        static void Main(string[] args)
        {
            Telerik.Windows.Documents.Fixed.FormatProviders.Pdf.PdfFormatProvider pdf_provider = new PdfFormatProvider();
            Telerik.Windows.Documents.Fixed.FormatProviders.Text.TextFormatProvider text_provider = new TextFormatProvider();
            Telerik.Windows.Documents.Fixed.Model.RadFixedDocument document = pdf_provider.Import(File.ReadAllBytes("PdfDocument.pdf"), TimeSpan.FromSeconds(10));
            string documentTextContent = text_provider.Export(document);

            AzureTextSummarizationProvider summarizationProvider = new AzureTextSummarizationProvider(azure_key, azure_endpoint);
            string summary = summarizationProvider.SummarizeText(documentTextContent).Result;

            Console.WriteLine(summary);
        }

        public class AzureTextSummarizationProvider 
        {
            private string languageKey;
            private string languageEndpoint;

            public AzureTextSummarizationProvider(string azure_key, string azure_endpoint)
            {
                this.languageKey = azure_key;
                this.languageEndpoint = azure_endpoint;
            }

            public async Task<string> SummarizeText(string text)
            {
                Azure.AzureKeyCredential credentials = new Azure.AzureKeyCredential(languageKey);
                Uri endpoint = new Uri(languageEndpoint);

                Azure.AI.TextAnalytics.TextAnalyticsClient client = new Azure.AI.TextAnalytics.TextAnalyticsClient(endpoint, credentials);

                // Prepare analyze operation input. You can add multiple documents to this list and perform the same
                // operation to all of them.
                List<string> batchInput = new List<string>
            {
                text
            };

                Azure.AI.TextAnalytics.TextAnalyticsActions actions = new Azure.AI.TextAnalytics.TextAnalyticsActions()
                {
                    ExtractiveSummarizeActions = [new Azure.AI.TextAnalytics.ExtractiveSummarizeAction()]
                };

                // Start analysis process.
                Azure.AI.TextAnalytics.AnalyzeActionsOperation operation = await client.StartAnalyzeActionsAsync(batchInput, actions);
                await operation.WaitForCompletionAsync();

                System.Text.StringBuilder stringBuilder = new System.Text.StringBuilder();
                // View operation status.
                stringBuilder.AppendLine($"AnalyzeActions operation has completed");
                stringBuilder.AppendLine();

                stringBuilder.AppendLine($"Created On   : {operation.CreatedOn}");
                stringBuilder.AppendLine($"Expires On   : {operation.ExpiresOn}");
                stringBuilder.AppendLine($"Id           : {operation.Id}");
                stringBuilder.AppendLine($"Status       : {operation.Status}");

                stringBuilder.AppendLine();
                // View operation results.
                await foreach (Azure.AI.TextAnalytics.AnalyzeActionsResult documentsInPage in operation.Value)
                {
                    IReadOnlyCollection<Azure.AI.TextAnalytics.ExtractiveSummarizeActionResult> summaryResults = documentsInPage.ExtractiveSummarizeResults;

                    foreach (Azure.AI.TextAnalytics.ExtractiveSummarizeActionResult summaryActionResults in summaryResults)
                    {
                        if (summaryActionResults.HasError)
                        {
                            stringBuilder.AppendLine($"  Error!");
                            stringBuilder.AppendLine($"  Action error code: {summaryActionResults.Error.ErrorCode}.");
                            stringBuilder.AppendLine($"  Message: {summaryActionResults.Error.Message}");
                            continue;
                        }

                        foreach (Azure.AI.TextAnalytics.ExtractiveSummarizeResult documentResults in summaryActionResults.DocumentsResults)
                        {
                            if (documentResults.HasError)
                            {
                                stringBuilder.AppendLine($"  Error!");
                                stringBuilder.AppendLine($"  Document error code: {documentResults.Error.ErrorCode}.");
                                stringBuilder.AppendLine($"  Message: {documentResults.Error.Message}");
                                continue;
                            }

                            stringBuilder.AppendLine($"  Extracted the following {documentResults.Sentences.Count} sentence(s):");
                            stringBuilder.AppendLine();

                            foreach (Azure.AI.TextAnalytics.ExtractiveSummarySentence sentence in documentResults.Sentences)
                            {
                                stringBuilder.Append($"{sentence.Text} ");
                            }
                        }
                    }
                }

                string result = stringBuilder.ToString();

                return result;
            }
        }             
```

## See Also

- [Extracting Text from PDF Documents]({%slug extract-text-from-pdf%})
- [OcrFormatProvider]({%slug radpdfprocessing-formats-and-conversion-ocr-ocrformatprovider%})
- [TextFormatProvider]({%slug radpdfprocessing-formats-and-conversion-plain-text-textformatprovider%}) 

